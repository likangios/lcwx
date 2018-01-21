//
//  BookShelfViewController.m
//  lcwx
//
//  Created by luck on 2018/1/8.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "BookShelfViewController.h"
//vc
#import "SearchViewController.h"
//view
#import "BookShelfCollectionViewCell.h"
#import "NavBarPopMenuView.h"
//model
#import "BookShelfModel.h"
//request
#import "LCActionCheckAppVersion.h"
#import "LCActionInit.h"


@interface BookShelfViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) BookShelfModel *model;

@property(nonatomic,strong) UICollectionView  *collectionView;


@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDefaultBackItem];
    [self setRightItemImage:@"navigationbar_search_20x20_"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(kAUTOSCALE_WIDTH(18));
        make.right.mas_equalTo(-kAUTOSCALE_WIDTH(18));
        make.top.equalTo(self.customNavBar.mas_bottom);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshData];
}
- (void)refreshData{
    LCActionInit *action =[[LCActionInit alloc]initWithIsFir:@0];
    MJWeakSelf;
    [action DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
        MSResponeResult *result = [MSResponeResult createWithResponeObject:responseObject];
        weakSelf.model = [BookShelfModel mj_objectWithKeyValues:result.try_get_data_with_dict];
        [weakSelf.collectionView reloadData];
        [weakSelf.collectionView.mj_header endRefreshing];
    } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
        [weakSelf.collectionView.mj_header endRefreshing];
    }];
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(kAUTOSCALE_WIDTH(112), kAUTOSCALE_WIDTH(185));
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 1;
        layout.sectionInset = UIEdgeInsetsMake(kAUTOSCALE_WIDTH(18),0, kAUTOSCALE_WIDTH(18), 0);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView  = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[BookShelfCollectionViewCell class] forCellWithReuseIdentifier:@"BookShelfCollectionViewCell"];
        MJWeakSelf;
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf refreshData];
        }];
    }
    return _collectionView;
}
#pragma mark - UICollectionDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.hot.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookShelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookShelfCollectionViewCell" forIndexPath:indexPath];
    BookShelfHotModel *model = self.model.hot[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark - action

-(void)rightItemAction:(id)sender{
    SearchViewController *search = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
}
- (void)leftItemAction:(id)sender{
    NavBarPopMenuView *popViwe =[[NavBarPopMenuView alloc]init];
    [self.view addSubview:popViwe];
    [popViwe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    BaseWebViewController *web = [[BaseWebViewController alloc]initWithUrl:@"http://client.v4.luochen.com//h5/booklistcomplete.aspx"];
//    [self.navigationController pushViewController:web animated:YES];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
