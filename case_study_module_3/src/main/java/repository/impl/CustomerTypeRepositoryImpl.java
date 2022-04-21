package repository.impl;

import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements ICustomerTypeRepository {
    private final BaseRepository baseRepository =  new BaseRepository();
    @Override
    public List<CustomerType> showListCustomerType() {
        List<CustomerType> customerTypes = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement("select * from customer_type;");
            ResultSet resultSet = preparedStatement.executeQuery();
            CustomerType customerType;
            while (resultSet.next()){
                customerType = new CustomerType();
                customerType.setTypeCode(resultSet.getInt("customer_type_code"));
                customerType.setTypeName(resultSet.getString("customer_type_name"));
                customerTypes.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerTypes;
    }
}
