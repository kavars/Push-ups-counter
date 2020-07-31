//
//  StoreServiceProtocol.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import Foundation
import CoreData

protocol StoreServiceProtocol: class {
    var managedContext: NSManagedObjectContext { get }
    
    func saveContext()
}
