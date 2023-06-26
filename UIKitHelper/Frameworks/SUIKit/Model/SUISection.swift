//
//  SUISection.swift
//  SwiftHelper
//
//  Created by sauron on 2022/5/27.
//  Copyright © 2022 com.teenloong. All rights reserved.
//

import Foundation

public struct SUISection<Label, Value> {
    public var label: Label?
    public var value: Value
    
    public init(_ label: Label? = nil, value: Value) {
        self.label = label
        self.value = value
    }
}
