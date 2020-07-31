//
//  WorkoutListConfigurator.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation

class WorkoutListConfigurator: WorkoutListConfiguratorProtocol {
    func configure(with tableViewController: WorkoutListTableViewController) {
        let presenter = WorkoutListPresenter(tableView: tableViewController)
        let interactor = WorkoutListInteractor(presenter: presenter)
        let router = WorkoutListRouter(tableViewController: tableViewController)
        
        tableViewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
