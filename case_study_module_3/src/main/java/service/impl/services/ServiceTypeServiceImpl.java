package service.impl.services;

import model.ServiceType;
import repository.IServiceTypeRepository;
import repository.impl.ServiceTypeRepositoryImpl;
import service.iservices.IServiceTypeService;

import java.util.List;

public class ServiceTypeServiceImpl implements IServiceTypeService {
    private final IServiceTypeRepository repository =  new ServiceTypeRepositoryImpl();
    @Override
    public List<ServiceType> getServiceType() {
        return this.repository.getServiceTypes();
    }
}
