//
//  CoreData.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 27/09/21.
//
import Foundation
import CoreData


class CoreDataService:ObservableObject{
    
    func add(data:Activity,title:String,category:String,sticker:String,date:Date)->Activity{
        data.title = title
        data.category = category
        data.sticker = sticker
        data.date = date
        data.isDone = false
        data.isFavorite = false
        
        return data
    }
}
