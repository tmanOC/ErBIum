//
//  String+DateFormat.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/13.
//

import Foundation

extension String {
    static func aba_format(date: Date) -> String? {
        return ISO8601DateFormatter().string(from: date)
    }
}
