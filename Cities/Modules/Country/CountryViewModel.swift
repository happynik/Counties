//
//  CountryViewModel.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CountryViewModel {
    private let countriesService: CountriesServiceProtocol
    
    // MARK: - Input
    
    // MARK: - Output
    
    var title: Observable<String>
    var country: Driver<Country>
    var borderedCountries: Driver<[Country]>
    
    init(country: Country, countriesService: CountriesServiceProtocol) {
        self.countriesService = countriesService
        
        self.title = .just(country.name ?? "unknown")
        self.country = .just(country)
        self.borderedCountries = countriesService.list(of: country.borders ?? [])
            .asDriver(onErrorJustReturn: [])
    }
}
