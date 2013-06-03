//
//  TTViewController.m
//  Ten Tytans
//
//  Created by Derrick Ho on 5/19/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import "TTViewController.h"

@interface TTViewController ()

@end

@implementation TTViewController

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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonNewGame:(id)sender {
	//SegwayTitle2GameInterfaceButtons is the name given to the segway's identifier
	//The below method allows segue execution programatically
//	[self performSegueWithIdentifier:@"SegwayTitle2GameInterfaceButtons" sender:self];// temporary
}

- (IBAction)ButtonLoadGame:(id)sender {
}

- (IBAction)ButtonCredits:(id)sender {
}
- (IBAction)unwindBackToTitle:(UIStoryboardSegue *) segue{
	printf("unwindFromGameInterfaceToTitle\n");
}
@end
