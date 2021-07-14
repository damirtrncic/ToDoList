//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by Luka Babovic on 12/07/2021.
//

import UIKit
import CoreData
protocol DeleteViewControllerDelegate {
    func delete()
    
}
class DeleteViewController: UIViewController {
    
    
    @IBOutlet weak var LabelDetail: UILabel!
    let  content : Details
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate : DeleteViewControllerDelegate?
    init(detail:Details) {
        self.content=detail
    
        super.init(nibName: nil,  bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LabelDetail.text = self.content.title
    }
    

    @IBAction func DeletePressed(_ sender: Any){
        if let naziv=self.LabelDetail.text{
            let Name1 = Num(context: contex)
            Name1.name = naziv
        }
        do{
            try contex.save()
            self.delegate?.delete()
            print("saved")
            
        }
        catch{}
    }
    
}
    
    

