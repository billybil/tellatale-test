//
//  Screeen3VC.m
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import "Screeen3VC.h"
#import "Screen4VC.h"

@interface Screeen3VC (){
    NSArray *characterImagesArray;
    NSArray *objectImagesArray;
    NSArray *placeBigImagesArray;
    NSArray *placeSmallImagesArray;
    
    int leftInt;
    int middleInt;
    int rightInt;
}

-(IBAction)spinImages;

@end

@implementation Screeen3VC
@synthesize boxLeft;
@synthesize boxMiddle;
@synthesize boxRight;
@synthesize picker1;

-(void)spinImages{
    leftInt = arc4random() % 9;
    middleInt = arc4random() % 6;
    rightInt = arc4random() % 4;
    
    
    [boxRight setImage:[UIImage imageNamed:[placeSmallImagesArray objectAtIndex:rightInt]]];
    [boxMiddle setImage:[UIImage imageNamed:[objectImagesArray objectAtIndex:middleInt]]];
    [boxLeft setImage:[UIImage imageNamed:[characterImagesArray objectAtIndex:leftInt]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    characterImagesArray = [NSArray arrayWithObjects:@"character_11.png", @"character_13.png", @"character_14.png", @"character_15.png", @"character_16.png", @"character_17.png", @"character_18.png", @"character_19.png", @"character_20.png",  nil];
    objectImagesArray = [NSArray arrayWithObjects:@"object_10.png",  @"object_11.png", @"character_21.png", @"character_22.png", @"character_23.png", @"character_24.png", nil];
    placeBigImagesArray = [NSArray arrayWithObjects:@"place_big_12.png", @"place_big_13.png", @"place_big_14.png", @"place_big_15.png", nil];
    placeSmallImagesArray = [NSArray arrayWithObjects:@"place_small_12.png", @"place_small_13.png", @"place_small_14.png", @"place_small_15.png", nil];
    
    [self spinImages];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //[[segue destinationViewController] setThisGame:thisGame];
    
    Screen4VC *myViewController = (Screen4VC *)segue.destinationViewController;
    //[[segue destinationViewController] setbox
    myViewController.boxRightImage = boxRight.image;
    myViewController.boxMiddleImage = boxMiddle.image;
    myViewController.boxLeftImage = boxLeft.image;
    
}

#pragma Picker View Methods
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 236.0;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (view) {
        return view;
    }
    
    switch (row) {
        case 0:
            return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"character_1.png"]];
            break;
        case 1:
            return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"character_2.png"]];
            break;
        case 2:
            return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"character_3.png"]];
            break;
        
        default:
            return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"character_1.png"]];
            break;
    }
}


@end
