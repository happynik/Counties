//
//  CountriesListViewModel.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class CountriesListViewModel {
    private var countriesService: CountriesServiceProtocol
    
    // MARK: - Input
    
    var selectedCountry: AnyObserver<Country>
    
    // MARK: - Output
    
    var countries: Observable<[Country]>
    
    var showCountry: Observable<Country>
    
    init(countriesService: CountriesServiceProtocol) {
        self.countriesService = countriesService
        
        self.countries = countriesService.all().asObservable()
        
        let selectedCountry = PublishSubject<Country>()
        self.selectedCountry = selectedCountry.asObserver()
        self.showCountry = selectedCountry.asObservable()
    }
}
