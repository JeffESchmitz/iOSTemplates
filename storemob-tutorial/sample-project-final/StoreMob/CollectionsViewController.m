//
//  CollectionsViewController.m
//  StoreMob
//
//  Created by App Design Vault on 19/11/13.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "CollectionsViewController.h"
#import "CollectionsCell.h"
#import "CollectionDetailController.h"
#import <QuartzCore/QuartzCore.h>

@interface CollectionsViewController ()
@property (nonatomic, strong) NSArray *arrCollectionsData;
@property (nonatomic, strong) NSMutableArray *arrCollectionsImages;

/*! This method is used to setup the navigation bar items. Specifically, it's used to create the
 *  left bar button item, the title of the navigation bar and the right bar button item. It's called
 *  from the viewDidLoad method.
 */
-(void)setupNavigationBarItems;

/*!
 *  The method is used to download the JSON which contains the Collections data that will be displayed
 *  on the collection view. It's called by the viewDidLoad method.
 */
-(void)getCollectionsData;

/*!
 *  It's used to download an image from the URL provided as a parameter. Once the image data has been
 *  downloaded, a UIImage object created by this data is stored into the arrCollectionsImages array, into
 *  the position specified by the index parameter value.
 *  \param  imageDataUrl:   The URL to get the image data from.
 *  \param  index:  The index of the position that the downloaded image will be stored into.
 */
-(void)getImageDataFromURL:(NSURL *)imageDataUrl forIndex:(int)index;
@end

@implementation CollectionsViewController

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
    
    [self setupNavigationBarItems];

    // Make self the collection view's delegate and datasource.
    [_cvCollections setDelegate:self];
    [_cvCollections setDataSource:self];
    
    _cvCollections.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
    
    // Register the CollectionsCell xib file with the collection view. Set the identifier "collectionsCell" that will
    // be used later when cell will be dequeued and to be displayed the collection view cells.
    UINib *collectionsCellNib = [UINib nibWithNibName:@"CollectionsCell" bundle:nil];
    [_cvCollections registerNib:collectionsCellNib forCellWithReuseIdentifier:@"collectionsCell"];
    
    // Setup the layout for the collection view.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(142.0, 188.0)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setSectionInset:UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0)];
    [_cvCollections setCollectionViewLayout:layout];
    
    // Initially make the collections data and images arrays nil.
    _arrCollectionsData = nil;
    _arrCollectionsImages = nil;
    
    // Download the Collections data.
    [self getCollectionsData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private method implementation


-(void)setupNavigationBarItems{
    // Set the title of the navigation bar.
    self.navigationItem.title = @"COLLECTIONS";

    // Set the left bar button item.
    UIImage *leftItemImage = [[UIImage imageNamed:@"collections_left"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftItemImage
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:nil];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
    // Set the right bar button item.
    // This is going to be a custom UIButton, on which a UILabel object will be added as a subview
    // so as to represent the badge number.
    
    // Get the image.
    UIImage *collectionsRightImage = [UIImage imageNamed:@"collections_right"];
    // Create a custom UIButton with size equal to the image's size.
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0.0, 0.0, collectionsRightImage.size.width, collectionsRightImage.size.height)];
    // Set the image to its image property.
    [rightButton setImage:collectionsRightImage forState:UIControlStateNormal];
    
    // Create a custom UILabel object with the following frame, so as to make it appear at the upper-right side of
    // the custom UIButton.
    UILabel *badge = [[UILabel alloc] initWithFrame:CGRectMake(rightButton.frame.size.width - 6.0, rightButton.frame.origin.y - 4.0, 15.0, 15.0)];
    // Set the background color.
    [badge setBackgroundColor:[UIColor colorWithRed:1.0 green:91.0/255.0 blue:84.0/255.0 alpha:1.0]];
    // Set the corner radius value to make the label appear rounded.
    [[badge layer] setCornerRadius:8.0];
    // Set its value, alignment, color and font.
    [badge setText:@"5"];
    [badge setTextAlignment:NSTextAlignmentCenter];
    [badge setTextColor:[UIColor whiteColor]];
    [badge setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0]];
    // Add the image as a subview to the custom button.
    [rightButton addSubview:badge];
    
    // Create a bar button item with custom view. This is the custom button.
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    // Add it to the navigation bar.
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}


