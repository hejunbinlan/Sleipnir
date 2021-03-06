//
//  Equal.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

public class Equal<T: Equatable> : BaseMatcher<T> {
    
    override init(expected: T?) {
        super.init(expected: expected)
    }
    
    override func match(actual: T?) -> Bool {
        return actual == expected
    }
    
    override func failureMessageEnd() -> String {
        return "equal <\(stringify(expected))>"
    }
}

public func equal<T: Equatable>(expected: T?) -> Equal<T> {
    return Equal(expected: expected)
}

public func ==<T: Equatable>(actual: ActualValue<T>, expected: T?) {
    actual.to(equal(expected))
}

public func !=<T: Equatable>(actual: ActualValue<T>, expected: T?) {
    actual.toNot(equal(expected))
}