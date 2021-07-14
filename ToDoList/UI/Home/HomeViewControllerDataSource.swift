//
//  HomeViewControllerDataSource.swift
//  ToDoList
//
//  Created by Luka Babovic on 10/07/2021.
//

import UIKit
import CoreData
protocol MakeFeedback {
    func dataUpdate()
}
class HomeViewControllerDataSource: NSObject{
    let coontex=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let cellID="tableViewCell"
    var feedback:MakeFeedback?
    var niz = [Num]()
    
    func fetchData(){
        do{
            let niz = try coontex.fetch(Num.fetchRequest())
            guard let niz1 = niz as? [Num]  else { return }
            self.niz = niz1
            print("number of goals is ->\(self.niz.count)")
            self.feedback?.dataUpdate()
                
            }
        catch{}
    }
    func deleteItem(item: Num){
        coontex.delete(item)
        do{ try coontex.save()
            
            
        }catch{}
    }

}
extension HomeViewControllerDataSource:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.niz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath)
        
        guard let NumCell=cell as? TableViewCell else {return cell}
        NumCell.MyLabel.text = self.niz[indexPath.row].name
        return NumCell
    }
    
}
