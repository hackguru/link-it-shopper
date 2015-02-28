//
//  ListItem.m
//  Link It Merchant
//
//  Created by Edward Rezaimehr on 2/4/15.
//  Copyright (c) 2015 Edward Rezaimehr. All rights reserved.
//

#import "ListItem.h"

#define kBoarderWidth 0.5
#define kCornerRadius 0.0

@implementation ListItem

@synthesize instaImage = _instaImage;
@synthesize productLinkImage = _productLinkImage;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize userName = _userName;
@synthesize profileImage = _profileImage;
@synthesize topMargin = _topMargin;


- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    CALayer *borderLayer = [CALayer layer];
    CGRect borderFrame = CGRectMake(-0.5, -0.5, (self.profileImage.frame.size.width+1), (self.profileImage.frame.size.height+3));
    [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer setFrame:borderFrame];
    [borderLayer setCornerRadius:kCornerRadius];
    [borderLayer setBorderWidth:kBoarderWidth];
    [borderLayer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.profileImage.layer addSublayer:borderLayer];
    
    
    
}

@end