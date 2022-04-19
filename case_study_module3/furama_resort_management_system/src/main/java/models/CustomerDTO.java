package models;

public class CustomerDTO {
    private Integer customerId;
    private String name;
    private String dayOfBirth;
    private Integer gender;
    private String passportId;
    private String phoneNumber;
    private String email;
    private String address;
    private String customerTypeName;

    public CustomerDTO() {
    }

    public CustomerDTO(Integer customerId, String name, String dayOfBirth, Integer gender, String passportId, String phoneNumber, String email, String address, String customerTypeName) {
        this.customerId = customerId;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.passportId = passportId;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.customerTypeName = customerTypeName;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getPassportId() {
        return passportId;
    }

    public void setPassportId(String passportId) {
        this.passportId = passportId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCustomerTypeName() {
        return customerTypeName;
    }

    public void setCustomerTypeName(String customerTypeName) {
        this.customerTypeName = customerTypeName;
    }

    @Override
    public String toString() {
        return "CustomerDTO{" +
                "customerId=" + customerId +
                ", name='" + name + '\'' +
                ", dayOfBirth='" + dayOfBirth + '\'' +
                ", gender=" + gender +
                ", passportId='" + passportId + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", customerTypeName='" + customerTypeName + '\'' +
                '}';
    }
}
