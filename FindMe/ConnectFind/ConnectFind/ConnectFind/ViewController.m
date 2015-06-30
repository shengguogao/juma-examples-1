//
//  ViewController.m
//  JumaFinder
//
//  Created by Wang AnJun on 15/5/8.
//  Copyright (c) 2015年 Jumacc. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "Device.h"

#import "JumaDeviceManager.h"

#import "MBProgressHUD+MJ.h"
#import "UIBarButtonItem+Extension.h"

#import "config.h"

@interface ViewController () <JumaDeviceManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) JumaDeviceManager *deviceManager;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** discovered devices, [Device] */
@property (nonatomic, strong) NSMutableArray *devices;

/** search the connected device view controller */
@property (nonatomic, strong) SearchViewController *searchVC;

@end

@implementation ViewController

#pragma mark - setter and getter

- (JumaDeviceManager *)deviceManager {
    if (_deviceManager == nil) {
        _deviceManager = [[JumaDeviceManager alloc] init];
    }
    return _deviceManager;
}

- (NSMutableArray *)devices {
    if (_devices == nil) {
        _devices = [NSMutableArray array];
    }
    return _devices;
}

- (SearchViewController *)searchVC {
    if (_searchVC == nil) {
        _searchVC= [[SearchViewController alloc] init];
        _searchVC.deviceManager = self.deviceManager;
    }
    return _searchVC;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // table view add refresh controll
    [self addRefreshControl];
    
    //observe the events entering background or foreground
    [self observeBackgroundEvent];
    
    self.navigationItem.backBarButtonItem = [UIBarButtonItem systemBackButtonWithNullTitle];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.deviceManager.delegate != self) {
        self.deviceManager.delegate  = self;
    }
}

#pragma mark -

- (void)addRefreshControl {
    
    UIRefreshControl *refreshCtrl = [[UIRefreshControl alloc] init];
    [refreshCtrl addTarget:self action:@selector(rescan) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshCtrl];
}
- (void)rescan {
    
    [self stopWhenEnterBackground];
    [self startWhenEnterForeground];
    
    for (UIRefreshControl *ctrl in self.tableView.subviews) {
        if ([ctrl isMemberOfClass:[UIRefreshControl class]]) {
            [ctrl endRefreshing];
            break;
        }
    }
}


- (void)observeBackgroundEvent {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startWhenEnterForeground)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(stopWhenEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}
- (void)startWhenEnterForeground {
    
    NSLog(@"%s", __func__);
    
    if (self.deviceManager.delegate != self) {
        self.deviceManager.delegate  = self;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.deviceManager scanDeviceWithName:nil];
    });
}
- (void)stopWhenEnterBackground {
    
    NSLog(@"%s", __func__);
    
    // stop scaning, disconected
    [self.deviceManager stopScan];
    [self.deviceManager disconnectDevice];
     self.deviceManager.delegate = nil;
    
    [self.navigationController popViewControllerAnimated:NO];
    
    // clear data
    [self.devices removeAllObjects];
    [self.tableView reloadData];
    
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
}


#pragma mark - IBAction


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.devices.count;
}

- (NSString *)cellID {
    static NSString *identifier;
    if (identifier == nil) {
        identifier = [NSString stringWithFormat:@"%@ cell", [self class]];
    }
    return identifier;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellID]];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[self cellID]];
    }
    
    Device *device = self.devices[indexPath.row];
    cell.textLabel.text = device.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Device *device = [self.devices objectAtIndex:indexPath.row];

    [self.deviceManager connectDevice:device.UUID];
    
    NSString *msg = [NSString stringWithFormat:@"conecting %@", device.name];
    [MBProgressHUD showMessage:msg toView:self.view];
}

#pragma mark - JumaDeviceManagerDelegate

- (void)deviceManager:(JumaDeviceManager *)deviceManager didUpdateState:(JumaDeviceManagerState)state {
    
    switch (state) {
        case JumaDeviceManagerStatePoweredOn:    NSLog(@"Bluetooth is powerd on");           break;
        case JumaDeviceManagerStatePoweredOff:   NSLog(@"Bluetooth is powerd off");          break;
        case JumaDeviceManagerStateUnauthorized: NSLog(@"Bluetooth is unauthorized");        break;
        case JumaDeviceManagerStateUnsupported:  NSLog(@"Bluetooth state is unsupported");   break;
        case JumaDeviceManagerStateResetting:    NSLog(@"Bluetooth is being reset");         break;
        case JumaDeviceManagerStateUnknown:      NSLog(@"Bluetooth state is unknown");       break;
    }
    
    if (state == JumaDeviceManagerStatePoweredOn) {
        
        // start scaning
        [deviceManager scanDeviceWithName:nil];
    }
}

- (void)deviceManagerDidStopScan:(JumaDeviceManager *)deviceManager {
    JMLog(@"%s", __FUNCTION__);
}

- (void)deviceManager:(JumaDeviceManager *)deviceManager didDiscoverDevice:(NSString *)deviceUUID name:(NSString *)deviceName RSSI:(NSNumber *)RSSI {
    
    NSLog(@"did found device: %@", deviceName);
    
    // record devices discovered
    Device *device = [Device deviceWithName:deviceName UUID:deviceUUID RSSI:RSSI];
    [self.devices insertObject:device atIndex:0];
    
    // refresh table
    [self.tableView reloadData];
}

- (void)showErrorWithTimeForDisappear:(int64_t)delayInSeconds {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [MBProgressHUD showError:@"did fail to connect device" toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void)deviceManager:(JumaDeviceManager *)deviceManager didFailToConnectDevice:(NSString *)deviceUUID error:(NSString *)error {
    
    NSLog(@"didFailToConnectDevice, error : %@", error);
    [self showErrorWithTimeForDisappear:1];
}

- (void)deviceManager:(JumaDeviceManager *)deviceManager didDisconnectDevice:(NSString *)deviceUUID byRemote:(BOOL)byRemote code:(NSInteger)code error:(NSString *)error {
    
    NSLog(@"didDisconnectDevice, error : %@", error);
    
    if (self.navigationController.viewControllers.count == 1) {
        
        if (byRemote) {
            [self showErrorWithTimeForDisappear:1];
        }
    }
    else {
        [self.searchVC receiveRSSI:nil];
        
        if (byRemote) {
            
            // connect again
            [deviceManager connectDevice:deviceUUID];
        }
    }
}

- (void)deviceManager:(JumaDeviceManager *)deviceManager didConnectDevice:(NSString *)deviceUUID {
    
    if (self.navigationController.viewControllers.count == 1) {
    
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        // Get the Device instance with deviceUUID
        Device *device = [self deviceWithUUID:deviceUUID];
        NSLog(@"didConnectDevice : %@", device.name);
        
        self.searchVC.title = device.name;
        [self.navigationController pushViewController:self.searchVC animated:YES];
    }
}

- (void)deviceManager:(JumaDeviceManager *)deviceManager didReadRSSI:(NSNumber *)RSSI error:(NSString *)error {
    
    [self.searchVC receiveRSSI:RSSI];
}

- (Device *)deviceWithUUID:(NSString *)deviceUUID {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"UUID = %@", deviceUUID];
    return [self.devices filteredArrayUsingPredicate:predicate].firstObject;
}

#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.navigationController.viewControllers.count == 1) {
        self.searchVC = nil;
    }
}

@end
