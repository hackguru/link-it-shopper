//
//  BrowserController.m
//  Link It Merchant
//
//  Created by Edward Rezaimehr on 2/6/15.
//  Copyright (c) 2015 Edward Rezaimehr. All rights reserved.
//

#import "BrowserController.h"
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>
#import "AppDelegate.h"

@interface BrowserController ()

@end

@implementation BrowserController{
    UIViewController *cropController;
    NSTimer *progressBarTimer;
    bool isDoneLoadingAPage;
}

@synthesize webView = _webView;
@synthesize link = _link;
@synthesize instaImageUrl = _instaImageUrl;
@synthesize instaImageUrlBig = _instaImageUrlBig;
@synthesize toolBar = _toolBar;
@synthesize progressBar = _progressBar;
@synthesize instaImageBig = _instaImageBig;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(self.link != nil){
        [self loadRequestFromString: self.link];
    } else  {
        [self loadRequestFromString: @"http://www.google.com"];
    }
    UIButton *instaImageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35,35)];
    [instaImageButton sd_setImageWithURL:[NSURL URLWithString:self.instaImageUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading"]];
    [self.instaImageBig sd_setImageWithURL:[NSURL URLWithString:self.instaImageUrlBig] placeholderImage:[UIImage imageNamed:@"loading"]];
    [instaImageButton addTarget:self action:@selector(instaImageTouched) forControlEvents:UIControlEventTouchDown];
    [instaImageButton addTarget:self action:@selector(instaImageUntouched) forControlEvents:UIControlEventTouchUpInside];
    [instaImageButton addTarget:self action:@selector(instaImageUntouched) forControlEvents:UIControlEventTouchUpOutside];
    UIBarButtonItem *instaImageBarButton =[[UIBarButtonItem alloc] initWithCustomView:instaImageButton];
    NSMutableArray *currentItems = self.toolBar.items.mutableCopy;
    [currentItems insertObject:instaImageBarButton atIndex:0];
    [self.toolBar setItems:currentItems];
    self.progressBar.hidden = YES;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                         change:(NSDictionary *)change context:(void *)context
{
    if (object == [NSUserDefaults standardUserDefaults] && [keyPath isEqualToString:kMostRecentNotificationForPostKey] && [[NSUserDefaults standardUserDefaults] valueForKey:kMostRecentNotificationForPostKey] != nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        @try{
            [super observeValueForKeyPath:keyPath ofObject:object
                                   change:change context:context];
        }
        @catch (NSException * __unused exception) {}
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [[NSUserDefaults standardUserDefaults] addObserver:self
               forKeyPath:kMostRecentNotificationForPostKey
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
}

- (void)loadRequestFromString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    if(!url.scheme)
    {
        NSString* modifiedURLString = [NSString stringWithFormat:@"http://%@", urlString];
        url = [NSURL URLWithString:modifiedURLString];
    }
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:urlRequest];
}

- (IBAction)goBack:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openInSafari:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.webView.request.URL.absoluteString]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    isDoneLoadingAPage = true;
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
   navigationType:(UIWebViewNavigationType)navigationType {
    if(self.progressBar.hidden){
        self.progressBar.hidden = false;
        self.progressBar.progress = 0;
        isDoneLoadingAPage = false;
        progressBarTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
    }
    return YES;
}

-(void)timerCallback {
    if (isDoneLoadingAPage) {
        if (self.progressBar.progress >= 1) {
            self.progressBar.hidden = true;
            [progressBarTimer invalidate];
        }
        else {
            self.progressBar.progress += 0.1;
        }
    }
    else {
        self.progressBar.progress += 0.005;
        if (self.progressBar.progress >= 0.95) {
            self.progressBar.progress = 0.95;
        }
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    @try {
        [[NSUserDefaults standardUserDefaults] removeObserver:self forKeyPath:kMostRecentNotificationForPostKey];
    }
    @catch (NSException * __unused exception) {}
}

- (void)instaImageTouched{
    self.instaImageBig.hidden = NO;
}

- (void)instaImageUntouched{
    self.instaImageBig.hidden = YES;
}

@end
