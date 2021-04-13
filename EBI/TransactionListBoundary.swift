//
//  TransactionListBoundary.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/12.
//

import Foundation

typealias TransactionListSuccessBlock = (_ transactions: [TransactionResponseModel]) -> Void
typealias TransactionListFailureBlock = (_ error: Error) -> Void

protocol TransactionListBoundary {
    func fetchTransactions(accountNumber: String,
                           limit: Int,
                           success: @escaping TransactionListSuccessBlock,
                           failure: @escaping TransactionListFailureBlock)
}
