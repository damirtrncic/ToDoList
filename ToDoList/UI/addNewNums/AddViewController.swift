//
//  AddViewController.swift
//  ToDoList
//
//  Created by Luka Babovic on 10/07/2021.
//

import UIKit
import CoreData
protocol AddViewControllerDelegate {
    func newnumsaved()
    
    
}
class AddViewController: UIViewController {
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var delegate : AddViewControllerDelegate?
    
    @IBOutlet weak var MyText: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func SavePressed(_ sender: Any) {
        if let naziv=self.MyText.text{
            let Name1 = Num(context: contex)
            Name1.name = naziv
        }
        do{
            try contex.save()
            self.delegate?.newnumsaved()
            print("saved")
            
        }
        catch{}
    }
    
    
}
