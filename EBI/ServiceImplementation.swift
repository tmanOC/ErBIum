//
//  ServiceImplementation.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/15.
//

import Foundation

class ServiceImplementation: Service {
    func getJSONFrom(uri: String, success: (Any) -> (), failure: (String) -> ()) {
        let data = [["refNo":"Reference1", "description":"Transaction1", "dateString":"2020-08-01T08:00:00Z", "amount":25000]]
        success(data)
    }
}
