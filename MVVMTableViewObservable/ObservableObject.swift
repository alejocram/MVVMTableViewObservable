//
//  ObservableObject.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 8/11/22.
//

import Foundation

final class ObservableObject<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping((T) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
