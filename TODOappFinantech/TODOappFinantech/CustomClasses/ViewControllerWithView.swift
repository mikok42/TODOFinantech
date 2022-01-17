//
//  ViewControllerWithView.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation
import UIKit

class ViewControllerWithView<View: UIView>: UIViewController {
    var myView: View { view as! View }
    
    override func viewDidLoad() { view = View() }
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
