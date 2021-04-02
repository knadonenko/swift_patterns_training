//
//  SubTaskTableViewController.swift
//  CompositePatternTask
//
//  Created by Константин Надоненко on 02.04.2021.
//

import UIKit

class SubTaskTableViewController: UITableViewController {
    
    var task: TodoTask!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.subTasksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell

        cell.setup(forcell: task.subTasksList[indexPath.row])

        return cell
    }
    
    @IBAction func addSubTaskUnwindSegue(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "addSubTask" {
            
            guard let allTasksController = unwindSegue.source as? AddTaskViewController else { return }
        
            if let taskText = allTasksController.taskTextField.text, !taskText.isEmpty {
                let newTask = TodoTask(name: taskText)
                task.subTasksList.append(newTask)
                tableView.reloadData()
            }
    
        
        }
    }
}
