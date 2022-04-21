package repository;

import model.RentType;
import model.Service;
import model.ServiceType;

import java.util.List;

public interface IServiceRepository extends ICrudRepository<Service> {
    List<Service> listService();
    void addService(Service service);
}
