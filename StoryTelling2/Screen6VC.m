//
//  Screen6VC.m
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import "Screen6VC.h"
#import "Screen5VC.h"

#import "Social/Social.h"

@interface Screen6VC (){
    NSArray *characterImagesArray;
    NSArray *objectImagesArray;
    NSArray *placeBigImagesArray;
    NSArray *placeSmallImagesArray;
    
    IBOutlet UIButton *bigVideoButton;
}

 

-(IBAction)spinImages;
-(IBAction)redoStory;
-(IBAction)listenToStory;
-(IBAction)shareStory;
-(IBAction)hidePlaybackView;

@end

@implementation Screen6VC
@synthesize boxLeft, boxMiddle, boxRight;
@synthesize imageToShare;

-(void)spinImages{
    int leftInt = arc4random() % 3;
    int middleInt = arc4random() % 3;
    int rightInt = arc4random() % 3;
    
    [boxRight setImage:[UIImage imageNamed:[placeSmallImagesArray objectAtIndex:rightInt]]];
    [boxMiddle setImage:[UIImage imageNamed:[objectImagesArray objectAtIndex:middleInt]]];
    [boxLeft setImage:[UIImage imageNamed:[characterImagesArray objectAtIndex:leftInt]]];
}

-(void)hidePlaybackView{
    [bigVideoButton setHidden:YES];
}

-(void)redoStory{
    //NSLog(@"redo pressed");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)listenToStory{
    [bigVideoButton setHidden:NO];
    
    //Audio recording
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"recordedStory.caf"];
    NSURL *myURL = [[NSURL alloc] initFileURLWithPath:path];
    //NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:AVAudioQualityMin],AVEncoderAudioQualityKey,[NSNumber numberWithInt:16],AVEncoderBitRateKey,[NSNumber numberWithInt:2],AVNumberOfChannelsKey,[NSNumber numberWithFloat:44100],AVSampleRateKey,nil];
    //_audioRecorder = [[AVAudioPlayer alloc] initWithURL:myURL settings:recordSettings error:&error];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:myURL error:&error];
    
    [_audioPlayer play];
    
}

-(void)shareStory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"recordedStory.caf"];
    NSURL *myURL = [[NSURL alloc] initFileURLWithPath:path];
    
    
    ////////
    
    NSString *textToShare = @"Dad,\n We miss you. Heres our story about the adventures of Mr. Firaffe and Mrs. Frog! \n-Lucy and Izzy";
    
    NSArray *activityItems = @[textToShare];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
    /*
    SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [facebookVC setInitialText:@"This is my story"];
    [facebookVC 
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    characterImagesArray = [NSArray arrayWithObjects:@"character_1.png", @"character_2.png", @"character_3.png",nil];
    objectImagesArray = [NSArray arrayWithObjects:@"object_1.png", @"object_2.png", @"object_3.png",nil];
    placeBigImagesArray = [NSArray arrayWithObjects:@"place_big_1.png", @"place_big_2.png", @"place_big_3.png",nil];
    placeSmallImagesArray = [NSArray arrayWithObjects:@"place_small_1.png", @"place_small_2.png", @"place_small_3.png",nil];
    
    [self spinImages];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    Screen5VC *myViewController = (Screen5VC *) segue.destinationViewController;
//
//    myViewController.characterImage = boxLeft.image;
//    myViewController.objectImage = boxMiddle.image;
//    myViewController.placeImage = boxRight.image;
}

@end
