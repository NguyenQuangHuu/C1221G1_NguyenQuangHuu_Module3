package repository;

import model.Contract;

public interface IContractRepository extends ICrudRepository<Contract> {
    void newContract(Contract contract);
}
