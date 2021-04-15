//
//  File.swift
//  EBI
//
//  Created by Tielman Janse van Vuuren on 2021/04/15.
//

import Foundation

protocol Service {
    func getJSONFrom(uri: String, success: (_ data:Any)->(), failure: (_ message:String) -> ())
}
