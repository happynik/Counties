//
//  CountriesTarget.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya

protocol CountriesTarget: TargetType {
    var additionalParameters: [String: String] { get }
}

extension CountriesTarget {
    var requestParameters: [String: String] {
        let additionalParameters = [String: String]()
        return ["fields": "name;capital;population;borders;currencies"]
            .merging(additionalParameters, uniquingKeysWith: { (arg1, arg2) -> String in return arg1 })
    }
    
    // MARK: - Override
    var baseURL: URL {
        return URL(string: "https://restcountries.eu/rest/v2")!
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: requestParameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var additionalParameters: [String: String] {
        return [:]
    }
}
