//
//  UIButtonExtension.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation
import UIKit

extension UIButton {
    @objc private func buttonLetGoOutside(_ sender: UIButton) { sender.alpha = 1 }
    @objc private func buttonTouched(_ sender: UIButton) { sender.alpha = 0.5 }
    
    func addBasicActions() {
        self.addTarget(self, action: #selector(buttonLetGoOutside(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(buttonLetGoOutside(_:)), for: .touchUpOutside)
    }
}

