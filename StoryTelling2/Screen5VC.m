//
//  Screen5VC.m
//  StoryTelling2
//
//  Created by JB on 9/22/12.
//  Copyright (c) 2012 JB. All rights reserved.
//

#import "Screen5VC.h"
#import "Screen6VC.h"

@interface Screen5VC (){
    float horzDistanceOfTouchFromObjectX;
    float vertDistanceOfTouchFromObjectY;
    
    //NSString *audioPath;
    UIImage *screenImage;
}

-(IBAction)stop;
//-(void)saveScreenImage;

@end

@implementation Screen5VC
@synthesize characterImage, objectImage, placeImage;
@synthesize characterImageView;
@synthesize objectImageView;
@synthesize placeImageView;
@synthesize characterAudioPlayer, objectAudioPlayer, soundFx;
@synthesize characterAudioFile, objectAudioFile;
@synthesize audioRecorder;
@synthesize mainView;

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"image object: %@",characterImage.images);
    /*
     if ([characterImage.) {
        <#statements#>
    }
    */
    
    //Audio recording
    // TODO: renenable audio recording later
    /*
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"recordedStory.caf"];
    NSURL *myURL = [[NSURL alloc] initFileURLWithPath:path];
    NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:AVAudioQualityMin],AVEncoderAudioQualityKey,[NSNumber numberWithInt:16],AVEncoderBitRateKey,[NSNumber numberWithInt:2],AVNumberOfChannelsKey,[NSNumber numberWithFloat:44100],AVSampleRateKey,nil];
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:myURL settings:recordSettings error:&error];
    [audioRecorder prepareToRecord];
    [audioRecorder record];
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[characterImageView setImage:characterImage];
    //[objectImageView setImage:objectImage];
    
    [characterImageView setBackgroundImage:characterImage forState:UIControlStateNormal];
    [objectImageView setBackgroundImage:objectImage forState:UIControlStateNormal];
    
    [placeImageView setImage:placeImage];
    
    //Add drag event selectors
    [objectImageView addTarget:self action:@selector(imageTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
    
    [objectImageView addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    
    [characterImageView addTarget:self action:@selector(imageTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
    
    [characterImageView addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    
    //Audio
    /*
    NSString *characterAudioPath = [[NSBundle mainBundle] pathForResource:characterAudioFile
                                                                   ofType:@"mp3"];
    if (characterAudioPath) {
        NSURL *charAudioURL = [NSURL fileURLWithPath:characterAudioPath];
        characterAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:charAudioURL error:nil];
        [characterAudioPlayer setDelegate:self];
    }
    */
         
}
#pragma mark - Grab Image

-(UIImage *)grabImageFromView:(UIView *)viewToGrab{
    UIGraphicsBeginImageContext(viewToGrab.bounds.size);
    
    [[viewToGrab layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

-(void)saveImageToPhone:(UIImage *)imageToSave{
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/StoryScreen.jpg"];
    [UIImageJPEGRepresentation(imageToSave, 1.0) writeToFile:jpgPath atomically:YES];
    
    // Create file manager
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // Write out the contents of home directory to console
    NSLog(@"Documents directory: %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
}

#pragma mark - Drag Methods
- (void)imageTouch:(UIButton *)sender withEvent:(UIEvent *)event{
    CGPoint activePoint = [[[event allTouches] anyObject] locationInView:self.view];
    //UIControl *control = sender;
    horzDistanceOfTouchFromObjectX = activePoint.x - sender.frame.origin.x;
    vertDistanceOfTouchFromObjectY = activePoint.y - sender.frame.origin.y;
    
    //[characterAudioPlayer play];
    
    // Sound FX
    NSError *error;
    NSString *path = @"sc_engage.mp3";
    NSData *soundFXfile = [NSData dataWithContentsOfFile:path];
    soundFx = [[AVAudioPlayer alloc] initWithData:soundFXfile error:&error];
    
    [soundFx prepareToPlay];
    NSLog(@"preparing to play: %@", path);
    [soundFx play];
    NSLog(@"jumped with gusto!");
    

    //soundFx = [[AVAudioPlayer alloc], path];
}

- (void)imageMoved:(UIButton *)sender withEvent:(UIEvent *)event{
    CGPoint activePoint = [[[event allTouches] anyObject] locationInView:self.view];
    
    //Define new xPos for object
    float newObject_xPos = activePoint.x - horzDistanceOfTouchFromObjectX;
    float newObject_yPos = activePoint.y - vertDistanceOfTouchFromObjectY;
    
    NSLog(@"test log");
    
    //Limit x position
    /*
    if (newObject_xPos > objectMaxPosition) {
        newObject_xPos = objectMaxPosition;
    }
    if (newObject_xPos < objectMinPosition) {
        newObject_xPos = objectMinPosition;
    }
    */
    //NSLog(@"New X = %f",newObject_xPos);
    
    CGRect newObjectPos = sender.frame;
    newObjectPos.origin.x = newObject_xPos;
    newObjectPos.origin.y = newObject_yPos;
    sender.frame = newObjectPos;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    screenImage = [self grabImageFromView:mainView];
    
    Screen6VC *newVC = (Screen6VC *)segue.destinationViewController;
    newVC.imageToShare = screenImage;
    
    //[audioRecorder stop];
}

-(void)stop{
    //[audioRecorder stop];
}



@end
