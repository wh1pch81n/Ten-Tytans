//
//  TTGameScreenViewConroller.h
//  Team Tytans
//
//  Created by Derrick Ho on 6/1/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTGameScreenViewController : UIViewController
@property (strong, nonatomic) NSTimer *timer;
-(void) StopTimer;
-(void) StartTimer;
@property NSInteger dx;//for moving left and right
@property BOOL isDashing;//for doubl taps
@property BOOL isShaking;
@property (strong, nonatomic) IBOutlet UIImageView *hero;
@end
