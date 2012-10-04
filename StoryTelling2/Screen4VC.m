//
//  Screen4VC.m
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import "Screen4VC.h"
#import "Screen5VC.h"

@interface Screen4VC ()

@end

@implementation Screen4VC
@synthesize boxLeftImage, boxMiddleImage, boxRightImage;

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
    //NSLog(@"right image: %@",boxRightImage);
    //NSLog(@"middle image: %@", boxMiddleImage);
    //NSLog(@"left image: %@", boxLeftImage);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Screen5VC *myViewController = (Screen5VC *) segue.destinationViewController;
    
    myViewController.characterImage = boxLeftImage;
    myViewController.objectImage = boxMiddleImage;
    myViewController.placeImage = boxRightImage;
    myViewController.characterAudioFile = @"airplane.mp3";
    myViewController.objectAudioFile = @"cat.mp3";
}

@end
