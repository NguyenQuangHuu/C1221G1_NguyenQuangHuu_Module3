package service.iservices;

import model.RentType;
import service.IService;

import java.util.List;

public interface IRentTypeService extends IService<RentType> {
    List<RentType> getRentType();
}
