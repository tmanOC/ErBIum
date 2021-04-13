//
//  TransactionResponseModel.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/12.
//

import Foundation

struct TransactionResponseModel: Codable {
    private(set) var referenceNumber: String?
    private(set) var description: String?
    private(set) var date: Date?
    private(set) var amountInCents: Int?
    init(dictionary: [String: Any]) {
        if let referenceNumber = dictionary["refNo"] as? String {
            self.referenceNumber = referenceNumber
        }
        if let description = dictionary["description"] as? String {
            self.description = description
        }
        if let dateString = dictionary["dateString"] as? String {
            let dateFormatter = ISO8601DateFormatter()
            self.date = dateFormatter.date(from: dateString)
        }
        if let amountInCents = dictionary["amount"] as? Int {
            self.amountInCents = amountInCents
        }
    }
}
