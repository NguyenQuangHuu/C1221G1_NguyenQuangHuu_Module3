package service.iservices;

import model.ServiceType;
import service.IService;

import java.util.List;

public interface IServiceTypeService extends IService<ServiceType> {
    List<ServiceType> getServiceType();
}
