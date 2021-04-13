//
//  EBITests.swift
//  EBITests
//
//  Created by Tielman Janse van Vuuren on 2021/04/12.
//

import XCTest
@testable import EBI

class FakeTransactionListViewModelDelegate: TransactionListViewModelDelegate {
    func refreshViewContents() {
        print("contents refreshed")
    }
    
    func showErrorMessage(message: String) {
        print(message)
    }
}

class FakeTransactionListInteractor: TransactionListInteractor {
    let transactions:[[String:Any]]
    init(transactions: [[String: Any]]) {
        self.transactions = transactions
    }
    
    override func fetchTransactions(accountNumber: String, limit: Int, success: @escaping TransactionListSuccessBlock, failure: @escaping TransactionListFailureBlock) {
        success(transactions.compactMap{TransactionResponseModel(dictionary: $0)})
    }
}


class EBITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResponseModelConstructor() throws {
        let transaction: [String:Any] =  ["refNo":"Reference1", "description":"Transaction1", "dateString":"2020-08-01T08:00:00Z", "amount":25000]
        let transactionResponse = TransactionResponseModel(dictionary: transaction)
        XCTAssertNotNil(transactionResponse.referenceNumber)
        XCTAssertNotNil(transactionResponse.description)
        XCTAssertNotNil(transactionResponse.date)
        XCTAssertNotNil(transactionResponse.amountInCents)
    }

    func testTransactionListViewModel() throws {
        let viewModel = TransactionListViewModel(delegate: FakeTransactionListViewModelDelegate(), interactor: FakeTransactionListInteractor(transactions: [["refNo":"Reference1", "description":"Transaction1", "dateString":"2020-08-01T08:00:00Z", "amount":25000]]), accountNumber: "Some account number", transactionLimit: 30)
        XCTAssertEqual(viewModel.numberOfTransactions, 0)
        viewModel.fetchTransactionList()
        XCTAssertEqual(viewModel.numberOfTransactions, 1)
    }

}
