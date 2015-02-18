//
//  BrowserController.h
//  Link It Merchant
//
//  Created by Edward Rezaimehr on 2/6/15.
//  Copyright (c) 2015 Edward Rezaimehr. All rights reserved.
//

#ifndef Link_It_Merchant_BrowserController_h
#define Link_It_Merchant_BrowserController_h

#import <UIKit/UIKit.h>

@interface BrowserController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (strong, nonatomic) NSString *link;

@property (strong, nonatomic) NSString *imageId;

@property (strong, nonatomic) NSString *instaImageUrl;

@end


#endif
