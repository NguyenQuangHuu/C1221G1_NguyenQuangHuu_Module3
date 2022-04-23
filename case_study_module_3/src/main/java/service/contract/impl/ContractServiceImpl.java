package service.contract.impl;

import model.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepositoryImpl;
import service.contract.IContractService;

public class ContractServiceImpl implements IContractService {
    private final IContractRepository contractRepository = new ContractRepositoryImpl();

    @Override
    public void newContract(Contract contract) {
        this.contractRepository.newContract(contract);
    }
}
