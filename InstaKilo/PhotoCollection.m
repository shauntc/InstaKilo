//
//  PhotoCollection.m
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "PhotoCollection.h"

@implementation PhotoCollection

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photos = [[NSMutableArray alloc] init];
        
        for(NSString *photoName in [self returnPhotoStrings])
        {
            Photo *photo = [[Photo alloc] initWithPhotoNamed:photoName andLocation:[NSString stringWithFormat:@"%d Location", arc4random_uniform(10)] andSubject:[NSString stringWithFormat:@"%d Subject", arc4random_uniform(10)]];
            [_photos addObject:photo];
        }
        
    }
    return self;
}

-(void)sortBySubject
{
        [self.photos sortUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"subject" ascending:NO],[NSSortDescriptor sortDescriptorWithKey:@"location" ascending:NO],nil]];
    
    self.sortedBy = @"Subject";
}


-(void)sortByLocation
{
    [self.photos sortUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"location" ascending:NO],[NSSortDescriptor sortDescriptorWithKey:@"subject" ascending:NO],nil]];
    
    self.sortedBy = @"Location";
}


-(NSArray<NSString *> *)returnPhotoStrings
{
    return @[
             @"IMG_20140706_115212.jpg",
             @"IMG_20140913_131112.jpg",
             @"IMG_20140913_131121.jpg",
             @"IMG_20150414_110715.jpg",
             @"IMG_20150414_145730.jpg",
             @"IMG_20150420_102515.jpg",
             @"IMG_20150420_170735.jpg",
             @"IMG_20150424_142912.jpg",
             @"IMG_20150609_165144.jpg",
             @"IMG_20150706_193643.jpg",
             @"IMG_20150816_135508.jpg",
             @"IMG_20150820_063703.jpg",
             @"PANO_20140704_151535.jpg",
             @"PANO_20140913_134040.jpg",
             @"PANO_20150417_141932.jpg",
             @"PANO_20150421_085327.jpg",
             @"PANO_20150422_143242.jpg",
             @"PANO_20150422_143329.jpg",
             @"PANO_20150422_143346.jpg",
             @"PANO_20150422_143716.jpg",
             ];
}


@end
