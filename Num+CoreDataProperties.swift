//
//  Num+CoreDataProperties.swift
//  ToDoList
//
//  Created by Luka Babovic on 10/07/2021.
//
//

import Foundation
import CoreData


extension Num {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Num> {
        return NSFetchRequest<Num>(entityName: "Num")
    }

    @NSManaged public var name: String?

}
