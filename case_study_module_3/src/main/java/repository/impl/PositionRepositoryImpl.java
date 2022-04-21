package repository.impl;

import model.Position;
import repository.BaseRepository;
import repository.IPositionRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements IPositionRepository {
    private final BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Position> getListPosition() {
        List<Position> positions = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select * from positions");
            ResultSet resultSet = preparedStatement.executeQuery();
            Position position;
            while (resultSet.next()){
                position = new Position();
                position.setId(resultSet.getInt("position_code"));
                position.setName(resultSet.getString("position_name"));
                positions.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positions;
    }
}
