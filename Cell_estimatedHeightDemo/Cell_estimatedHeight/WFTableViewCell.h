//
//  WFTableViewCell.h
//  Cell_estimatedHeight
//
//  Created by iOS-aFei on 16/10/12.
//  Copyright © 2016年 iOS-aFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WFTableViewCellModel;

typedef NS_ENUM(NSInteger, WFTableViewCellIconLocation) {
    WFTableViewCellIconLeft,
    WFTableViewCellIconRight
};

@interface WFTableViewCell : UITableViewCell

@property(nonatomic, strong) WFTableViewCellModel *cellModel;

@end
