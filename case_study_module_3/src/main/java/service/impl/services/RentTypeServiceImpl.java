package service.impl.services;

import model.RentType;
import repository.IRentTypeRepository;
import repository.impl.RentTypeRepositoryImpl;
import service.iservices.IRentTypeService;

import java.util.List;

public class RentTypeServiceImpl implements IRentTypeService {
    private final IRentTypeRepository repository = new RentTypeRepositoryImpl();
    @Override
    public List<RentType> getRentType() {
        return this.repository.getRentTypes();
    }
}
