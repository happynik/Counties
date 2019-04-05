//
//  CountriesService.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol CountriesServiceProtocol {
    func all() -> Single<[Country]>
    
    func list(of codes: [String]) -> Single<[Country]>
}

class CountriesService: CountriesServiceProtocol {
    private var provider: MoyaProvider<CountriesAPI>
    
    init(provider: MoyaProvider<CountriesAPI>) {
        self.provider = provider
    }
    
    func all() -> Single<[Country]> {
        return provider.rx.request(.all).map([Country].self)
    }
    
    func list(of codes: [String]) -> Single<[Country]> {
        return codes.isEmpty ? .never() : provider.rx.request(.listOfCodes(codes)).map([Country].self)
    }
}
