//
//  ViewController.h
//  myTableApp
//
//  Created by Dragos Bercea  on 11/5/16.
//  Copyright © 2016 Dragos Bercea . All rights reserved.
///Users/Dragos/Documents/Recreational:later materials/myTableApp/myTableApp/ViewController.h

#import <UIKit/UIKit.h>


//  the UITableViewDataSource tells the table view what data to display
// while UITableViewDelegate is used for the apperance of the table view, how many rows etc
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>



@end

