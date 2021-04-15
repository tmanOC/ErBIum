//
//  TransactionListInteractor.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/12.
//

import Foundation

class TransactionListInteractor: TransactionListBoundary {
    
    
    func fetchTransactions(accountNumber: String,
                           limit: Int,
                           success: @escaping TransactionListSuccessBlock,
                           failure: @escaping TransactionListFailureBlock) {
        //Here we can do the relevant service calls to get the transaction list for a particular account
        let transactions: [[String:Any]] =  [["refNo":"Reference1", "description":"Transaction1", "dateString":"2020-08-01T08:00:00Z", "amount":25000]]
        
        success(transactions.compactMap{TransactionResponseModel(dictionary: $0)})
        //The success block is called if the transactions were retrieved successfully.
        //The failure block is triggered if the service failed to return useful information.
    }
    
}
