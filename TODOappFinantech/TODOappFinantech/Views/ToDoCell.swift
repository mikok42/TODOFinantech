//
//  ToDoCell.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation
import UIKit
import Then
import SnapKit

public protocol ToDoCellButtonDelegate: AnyObject {
    func doneButtonPressed()
    func deleteButtonPressed()
}

class ToDoCell: UITableViewCell, Identifiable {
    private lazy var categoryIconLabel = UILabel().then {
        $0.font = UIFont(name: Constants.boldFontMod, size: 30)
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.font = UIFont(name: Constants.boldFontMod, size: 10)
        $0.textColor = .black
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = UIFont(name: Constants.boldFontMod, size: 10)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private lazy var urgencyLabel = UILabel().then {
        $0.font = UIFont(name: Constants.boldFontMod, size: 20)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        $0.text = "❕"
    }
    
    private lazy var doneButton = UIButton().then {
        $0.setTitle("✔️", for: .normal)
        $0.backgroundColor = .clear
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        $0.titleLabel?.textColor = .green
        
        $0.addBasicActions()
    }
    
    private lazy var deleteButton = UIButton().then {
        $0.setTitle("❌", for: .normal)
        $0.backgroundColor = .clear
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        $0.addBasicActions()
    }
    
    weak public var buttonDelegate: ToDoCellButtonDelegate?
    var toDoID: UUID?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(toDo: ToDo) {
        self.categoryIconLabel.text = toDo.category.icon
        self.titleLabel.text = toDo.name
        self.descriptionLabel.text = toDo.description
        
        switch toDo.priority {
        case .high:
            urgencyLabel.backgroundColor = .red
        case .low:
            urgencyLabel.backgroundColor = .yellow
        }
    }
    
    private func addSubviews() {
        [titleLabel, descriptionLabel, categoryIconLabel, doneButton, deleteButton, urgencyLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupSubviews() {
        categoryIconLabelSetup()
        titleLabelSetup()
        urgencyLabelSetup()
        descriptionLabelSetup()
        doneButtonSetup()
        deleteButtonSetup()
    }
    
    private func deleteButtonPressed() {
        buttonDelegate?.deleteButtonPressed()
    }
    
    private func doneButtonPressed() {
        buttonDelegate?.doneButtonPressed()
    }
    
    fileprivate func categoryIconLabelSetup() {
        categoryIconLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(Constants.labelsMargins)
            $0.leading.equalTo(snp.leading).offset(Constants.labelsMargins)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
    
    fileprivate func titleLabelSetup() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(Constants.labelsMargins)
            $0.leading.equalTo(categoryIconLabel.snp.trailing).offset(Constants.labelsMargins)
            $0.height.equalTo(20)
        }
    }
    
    fileprivate func urgencyLabelSetup() {
        urgencyLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(Constants.labelsDistance)
            $0.top.equalTo(titleLabel.snp.top)
            $0.height.equalTo(20)
            $0.trailing.lessThanOrEqualTo(doneButton.snp.leading)
        }
    }
    
    fileprivate func descriptionLabelSetup() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(snp.trailing)
            $0.height.equalTo(20)
        }
    }
    
    fileprivate func doneButtonSetup() {
        doneButton.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(Constants.labelsMargins)
            $0.trailing.equalTo(deleteButton.snp.leading).offset(Constants.labelsMargins)
            $0.height.equalTo(20)
        }
    }
    
    fileprivate func deleteButtonSetup() {
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(Constants.labelsMargins)
            $0.trailing.equalTo(snp.trailing).inset(Constants.labelsMargins)
            $0.height.equalTo(20)
        }
    }
}

protocol Identifiable: AnyObject {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
