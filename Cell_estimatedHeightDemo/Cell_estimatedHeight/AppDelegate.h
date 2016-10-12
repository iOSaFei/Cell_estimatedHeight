//
//  AppDelegate.h
//  Cell_estimatedHeight
//
//  Created by iOS-aFei on 16/10/12.
//  Copyright © 2016年 iOS-aFei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

