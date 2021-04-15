//
//  TransactionListViewController.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/13.
//

import Foundation
import UIKit

class TransactionListViewController: UIViewController {
    // We've only defined the 'maximumTransactionCount' as a constant to illustrate how to def
    // In reality, we'd only use the constant if we needed the value more than four times
    private let maximumTransactionCount = 30
    @IBOutlet private var transactionTableView: UITableView!
    private(set) var accountNumber = ""
    private lazy var viewModel = TransactionListViewModel(delegate: self, interactor: TransactionListInteractor(), accountNumber: "Account Number", transactionLimit: maximumTransactionCount)
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // For simplicity, we tell the View Model to get the transactions as soon as the view
        // In reality, we would typically do this call once the UI & user is ready to fetch in
        self.transactionTableView.delegate = self
        self.transactionTableView.dataSource = self
        retrieveTransactions()
    }
    //MARK: Private
    private func retrieveTransactions() {
        showLoadingIndicator()
        viewModel.fetchTransactionList()
    } }

extension TransactionListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionTableViewCell
        let transaction = viewModel.transactionList[indexPath.row]
        cell.populate(transaction: transaction)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTransactions
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension TransactionListViewController: TransactionListViewModelDelegate {
    func refreshViewContents() {
        hideLoadingIndicator()
        transactionTableView.reloadData()
    }
    func showErrorMessage(_ errorMessage: String) {
        //Show the error message
    } }
