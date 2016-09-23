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
        _photos = [[NSMutableDictionary alloc] init];
        
        for(NSString *photoName in [self returnPhotoStrings])
        {
            Photo *photo = [[Photo alloc] initWithPhotoNamed:photoName andLocation:[NSString stringWithFormat:@"%d Location", arc4random_uniform(6)] andSubject:[NSString stringWithFormat:@"%d Subject", arc4random_uniform(0)]];
            
            if(!_photos[photo.subject])
            {
                [_photos setObject:[[NSMutableArray alloc] init] forKey:photo.subject];
            }
            
            [_photos[photo.subject] addObject:photo];
        }
        
        //Sorts each array by Location after they have been sorted into arrays by Subject
        for(NSString *key in _photos)
        {
            
            [_photos[key] sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"location" ascending:NO]]];
            
        }
        
        _photosKeys = [[_photos allKeys] mutableCopy];
        
        [self sortKeys];
        
        _sortedBy = @"Subject";
        
    }
    return self;
}



-(void)sortKeys
{
    [_photosKeys sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:nil ascending:NO]]];
}

-(void)sortBySubject
{
    NSMutableDictionary *newSortedDictionary= [[NSMutableDictionary alloc] init];
    
    for(NSString *key in _photos)
    {
        for(Photo *photo in _photos[key])
        {
            
            if(!newSortedDictionary[photo.subject])
            {
                [newSortedDictionary setObject:[[NSMutableArray alloc] init] forKey:photo.subject];
            }
        
            [newSortedDictionary[photo.subject] addObject:photo];
        
        
        }
    }
    
    
    //Sorts each array by Location after they have been sorted into arrays by Subject
    for(NSString *key in newSortedDictionary)
    {
        
        [newSortedDictionary[key] sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"location" ascending:NO]]];
        
    }
    
    
    
    
    
    _photosKeys = [[newSortedDictionary allKeys] mutableCopy];
    
    
    _photos = newSortedDictionary;
    
    [self sortKeys];
    
    _sortedBy = @"Subject";
}


-(void)sortByLocation
{
    NSMutableDictionary *newSortedDictionary= [[NSMutableDictionary alloc] init];
    
    for(NSString *key in _photos)
    {
        for(Photo *photo in _photos[key])
        {
            
            if(!newSortedDictionary[photo.location])
            {
                [newSortedDictionary setObject:[[NSMutableArray alloc] init] forKey:photo.location];
            }
            
            [newSortedDictionary[photo.location] addObject:photo];
            
            
        }
    }
    
    
    //Sorts each array by Location after they have been sorted into arrays by Subject
    for(NSString *key in newSortedDictionary)
    {
        
        [newSortedDictionary[key] sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"subject" ascending:NO]]];
        
    }
    
    
    
    
    
    _photosKeys = [[newSortedDictionary allKeys] mutableCopy];
    
    
    _photos = newSortedDictionary;
    
    [self sortKeys];
    
    _sortedBy = @"Location";
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
