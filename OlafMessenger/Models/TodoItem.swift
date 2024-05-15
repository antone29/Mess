//
//  Item.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//

import UIKit
import SwiftUI

/// A simple model to keep track of tasks
class TodoItem: NSObject, ObservableObject, Identifiable {
    var taskName: String
    @Published var isCompleted: Bool = false
    
    init(task: String) {
        taskName = task
    }
}
