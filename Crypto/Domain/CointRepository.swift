//
//  CointRepository.swift
//  Crypto
//
//  Created by Nguyen The Trinh on 2/11/25.
//

import Foundation
import RxSwift

public protocol CoinRepository {
    func fetchCoin() -> Observable<[Coin]>
}
