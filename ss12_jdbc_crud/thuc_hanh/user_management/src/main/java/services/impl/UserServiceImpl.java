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
        if(iUserRepository.list().size() == 0){
            return null;
        }else{
            return iUserRepository.list();
        }
    }

    @Override
    public void createUser(User user) {
        this.iUserRepository.createUser(user);
    }

    @Override
    public User findUserById(Integer id) {
        return this.iUserRepository.findUserById(id);
    }

    @Override
    public void editUser(int id, String name, String email, String country) {
        this.iUserRepository.edit(id,name,email,country);
    }

    @Override
    public void deleteUser(int id) {
        this.iUserRepository.removeUser(id);
    }

    @Override
    public List<User> searchUserByCountryName(String searchText) {
        if(this.iUserRepository.findUserByCountry(searchText).size() == 0){
            return null;
        }else{
            return this.iUserRepository.findUserByCountry(searchText);
        }
    }

    @Override
    public List<User> sortByName() {
        return this.iUserRepository.sortUserByName();
    }

}
