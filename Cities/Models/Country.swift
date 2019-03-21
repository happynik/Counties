//
//  Country.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

struct Country: Codable {
    var name: String?
    var capital: String?
    var population: Int?
    var borders: [String]?
    var currencies: [Currency]?
}

typealias CountryCode = String

struct Currency: Codable {
    var code: String?
    var name: String?
    var symbol: String?
}
