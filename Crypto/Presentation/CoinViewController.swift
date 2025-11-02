//
//  ViewController.swift
//  Crypto
//
//  Created by Nguyen The Trinh on 2/11/25.
//

import UIKit
import RxSwift

class CoinViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let viewModel = CoinViewModel(usecase: CoinUseCases(repositoty: CoinRepositoryImpl(network: FakeNetworking())))

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCoinTrigger.onNext(())
        
        
        viewModel.loadingSubject.asObservable()
            .subscribe(onNext: { loading in
                print(loading ? "Loading..." : "Loaded")
            })
            .disposed(by: disposeBag)
        
        
        viewModel.errorSubject.asObservable()
            .subscribe(onNext: { error in
                print("Error: \(error)")
            })
            .disposed(by: disposeBag)
        
        viewModel.coin.asObservable()
            .subscribe(onNext: { coins in
                print("Received coins: \(coins.map { $0 })")
            })
            .disposed(by: disposeBag)
        
    }
}

