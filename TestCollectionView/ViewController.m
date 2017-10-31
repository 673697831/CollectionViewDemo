//
//  ViewController.m
//  TestCollectionView
//
//  Created by ouzhirui on 2017/7/28.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "ViewController.h"

static const CGFloat kViewHeight = 80;
static NSString * const kCell = @"cell";

@interface ViewController ()<UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDelegateFlowLayout & UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                 cellForItemAtIndexPath:(NSIndexPath*)indexPath {
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell
                                                                           forIndexPath:indexPath];
    UILabel *label = [cell.contentView viewWithTag:123456];
    if (!label) {
        label = [UILabel new];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor redColor];
        label.tag = 123456;
        [cell.contentView addSubview:label];
        
        label.center = cell.contentView.center;
    }
    
    label.text = @(indexPath.row).stringValue;
    [label sizeToFit];
    
    return cell;
}

#pragma mark -

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(86, kViewHeight);
        UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, kViewHeight * 2) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor greenColor];
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.scrollsToTop = NO;
        collectionView.contentInset = UIEdgeInsetsMake(0, 13, 0, 13);
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[UICollectionViewCell class]
           forCellWithReuseIdentifier:kCell];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        _collectionView = collectionView;
    }

    return _collectionView;

}


@end
