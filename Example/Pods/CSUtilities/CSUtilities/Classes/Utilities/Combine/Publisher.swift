//
//  Publisher.swift
//  CSUtilities
//
//  Created by 于冬冬 on 2023/2/20.
//

import Combine

public extension Publisher where Failure == Never {
    func weakAssign<T: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<T, Output>,
        on object: T
    ) -> AnyCancellable {
        sink { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }
}

