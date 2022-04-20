package service;

import model.RentType;
import model.Service;
import model.ServiceType;

import java.util.List;

public interface IServicesService {
    List<Service> listService();

    List<ServiceType> getServiceType();

    List<RentType> getRentType();

    void addService(Service service);
}
