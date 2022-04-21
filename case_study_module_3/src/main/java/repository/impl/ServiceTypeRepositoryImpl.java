package repository.impl;

import model.ServiceType;
import repository.BaseRepository;
import repository.IServiceTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepositoryImpl implements IServiceTypeRepository {

    private final BaseRepository baseRepository = new BaseRepository();

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
}
