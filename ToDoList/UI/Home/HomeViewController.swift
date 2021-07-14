//
//  HomeViewController.swift
//  ToDoList
//
//  Created by Luka Babovic on 10/07/2021.
//

import UIKit
import CoreData
protocol HomeViewControllerDelegate {
    func showDelete(_ content:Details)
}
class HomeViewController: UIViewController {
    let coontex=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataSource=HomeViewControllerDataSource()
    var delegate : HomeViewControllerDelegate?
    let item = coontex[indexPath.row]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
       
    }
    private func setTableView(){
        
        self.dataSource.fetchData()
        self.dataSource.deleteItem(item: item)
        self.dataSource.feedback=self
        self.tableView.delegate=self
        self.tableView.dataSource=self.dataSource
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: self.dataSource.cellID)
    }
    

    @IBAction func addNumsPressed(_ sender: Any) {
        let addNewNums = AddViewController()
        addNewNums.delegate=self
        self.present(addNewNums, animated: true, completion: nil)
    }
    
}
extension HomeViewController:UITableViewDelegate{
    
}
extension HomeViewController:AddViewControllerDelegate{
    func newnumsaved(){
        self.dataSource.fetchData()
    }
}
extension HomeViewController:DeleteViewControllerDelegate{
    func delete() {
        self.dataSource.deleteItem(item: item)
    }
    
}
extension HomeViewController:MakeFeedback{
    func dataUpdate() {
        self.tableView.reloadData()
    }
}


    


