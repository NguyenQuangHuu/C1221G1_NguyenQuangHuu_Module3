package model;

public class CustomerType {
    private Integer typeCode;
    private String typeName;

    public CustomerType() {
    }

    public CustomerType(Integer typeCode, String typeName) {
        this.typeCode = typeCode;
        this.typeName = typeName;
    }

    public Integer getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(Integer typeCode) {
        this.typeCode = typeCode;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "CustomerType{" +
                "typeCode=" + typeCode +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
