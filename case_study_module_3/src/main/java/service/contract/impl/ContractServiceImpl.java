package service.contract.impl;

import repository.IContractRepository;
import repository.impl.ContractRepositoryImpl;
import service.contract.IContractService;

public class ContractServiceImpl implements IContractService {
    private final IContractRepository contractRepository = new ContractRepositoryImpl();
}
