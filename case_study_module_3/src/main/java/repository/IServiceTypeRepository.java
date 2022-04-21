package repository;

import model.ServiceType;
import service.IService;

import java.util.List;

public interface IServiceTypeRepository extends ICrudRepository<ServiceType> {
    List<ServiceType> getServiceTypes();
}
