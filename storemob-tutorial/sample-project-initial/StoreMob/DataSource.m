//
//  DataSource.m
//  StoreMob
//
//  Created by Tope Abayomi on 06/12/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

/*
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
*/

@end
