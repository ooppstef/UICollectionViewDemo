//
//  ViewController.m
//  CollectionViewTest
//
//  Created by charleszhang on 15/9/1.
//  Copyright (c) 2015年 cn.gongjiang. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayout.h"
#import "Cell.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,CustomLayoutDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *ds;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    
    CustomLayout *layout = [[CustomLayout alloc] init];
    layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 320) / 2, 64, 320, 500) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:collectionView];
    
    [collectionView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellWithReuseIdentifier:@"CellIdentifier"];
}

- (void)setupData {
    self.ds = [@[] mutableCopy];
    [self.ds addObjectsFromArray:@[@"aaa",@"bbbbbb",@"ccc",@"dddddddddd",@"eeee",@"fffffffffff",@"gggggggggggggg",@"hhhhhhhhhhh",@"iiiiii",@"jjj",@"kkkkkkkkkkk",@"llllllllll",@"mmmmmmmmm",@"nnn",@"o",@"ppppppp",@"qqqqqq",@"rrrrrrrrrrrrrrrrr",@"ssssssssss",@"tttt",@"uuuuuuuu",@"vvv",@"wwwwww",@"xxx",@"yyyyyyyyyy",@"zzzzzzzzzzzzzzzz"]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.ds count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.ds[indexPath.row];
    cell.clipsToBounds = YES;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.layer.borderWidth = 1;
    cell.layer.cornerRadius = 5;
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView widthForTextAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.ds[indexPath.row];
    CGRect frame = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, kLineHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return ceil(frame.size.width);
}

@end
