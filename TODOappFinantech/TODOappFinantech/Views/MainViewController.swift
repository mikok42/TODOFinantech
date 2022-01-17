//
//  ViewController.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import UIKit

class MainViewController: ViewControllerWithView<MainView>, ToDoCellButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.toDoTable.delegate = self
        myView.toDoTable.dataSource = self
        myView.toDoTable.registerCellClasses([ToDoCell.self])
        myView.toDoTable.reloadData()
    }
    
    private let viewModel = MainViewViewModel()
    
    func doneButtonPressed() {
        print("Mikołaj: done")
    }
    
    func deleteButtonPressed() {
        print("Mikołaj: delete")
    }
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Mikołaj: kggk")
        return MainViewViewModel.toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupCell(toDo: MainViewViewModel.toDos[indexPath.row])
        cell.buttonDelegate = self
        print("Mikołaj: oioioi")
        return cell
    }
    
    
}
