//
//  SUINavigationLink.swift
//  UIKitHelper
//
//  Created by sauron on 2023/6/22.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

import UIKit

public struct SUINavigationLink<Label> {
    public var label: Label
    public var destination: () -> UIViewController
    
    public init(_ label: Label, destination: @escaping () -> UIViewController) {
        self.label = label
        self.destination = destination
    }
    
}
