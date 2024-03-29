//
//  Observable.swift
//  Counter+MVVM+binding
//
//  Created by Нурдаулет on 28.03.2024.
//
import Foundation

final class Observable<T: Equatable> {
    var value: T {
        didSet {
            if value != oldValue {
                listener?(value)
            }
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    private var listener: ((T) -> ())?
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
