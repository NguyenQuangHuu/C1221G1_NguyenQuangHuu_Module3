package repository;

import model.RentType;

import java.util.List;

public interface IRentTypeRepository extends ICrudRepository<RentType> {
    List<RentType> getRentTypes();
}
