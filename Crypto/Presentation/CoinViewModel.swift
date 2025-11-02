//
//  CoinViewModel.swift
//  Crypto
//
//  Created by Nguyen The Trinh on 2/11/25.
//

import RxSwift

class CoinViewModel {
    let fetchCoinTrigger = PublishSubject<Void>()
    let loadingSubject = BehaviorSubject<Bool>(value: false)
    let errorSubject = BehaviorSubject<String>(value: "")
    var coin = BehaviorSubject<[Coin]>(value: [])
    let disposeBag = DisposeBag()
    let useCase: CoinUseCases
    
    init(usecase: CoinUseCases) {
        self.useCase = usecase
        binding()
    }
    
    func binding() {
        fetchCoinTrigger.flatMap { _ -> Observable<[Coin]> in
            self.loadingSubject.onNext(true)
            
            return self.useCase.fetchCoin()
                .do(onNext: { coinList in
                    self.loadingSubject.onNext(false)
                    self.coin.onNext(coinList)
                }, onError: { error in
                    self.errorSubject.onNext("Fetch Coin Error")
                })
                .catch { _ in Observable.empty() }
        }
        .subscribe()
        .disposed(by: disposeBag)
    }
}
