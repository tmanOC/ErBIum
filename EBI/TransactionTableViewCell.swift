//
//  TransactionTableViewCell.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/13.
//

import Foundation
import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet var amountView: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    func populate(transaction: TransactionModel) {
        amountView.text = "\(transaction.amountInCents ?? 0)"
        dateLabel.text = transaction.date.flatMap{String.aba_format(date: $0)}
        descriptionLabel.text = transaction.description
    } }
