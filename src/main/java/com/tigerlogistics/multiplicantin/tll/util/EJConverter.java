package com.tigerlogistics.multiplicantin.tll.util;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang3.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


public class EJConvertor {

   
    private static final String DEFAULT_CONFIG_FILE_NAME = "EJConvertorConfig.xml";

   
    private static final String ENTITY_ELEMENT = "entity";

    
    private static final String PROPERTY_ELEMENT = "property";


   
    private static final String FIELD_ELEMENT = "field";

   
    private static final String VALUE_ELEMENT = "value";

    
    private static final String CLASS_ATTRIBUTE = "class";

    
    private static final String SHEET_NAME_ATTRIBUTE = "sheetName";

    
    private static final String BOLD_HEADING_ATTRIBUTE = "boldHeading";

    
    private Map<String, MappingInfo> excelJavaBeanMap;

    public EJConvertor() {
        init(DEFAULT_CONFIG_FILE_NAME);
    }

    public EJConvertor(String filePath) {
        init(filePath);
    }

    
    private void init(String fileLocation) {
        try {
          
            File configFile = new ClassPathResource(fileLocation).getFile();
            DocumentBuilder documentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document doc = documentBuilder.parse(configFile);

           
            this.excelJavaBeanMap = parseMappingInfo(doc);

        } catch (ParserConfigurationException | SAXException | IOException e) {
            e.printStackTrace();
        }
    }

    
    private Map<String, MappingInfo> parseMappingInfo(Document root) {
        
        NodeList entities = root.getElementsByTagName(ENTITY_ELEMENT);

        
        Map<String, MappingInfo> mappingInfoMap = new HashMap<>(entities.getLength());

        
        for (int index = 0; index < entities.getLength(); index++) {
           
            MappingInfo mappingInfo = new MappingInfo();

            
            Node entityNode = entities.item(index);
            if (entityNode.getNodeType() == Node.ELEMENT_NODE) {
                Element entityElement = (Element) entityNode;
                parseEntityElement(entityElement, mappingInfo);
            }

            
            mappingInfoMap.put(mappingInfo.getClassName(), mappingInfo);
        }
        return mappingInfoMap;
    }

    
    private void parseEntityElement(Element entityElement, MappingInfo mappingInfo) {
        
        String className = entityElement.getAttribute(CLASS_ATTRIBUTE);
        mappingInfo.setClassName(className);

       
        if (entityElement.hasAttribute(SHEET_NAME_ATTRIBUTE))
            mappingInfo.setSheetName(entityElement.getAttribute(SHEET_NAME_ATTRIBUTE));

       
        if (entityElement.hasAttribute(BOLD_HEADING_ATTRIBUTE)) {
            String isBoldHeading = entityElement.getAttribute(BOLD_HEADING_ATTRIBUTE);
            mappingInfo.setBoldHeading(isBoldHeading.equals("true"));
        }

        
        NodeList properties = entityElement.getElementsByTagName(PROPERTY_ELEMENT);
        for (int index = 0; index < properties.getLength(); index++) {
            Node propertyNode = properties.item(index);
            if (propertyNode.getNodeType() == Node.ELEMENT_NODE) {
                Element propertyElement = (Element) propertyNode;
                parsePropertyElement(propertyElement, mappingInfo);
            }
        }
    }

    
    private void parsePropertyElement(Element propertyElement, MappingInfo mappingInfo) {
        NodeList infoNodes = propertyElement.getChildNodes();
        String field = null;
        String value = null;

        for (int infoNode_index = 0; infoNode_index < infoNodes.getLength(); infoNode_index++) {
            Node infoNode = infoNodes.item(infoNode_index);
            if (infoNode.getNodeName().equals(FIELD_ELEMENT))
                field = infoNode.getTextContent();
            if (infoNode.getNodeName().equals(VALUE_ELEMENT))
                value = infoNode.getTextContent();
        }

        
        if (field != null && value != null) {
            mappingInfo.addFieldValueMapping(field, value);
            mappingInfo.addValueFieldMapping(value, field);
        }
    }

   
    public <T> List<T> excelReader(Class<T> javaBeanClass, File file) {
      
        if (file == null || javaBeanClass == null)
            return null;

       
        List<T> javaBeans = new ArrayList<>();

       
        String className = javaBeanClass.getName();
        MappingInfo mappingInfo = excelJavaBeanMap.get(className);
        if (mappingInfo == null)
            return null;

        
        try (Workbook workbook = new XSSFWorkbook(new FileInputStream(file))) {
            Sheet dataSheet = workbook.getSheetAt(0);
            Row row;
            Cell cell;

            Iterator<Row> rowIterator = dataSheet.iterator();
            Iterator<Cell> cellIterator;

            
            if (!rowIterator.hasNext())
                return null;
            String fieldName;
            Field fieldInstance;
            Class<?> fieldClass;
            List<String> fieldNameList = new ArrayList<>();
            List<Class<?>> fieldClassList = new ArrayList<>();
            row = rowIterator.next();
            cellIterator = row.iterator();
            while (cellIterator.hasNext()) {
                cell = cellIterator.next();

                
                fieldName = mappingInfo.getValueFieldMapping(cell.getStringCellValue());
                fieldClass = (fieldName != null && (fieldInstance = javaBeanClass.getDeclaredField(fieldName)) != null) ?
                        fieldInstance.getType() : null;

                
                fieldClassList.add(cell.getColumnIndex(), fieldClass);
                fieldNameList.add(cell.getColumnIndex(), fieldName);
            }

            
            while (rowIterator.hasNext()) {
                row = rowIterator.next();
                cellIterator = row.iterator();
                T javaBean = javaBeanClass.newInstance();

                
                while (cellIterator.hasNext()) {
                    cell = cellIterator.next();
                    int columnIndex = cell.getColumnIndex();

                    
                    Object fieldValue = getCellValue(fieldClassList.get(columnIndex), cell);
                    if (fieldValue == null) continue;
                    setField(javaBean, fieldNameList.get(columnIndex), fieldValue);
                }
                
                javaBeans.add(javaBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return javaBeans;
    }

    
    public File excelWriter(Class<?> classType, List<?> javaBeans) {
       
        if (classType == null || javaBeans == null)
            return null;

        
        String className = classType.getName();
        MappingInfo mappingInfo = excelJavaBeanMap.get(className);
        if (mappingInfo == null)
            return null;

        
        Set<String> fields = mappingInfo.getFieldValueMapping().keySet();
        List<String> valuesList = new ArrayList<>();
        fields.forEach(field -> valuesList.add(mappingInfo.getFieldValueMapping(field)));

        
        File excel = null;
        try {
            
            excel = File.createTempFile("excel", ".xlsx");
            
            Workbook workbook = new XSSFWorkbook();
            
            Sheet sheet = workbook.createSheet(mappingInfo.getSheetName());

            int rowIndex = 0;
            int cellIndex;
            Row row;
            Cell cell;

            
            cellIndex = 0;
            row = sheet.createRow(rowIndex++);
            XSSFFont font = (XSSFFont) workbook.createFont();
            font.setBold(mappingInfo.isBoldHeading());
            CellStyle cellStyle = workbook.createCellStyle();
            cellStyle.setFont(font);
            for (String value : valuesList) {
                cell = row.createCell(cellIndex);
                cell.setCellValue(value);
                cellIndex++;

                
                cell.setCellStyle(cellStyle);
            }

            
            for (Object javaBean : javaBeans) {
                row = sheet.createRow(rowIndex++);
                cellIndex = 0;
                for (String fieldName : fields) {
                    Object value = getField(javaBean, getGetterMethodName(fieldName));
                    cell = row.createCell(cellIndex++);
                    setCellValue1(value, workbook, cell);
                }
            }

            
            for (int i = 0; i < valuesList.size(); i++) {
                sheet.autoSizeColumn(i);
            }

            
            FileOutputStream outputStream = new FileOutputStream(excel);
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return excel;
    }

    
    @SuppressWarnings("unchecked")
    private <T> T getCellValue(Class<T> fieldClass, Cell cell) {

        
        T fieldValue = null;

        if (fieldClass == int.class || fieldClass == Integer.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Integer integer = NumberUtils.isNumber(cellValue) ? Double.valueOf(cellValue).intValue() : 0;
            fieldValue = (T) integer;
        } else if (fieldClass == long.class || fieldClass == Long.class) {
           
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Long l = NumberUtils.isNumber(cellValue) ? Double.valueOf(cellValue).longValue() : 0;
            fieldValue = (T) l;
        } else if (fieldClass == float.class || fieldClass == Float.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Float f = NumberUtils.isNumber(cellValue) ? Float.valueOf(cellValue) : 0;
            fieldValue = (T) f;
        } else if (fieldClass == double.class || fieldClass == Double.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Double d = NumberUtils.isNumber(cellValue) ? Double.valueOf(cellValue) : 0;
            fieldValue = (T) d;
        } else if (fieldClass == short.class || fieldClass == Short.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Short s = NumberUtils.isNumber(cellValue) ? Double.valueOf(cellValue).shortValue() : 0;
            fieldValue = (T) s;
        } else if (fieldClass == boolean.class || fieldClass == Boolean.class) {
            
            cell.setCellType(Cell.CELL_TYPE_BOOLEAN);
            Boolean b = cell.getBooleanCellValue();
            fieldValue = (T) b;
        } else if (fieldClass == char.class || fieldClass == Character.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Character c = cellValue.charAt(0);
            fieldValue = (T) c;
        } else if (fieldClass == byte.class || fieldClass == Byte.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            Byte b = NumberUtils.isNumber(cellValue) ? Double.valueOf(cellValue).byteValue() : 0;
            fieldValue = (T) b;
        } else if (fieldClass == String.class) {
            
            cell.setCellType(Cell.CELL_TYPE_STRING);
            String cellValue = cell.getStringCellValue();
            fieldValue = (T) cellValue;
        } else if (fieldClass == Date.class) {
            
            fieldValue = HSSFDateUtil.isCellDateFormatted(cell) ? (T) cell.getDateCellValue() : null;
        } else if (fieldClass == java.sql.Date.class) {
            
            fieldValue = null;
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                java.sql.Date date = new java.sql.Date(cell.getDateCellValue().getTime());
                fieldValue = (T) date;
            }
        }
        return fieldValue;
    }

   
    private void setCellValue1(Object cellValue, Workbook workbook, Cell cell) {
       
        if (cell == null || cellValue == null || workbook == null)
            return;

        Class<?> cellValueClass = cellValue.getClass();
        if (cellValueClass == boolean.class || cellValueClass == Boolean.class) {
            cell.setCellValue((Boolean) cellValue);
        } else if (cellValueClass == char.class || cellValueClass == Character.class) {
            cell.setCellValue(String.valueOf(cellValue));
        } else if (cellValueClass == byte.class || cellValueClass == Byte.class) {
            cell.setCellValue((Byte) cellValue);
        } else if (cellValueClass == short.class || cellValueClass == Short.class) {
            cell.setCellValue((Short) cellValue);
        } else if (cellValueClass == int.class || cellValueClass == Integer.class) {
            cell.setCellValue((Integer) cellValue);
        } else if (cellValueClass == long.class || cellValueClass == Long.class) {
            cell.setCellValue((Long) cellValue);
        } else if (cellValueClass == float.class || cellValueClass == Float.class) {
            cell.setCellValue(String.valueOf(cellValue));
//            cell.setCellValue((Float) cellValue);
        } else if (cellValueClass == double.class || cellValueClass == Double.class) {
            cell.setCellValue((Double) cellValue);
        } else if (cellValueClass == String.class) {
            cell.setCellValue((String) cellValue);
        } else if (cellValueClass == Date.class) {
            Date v = (Date) cellValue;
            CellStyle cellStyle = workbook.createCellStyle();
            CreationHelper creationHelper = workbook.getCreationHelper();
            cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy/mm/dd"));
            cell.setCellValue(v);
            cell.setCellStyle(cellStyle);
        } else if (cellValueClass == java.sql.Date.class) {
            java.sql.Date v = (java.sql.Date) cellValue;
            CellStyle cellStyle = workbook.createCellStyle();
            CreationHelper creationHelper = workbook.getCreationHelper();
            cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy/mm/dd"));
            cell.setCellValue(v);
            cell.setCellStyle(cellStyle);
        }
    }

    
    private void setField(Object targetObject, String fieldName, Object fieldValue) throws Exception {
       
        Class<?> targetObjectClass = targetObject.getClass();
        Class<?> fieldClass = targetObjectClass.getDeclaredField(fieldName).getType();
        Method setterMethod = targetObjectClass.getMethod(getSetterMethodName(fieldName), fieldClass);

        
        setterMethod.invoke(targetObject, fieldValue);
    }

   
    private Object getField(Object targetObject, String methodName) throws Exception {
        
        Class<?> targetObjectType = targetObject.getClass();
        Method getterMethod = targetObjectType.getMethod(methodName);

        
        return getterMethod.invoke(targetObject);
    }

    
    private Map<String, String> setterMethodNameCache = new HashMap<>(64);

   
    private Map<String, String> getterMethodNameCache = new HashMap<>(64);

    
    private String getSetterMethodName(String fieldName) {
        
        return setterMethodNameCache.computeIfAbsent(fieldName, n -> "set" + n.replaceFirst(n.substring(0, 1), n.substring(0, 1).toUpperCase()));
    }

    
    private String getGetterMethodName(String fieldName) {
        return getterMethodNameCache.computeIfAbsent(fieldName, n -> "get" + n.replaceFirst(n.substring(0, 1), n.substring(0, 1).toUpperCase()));
    }

    
    private class MappingInfo {
       
        private String className;

        
        private String sheetName = "sheet1";

       
        private boolean boldHeading = false;

       
        private Map<String, String> fieldValueMapping = new LinkedHashMap<>();

        
        private Map<String, String> valueFieldMapping = new LinkedHashMap<>();

       
        void setClassName(String className) {
            this.className = className;
        }

       
        String getClassName() {
            return className;
        }

        ram sheetName sheet 名称
         */
        void setSheetName(String sheetName) {
            this.sheetName = sheetName;
        }

        String getSheetName() {
            return sheetName;
        }

        
        void setBoldHeading(boolean boldHeading) {
            this.boldHeading = boldHeading;
        }

       
        boolean isBoldHeading() {
            return boldHeading;
        }

        
        void addFieldValueMapping(String field, String value) {
            fieldValueMapping.put(field, value);
        }

       
        String getFieldValueMapping(String field) {
            return fieldValueMapping.get(field);
        }

       
      
        void addValueFieldMapping(String value, String field) {
            valueFieldMapping.put(value, field);
        }

        
        String getValueFieldMapping(String value) {
            return valueFieldMapping.get(value);
        }

        
        Map<String, String> getFieldValueMapping() {
            return fieldValueMapping;
        }
    }
}
