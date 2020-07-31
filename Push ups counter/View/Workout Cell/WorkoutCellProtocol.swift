//
//  WorkoutCellProtocol.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation

protocol WorkoutCellProtocol: class {
    var date: String? { get set }
    var count: String? { get set }
}
