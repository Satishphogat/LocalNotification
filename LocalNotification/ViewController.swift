//
//  ViewController.swift
//  LocalNotification
//
//  Created by Satish Phogat on 27/06/17.
//  Copyright © 2017 Satish Phogat. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    var checkAccessGranted : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert, completionHandler: {(allow,error) in
        self.checkAccessGranted = allow
        })
    }

    
    
  override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func applyNotification(_ sender: Any) {
        
        if checkAccessGranted{
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "name of notification "
            notificationContent.subtitle = "subtitle"
            notificationContent.body = "Notification Body"
            notificationContent.categoryIdentifier = "message"
            
            let notificationTrigger = UNTimeIntervalNotificationTrigger(
                timeInterval: 60.0,
                repeats: true)
            
            //Set the request for the notification from the above
            let notificationRequest = UNNotificationRequest(
                identifier: "10.second.message",
                content:notificationContent,
                trigger: notificationTrigger
            )
            
            //Add the notification to the currnet notification center
            //        UNUserNotificationCenter.current().add(
            //            request, withCompletionHandler: nil)
            
            
            
            UNUserNotificationCenter.current().add(notificationRequest) {(error) in
                if let notificationError = error {
                    print(notificationError)
                }
                
            }
            
            
            
        }

    }
    
    
    


}

