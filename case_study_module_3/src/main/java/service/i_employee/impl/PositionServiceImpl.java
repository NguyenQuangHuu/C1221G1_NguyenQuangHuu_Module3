package service.i_employee.impl;

import model.Position;
import repository.IPositionRepository;
import repository.impl.PositionRepositoryImpl;
import service.i_employee.IPositionService;

import java.util.List;

public class PositionServiceImpl implements IPositionService {
    private final IPositionRepository positionRepository = new PositionRepositoryImpl();

    @Override
    public List<Position> getList() {
        return this.positionRepository.getListPosition();
    }
}
