package repository.impl;

import model.Contract;
import repository.BaseRepository;
import repository.IContractRepository;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractRepositoryImpl implements IContractRepository {
    private final BaseRepository baseRepository = new BaseRepository();

    @Override
    public void newContract(Contract contract) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement("" +
                    "insert into contracts(contract_start_date,contract_end_date,contract_deposit,employee_code" +
                    ",customer_id,service_id) value (?,?,?,?,?,?)");
            preparedStatement.setString(1,contract.getStartDate());
            preparedStatement.setString(2,contract.getEndDate());
            preparedStatement.setDouble(3,contract.getDeposit());
            preparedStatement.setInt(4,contract.getEmployeeCode());
            preparedStatement.setInt(5,contract.getCustomerCode());
            preparedStatement.setInt(6,contract.getServiceCode());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }
}