-(void)getCollectionsData{
    // Specify the data URL.
    NSURL *url = [NSURL URLWithString:@"http://www.appdesignvault.com/downloads/storemob/storemob.json"];
    
    // Use a NSURLSession session to get the data in combination with a NSURLSessionDataTask object.
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            // In case any error occurs just log a message along with a description of the error.
            NSLog(@"An error occured while getting Collections data.");
            NSLog(@"%@", [error localizedDescription]);
        }
        else{
            NSError *jsonError;
            
            // Get a dictionary from the downloaded JSON data, using the NSJSONSerialization class.
            NSDictionary *jsonDataDict = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:&jsonError];
            
            if (jsonError) {
                // If an error occured while converting JSON data into a NSDictionary object then log a message
                // along with the error description.
                NSLog(@"Unable to convert JSON data.");
                NSLog(@"%@", [jsonError localizedDescription]);
            }
            else{
                // Initialize the _arrCollectionsData array with contents the array of the "items" key, of
                // the dictionary object.
                _arrCollectionsData = [[NSArray alloc] initWithArray:jsonDataDict[@"items"]];
                
                // Also, initialize the _arrCollectionsImages array and fill it with null objects.
                _arrCollectionsImages = [[NSMutableArray alloc] init];
                for (int i=0; i<[_arrCollectionsData count]; i++) {
                    [_arrCollectionsImages addObject:[NSNull null]];
                }
                
                // As NSURLSession tasks are asynchronous, reload the data of the collection view using the main thread.
                // Do that right now to allow any downloaded data to appear until all images are downloaded too.
                [_cvCollections performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
                
                
                // Using a loop, get each one image URL from the _arrCollectionsData array and download it by making use
                // of the getImageDataFromURL:forIndex: private method.
                for (int i=0; i<[_arrCollectionsData count]; i++) {
                    // Get the image URL as a string value.
                    NSString *imageURLString = _arrCollectionsData[i][@"image"];
                    // Call the next method to download the image.
                    // Provide the index value to specify the position where the downloaded image should be stored
                    // into the _arrCollectionsImages array.
                    [self getImageDataFromURL:[NSURL URLWithString:imageURLString] forIndex:i];
                }
            } // else
        } // else
    }];
    
    // Begin downloading the JSON data.
    [task resume];
}


-(void)getImageDataFromURL:(NSURL *)imageDataUrl forIndex:(int)index{
    // Use a NSURLSession object with a NSURLSessionDataTask object to download the image specified by the parameter URL value.
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:imageDataUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // If no error occurs, then get the NSHTTPURLResponse value of the response and make sure that
            // the status code is 200, which means that it's all OK.
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if ([urlResponse statusCode] == 200) {
                // In that case, replace the null object at the position specified by the index parameter value with
                // a UIImage object created from the downloaded data.
                _arrCollectionsImages[index] = [[UIImage alloc] initWithData:data];
            }
            else{
                // If the status code of the response is other than 200, then no image data was downloaded. In that case
                // simply replace the position specified by the index value with any object other than of UIImage.
                // In this case I set a NSString object (empty string).
                _arrCollectionsImages[index] = @"";
            }
        } // if
        else{
            // If any error occurs simply log its description and replace the object at the position specified by the index value
            // with an empty string object (just like in the previous else case).
            NSLog(@"%@", [error localizedDescription]);
            _arrCollectionsImages[index] = @"";
        } // else
        
        // Using the main thread reload the item at the index specified by the index parameter value.
        [_cvCollections performSelectorOnMainThread:@selector(reloadItemsAtIndexPaths:) withObject:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:index inSection:0]] waitUntilDone:NO];
    }];
    
    // Begin downloading the image data.
    [task resume];
}


#pragma mark - UICollectionView Delegate and Datasource method implementation

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger totalItems = 0;
    
    if (_arrCollectionsData != nil) {
        totalItems = [_arrCollectionsData count];
    }
    
    return totalItems;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue a CollectionsCell cell using the "collectionsCell" identifier.
    CollectionsCell *cell = (CollectionsCell *)[_cvCollections dequeueReusableCellWithReuseIdentifier:@"collectionsCell"
                                                                                         forIndexPath:indexPath];
    
    
    // First of all, show the image of the current cell.
    // Make sure that the _arrCollectionImages array doesn't have an object of NSNull class at the current position
    // and that the kind of class is of UIImage class.
    if (![_arrCollectionsImages[indexPath.row] isKindOfClass:[NSNull class]]) {
        if ([_arrCollectionsImages[indexPath.row] isKindOfClass:[UIImage class]]) {
            // Set the image at the imgSample image view object of the cell.
            [[cell imgSample] setImage:_arrCollectionsImages[indexPath.row]];
        }
        
        // Stop animating the activity indicator and make it dissapear.
        [[cell activityIndicator] stopAnimating];
        [[cell activityIndicator] setHidden:YES];
    }
    
    // Set the brand value.
    [[cell lblBrand] setText:_arrCollectionsData[indexPath.row][@"name"]];
    
    // Set the images of the views, likes and purchases into the respective image view objects of the cell.
    [[cell imgViews] setImage:[UIImage imageNamed:@"views"]];
    [[cell imgLikes] setImage:[UIImage imageNamed:@"likes"]];
    [[cell imgPurchases] setImage:[UIImage imageNamed:@"purchases"]];
    
    // Convert the number of the views, likes and purchases into NSString values and show them in the respective labels of
    // the cell.
    NSString *views = [NSString stringWithFormat:@"%d", [_arrCollectionsData[indexPath.row][@"views"] intValue]];
    [[cell lblViews] setText:views];
    
    NSString *likes = [NSString stringWithFormat:@"%d", [_arrCollectionsData[indexPath.row][@"likes"] intValue]];
    [[cell lblLikes] setText:likes];
    
    NSString *purchases = [NSString stringWithFormat:@"%d", [_arrCollectionsData[indexPath.row][@"purchases"] intValue]];
    [[cell lblPurchases] setText:purchases];
    
    
    // Finally, return the cell.
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"detail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CollectionDetailController* detail = segue.destinationViewController;
    
    NSIndexPath* indexPath = _cvCollections.indexPathsForSelectedItems[0];
    NSDictionary* data = _arrCollectionsData[indexPath.row];
    detail.productImage = _arrCollectionsImages[indexPath.row];
    detail.data = data;
}

@end
