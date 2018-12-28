//
//  FMTagsView.h
//  FollowmeiOS
//
//  Created by Subo on 16/5/25.
//  Copyright © 2016年 com.followme. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FMTagsViewDelegate;

typedef void(^WBTagImageActionCompletion)(void);

@interface FMTagCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UIButton *imageButton;

@property (nonatomic) UIEdgeInsets contentInsets;

@property (nonatomic, copy) WBTagImageActionCompletion imageActionCompletion;

@end

@interface FMTagsView : UIView

/** default is (10.0f, 15.0f, 10.0f, 15.0f) */
@property (nonatomic) UIEdgeInsets contentInsets;

/** 数据源 */
@property (nonatomic) NSArray<NSString *> *tagsArray;

@property (weak, nonatomic) id<FMTagsViewDelegate> delegate;

/** 行间距, default 10.0f */
@property (nonatomic) CGFloat lineSpacing;

/** 元素之间的间距，default 15.0f */
@property (nonatomic) CGFloat interitemSpacing;

#pragma mark - ......::::::: 标签定制属性 :::::::......

/** default is (5.0f, 10.0f, 5.0f, 10.0f) */
@property (nonatomic) UIEdgeInsets tagInsets;

/** 标签边框宽度, default is 0.0f */
@property (nonatomic) CGFloat tagBorderWidth;
/** default is 0.0f */
@property (nonatomic) CGFloat tagcornerRadius;

@property (strong, nonatomic) UIColor *tagBorderColor;
@property (strong, nonatomic) UIColor *tagSelectedBorderColor;
@property (strong, nonatomic) UIColor *tagBackgroundColor;
@property (strong, nonatomic) UIColor *tagSelectedBackgroundColor;

@property (strong, nonatomic) UIFont *tagFont;
@property (strong, nonatomic) UIFont *tagSelectedFont;

@property (strong, nonatomic) UIColor *tagTextColor;
@property (strong, nonatomic) UIColor *tagSelectedTextColor;

/** 标签高度，default 34.0f */
@property (nonatomic) CGFloat tagHeight;

/** tag 最小宽度值, default 0.0f，即不作最小宽度限制 */
@property (nonatomic) CGFloat mininumTagWidth;

/** tag 最大宽度值, default CGFLOAT_MAX， 即不作最大宽度限制 */
@property (nonatomic) CGFloat maximumTagWidth;

#pragma mark - ......::::::: 选中 :::::::......

/** 是否允许选中, default is YES */
@property (nonatomic) BOOL allowsSelection;

/** 是否允许多选, default is NO */
@property (nonatomic) BOOL allowsMultipleSelection;

/** 是否允许空选, default is YES */
@property (nonatomic) BOOL allowEmptySelection;

/** title 旁显示图标 */
@property (nonatomic, strong) UIImage *suffix_image;

/** 允许最多的选中个数，默认不作限制；该属性仅在 allowsMultipleSelection 为 YES 时有效 */
@property (nonatomic) NSInteger maximumNumberOfSelection;

/** 选中索引 */
@property (nonatomic, readonly) NSUInteger selectedIndex;

/** 多选状态下，选中的Tags */
@property (nonatomic, readonly) NSArray<NSString *> *selecedTags;

/** 多选状态下，选中的索引 */
@property (nonatomic, readonly) NSArray<NSNumber *> *selectedIndexes;

- (void)selectTagAtIndex:(NSUInteger)index animate:(BOOL)animate;
- (void)deSelectTagAtIndex:(NSUInteger)index animate:(BOOL)animate;
- (void)deSelectAll;

- (FMTagCell *)cellForItemAtIndex:(NSInteger)index;

#pragma mark - ......::::::: Edit :::::::......

/** if not found, return NSNotFount */
- (NSUInteger)indexOfTag:(NSString *)tagName;

- (void)addTag:(NSString *)tagName;
- (void)insertTag:(NSString *)tagName AtIndex:(NSUInteger)index;

- (void)removeTagWithName:(NSString *)tagName;
- (void)removeTagAtIndex:(NSUInteger)index;
- (void)removeAllTags;

@end


@protocol FMTagsViewDelegate <NSObject>

@optional
- (BOOL)tagsView:(FMTagsView *)tagsView shouldSelectTagAtIndex:(NSUInteger)index;
- (void)tagsView:(FMTagsView *)tagsView didSelectTagAtIndex:(NSUInteger)index;

- (void)tagsView:(FMTagsView *)tagsView imageTagAtIndex:(NSUInteger)index;

- (BOOL)tagsView:(FMTagsView *)tagsView shouldDeselectItemAtIndex:(NSUInteger)index;
- (void)tagsView:(FMTagsView *)tagsView didDeSelectTagAtIndex:(NSUInteger)index;

/** 超过最多选中个数，可在这个方法中做自定义提示，如提示用户超过最多选中项 */
- (void)tagsViewDidBeyondMaximumNumberOfSelection:(FMTagsView *)tagsView;

/** 允许对 Cell 进行自定义操作 */
- (void)tagsView:(FMTagsView *)tagsView willDispayCell:(FMTagCell *)tagCell atIndex:(NSUInteger)index;

@end
