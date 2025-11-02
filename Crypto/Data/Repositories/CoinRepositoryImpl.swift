//
//  CoinRepositoryImpl.swift
//  Crypto
//
//  Created by Nguyen The Trinh on 2/11/25.
//

import RxSwift

protocol CoinRepositoryImplProtocol {
    func fetchCoin() -> Observable<[Coin]>
}

struct CoinRepositoryImpl: CoinRepository {
    
    let network: NetworkingProtocol
    
    init(network: NetworkingProtocol) {
        self.network = network
    }
    
    func fetchCoin() -> Observable<[Coin]> {
        network.fetchCoin()
    }
}
