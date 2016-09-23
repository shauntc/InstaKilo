//
//  Photo.m
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithPhotoNamed:(NSString*)photoName andLocation:(NSString*)location andSubject:(NSString*)subject
{
    self = [super init];
    if (self) {
        _photo = photoName;
        _subject = subject;
        _location = location;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithPhotoNamed:nil andLocation:@"" andSubject:@""];
}

@end
