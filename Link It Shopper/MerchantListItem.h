//
//  MerchantListItem.h
//  Link It Shopper
//
//  Created by Sina Rezaimehr on 2/19/15.
//  Copyright (c) 2015 Sina Rezaimehr. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef Link_It_Shopper_MerchantListItem_h
#define Link_It_Shopper_MerchantListItem_h

@interface MerchantListItem : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *userName;
@property (nonatomic, weak) IBOutlet UIImageView *profileImage;

@end


#endif
