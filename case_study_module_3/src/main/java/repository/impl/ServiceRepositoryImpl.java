package repository.impl;

import model.RentType;
import model.Service;
import model.ServiceType;
import repository.BaseRepository;
import repository.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServiceRepository {
    private final BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Service> listService() {
        List<Service> services = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select * from services");
            ResultSet resultSet = preparedStatement.executeQuery();
            Service service;
            while (resultSet.next()) {
                service = new Service();
                service.setId(resultSet.getInt("service_id"));
                service.setCode(resultSet.getString("service_code"));
                service.setName(resultSet.getString("service_name"));
                service.setArea(resultSet.getDouble("service_usable_area"));
                service.setFee(resultSet.getDouble("service_rent_fee"));
                service.setMaximum(resultSet.getInt("service_maximum_capacity"));
                service.setRoomType(resultSet.getString("service_room_type"));
                service.setConvenience(resultSet.getString("service_advance"));
                service.setPoolArea(resultSet.getDouble("service_swimming_pool_area"));
                service.setFloor(resultSet.getInt("service_floor"));
                service.setRentTypeCode(resultSet.getInt("rent_type_code"));
                service.setServiceTypeCode(resultSet.getInt("service_type_code"));
                services.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return services;
    }





    @Override
    public void addService(Service service) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("" +
                    "insert into services(service_code,service_name,service_usable_area," +
                    "service_rent_fee,service_maximum_capacity," +
                    "service_room_type,service_advance," +
                    "service_swimming_pool_area,service_floor,rent_type_code,service_type_code)" +
                    "value (?,?,?,?,?,?,?,?,?,?,?)");

            preparedStatement.setString(1, service.getCode());
            preparedStatement.setString(2, service.getName());
            preparedStatement.setDouble(3, service.getArea());
            preparedStatement.setDouble(4, service.getFee());
            preparedStatement.setInt(5, service.getMaximum());
            preparedStatement.setString(6, service.getRoomType());
            preparedStatement.setString(7, service.getConvenience());
            preparedStatement.setDouble(8, service.getPoolArea());
            preparedStatement.setInt(9, service.getFloor());
            preparedStatement.setInt(10, service.getRentTypeCode());
            preparedStatement.setInt(11, service.getServiceTypeCode());
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
