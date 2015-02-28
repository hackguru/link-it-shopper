//
//  MerchantListItem.m
//  Link It Shopper
//
//  Created by Sina Rezaimehr on 2/19/15.
//  Copyright (c) 2015 Sina Rezaimehr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MerchantListItem.h"

#define kBoarderWidth 0.5
#define kCornerRadius 0.0

@implementation MerchantListItem

@synthesize profileImage = _profileImage;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize userName = _userName;


- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    CALayer *borderLayer = [CALayer layer];
    CGRect borderFrame = CGRectMake(-0.5, -0.5, (self.profileImage.frame.size.width+1), (self.profileImage.frame.size.height+1));
    [borderLayer setBackgroundColor:[[UIColor clearColor] CGColor]];
    [borderLayer setFrame:borderFrame];
    [borderLayer setCornerRadius:kCornerRadius];
    [borderLayer setBorderWidth:kBoarderWidth];
    [borderLayer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.profileImage.layer addSublayer:borderLayer];
    
    
    
}
@end