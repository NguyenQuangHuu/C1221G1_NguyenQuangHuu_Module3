package model;

public class Contract {
    private Integer id;
    private String startDate;
    private String endDate;
    private Double deposit;
    private Integer employeeCode;
    private Integer customerCode;
    private Integer serviceCode;


    public Contract() {
    }



    public Contract(Integer id, String startDate, String endDate, Double deposit, Integer employeeCode, Integer customerCode, Integer serviceCode) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.employeeCode = employeeCode;
        this.customerCode = customerCode;
        this.serviceCode = serviceCode;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public Integer getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(Integer employeeCode) {
        this.employeeCode = employeeCode;
    }

    public Integer getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(Integer customerCode) {
        this.customerCode = customerCode;
    }

    public Integer getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(Integer serviceCode) {
        this.serviceCode = serviceCode;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", deposit=" + deposit +
                ", employeeCode=" + employeeCode +
                ", customerCode=" + customerCode +
                ", serviceCode=" + serviceCode +
                '}';
    }
}
