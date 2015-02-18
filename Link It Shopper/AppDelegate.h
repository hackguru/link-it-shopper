//
//  AppDelegate.h
//  Link It Merchant
//
//  Created by Edward Rezaimehr on 2/4/15.
//  Copyright (c) 2015 Edward Rezaimehr. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUpdateRegIdUrl @"http://ec2-54-149-40-205.us-west-2.compute.amazonaws.com/users/updateRegId"
#define kMostRecentNotificationForPostKey @"notificationId"

extern const NSString *NOTIFICATION_TOKEN_KEY;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

