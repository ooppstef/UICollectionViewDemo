//
//  CustomLayout.m
//  CollectionViewTest
//
//  Created by charleszhang on 15/9/1.
//  Copyright (c) 2015年 cn.gongjiang. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout ()

@property (nonatomic, strong) NSMutableArray *cache;

@end

@implementation CustomLayout

#pragma mark - override methods

- (id)init {
    if (self = [super init]) {
        lines = 1;
    }
    return self;
}

- (void)prepareLayout {
    if (!self.cache) {
        self.cache = [@[] mutableCopy];
        NSInteger totalCount = [self.collectionView numberOfItemsInSection:0];
        CGFloat lineWidth = self.collectionView.bounds.size.width;
        leftWidthInLine = lineWidth;
        for (NSInteger i = 0; i < totalCount;i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            CGFloat width = [self.delegate collectionView:self.collectionView widthForTextAtIndexPath:indexPath];
            BOOL anotherLine = YES;
            if (leftWidthInLine - width - kLeftMargin > 0) {
                anotherLine = NO;
            }
            else {
                lines++;
                leftWidthInLine = lineWidth;
            }
            CGRect frame = CGRectMake(lineWidth - leftWidthInLine, (kLineHeight + kLineSpace) * (lines - 1), width, kLineHeight);
            leftWidthInLine -= (width + kLeftMargin);
            UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attribute.frame = frame;
            [self.cache addObject:attribute];
        }
    }
}

- (CGSize)collectionViewContentSize {
    CGFloat height = lines * kLineHeight + (lines - 1) * kLineSpace;
    return CGSizeMake(self.collectionView.bounds.size.width, height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributesArray = [@[] mutableCopy];
    for (UICollectionViewLayoutAttributes *attributes in self.cache) {
        if (CGRectContainsRect(rect, attributes.frame)) {
            [attributesArray addObject:attributes];
        }
    }
    return attributesArray;
}

@end
