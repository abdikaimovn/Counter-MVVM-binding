//
//  MainPresenter.swift
//  Counter+MVVM+binding
//
//  Created by Нурдаулет on 27.03.2024.
//

protocol MainViewModelProtocol {
    var count: Observable<Int>? { get set }
}

final class MainViewModel: MainViewModelProtocol {
    var count: Observable<Int>? = Observable(value: 0)
    
    func plusButtonTapped() {
        count?.value += 1
    }
}
