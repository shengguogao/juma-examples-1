//
//  SearchViewController.m
//  JumaFinder
//
//  Created by Wang AnJun on 15/5/11.
//  Copyright (c) 2015年 Jumacc. All rights reserved.
//

#import "SearchViewController.h"
#import "JumaDeviceManager.h"
@class ViewController;

@import AVFoundation;

@interface SearchViewController () <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) CADisplayLink *searchLink;

@end

@implementation SearchViewController

/** minimum of rssi */
float const minRSSI = -100;
/** maximum of rssi */
float const maxRSSI = -15;

/** minimum of audio frequency */
float const minRate =  0.2;
/** minimum of audio frequency */
float const maxRate = 10.0;

#pragma mark - setter and getter

- (AVAudioPlayer *)audioPlayer {
    if (_audioPlayer == nil) {
        
        NSString *smallVolumePath = [[NSBundle mainBundle] pathForResource:@"sonar_sound_1.wav" ofType:nil];
        NSString *largeVolumePath = [[NSBundle mainBundle] pathForResource:@"sonar_sound_2.mp3" ofType:nil];
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:smallVolumePath] error:nil];
        
        // enable adjustable playback rate
        _audioPlayer.enableRate = YES;
        _audioPlayer.delegate = self;
        _audioPlayer.numberOfLoops = -1;
    }
    return _audioPlayer;
}

- (CADisplayLink *)searchLink {
    if (_searchLink == nil) {
        _searchLink = [CADisplayLink displayLinkWithTarget:self.deviceManager selector:@selector(readRSSI)];
        _searchLink.paused = YES;
        
        // the selector will be called (60 / frameInterval) times per second
        _searchLink.frameInterval = 30;
        [_searchLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _searchLink;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *circle = [[UIView alloc] init];
    circle.backgroundColor = [UIColor greenColor];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    circle.bounds = CGRectMake(0, 0, screenSize.width - 40, screenSize.width - 40);
    circle.center = CGPointMake(screenSize.width / 2, screenSize.height / 2);
    [self.view addSubview:circle];
    
    circle.layer.cornerRadius = circle.frame.size.width / 2;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%s", __func__);
    
    // Keep the screen bright
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    self.searchLink.paused = NO;
    [self.audioPlayer stop];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"%s", __func__);
    
    // Cancel the screen bright
    [UIApplication sharedApplication].idleTimerDisabled = NO;
    [self.deviceManager disconnectDevice];
    
    self.searchLink.paused = YES;
    [self.audioPlayer stop];
}

#pragma mark - public method

- (void)receiveRSSI:(NSNumber *)RSSI {
    
    NSLog(@"RSSI = %@", RSSI);
    
    
    if (RSSI) {
        
        double rssi = RSSI.doubleValue;
        
        if (rssi >= minRSSI && rssi <= maxRSSI) {
            
            self.audioPlayer.rate = [self audioRateWithRSSI:rssi];
             
            self.label.text = [NSString stringWithFormat:@"RSSI = %@, Rate = %.2f", RSSI, self.audioPlayer.rate];
            
            // start playing audio
            if (self.audioPlayer.isPlaying == NO) {
                [self.audioPlayer play];
            }
        }
    }
    else { // Failed to read rssi or disconected
        
        [self.audioPlayer pause];
    }
}

#pragma mark -

- (float)audioRateWithRSSI:(float)RSSI {
    
    // [minRSSI, maxRSSI] --- y = k * x * x + d --> [minRate, maxRate]
    // k = (maxRate - minRate) / (maxRSSI * maxRSSI - minRSSI * minRSSI)
    // d =  maxRate - k * maxRSSI * maxRSSI
    
    static float k = 0; k = (maxRate - minRate) / (powf(maxRSSI, 2) - powf(minRSSI, 2));
    static float d = 0; d =  minRate - k * powf(minRSSI, 2);
    
    return k * powf(RSSI, 2) + d;
}

#pragma mark IBAction

- (IBAction)cancel:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    
    NSLog(@"audioPlayerDecodeErrorDidOccur, error : %@", error.localizedDescription);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
    [self.searchLink invalidate];
}

@end
