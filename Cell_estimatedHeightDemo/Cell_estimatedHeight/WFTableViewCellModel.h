//
//  WFTableViewCellModel.h
//  Cell_estimatedHeight
//
//  Created by iOS-aFei on 16/10/12.
//  Copyright © 2016年 iOS-aFei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WFTableViewCell.h"


@interface WFTableViewCellModel : NSObject

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *textString;
@property (nonatomic, strong) NSString *backImageName;
@property (nonatomic, assign) WFTableViewCellIconLocation iconLocation;

@end
