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
	[self StartTimer];
}

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
- (void) animate{
	static int count = 0;
	if (count % 60) {
		NSLog(@"Doing what animaters do best");
	}
}
- (void) StartTimer{
	if( ![self timer]){
		//This will make sure that the specified function is called after an amount of time has passed
		[self setTimer:[NSTimer
						scheduledTimerWithTimeInterval:1.0/60.0
														target:self
						selector:@selector(animate)
						userInfo:NULL
						repeats:YES]];
	}
}
@end
