//
//  Networking.swift
//  Crypto
//
//  Created by Nguyen The Trinh on 2/11/25.
//

import RxSwift

protocol NetworkingProtocol {
    func fetchCoin() -> Observable<[Coin]>
}

public struct FakeNetworking: NetworkingProtocol {
    let scheduler = MainScheduler()
    func fetchCoin() -> Observable<[Coin]> {
        return Observable.just([Coin(id: "1", name: "Coin Name", description: "Coin description")])
            .delay(.seconds(3), scheduler: scheduler)
    }
}
