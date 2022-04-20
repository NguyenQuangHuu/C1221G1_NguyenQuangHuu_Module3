package repository;

import model.RentType;
import model.Service;
import model.ServiceType;

import java.util.List;

public interface IServiceRepository extends ICrudRepository<Service> {
    List<Service> listService();

    List<ServiceType> getServiceTypes();

    List<RentType> getRentTypes();

    void addService(Service service);
}
