package service.iservices;

import model.Service;
import service.IService;

import java.util.List;
import java.util.Map;

public interface IServicesService extends IService<Service> {
    List<Service> listService();



    Map<String, String> addService(Service service);
}
