//
//  MainView.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation
import UIKit
import Then
import SnapKit

final class MainView: UIView {
    private(set) var toDoTable = UITableView().then {
        $0.alpha = 0
        $0.backgroundColor = .cyan
        $0.rowHeight = 100
    }
    
    override func layoutSubviews() {
        self.backgroundColor = .purple
        addSubview(toDoTable)
        toDoTable.snp.makeConstraints {
            $0.top.equalTo(snp.top)
            $0.leading.equalTo(snp.leading)
            $0.trailing.equalTo(snp.trailing)
            $0.bottom.equalTo(snp.bottom)
        }
    }
}
