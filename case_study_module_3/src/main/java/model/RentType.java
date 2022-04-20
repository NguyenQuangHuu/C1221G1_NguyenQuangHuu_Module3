package model;

public class RentType {
    private Integer rentTypeCode;
    private String rentTypeName;

    public RentType() {
    }

    public RentType(Integer rentTypeCode, String rentTypeName) {
        this.rentTypeCode = rentTypeCode;
        this.rentTypeName = rentTypeName;
    }

    public Integer getRentTypeCode() {
        return rentTypeCode;
    }

    public void setRentTypeCode(Integer rentTypeCode) {
        this.rentTypeCode = rentTypeCode;
    }

    public String getRentTypeName() {
        return rentTypeName;
    }

    public void setRentTypeName(String rentTypeName) {
        this.rentTypeName = rentTypeName;
    }

    @Override
    public String toString() {
        return "RentType{" +
                "rentTypeCode=" + rentTypeCode +
                ", rentTypeName='" + rentTypeName + '\'' +
                '}';
    }
}
