//
//  CustomLayout.h
//  CollectionViewTest
//
//  Created by charleszhang on 15/9/1.
//  Copyright (c) 2015年 cn.gongjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kLeftMargin (5)
#define kLineSpace  (10)
#define kLineHeight (17)

@protocol CustomLayoutDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView widthForTextAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CustomLayout : UICollectionViewLayout {
    CGFloat   leftWidthInLine;
    NSInteger lines;
}

@property (nonatomic, assign) id<CustomLayoutDelegate> delegate;

@end
