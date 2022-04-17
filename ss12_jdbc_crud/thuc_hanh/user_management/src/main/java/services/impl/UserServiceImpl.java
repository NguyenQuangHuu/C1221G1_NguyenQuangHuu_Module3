package services.impl;

import models.User;
import repositories.IUserRepository;
import repositories.impl.UserRepositoryImpl;
import services.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private final IUserRepository iUserRepository = new UserRepositoryImpl();
    @Override
    public List<User> list() throws SQLException {
        return iUserRepository.list();
    }

}
