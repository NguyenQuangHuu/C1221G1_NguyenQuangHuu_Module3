package model;

public class ServiceType {
    private Integer serviceTypeCode;
    private String serviceTypeName;

    public ServiceType() {
    }

    public ServiceType(Integer serviceTypeCode, String serviceTypeName) {
        this.serviceTypeCode = serviceTypeCode;
        this.serviceTypeName = serviceTypeName;
    }

    public Integer getServiceTypeCode() {
        return serviceTypeCode;
    }

    public void setServiceTypeCode(Integer serviceTypeCode) {
        this.serviceTypeCode = serviceTypeCode;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    @Override
    public String toString() {
        return "ServiceType{" +
                "serviceTypeCode=" + serviceTypeCode +
                ", serviceTypeName='" + serviceTypeName + '\'' +
                '}';
    }
}
