//
//  BookShelfViewController.m
//  lcwx
//
//  Created by luck on 2018/1/8.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "BookShelfViewController.h"
#import "LCActionCheckAppVersion.h"
#import "LCActionInit.h"
#import "BookShelfModel.h"
#import "BookShelfCollectionViewCell.h"


@interface BookShelfViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) BookShelfModel *model;

@property(nonatomic,strong) UICollectionView  *collectionView;


@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    LCActionInit *action =[[LCActionInit alloc]initWithIsFir:@0];
    [action DoActionWithSuccess:^(MSActionBase *action, id responseObject, NSURLSessionDataTask *operation) {
        MSResponeResult *result = [MSResponeResult createWithResponeObject:responseObject];
        self.model = [BookShelfModel mj_objectWithKeyValues:result.try_get_data_with_dict];
        [self.collectionView reloadData];
    } Failure:^(MSActionBase *action, NSError *error, NSURLSessionDataTask *operation) {
        
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
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_collectionView.mj_header endRefreshing];
            });
        }];
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.hot.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BookShelfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookShelfCollectionViewCell" forIndexPath:indexPath];
    BookShelfHotModel *model = self.model.hot[indexPath.row];
    cell.model = model;
//    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BaseWebViewController *web = [[BaseWebViewController alloc]initWithUrl:@"http://client.v4.luochen.com//h5/booklistcomplete.aspx"];
    [self.navigationController pushViewController:web animated:YES];
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
