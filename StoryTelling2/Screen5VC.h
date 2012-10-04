//
//  Screen5VC.h
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Screen5VC : UIViewController <AVAudioPlayerDelegate>{
    AVAudioRecorder *audioRecorder;
}

@property (nonatomic, weak) UIImage *characterImage;
@property (nonatomic, weak) UIImage *objectImage;
@property (nonatomic, weak) UIImage *placeImage;

@property (nonatomic, strong) NSString *characterAudioFile, *objectAudioFile;

@property (nonatomic, weak) IBOutlet UIButton *characterImageView;
@property (nonatomic, weak) IBOutlet UIButton *objectImageView;
@property (nonatomic, weak) IBOutlet UIImageView *placeImageView;

@property (nonatomic, strong) AVAudioPlayer *characterAudioPlayer, *objectAudioPlayer;
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;

@property (nonatomic, strong) UIView *mainView;

@end
