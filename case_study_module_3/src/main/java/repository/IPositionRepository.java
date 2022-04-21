package repository;

import model.Position;

import java.util.List;

public interface IPositionRepository extends ICrudRepository<Position> {

    List<Position> getListPosition();
}
