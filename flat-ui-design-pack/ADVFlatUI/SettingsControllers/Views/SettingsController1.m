//
//  SettingsController1.m
//  ADVFlatUI
//
//  Created by Tope on 05/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "SettingsController1.h"
#import "SettingsCell1.h"
#import "Utils.h"
#import "RCSwitchOnOff.h"
#import "FlatTheme.h"

@interface SettingsController1 ()

@property (nonatomic, strong) NSArray* settingTitles;

@property (nonatomic, strong) NSArray* settingsElements;

@property (nonatomic, strong) NSString* boldFontName;

@property (nonatomic, strong) UIColor* onColor;

@property (nonatomic, strong) UIColor* offColor;

@property (nonatomic, strong) UIColor* dividerColor;
@end

@implementation SettingsController1

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
	

    self.boldFontName = @"Avenir-Black";
    
    
    self.onColor = [UIColor colorWithRed:53.0/255 green:150.0/255 blue:225.0/255 alpha:1.0];
    self.offColor = [UIColor colorWithRed:33.0/255 green:36.0/255 blue:39.0/255 alpha:1.0];
    self.dividerColor = [UIColor colorWithWhite:0.1 alpha:1.0f];
    
    [FlatTheme styleNavigationBarWithFontName:self.boldFontName andColor:[UIColor colorWithRed:65.0/255 green:75.0/255 blue:89.0/255 alpha:1.0]];
    [FlatTheme styleSegmentedControlWithFontName:self.boldFontName andSelectedColor:self.onColor andUnselectedColor:self.offColor andDidviderColor:self.dividerColor];
    
    self.navigationItem.leftBarButtonItem = [Utils getMenuItem];
    self.navigationItem.rightBarButtonItem  = [Utils getSearchButtonItem];
    
    self.title = @"Settings";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:231.0/255 green:235.0/255 blue:238.0/255 alpha:1.0f];
    self.tableView.separatorColor = [UIColor clearColor];
    
    self.settingTitles  = [NSArray arrayWithObjects:@"Bluetooth", @"Cloud backup", @"Show Offers", @"Streaming", @"Manage Accounts", nil];
    
    self.settingsElements = [NSArray arrayWithObjects:@"None", @"Switch", @"Segment", @"None", @"None", nil];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerView.backgroundColor = [UIColor colorWithRed:51.0/255 green:55.0/255 blue:57.0/255 alpha:1.0];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 200, 40)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:self.boldFontName size:20.0f];
    label.textColor = self.onColor;
    
    label.text = section == 0 ? @"Account Settings" : @"User Information";
    
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SettingsCell1* cell = [tableView dequeueReusableCellWithIdentifier:@"SettingsCell1"];
    
    NSString* title = self.settingTitles[indexPath.row];
    
    NSString* element = self.settingsElements[indexPath.row];
    
    cell.settingTitle.text = title;
    
    if([element isEqualToString:@"Switch"]){
        
        RCSwitchOnOff* cellSwitch = [self createSwitch];
        [cell addSubview:cellSwitch];
    }
    else if ([element isEqualToString:@"Segment"]){
        
        UISegmentedControl* control = [self createSegmentedControlWithItems:[NSArray arrayWithObjects:@"YES", @"NO", @"SOME", nil]];
        
        [cell addSubview:control];
    }

    return cell;
}

-(RCSwitchOnOff*)createSwitch{
    
    FlatTheme* theme = [[FlatTheme alloc] init];
    theme.switchOnBackground = [Utils drawImageOfSize:CGSizeMake(70, 30) andColor:self.onColor];
    theme.switchOffBackground = [Utils drawImageOfSize:CGSizeMake(70, 30) andColor:self.offColor];
    theme.switchThumb = [Utils drawImageOfSize:CGSizeMake(30, 29) andColor:[UIColor colorWithWhite:0.7f alpha:1.0f]];
    theme.switchTextOffColor = [UIColor whiteColor];
    theme.switchTextOnColor = [UIColor whiteColor];
    theme.switchFont = [UIFont fontWithName:self.boldFontName size:12.0f];
    
    RCSwitchOnOff* settingSwitch = [[RCSwitchOnOff alloc] initWithFrame:CGRectMake(230, 15, 70, 30) andTheme:theme];
    return settingSwitch;
}

-(UISegmentedControl*)createSegmentedControlWithItems:(NSArray*)items{
    
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    
    segmentedControl.frame = CGRectMake(150, 15, 150, 30);
    segmentedControl.selectedSegmentIndex = 0;

    return segmentedControl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
