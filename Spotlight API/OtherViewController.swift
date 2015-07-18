//
//  OtherViewControlle.swift
//  Spotlight API
//
//  Created by Amit Nivedan Kalra on 7/18/15.
//  Copyright © 2015 Amit Nivedan Kalra. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class OtherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let otherViewController : NSUserActivity = NSUserActivity(activityType: "OtherView")
        
        otherViewController.title = "Other"
        otherViewController.keywords = ["sup", "lol", "test"]
        otherViewController.eligibleForSearch = true
        otherViewController.eligibleForPublicIndexing = true
        otherViewController.becomeCurrent()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "displaySearchResult:", name: "DisplaySearchResult", object: nil)
        
        showInSpotlight()
    }
    
    var searchSomeIndex : Int!
    
    func displaySearchResult(notification : NSNotification) {
    
        searchSomeIndex = (notification.object as! NSString).integerValue
        self.performSegueWithIdentifier("showOther", sender: self)
    
    }
    
    var someNumber = 1
    
    func showInSpotlight() {
        
        let searchOther = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        
        searchOther.title = "Other"
        searchOther.keywords = ["sup", "lol", "test"]
        searchOther.contentDescription = "this is a lol test follow @AMITNKALRA"
        
        let searchableItem = CSSearchableItem(uniqueIdentifier: "\(someNumber)", domainIdentifier: "com.(youridentifier).Other", attributeSet: searchOther)
        
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([searchableItem]) {
            
            (error : NSError?) -> Void in
            
            if error != nil {
                
                print(error?.localizedDescription)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

