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

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) PhotoCollection *photoCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.photoCollection = [[PhotoCollection alloc] init];
    [self.photoCollection sortBySubject];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoCollection.photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *newCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    newCell.photo = self.photoCollection.photos[indexPath.row];
    newCell.backgroundColor = [UIColor redColor];
    
    
    
    return newCell;
}


#pragma mark - Segue Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"SegueShowDetailsView"])
    {
        DetailsViewController *nextVC = segue.destinationViewController;
        for( NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems)
        {
            PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
            nextVC.photo = cell.photo;
        }
    }
}




#pragma mark - Input Methods
    
- (IBAction)sortSelectorChanged:(UISegmentedControl *)sender {
    
    
    
    
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

    
    [self.collectionView reloadData];
    
}
    
    



@end
