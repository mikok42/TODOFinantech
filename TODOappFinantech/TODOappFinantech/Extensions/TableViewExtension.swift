//
//  TableViewExtension.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError("Couldn't dequeue cell with id:  \(T.identifier)") }
        return cell
    }
 
    func registerCellClasses(_ cellClasses: [Identifiable.Type]) {
        cellClasses.forEach { register($0, forCellReuseIdentifier: $0.identifier)}
    }
}
