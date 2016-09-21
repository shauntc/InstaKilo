//
//  PhotoCollectionViewCell.m
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;


@end

@implementation PhotoCollectionViewCell

//Sets up the Cell Layout/View
-(void)configureView
{
    _photoImageView.image = _photo.photo;
}

//Photo Setter also Configures the view properties
-(void)setPhoto:(Photo *)photo
{
    _photo = photo;
    [self configureView];
}






@end
