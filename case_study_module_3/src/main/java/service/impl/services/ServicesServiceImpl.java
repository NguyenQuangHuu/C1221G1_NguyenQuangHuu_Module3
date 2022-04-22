package service.impl.services;

import model.Service;
import repository.IServiceRepository;
import repository.impl.ServiceRepositoryImpl;
import service.iservices.IServicesService;
import utils.RegularExpression;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServicesServiceImpl implements IServicesService {
    private final IServiceRepository repository = new ServiceRepositoryImpl();
    private final RegularExpression regularExpression = new RegularExpression();
    @Override
    public List<Service> listService() {
        return this.repository.listService();
    }


    @Override
    public Map<String, String> addService(Service service) {
        Map<String,String> validateCreate = new HashMap<>();
        if("".equals(service.getCode())){
            validateCreate.put("code","Không được để trống mã dịch vụ");
        }else if(!this.regularExpression.serviceCode(service.getCode())){
            validateCreate.put("code","Sai định dạng. Mã dịch vụ có định dạng DV-XXXX , X là số");
        }

        if("".equals(service.getName())){
            validateCreate.put("name","Không được để trống tên dịch vụ");
        }

        if(!this.regularExpression.numberTensPositive(service.getArea().toString())){
            validateCreate.put("area","Diện tích sử dụng phải là số dương");
        }

        if(!this.regularExpression.numberTensPositive(service.getFee().toString())){
            validateCreate.put("fee","Chi phí thuê phải là số dương");
        }

        if(!this.regularExpression.numberTensPositive(service.getFee().toString())){
            validateCreate.put("poolArea","Chi phí thuê phải là số dương");
        }

        if(!this.regularExpression.numberPositive(service.getMaximum().toString())){
            validateCreate.put("maximum","Số người tối đa phải là số nguyên dương");
        }

        if(!this.regularExpression.numberPositive(service.getFloor().toString())){
            validateCreate.put("floor","Số tầng phải là số nguyên dương");
        }
        if(validateCreate.isEmpty()){
            this.repository.addService(service);
        }
        return validateCreate;
    }

}
