//
//  Screen6VC.h
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Screen6VC : UIViewController<AVAudioPlayerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *boxLeft;
@property (nonatomic, weak) IBOutlet UIImageView *boxMiddle;
@property (nonatomic, weak) IBOutlet UIImageView *boxRight;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) UIImage *imageToShare;

@end
