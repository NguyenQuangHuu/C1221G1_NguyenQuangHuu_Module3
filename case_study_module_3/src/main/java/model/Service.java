package model;

public class Service {
    private Integer id;
    private String code;
    private String name;
    private Double area;
    private Double fee;
    private Integer maximum;
    private String roomType;
    private String convenience;
    private Double poolArea;
    private Integer floor;
    private Integer rentTypeCode;
    private Integer serviceTypeCode;

    public Service() {
    }

    public Service(Integer id, String code, String name, Double area, Double fee, Integer maximum, String roomType, String convenience, Double poolArea, Integer floor, Integer rentTypeCode, Integer serviceTypeCode) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.area = area;
        this.fee = fee;
        this.maximum = maximum;
        this.roomType = roomType;
        this.convenience = convenience;
        this.poolArea = poolArea;
        this.floor = floor;
        this.rentTypeCode = rentTypeCode;
        this.serviceTypeCode = serviceTypeCode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Double getFee() {
        return fee;
    }

    public void setFee(Double fee) {
        this.fee = fee;
    }

    public Integer getMaximum() {
        return maximum;
    }

    public void setMaximum(Integer maximum) {
        this.maximum = maximum;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getConvenience() {
        return convenience;
    }

    public void setConvenience(String convenience) {
        this.convenience = convenience;
    }

    public Double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(Double poolArea) {
        this.poolArea = poolArea;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getRentTypeCode() {
        return rentTypeCode;
    }

    public void setRentTypeCode(Integer rentTypeCode) {
        this.rentTypeCode = rentTypeCode;
    }

    public Integer getServiceTypeCode() {
        return serviceTypeCode;
    }

    public void setServiceTypeCode(Integer serviceTypeCode) {
        this.serviceTypeCode = serviceTypeCode;
    }

    @Override
    public String toString() {
        return "Service{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", area=" + area +
                ", fee=" + fee +
                ", maximum=" + maximum +
                ", roomType='" + roomType + '\'' +
                ", convenience='" + convenience + '\'' +
                ", poolArea=" + poolArea +
                ", floor=" + floor +
                ", rentTypeCode=" + rentTypeCode +
                ", serviceTypeCode=" + serviceTypeCode +
                '}';
    }
}
