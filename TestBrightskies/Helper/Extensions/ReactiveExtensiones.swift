//
//  ReactiveExtensiones.swift
//  TestBrightskies
//
//  Created by Magdy rizk on 28/03/2021.
//  Copyright © 2021 Magdy rizk. All rights reserved.

import Foundation


import UIKit
import RxSwift
import RxCocoa

extension UIViewController: loadingViewable {}

extension Reactive where Base: UIViewController {
    
    /// Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    public var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.startAnimating()
            } else {
                vc.stopAnimating()
            }
        })
    }
    
}


