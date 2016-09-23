//
//  DetailsViewController.m
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) UIImageView *photoImageView;
@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *subjectOutputLabel;
@property (weak, nonatomic) IBOutlet UIView *labelSuperView;
@property (weak, nonatomic) IBOutlet UILabel *locationOutputLabel;

@end

@implementation DetailsViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [self setUpScrollView];
    self.photoImageView = [self setUpImageViewToView:self.scrollView];
    [self.view bringSubviewToFront:self.labelSuperView];
    
    [self configureView];
    [self configureZoom];
    
    self.scrollView.contentSize = self.photoImageView.frame.size;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    _photoImageView.image = [UIImage imageNamed:_photo.photo];
    _subjectOutputLabel.text = _photo.subject;
    _locationOutputLabel.text = _photo.location;
}

-(void)configureZoom
{
    if((self.view.frame.size.width / self.photoImageView.frame.size.width) < (self.view.frame.size.height / self.photoImageView.frame.size.height))
    {
        self.scrollView.minimumZoomScale = self.view.frame.size.width / self.photoImageView.frame.size.width;
        self.scrollView.zoomScale = self.view.frame.size.width / self.photoImageView.frame.size.width;
    }
    else
    {
        self.scrollView.minimumZoomScale = self.view.frame.size.height / self.photoImageView.frame.size.height;
        self.scrollView.zoomScale = self.view.frame.size.height / self.photoImageView.frame.size.height;
    }
    self.scrollView.maximumZoomScale = 4.0;
//    self.scrollView.minimumZoomScale = 1.0;
}


#pragma mark - UIScrollViewDelegate Methods


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photoImageView;
}


#pragma mark - Set Up Views

-(UIImageView*)setUpImageViewToView:(UIScrollView*)view
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.photo.photo]];
    
    [view addSubview:imageView];
    imageView.backgroundColor = [UIColor blueColor];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    NSLayoutConstraint *yLoc = [NSLayoutConstraint constraintWithItem:imageView
//                                                            attribute:NSLayoutAttributeCenterY
//                                                            relatedBy:NSLayoutRelationEqual
//                                                               toItem:view
//                                                            attribute:NSLayoutAttributeCenterY
//                                                           multiplier:1
//                                                             constant:0];
//    [view addConstraint:yLoc];
//    
//    NSLayoutConstraint *xLoc = [NSLayoutConstraint constraintWithItem:imageView
//                                                            attribute:NSLayoutAttributeCenterX
//                                                            relatedBy:NSLayoutRelationEqual
//                                                               toItem:view
//                                                            attribute:NSLayoutAttributeCenterX
//                                                           multiplier:1
//                                                             constant:0];
//    [view addConstraint:xLoc];
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:0];
    [view addConstraint:top];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:imageView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:view
                                                              attribute:NSLayoutAttributeBottom                                                             multiplier:1
                                                               constant:0];
    [view addConstraint:bottom];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:imageView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:view
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0];
    [view addConstraint:left];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:imageView
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:view
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:0];
    [self.view addConstraint:right];
    

    
    return imageView;
}


-(UIScrollView*)setUpScrollView
{
    UIScrollView *new = [[UIScrollView alloc] init];
    
    [self.view addSubview:new];
    
    new.delegate = self;
    new.backgroundColor = [UIColor blackColor];
    
    new.translatesAutoresizingMaskIntoConstraints = NO;

    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:new
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0];
    [self.view addConstraint:top];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:new
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom                                                             multiplier:1
                                                               constant:0];
    [self.view addConstraint:bottom];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:new
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0];
    [self.view addConstraint:left];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:new
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:0];
    [self.view addConstraint:right];
    
    
    
    return new;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
