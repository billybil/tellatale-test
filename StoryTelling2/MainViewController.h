//
//  MainViewController.h
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
