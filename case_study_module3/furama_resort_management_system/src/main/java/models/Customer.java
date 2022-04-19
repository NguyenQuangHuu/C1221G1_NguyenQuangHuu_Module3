package models;

public class Customer {
    private Integer customerCode;
    private String customerName;
    private String customerDOB;
    private Integer customerGender;
    private String customerPassportId;
    private String customerPhoneNumber;
    private String customerEmail;
    private String customerAddress;
    private Integer customerTypeCode;

    public Customer() {
    }

    public Customer(Integer customerCode, String customerName, String customerDOB, Integer customerGender, String customerPassportId, String customerPhoneNumber, String customerEmail, String customerAddress, Integer customerTypeCode) {
        this.customerCode = customerCode;
        this.customerName = customerName;
        this.customerDOB = customerDOB;
        this.customerGender = customerGender;
        this.customerPassportId = customerPassportId;
        this.customerPhoneNumber = customerPhoneNumber;
        this.customerEmail = customerEmail;
        this.customerAddress = customerAddress;
        this.customerTypeCode = customerTypeCode;
    }

    public Integer getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(Integer customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerDOB() {
        return customerDOB;
    }

    public void setCustomerDOB(String customerDOB) {
        this.customerDOB = customerDOB;
    }

    public Integer getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(Integer customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerPassportId() {
        return customerPassportId;
    }

    public void setCustomerPassportId(String customerPassportId) {
        this.customerPassportId = customerPassportId;
    }

    public String getCustomerPhoneNumber() {
        return customerPhoneNumber;
    }

    public void setCustomerPhoneNumber(String customerPhoneNumber) {
        this.customerPhoneNumber = customerPhoneNumber;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public Integer getCustomerTypeCode() {
        return customerTypeCode;
    }

    public void setCustomerTypeCode(Integer customerTypeCode) {
        this.customerTypeCode = customerTypeCode;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerCode=" + customerCode +
                ", customerName='" + customerName + '\'' +
                ", customerDOB='" + customerDOB + '\'' +
                ", customerGender=" + customerGender +
                ", customerPassportId='" + customerPassportId + '\'' +
                ", customerPhoneNumber='" + customerPhoneNumber + '\'' +
                ", customerEmail='" + customerEmail + '\'' +
                ", customerAddress='" + customerAddress + '\'' +
                ", customerTypeCode=" + customerTypeCode +
                '}';
    }
}
