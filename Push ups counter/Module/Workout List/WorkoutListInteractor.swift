//
//  WorkoutListInteractor.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation

class WorkoutListInteractor: WorkoutListInteractorProtocol {
    weak var presenter: WorkoutListPresenterProtocol!
    
    init(presenter: WorkoutListPresenterProtocol) {
        self.presenter = presenter
    }
}
