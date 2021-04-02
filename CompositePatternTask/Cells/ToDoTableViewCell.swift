//
//  ToDoTableViewCell.swift
//  CompositePatternTask
//
//  Created by Константин Надоненко on 02.04.2021.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoTaskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(forcell task: TodoTask) {
        toDoTaskName.text = task.name
    }

}
