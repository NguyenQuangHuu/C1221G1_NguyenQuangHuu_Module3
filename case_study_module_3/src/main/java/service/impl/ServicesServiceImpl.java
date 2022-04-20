package service.impl;

import model.RentType;
import model.Service;
import model.ServiceType;
import repository.IServiceRepository;
import repository.impl.ServiceRepositoryImpl;
import service.IServicesService;

import java.util.List;

public class ServicesServiceImpl implements IServicesService {
    private final IServiceRepository repository = new ServiceRepositoryImpl();

    @Override
    public List<Service> listService() {
        return this.repository.listService();
    }

    @Override
    public List<ServiceType> getServiceType() {
        return this.repository.getServiceTypes();
    }

    @Override
    public List<RentType> getRentType() {
        return this.repository.getRentTypes();
    }

    @Override
    public void addService(Service service) {
        this.repository.addService(service);
    }
}
