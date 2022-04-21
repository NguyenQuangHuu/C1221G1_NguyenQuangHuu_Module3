package service.i_employee.impl;

import model.Level;
import repository.ILevelRepository;
import repository.impl.LevelRepositoryImpl;
import service.i_employee.ILevelService;

import java.util.List;

public class LevelServiceImpl implements ILevelService {
    private final ILevelRepository levelRepository = new LevelRepositoryImpl();

    @Override
    public List<Level> getList() {
        return this.levelRepository.getListLevel();
    }
}
