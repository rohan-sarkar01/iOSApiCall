//
//  DictionaryExtension.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 29/01/23.
//

import Foundation

extension Dictionary {
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }
}
