//
//  TransactionListInteractor.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/12.
//

import Foundation

enum NetworkError: Error {
    case withMessage(String)
    case parse
}

class TransactionListInteractor: TransactionListBoundary {
    private var service: Service
    init(service: Service) {
        self.service = service
    }
    
    func fetchTransactions(accountNumber: String,
                           limit: Int,
                           success: @escaping TransactionListSuccessBlock,
                           failure: @escaping TransactionListFailureBlock) {
        //Here we can do the relevant service calls to get the transaction list for a particular account
        service.getJSONFrom(uri: "Transactions") { (data) in
            guard let transactions = data as? [[String:Any]] else {
                failure(NetworkError.parse)
                return
            }
            //let transactions: [[String:Any]] =  [["refNo":"Reference1", "description":"Transaction1", "dateString":"2020-08-01T08:00:00Z", "amount":25000]]
            
            
            
            success(transactions.compactMap{TransactionResponseModel(dictionary: $0)})
        } failure: { (message) in
            failure(NetworkError.withMessage(message))
        }

        
        
        //The success block is called if the transactions were retrieved successfully.
        //The failure block is triggered if the service failed to return useful information.
    }
    
}
