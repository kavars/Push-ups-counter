//
//  WorkoutListProtocols.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation

protocol WorkoutListTableViewProtocol: class {
    
}

protocol WorkoutListInteractorProtocol: class {
    
}

protocol WorkoutListPresenterProtocol: class {
    var router: WorkoutListRouterProtocol! { set get }
    
    func configureView()
}

protocol WorkoutListConfiguratorProtocol: class {
    func configure(with tableViewController: WorkoutListTableViewController)
}

protocol WorkoutListRouterProtocol: class {
    
}
