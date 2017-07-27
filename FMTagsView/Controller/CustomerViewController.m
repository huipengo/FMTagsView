//
//  CustomerViewController.m
//  FMTagsView
//
//  Created by Subo on 2017/7/27.
//  Copyright © 2017年 Followme. All rights reserved.
//

#import "CustomerViewController.h"
#import <Masonry/Masonry.h>
#import "FMTagsView.h"

@interface CustomerViewController ()<FMTagsViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIView *scrollContentView;

@property (nonatomic, weak) FMTagsView *tagsView;
@property (strong, nonatomic) NSArray *dataArray;

@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) FMTagsView *tagsView1;
@property (nonatomic, weak) UILabel *label2;
@property (nonatomic, weak) FMTagsView *tagsView2;
@property (nonatomic, weak) UILabel *label3;
@property (nonatomic, weak) FMTagsView *tagsView3;

@end

@implementation CustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self prepareUI];
    [self setConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (FMTagsView *)createTagsViewWithDataSrouse:(NSArray *)dataSource borderColor:(UIColor *)borderColor {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat padding = 15;
    FMTagsView *tagsView = [[FMTagsView alloc] initWithFrame:CGRectMake(0, 0, screenWidth - padding * 2, 180)];
    tagsView.backgroundColor = [UIColor whiteColor];
    tagsView.delegate = self;
    tagsView.contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    tagsView.tagcornerRadius = 0;
    tagsView.layer.borderColor = borderColor.CGColor;
    tagsView.layer.borderWidth = 1;
    tagsView.tagsArray = dataSource;
    
    return tagsView;
}

- (UILabel *)createLabelWithText:(NSString *)text textColor:(UIColor *)textColor {
    UILabel *label = [UILabel new];
    label.textColor = textColor;
    label.text = text;
    label.font = [UIFont boldSystemFontOfSize:17];
    
    return label;
}

- (void)prepareUI {
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    UIView *scrollContentView = [UIView new];
    [self.scrollView addSubview:scrollContentView];
    self.scrollContentView = scrollContentView;
    
    UILabel *label1 = [self createLabelWithText:@"TagsView1" textColor:[UIColor greenColor]];
    [self.scrollContentView addSubview:label1];
    self.label1 = label1;
    
    NSArray *dataArray1 = @[@"Alta Baronia", @"Alto Tirso", @"Limbara", @"Tirso", @"Gerrei",
                            @"Capoterra", @"Gutturu Mannu", @"Gennargentu", @"Ogliastra"];
    FMTagsView *tagsView1 = [self createTagsViewWithDataSrouse:dataArray1 borderColor:[UIColor greenColor]];
    [self.scrollContentView addSubview:tagsView1];
    self.tagsView1 = tagsView1;
    
    UILabel *label2 = [self createLabelWithText:@"TagsView2" textColor:[UIColor redColor]];
    [self.scrollContentView addSubview:label2];
    self.label2 = label2;
    
    NSArray *dataArray2 = @[@"Monte Acuto-Meilogu", @"Gallura"];
    FMTagsView *tagsView2 = [self createTagsViewWithDataSrouse:dataArray2 borderColor:[UIColor redColor]];
    [self.scrollContentView addSubview:tagsView2];
    self.tagsView2 = tagsView2;
    
    UIColor *color3 = [UIColor colorWithRed:0.96 green:0.89 blue:0.2 alpha:1.0];
    UILabel *label3 = [self createLabelWithText:@"TagsView3" textColor:color3];
    [self.scrollContentView addSubview:label3];
    self.label3 = label3;
    
    NSArray *dataArray3 = @[@"Monte Acuto-Meilogu", @"Gallura"];
    FMTagsView *tagsView3 = [self createTagsViewWithDataSrouse:dataArray3 borderColor:color3];
    [self.scrollContentView addSubview:tagsView3];
    self.tagsView3 = tagsView3;
}

- (void)setConstraints {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.bottom.right.equalTo(self.view);
    }];
    
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];

    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.left.equalTo(self.scrollView).offset(15);
    }];

    [self.tagsView1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.label1.mas_bottom).offset(5);
        make.left.equalTo(self.label1);
        make.right.equalTo(self.scrollContentView).offset(-15);
    }];

    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.tagsView1.mas_bottom).offset(15);
        make.left.equalTo(self.label1);
    }];
    
    [self.tagsView2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.label2.mas_bottom).offset(5);
        make.left.equalTo(self.label1);
        make.right.equalTo(self.scrollContentView).offset(-15);
    }];

    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.tagsView2.mas_bottom).offset(15);
        make.left.equalTo(self.label1);
    }];
    
    [self.tagsView3 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.label3.mas_bottom).offset(5);
        make.left.equalTo(self.label1);
        make.right.equalTo(self.scrollContentView).offset(-15);
    }];
    
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.tagsView3.mas_bottom).offset(10);
    }];

}

#pragma mark - ......::::::: FMTagsViewDelegate :::::::......
- (void)tagsView:(FMTagsView *)tagsView willDispayCell:(FMTagCell *)tagCell atIndex:(NSUInteger)index {
    
}

@end
