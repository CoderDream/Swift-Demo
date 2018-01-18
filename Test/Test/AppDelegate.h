//
//  AppDelegate.h
//  Test
//
//  Created by WingChing_Yip on 2017/12/1.
//  Copyright © 2017年 ywc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

