//
//  CoinUseCases.swift
//  Crypto
//
//  Created by Nguyen The Trinh on 2/11/25.
//

import RxSwift

protocol CoinUseCasesProtocol {
    func fetchCoin() -> Observable<[Coin]>
}

struct CoinUseCases: CoinUseCasesProtocol {
    let repositoty: CoinRepository
    
    func fetchCoin() -> Observable<[Coin]> {
        repositoty.fetchCoin()
    }
}
