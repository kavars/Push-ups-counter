//
//  WorkoutListPresenter.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation

class WorkoutListPresenter: WorkoutListPresenterProtocol {
    weak var tableView: WorkoutListTableViewProtocol!
    var interactor: WorkoutListInteractorProtocol!
    var router: WorkoutListRouterProtocol!
    
    init(tableView: WorkoutListTableViewProtocol) {
        self.tableView = tableView
    }
    
    
    // MARK: - WorkoutListPresenterProtocol methods
    
    func configureView() {
        
    }
}
