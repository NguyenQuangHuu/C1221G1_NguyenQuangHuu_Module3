package repository.impl;

import model.RentType;
import repository.BaseRepository;
import repository.IRentTypeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepositoryImpl implements IRentTypeRepository {
    private final BaseRepository baseRepository = new BaseRepository();
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
}
