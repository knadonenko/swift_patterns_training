//
//  TodoTableViewController.swift
//  CompositePatternTask
//
//  Created by Константин Надоненко on 02.04.2021.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    private var mainTask = TodoTask(name: "mainTasks")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTask.subTasksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        
        cell.setup(forcell: mainTask.subTasksList[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSubTask" {
            let subTasks = segue.destination as! SubTaskTableViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                
                subTasks.task = mainTask.subTasksList[indexPath.row]
            }
        }
    }
    
    @IBAction func addTaskUnwindSegue(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "addTask" {
            
            guard let allTasksController = unwindSegue.source as? AddTaskViewController else { return }
        
            if let taskText = allTasksController.taskTextField.text, !taskText.isEmpty {
                let newTask = TodoTask(name: taskText)
                mainTask.subTasksList.append(newTask)
                tableView.reloadData()
            }
        
        }
    }

}
