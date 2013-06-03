//
//  TTGameScreenViewConroller.m
//  Team Tytans
//
//  Created by Derrick Ho on 6/1/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "TTGameScreenViewController.h"

@interface TTGameScreenViewController ()

@end

@implementation TTGameScreenViewController

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
	
}
//-(void)viewDidAppear:(BOOL)animated{
//	[super viewDidAppear:animated];
//	//[self StartTimer];
//}
//-(void)viewDidDisappear:(BOOL)animated{
//	//[self StopTimer];
//	[super viewDidDisappear:animated];
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) StopTimer{
	if ( [self timer]) {
		[[self timer] invalidate];
		[self setTimer:nil];
	}
}
- (void) StartTimer{
	if( ![self timer]){
		//This will make sure that the specified function is called after an amount of time has passed
		[self setTimer:[NSTimer
						scheduledTimerWithTimeInterval: 1.0/60.0
														target:self
						selector:@selector(animate)
						userInfo:NULL
						repeats:YES]];
	}
}

- (void) animate{
	static int count = 0;
	if ((++count % 600) ==0) {
		NSLog(@"Doing what animaters do best");
		
	}
	/**left and right*/
	CGRect curLoc = [[self hero] frame];
	curLoc.origin.x += (2 + (([self isDashing])?10: 0)) * [self dx];
	if (curLoc.origin.x + curLoc.size.width < self.view.frame.size.width /*480*/ &&
		curLoc.origin.x >= 0){
		[[self hero] setFrame:curLoc];
	}
	/**Shaking
	 it appears that motoin is insensitive.  when i shake it goes from begin to end
	 begin end begin end even thought i never stopped shaking.  
	 Perhaps detection changes in tilt would be better then shaking
	 */
	float alpha = [[self hero] alpha];
	if ([self isShaking]) {
		alpha -= 0.02;
	}else{
		alpha += 0.01;
	}
	if(alpha <= 1.0 && alpha >= 0.0){
		[[self hero] setAlpha:alpha];
	}
}

@end
