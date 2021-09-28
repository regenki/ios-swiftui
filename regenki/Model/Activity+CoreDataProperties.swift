//
//  Activity+CoreDataProperties.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 27/09/21.
//
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var title: String?
    @NSManaged public var category: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var isFavorite: Bool
    @NSManaged public var date: Date?
    @NSManaged public var sticker: String?

}

extension Activity : Identifiable {

}
