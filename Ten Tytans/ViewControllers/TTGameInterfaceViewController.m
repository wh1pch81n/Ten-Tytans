//
//  TTGameInterfaceViewController.m
//  Team Tytans
//
//  Created by Derrick Ho on 6/1/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "TTGameInterfaceViewController.h"
#import "TTViewController.h"
#import "TTPictureStoryPanViewController.h"
#import "TTGameScreenViewController.h"


enum eBUT{ eLEFTBUTTON, eRIGHTBUTTON, eJUMPBUTTON,
	eATTACKBUTTON, eTILT };

@interface TTGameInterfaceViewController ()
@end

@implementation TTGameInterfaceViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

	loadTitle = YES;
	[self initButton:eLEFTBUTTON];
	[self initButton:eRIGHTBUTTON];
//	[self initButton:eJUMPBUTTON];
	[self initButton:eATTACKBUTTON];
//	[self initButton:eTILT];
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
	[[[self childViewControllers] objectAtIndex:0] StartTimer];
	if(loadTitle == YES){
	[self performSegueWithIdentifier:@"SegueGameInterface2TitleScreen" sender:self];
	}
	
}
- (void)viewWillDisappear:(BOOL)animated{
	[[[self childViewControllers] objectAtIndex:0] StopTimer];
	[self resignFirstResponder];
	[super viewWillDisappear:animated];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//	TTGameScreenViewController *modScreen=(TTGameScreenViewController *)[self GameScreen];
//	[modScreen StopTimer];
}
-(IBAction)unwindIntoGameInterface:(UIStoryboardSegue *) segue{
//	TTGameScreenViewController *modScreen=(TTGameScreenViewController *)[self GameScreen];
//	[modScreen StartTimer];
	
	UIViewController * sourceViewController =
	[segue sourceViewController];
	if ([sourceViewController isKindOfClass:[TTViewController class]]) {
		printf("unwind from titleScreen\n");
		loadTitle = NO;
	}else if([sourceViewController isKindOfClass:[TTPictureStoryPanViewController class]]){
		printf("unwind from movie view\n");
	}
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
		case eTILT:{
//			self.motionManager = [[CMMotionManager alloc] init];
//			self.motionManager.deviceMotionUpdateInterval = 0.02;  // 50 Hz
//			
//			self.motionDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(motionRefresh:)];
//			[self.motionDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//			
//			if ([self.motionManager isDeviceMotionAvailable]) {
//				// to avoid using more CPU than necessary we use `CMAttitudeReferenceFrameXArbitraryZVertical`
//				[self.motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXArbitraryZVertical];
//			}
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
	TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
	[modScreen setDx:-1];
}
-(void) LeftButtonEnded:(UIControl *)c withEvent:ev{
	printf("LB Ended\n");
	TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
	[modScreen setDx:0];
	[modScreen setIsDashing:NO];
}
- (void)LeftButtonOneFingerTwoTaps{
	printf("Left Button-action: one finger, two taps\n");
	TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
	[modScreen setIsDashing:YES];
}

//=================
// right Buttons
//-----------------
-(void) RightButtonBegan:(UIControl *)c withEvent:ev{
	printf("RB began\n");
	TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
	[modScreen setDx:+1];
}
-(void) RightButtonEnded:(UIControl *)c withEvent:ev{
	printf("RB Ended\n");
	TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
	[modScreen setDx:0];
	[modScreen setIsDashing:NO];
}
- (void)RightButtonOneFingerTwoTaps{
	printf("right Button-action: one finger, two taps\n");
	TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
	[modScreen setIsDashing:YES];
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
//- (void)motionRefresh:(id)sender {
//    double yaw = self.motionManager.deviceMotion.attitude.yaw;
//	printf("yawing %f\n", yaw);
//}
//--
-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	//if([event type] == UIEventSubtypeMotionShake){
		printf("motion began\n");
		TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
		[modScreen setIsShaking:YES];
	//}
}
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	//if([event type] == UIEventSubtypeMotionShake){
		printf("motion Ended\n");
		TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
		[modScreen setIsShaking:NO];
	//}
}
-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	//if([event type] == UIEventSubtypeMotionShake){
		printf("motion Cancel\n");
		TTGameScreenViewController *modScreen = [[self childViewControllers] objectAtIndex:0];
		[modScreen setIsShaking:NO];
	//}
}


- (BOOL) canBecomeFirstResponder{
	return YES;
}


@end
