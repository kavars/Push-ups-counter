//
//  WorkoutListTableViewController.swift
//  Push ups counter
//
//  Created by Kirill Varshamov on 31.07.2020.
//  Copyright © 2020 Kirill Varshamov. All rights reserved.
//

import UIKit
import CoreData

class WorkoutListTableViewController: UITableViewController, WorkoutListTableViewProtocol {
    
    var presenter: WorkoutListPresenterProtocol!
    let configurator: WorkoutListConfiguratorProtocol = WorkoutListConfigurator()
    
    private let workoutCellID = "workoutCellID"
    
    // tmp
    
    let storeService: StoreServiceProtocol = StoreService(modelName: "PushUpsModel")
    var workouts: [Workout] = []
    // \tmp

    override func viewDidLoad() {
        super.viewDidLoad()

        configurator.configure(with: self)
        presenter.configureView()
        
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        
        do {
            workouts = try storeService.managedContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: workoutCellID, for: indexPath) as? WorkoutCellProtocol else {
            return UITableViewCell()
        }
        
        let workout = workouts[indexPath.row]
        
        guard let wDate = workout.date else {
            return UITableViewCell()
        }

        cell.date = dateFormatter.string(from: wDate)
        cell.count = String(workout.count)
        
        guard let workoutCell = cell as? WorkoutCellTableViewCell else {
            return UITableViewCell()
        }
        
        return workoutCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Properties
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_GB")
        formatter.setLocalizedDateFormatFromTemplate("dMMMMyyyy")
        
        return formatter
    }()

    // MARK: - Action
    
    @IBAction func addWorkout(_ sender: UIBarButtonItem) {
        let dateNow = Date()
        
        for workout in workouts {
            if Calendar.current.isDate(dateNow, inSameDayAs: workout.date!) { //
                workout.count += 10
                
                tableView.reloadData()
                
                storeService.saveContext()
                
                return
            }
        }
        
        let count = Int32(10)
        
        let workout = Workout(context: storeService.managedContext)
        
        workout.date = dateNow
        workout.count = count
        
        workouts.append(workout)
        
        storeService.saveContext()
        
        tableView.reloadData()
    }
}





