//
//  CountriesAPI.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya

enum CountriesAPI {
    case all
    case name(String)
    case listOfCodes([String])
}

extension CountriesAPI: CountriesTarget {
    var path: String {
        switch self {
        case .all: return "all"
        case let .name(name): return "/name/\(name)"
        case .listOfCodes: return "alpha"
        }
    }
    
    var additionalParameters: [String: String] {
        switch self {
        case .all, .name: return [:]
        case let .listOfCodes(codes): return ["codes": codes.joined(separator: ";")]
        }
    }
}
