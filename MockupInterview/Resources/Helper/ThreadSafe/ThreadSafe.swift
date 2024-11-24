//
//  ThreadSafe.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import Foundation

@propertyWrapper public struct ThreadSafe<T> {
    private var _value: T
    private let lock = NSLock()
    private let queue: DispatchQueue

    public var wrappedValue: T {
        get {
            queue.sync { _value }
        }
        _modify {
            lock.lock()
            var tmp: T = _value

            defer {
                _value = tmp
                lock.unlock()
            }

            yield &tmp
        }
    }

    public init(wrappedValue: T, queue: DispatchQueue? = nil) {
        _value = wrappedValue
        self.queue = queue ?? DispatchQueue(label: "ThreadSafe \(String(typeName: T.self))")
    }
}
