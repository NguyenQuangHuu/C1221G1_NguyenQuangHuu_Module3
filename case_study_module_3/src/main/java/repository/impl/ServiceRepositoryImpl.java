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
                service.setId(resultSet.getInt("service_code"));
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
    public List<ServiceType> getServiceTypes() {

        List<ServiceType> types = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select * from service_type;");

            ResultSet resultSet = preparedStatement.executeQuery();
            ServiceType serviceType;
            while (resultSet.next()) {
                serviceType = new ServiceType();
                serviceType.setServiceTypeCode(resultSet.getInt("service_type_code"));
                serviceType.setServiceTypeName(resultSet.getString("service_type_name"));
                types.add(serviceType);
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
        return types;
    }

    @Override
    public List<RentType> getRentTypes() {
        List<RentType> rentTypes = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select * from rent_type;");
            ResultSet resultSet = preparedStatement.executeQuery();
            RentType rentType;
            while (resultSet.next()) {
                rentType = new RentType();
                rentType.setRentTypeCode(resultSet.getInt("rent_type_code"));
                rentType.setRentTypeName(resultSet.getString("rent_type_name"));
                rentTypes.add(rentType);
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
        return rentTypes;
    }

    @Override
    public void addService(Service service) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("" +
                    "insert into services(service_name,service_usable_area," +
                    "service_rent_fee,service_maximum_capacity," +
                    "service_room_type,service_advance," +
                    "service_swimming_pool_area,service_floor,rent_type_code,service_type_code)" +
                    "value (?,?,?,?,?,?,?,?,?,?)");

            preparedStatement.setString(1, service.getName());
            preparedStatement.setDouble(2, service.getArea());
            preparedStatement.setDouble(3, service.getFee());
            preparedStatement.setInt(4, service.getMaximum());
            preparedStatement.setString(5, service.getRoomType());
            preparedStatement.setString(6, service.getConvenience());
            preparedStatement.setDouble(7, service.getPoolArea());
            preparedStatement.setInt(8, service.getFloor());
            preparedStatement.setInt(9, service.getRentTypeCode());
            preparedStatement.setInt(10, service.getServiceTypeCode());
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
