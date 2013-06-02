//
//  TTViewController.h
//  Ten Tytans
//
//  Created by Derrick Ho on 5/19/13.
//  Copyright (c) 2013 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTViewController : UIViewController
- (IBAction)ButtonNewGame:(id)sender;
- (IBAction)ButtonLoadGame:(id)sender;
- (IBAction)ButtonCredits:(id)sender;

@end
/*This is the header for the top most view aka the Title Screen.
The header and implementation files have not yet been created for the other view controllers.  In order to associate a objective c class with a view controller you must select the specific view controller then....:
 
 View Controller(orange circle) ->
 utilites-> identity inspector -> custom class -> class -> (pick the class)
 
 The above tip is also useful for when you are making generic objects such as a platform.  The platform would be a derived class of a uiView or uiImageView and you would follow the above steps to associate it with the class
 
 */