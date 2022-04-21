package service.i_employee;

import model.Level;
import service.IService;

import java.util.List;

public interface ILevelService extends IService<Level> {
    List<Level> getList();
}
