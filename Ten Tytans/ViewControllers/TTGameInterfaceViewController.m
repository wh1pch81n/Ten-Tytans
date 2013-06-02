//
//  TTGameInterfaceViewController.m
//  Team Tytans
//
//  Created by Derrick Ho on 6/1/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "TTGameInterfaceViewController.h"
enum eBUT{ eLEFTBUTTON, eRIGHTBUTTON, eJUMPBUTTON, eATTACKBUTTON };


@interface TTGameInterfaceViewController ()

@end

@implementation TTGameInterfaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

	[self initButton:eLEFTBUTTON];
	[self initButton:eRIGHTBUTTON];
	[self initButton:eATTACKBUTTON];
	//todo detects shaking/motion
}
- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated{
	[self resignFirstResponder];
	[super viewWillDisappear:animated];
}
-(void) initButton:(int) b{
	
	UITapGestureRecognizer *button= nil;
	UISwipeGestureRecognizer *scratcher = nil;
	UIRotationGestureRecognizer *turn_dial = nil;
	switch (b) {
		case eLEFTBUTTON:{
			
			[[self LeftButton] addTarget:self
								  action:@selector(LeftButtonBegan:withEvent:)
						forControlEvents: UIControlEventTouchDown];
			[[self LeftButton] addTarget:self
								  action:@selector(LeftButtonEnded:withEvent:)
						forControlEvents: UIControlEventTouchUpInside];
			[[self LeftButton] addTarget:self
								  action:@selector(LeftButtonOneFingerTwoTaps)
						forControlEvents:UIControlEventTouchDownRepeat];
		}break;
		case eRIGHTBUTTON:{
			[[self RightButton] addTarget:self
								  action:@selector(RightButtonBegan:withEvent:)
						forControlEvents: UIControlEventTouchDown];
			[[self RightButton] addTarget:self
								  action:@selector(RightButtonEnded:withEvent:)
						forControlEvents: UIControlEventTouchUpInside];
			[[self RightButton] addTarget:self
								   action:@selector(RightButtonOneFingerTwoTaps) forControlEvents:UIControlEventTouchDownRepeat];
		}break;
		case eJUMPBUTTON:{
		//need todo this
		}break;
		case eATTACKBUTTON:{
		button = [[UITapGestureRecognizer alloc]
				  initWithTarget:self
				  action:@selector(AttackButtonThreeFingerTap)];
			[button setNumberOfTouchesRequired:3];
			[button setNumberOfTapsRequired:1];

			//todo tap
			//rotate
			turn_dial = [[UIRotationGestureRecognizer alloc]
						 initWithTarget:self
						 action:@selector(AttackButtonRotate:)];
			//add gestures
			[[self AttackButton] addGestureRecognizer:button];
			[[self AttackButton] addGestureRecognizer:turn_dial];
		}break;
	}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//=================
// Left Buttons
//-----------------
-(void) LeftButtonBegan:(UIControl *)c withEvent:ev{
	printf("LB began\n");
}
-(void) LeftButtonEnded:(UIControl *)c withEvent:ev{
	printf("LB Ended\n");
}
- (void)LeftButtonOneFingerTwoTaps{
	printf("Left Button-action: one finger, two taps\n");
}

//=================
// right Buttons
//-----------------
-(void) RightButtonBegan:(UIControl *)c withEvent:ev{
	printf("RB began\n");
}
-(void) RightButtonEnded:(UIControl *)c withEvent:ev{
	printf("RB Ended\n");
}
- (void)RightButtonOneFingerTwoTaps{
	printf("right Button-action: one finger, two taps\n");
}

//=================
// Jump Buttons
//-----------------
-(void) JumpButtonOneFingerOneTap{
	printf("jump Button-action: one finger, one tap\n");
}
- (void)JumpButtonOneFingerTwoTaps{
	printf("jump Button-action: one finger, two taps\n");
}

//=================
// Game Screen Buttons
//-----------------
- (void)AttackButtonOneFingerOneTap{
	printf("Attack Button-action: one finger, one tap\n");
}
- (void)AttackButtonRotate:(UIRotationGestureRecognizer *)recognizer{
	printf("Attack Button-action: two finger rotate: theta %f\n", ([recognizer rotation] * 180) / M_PI);
}
- (void)AttackButtonThreeFingerTap{
	printf("Attack Button-action: 3 finger Tap\n");
	[self dismissViewControllerAnimated:true completion:NULL];
}

//===================
// mothing shaking
//-------------------
-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	if([event type] == UIEventSubtypeMotionShake)
		printf("motion began\n");
}
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	if([event type] == UIEventSubtypeMotionShake)
		printf("motion Ended\n");
}
-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	if([event type] == UIEventSubtypeMotionShake)
		printf("motion Cancel\n");
}


- (BOOL) canBecomeFirstResponder{
	return YES;
}

//-(UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController
//									 fromViewController:(UIViewController *)fromViewController
//											 identifier:(NSString *)identifier{
//	
//}
@end
