//
//  PhotoCollection.h
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface PhotoCollection : NSObject

@property (nonatomic) NSMutableDictionary <NSString*, NSMutableArray<Photo *>*> *photos;
@property (nonatomic) NSString *sortedBy;

-(void)sortBySubject;
-(void)sortByLocation;

@end
