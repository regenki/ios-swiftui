//
//  Notification.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 03/10/21.
//

import Foundation
import UserNotifications

class Notification:ObservableObject{
    var userNotificationCenter = UNUserNotificationCenter.current()
    func schenduled(notification data:Activity){
        
        do{
            userNotificationCenter.requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { success,error in
                if success{
                    print("Nice")
                }else if let errorData = error{
                    print(errorData.localizedDescription)
                }
            })
            let contentNotification = UNMutableNotificationContent()
            contentNotification.title = data.title!
            contentNotification.subtitle = data.category!
            contentNotification.categoryIdentifier = data.title ?? UUID().description
            contentNotification.sound = UNNotificationSound(named: UNNotificationSoundName.init(rawValue: "yay.wav"))
            
            
            guard let image = Bundle.main.path(forResource: "\(String(describing: data.sticker!))", ofType: "png")else{
            return
                
            }
            let attachement = try UNNotificationAttachment(identifier: "", url: URL(fileURLWithPath: image), options: nil)
            contentNotification.attachments = [attachement]
            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.day,.month,.year,.hour,.minute], from: data.date!), repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: contentNotification, trigger: trigger)
            userNotificationCenter.self
            userNotificationCenter.add(request, withCompletionHandler: {_ in })
            
        }
        catch{
            
        }
    }
    func delete(notification data:Activity){
        userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [data.title!])
    }
}
