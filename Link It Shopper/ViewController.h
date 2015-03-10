//
//  ViewController.h
//  Link It Merchant
//
//  Created by Edward Rezaimehr on 2/4/15.
//  Copyright (c) 2015 Edward Rezaimehr. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const NSString *USER_ID_KEY;

@interface ViewController : UITableViewController <NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, assign) BOOL needToLogout;

@end

