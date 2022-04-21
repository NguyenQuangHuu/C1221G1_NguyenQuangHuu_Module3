package repository.impl;

import model.Level;
import model.Position;
import repository.BaseRepository;
import repository.ILevelRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LevelRepositoryImpl implements ILevelRepository {
    private final BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Level> getListLevel() {
        List<Level> levels = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("select * from levels");
            ResultSet resultSet = preparedStatement.executeQuery();
            Level level;
            while (resultSet.next()){
                level = new Level();
                level.setId(resultSet.getInt("position_code"));
                level.setName(resultSet.getString("position_name"));
                levels.add(level);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return levels;
    }
}
