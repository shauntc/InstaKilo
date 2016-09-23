//
//  ViewController.m
//  InstaKilo
//
//  Created by Shaun Campbell on 2016-09-21.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "DetailsViewController.h"
#import "CoverFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) PhotoCollection *photoCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortBySegmentedControl;

@end

@implementation ViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.photoCollection = [[PhotoCollection alloc] init];
    
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceDidRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    [self deviceDidRotate:nil];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.photoCollection.photos.count;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    if(!self.photoCollection.photos[self.photoCollection.photosKeys[section]].count)
    {
        return 0;
    }
    
    return self.photoCollection.photos[self.photoCollection.photosKeys[section]].count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    newCell.photo = self.photoCollection.photos[self.photoCollection.photosKeys[indexPath.section]][indexPath.item];
    newCell.backgroundColor = [UIColor redColor];
    
    
    
    return newCell;
}


#pragma mark - Segue Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"SegueShowDetailsView"] || [[segue identifier] isEqualToString:@"SegueShowDetailsViewButton"])
    {
        DetailsViewController *nextVC = segue.destinationViewController;
        for( NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems)
        {
            PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
            nextVC.photo = cell.photo;
        }
    }
}


#pragma mark - Notification response



-(void)deviceDidRotate:(NSNotification *)notification
{
    if([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait || [UIDevice currentDevice].orientation == UIDeviceOrientationPortraitUpsideDown)
    {
        [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    }
    else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)
    {
        [self.collectionView setCollectionViewLayout:[[CoverFlowLayout alloc] init]];
    }
    
    
}



#pragma mark - Input Methods
    
- (IBAction)sortSelectorChanged:(UISegmentedControl *)sender {
    
    NSMutableDictionary <NSString*,NSMutableArray<Photo*>*> *temp = self.photoCollection.photos;
    NSMutableArray *tempKeys = self.photoCollection.photosKeys;
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.photoCollection sortBySubject];
            break;
        case 1:
            [self.photoCollection sortByLocation];
            break;
        case 2:
            
            break;
            
        default:
            NSLog(@"ViewController: Segmented Selector has too many states");
            break;
    }

//        [self.collectionView reloadData];

    if(tempKeys.count>self.photoCollection.photosKeys.count)
    {
        [self.collectionView deleteSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.photoCollection.photosKeys.count-1, tempKeys.count - self.photoCollection.photosKeys.count)]];
    }
    if(tempKeys.count<self.photoCollection.photosKeys.count)
    {
        [self.collectionView insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(tempKeys.count-1,self.photoCollection.photosKeys.count-tempKeys.count)]];
    }
    
   
    
    
    [self.collectionView performBatchUpdates:^{
        
        
        
        for (int i = 0; i<tempKeys.count; i++)
        {
            for(int j = 0; j<temp[tempKeys[i]].count; j++)
                {
                    NSIndexPath *fromIndexPath = [NSIndexPath indexPathForItem:j inSection:i];
                    NSIndexPath *toIndexPath = [[NSIndexPath alloc] init];
                    
                    BOOL loop = YES;
                    
                    for (int k = 0; k<self.photoCollection.photosKeys.count && loop; k++)
                    {
                        for(int l = 0; l<self.photoCollection.photos[self.photoCollection.photosKeys[k]].count; l++)
                        {
                            if([self.photoCollection.photos[self.photoCollection.photosKeys[k]][l] isEqual:temp[tempKeys[i]][j]])
                            {
                                toIndexPath = [NSIndexPath indexPathForItem:l inSection:k];
                                loop = NO;
                                break;
                            }
                            
                        }
                    }
                    
                    
                    
                    
                    [self.collectionView moveItemAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
                }
            
        }
    } completion:^(BOOL finished) {}];
    
    
    
    
}
    
    



@end
