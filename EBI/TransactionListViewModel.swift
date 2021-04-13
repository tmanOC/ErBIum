//
//  File.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/12.
//

import Foundation

protocol TransactionListViewModelDelegate: class {
    func refreshViewContents()
    func showErrorMessage(_ errorMessage: String)
}

class TransactionListViewModel {
    private(set) var transactionList = [TransactionModel]()
    weak private var delegate: TransactionListViewModelDelegate?
    private var interactor: TransactionListBoundary?
    private(set) var accountNumber: String?
    private var transactionLimit: Int?
    
    init(delegate: TransactionListViewModelDelegate,
         interactor: TransactionListBoundary,
         accountNumber: String?,
         transactionLimit: Int) {
        self.delegate = delegate
        self.transactionLimit = transactionLimit
        self.interactor = interactor
        if let accountNumber = accountNumber {
            self.accountNumber = accountNumber
        }
    }
    
    func fetchTransactionList() {
        guard let accountNumber = self.accountNumber else {
            return
        }
        self.interactor?.fetchTransactions(accountNumber: accountNumber, limit: 30, success: { (transactions) in
            self.transactionList = TransactionListViewModel.transactionList(from: transactions)
            self.delegate?.refreshViewContents()
        }, failure: { (error) in
            self.delegate?.showErrorMessage(error.localizedDescription)
        })
    }
    
    public var numberOfTransactions: Int {
        return transactionList.count
    }
    
    //MARK: Private
    private class func transactionList(from response:[TransactionResponseModel]) -> [TransactionModel] {
        return response.compactMap{TransactionModel(description: $0.description, date: $0.date, amountInCents: $0.amountInCents)}
    }
    
    
}
