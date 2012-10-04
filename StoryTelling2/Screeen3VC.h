//
//  Screeen3VC.h
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
// some weird test here

#import <UIKit/UIKit.h>

@interface Screeen3VC : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet UIImageView *boxLeft;
@property (nonatomic, weak) IBOutlet UIImageView *boxMiddle;
@property (nonatomic, weak) IBOutlet UIImageView *boxRight;

@property (nonatomic, weak) IBOutlet UIPickerView *picker1;

@end
