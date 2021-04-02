//
//  TodoTask.swift
//  CompositePatternTask
//
//  Created by Константин Надоненко on 02.04.2021.
//

import Foundation

class TodoTask: Tasks {
    
    var subTasksList: [TodoTask] = []
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func open() {
        self.subTasksList.forEach{ $0.open() }
    }
    
}
