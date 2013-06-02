//
//  TTAppDelegate.h
//  Ten Tytans
//
//  Created by Derrick Ho on 5/19/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTGameScreenViewController.h"
@interface TTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TTGameScreenViewController *GameScreenViewController;
@end
