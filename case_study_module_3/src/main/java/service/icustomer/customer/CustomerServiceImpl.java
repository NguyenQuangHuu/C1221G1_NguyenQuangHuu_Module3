package service.icustomer.customer;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.icustomer.ICustomerService;
import utils.RegularExpression;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepositoryImpl();
    private RegularExpression regularExpression = new RegularExpression();
    @Override
    public List<Customer> listCustomer() {
        return iCustomerRepository.showListCustomer();
    }



    @Override
    public Map<String, String> createCustomer(Customer customer) {
        Map<String,String> validate = new HashMap<>();

        if("".equals(customer.getCode())){
            validate.put("code","Mã khách hàng không được để trống");
        }else if(!this.regularExpression.codeCustomerCheck(customer.getCode())){
            validate.put("code","Định dạng mã khách hàng là KH-XXXX, X là số 0-9");
        }

        if("".equals(customer.getName())){
            validate.put("name","Tên không được để trống");
        }else if(customer.getName().length()<4){
            validate.put("name","Tên không thể ít hơn 4 ký tự");
        }


        if("".equals(customer.getPassport())){
            validate.put("passport","Vui lòng cung cấp chứng minh thư để lưu trữ");
        }else if(!this.regularExpression.passportValidate(customer.getPassport())){
            validate.put("passport","Chứng minh thư phải đúng định dạng 9 hoặc 12 số");
        }

        if("".equals(customer.getEmail())){
            validate.put("email","Không được để trống. Vui lòng nhập lại");
        }else if(!regularExpression.emailValidate(customer.getEmail())){
            validate.put("email","Không đúng định dạng email. Vui lòng nhập lại");
        }

        if("".equals(customer.getPhone())){
            validate.put("phone","Vui lòng cung cấp số điện thoại!");
        }else if(!regularExpression.phoneNumberValidate(customer.getPhone())){
            validate.put("phone","Không đúng định dạng số điện thoại. Vui lòng nhập lại");
        }

        if(("").equals(customer.getDayOfBirth())){
            validate.put("dayOfBirth","Không được để trống ngày tháng năm sinh của khách hàng");
        }else if(!this.regularExpression.dateValidate(customer.getDayOfBirth())){
            validate.put("dayOfBirth","Sai định dạng ngày tháng");
        }

        if(validate.isEmpty()){
            this.iCustomerRepository.createCustomer(customer);
        }
        return validate;
    }

    @Override
    public Customer findCustomerById(int id) {
        return this.iCustomerRepository.findCustomerById(id);
    }

    @Override
    public void removeCustomer(int id) {
        this.iCustomerRepository.removeCustomer(id);
    }

    @Override
    public Map<String, String> editCustomer(Customer customer) {
        Map<String,String> validateEdit = new HashMap<>();
        if("".equals(customer.getCode())){
            validateEdit.put("code","Mã khách hàng không được để trống");
        }else if(!this.regularExpression.codeCustomerCheck(customer.getCode())){
            validateEdit.put("code","Định dạng mã khách hàng là KH-XXXX, X là số 0-9");
        }

        if("".equals(customer.getName())){
            validateEdit.put("name","Tên không được để trống");
        }else if(customer.getName().length()<4){
            validateEdit.put("name","Tên không thể ít hơn 4 ký tự");
        }


        if("".equals(customer.getPassport())){
            validateEdit.put("passport","Vui lòng cung cấp chứng minh thư để lưu trữ");
        }else if(!this.regularExpression.passportValidate(customer.getPassport())){
            validateEdit.put("passport","Chứng minh thư phải đúng định dạng 9 hoặc 12 số");
        }

        if("".equals(customer.getEmail())){
            validateEdit.put("email","Không được để trống. Vui lòng nhập lại");
        }else if(!regularExpression.emailValidate(customer.getEmail())){
            validateEdit.put("email","Không đúng định dạng email. Vui lòng nhập lại");
        }

        if("".equals(customer.getPhone())){
            validateEdit.put("phone","Vui lòng cung cấp số điện thoại!");
        }else if(!regularExpression.phoneNumberValidate(customer.getPhone())){
            validateEdit.put("phone","Không đúng định dạng số điện thoại. Vui lòng nhập lại");
        }

        if(("").equals(customer.getDayOfBirth())){
            validateEdit.put("dayOfBirth","Không được để trống ngày tháng năm sinh của khách hàng");
        }
//        else if(!this.regularExpression.dateValidate(customer.getDayOfBirth())){
//            validateEdit.put("dayOfBirth","Sai định dạng ngày tháng");
//        }
        if(validateEdit.isEmpty()){
            this.iCustomerRepository.editCustomer(customer);
        }
        return validateEdit;
    }

    @Override
    public List<Customer> searchCustomer(String nameSearch, Integer typeCustomerSearch, String emailSearch) {
        return this.iCustomerRepository.searchCustomer(nameSearch,typeCustomerSearch,emailSearch);
    }


}
