//
//  TTGameInterfaceViewController.h
//  Team Tytans
//
//  Created by Derrick Ho on 6/1/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <CoreMotion/CoreMotion.h>
//#import <QuartzCore/QuartzCore.h>
//#import "TTGameScreenViewController.h"
//#import "TTPictureStoryPanViewController.h"

@interface TTGameInterfaceViewController : UIViewController{
	BOOL loadTitle;
}
@property (strong, nonatomic) IBOutlet UIButton *LeftButton;
@property (strong, nonatomic) IBOutlet UIButton *RightButton;
@property (strong, nonatomic) IBOutlet UIButton *JumpButton;
@property (strong, nonatomic) IBOutlet UIButton *AttackButton;
@property (strong, nonatomic) IBOutlet UIView *GameScreen;
//@property (strong, nonatomic)  CMMotionManager *motionManager;
//@property (strong, nonatomic) CADisplayLink *motionDisplayLink;

@end
