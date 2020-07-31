//
//  WorkoutListRouter.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation

class WorkoutListRouter: WorkoutListRouterProtocol {
    weak var tableViewController: WorkoutListTableViewController!
    
    init(tableViewController: WorkoutListTableViewController) {
        self.tableViewController = tableViewController
    }
}
