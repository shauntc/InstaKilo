//
//  Photo.h
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, readonly) NSString *photo;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic, readonly) NSString *subject;

-(instancetype)initWithPhotoNamed:(NSString*)photoName andLocation:(NSString*)location andSubject:(NSString*)subject;

@end
