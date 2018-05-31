//
//  BCMeViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/21.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeViewController.h"
#import "BCMeHeaderView.h"
#import "BCMeTableViewCell.h"
#import "BCMeModel.h"
#import "BCMeTangGuoJiLuListController.h"
#import "BCMeQRCodeController.h"
#import "BCMePDCListController.h"
#import "UIBarButtonItem+ZZExtension.h"
#import "BCSetViewController.h"
#import "BCTaskViewController.h"
#import "BCTaskDetailViewController.h"
#import "BCMeInvitingFriendsController.h"
#import "BCRequestData.h"
#import "BCTangGuoListMode.h"
#import "KMQRCode.h"


@interface BCMeViewController ()<UITableViewDataSource,UITableViewDelegate,BCMeHeaderViewDelegate,BCMeTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeHeaderView *meHeaderView;//我的钱包顶部试图
@property(nonatomic,strong)NSMutableArray *headerArray;//顶部数据
@property(nonatomic,strong)NSMutableArray *listArray;//列表数据
@property(nonatomic,strong)BCMeModel *meModel;//数据源

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,strong)UIImage *Qiamge;



@end

@implementation BCMeViewController

static NSString * const cellidenfder = @"BCMeTableViewCell";

#define HeaderViewHeight   (SYRealValue(230))  //顶部view高度
/***数据源***/
-(NSMutableArray *)headerArray{
    if (!_headerArray) {
        _headerArray= [NSMutableArray array];
    }
    return _headerArray;
}
-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray= [NSMutableArray array];
    }
    return _listArray;
}
//-(BCMeModel *)meModel{
//    if (!_meModel) {
//        _meModel = [[BCMeModel alloc] init];
//    }
//    return _meModel;
//}
//kTopHeight

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTabBarHeight-kTopHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor  =bagColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 300;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
    }
    return _tableView;
}

/**顶部view**/
-(BCMeHeaderView *)meHeaderView{
    if (!_meHeaderView) {
        _meHeaderView = [[BCMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
        _meHeaderView.delegate=self;
//        _meHeaderView.model =self.meModel;
        _meHeaderView.backgroundColor =[UIColor redColor];
    }
    return _meHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    //加载数据
    [self loadNewData];
    //设置导航按钮
    [self setupUIBarButtonItem];
    //增加下拉刷新
    [self createRefresh];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
     self.tableView.tableHeaderView =  self.meHeaderView;

}

- (void)createRefresh
{
//    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    [header beginRefreshing];
//    self.tableView.mj_header = header;
//    self.tableView.mj_footer = footer;
//    self.header =header;
//    self.footer =footer;

}

//下拉加载
-(void)loadNewData{
    [self loadUpData];
    [self loadListData];
   
    
}
-(void)loadUpData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    [BCRequestData getUser_InfoDict:candyDict success:^(id responseObject) {
        BCMeModel *model = [BCMeModel mj_objectWithKeyValues:REQUEST_DATA];
        self.meModel=model;
         [LFAccountTool saveMe:model];
        self.meHeaderView.model =model;
        [self.header endRefreshing];
    } erorr:^(id error) {//请求失败
        [self.header endRefreshing];
    }];
}

-(void)loadListData{
    //BCMeModel * meModel = [self.listArray lastObject];
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    [self.listArray removeAllObjects];
    [BCRequestData get_Token_List_Dict:candyDict success:^(id responseObject) {
        BCMeModel *model = [BCMeModel mj_objectWithKeyValues:responseObject[@"data"]];
        self.meHeaderView.model =model;
        self.listArray = [BCTangGuoListMode mj_objectArrayWithKeyValuesArray:model.list];
        [self.tableView reloadData];
        [self.header endRefreshing];
        
    } erorr:^(id error) {
        [self.header endRefreshing];
    }];

}
//上拉加载
-(void)loadMoreData{
    [self.footer endRefreshing];
}

-(void)setNaviTitle{
    self.navigationItem.title=@"糖果派";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}
//右边边导航控制器右边item
- (void)setupUIBarButtonItem {
    UIBarButtonItem *rightItemButton =[UIBarButtonItem itemWithImage:@"me_set_icon" hightImage:nil target:self action:@selector(onNavButtonTapped:event:)];
    self.navigationItem.rightBarButtonItem =rightItemButton;
    // self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
}
#pragma mark-右侧导航按钮item 点击事件
-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{
    
    LFLog(@"%@",loginMe.authStatus);
//    BCMeInvitingFriendsController *setVc =[[BCMeInvitingFriendsController alloc] init];
//    [self.navigationController pushViewController:setVc animated:YES];
    BCSetViewController *setVc =[[BCSetViewController alloc] init];
    setVc.model =self.meModel;
    
    [self.navigationController pushViewController:setVc animated:YES];
}



#pragma 糖果记录跳转
-(void)tangGuoBtnClick{
    NSLog(@"糖果记录");
    BCMeTangGuoJiLuListController *vc = [[BCMeTangGuoJiLuListController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma 糖果更多记录跳转
-(void)moreTangGuoBtnClick{
    NSLog(@"更多糖果");
    BCTaskViewController *taskVc =[[BCTaskViewController alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}
#pragma 二维码
-(void)QRCodeBtnClick{
    //生成二维码 并传递图片下去
//    UIImage *centerImage =[UIImage imageNamed:@"检验完毕"];
//    NSString *QCode = self.meModel.token;
    self.Qiamge= [self colorQrcode];
    self.meModel.Qimage =self.Qiamge;
    
    BCMeQRCodeController *QRVc= [[BCMeQRCodeController alloc] init];
    QRVc.meModel  = self.meModel;
    [self.navigationController pushViewController:QRVc animated:YES];
    NSLog(@"二维码");
}



-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
        return  (SYRealValue(13)) ;
}
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.listArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SYRealValue(54));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //添加事件
    BCMeTableViewCell *cell = [BCMeTableViewCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
    BCTangGuoListMode *listMode = self.listArray[indexPath.row];
    cell.delegate =self;
    cell.model =listMode;
    return cell;
}
//进入PDC简介
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BCTangGuoListMode *listMode = self.listArray[indexPath.row];
    BCMePDCListController *pdcListVc = [[BCMePDCListController alloc] init];
    pdcListVc.code =listMode.code;//苹果id
    [self.navigationController pushViewController:pdcListVc animated:YES];
}


/**
 
 生成二维码(中间有小图片)
 
 QRStering：所需字符串
 
 centerImage：二维码中间的image对象
 
 */

//+ (UIImage *)createImgQRCodeWithString:(NSString *)QRString centerImage:(UIImage *)centerImage{
//
//    // 创建滤镜对象
//
//    CIFilter *filter = [CIFilter filterWithName:@"XiaoGuiGe"];
//
//    // 恢复滤镜的默认属性
//
//    [filter setDefaults];
//
//    // 将字符串转换成 NSdata
//
//    NSData *dataString = [QRString dataUsingEncoding:NSUTF8StringEncoding];
//
//    // 设置过滤器的输入值, KVC赋值
//
//    [filter setValue:dataString forKey:@"inputMessage"];
//
//    // 获得滤镜输出的图像
//
//    CIImage *outImage = [filter outputImage];
//
//    // 图片小于(27,27),我们需要放大
//
//    outImage = [outImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
//
//    // 将CIImage类型转成UIImage类型
//
//    UIImage *startImage = [UIImage imageWithCIImage:outImage];
//
//    // 开启绘图, 获取图形上下文
//
//    UIGraphicsBeginImageContext(startImage.size);
//
//
//
//    // 把二维码图片画上去 (这里是以图形上下文, 左上角为(0,0)点
//
//    [startImage drawInRect:CGRectMake(0, 0, startImage.size.width, startImage.size.height)];
//
//    // 再把小图片画上去
//
//    CGFloat icon_imageW = 200;
//
//    CGFloat icon_imageH = icon_imageW;
//
//    CGFloat icon_imageX = (startImage.size.width - icon_imageW) * 0.5;
//
//    CGFloat icon_imageY = (startImage.size.height - icon_imageH) * 0.5;
//
//    [centerImage drawInRect:CGRectMake(icon_imageX, icon_imageY, icon_imageW, icon_imageH)];
//
//    // 获取当前画得的这张图片
//
//    UIImage *qrImage = UIGraphicsGetImageFromCurrentImageContext();
//
//    // 关闭图形上下文
//
//    UIGraphicsEndImageContext();
//
//    //返回二维码图像
//
//    return qrImage;
//
//}

//MARK:彩色的二维码
-(UIImage*)colorQrcode{
    
    
    //二维码的实质是 字符串, 我们生产二维码,就是根据字符串去生产一张图片
    //获取内建的所有过滤器.
    //        NSArray *filterArr = [CIFilter filterNamesInCategories:kCICategoryBuiltIn]; //也对
    NSArray *filterArr = [CIFilter filterNamesInCategories:@[kCICategoryBuiltIn]];   //对
    
    NSLog(@"%@",filterArr); //所有内建过滤器,找CR... 二维码的
    
    //创建二维码过滤器
    CIFilter * qrfilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //设置默认属性(老油条)
    [qrfilter setDefaults];
    
    //我们需要给 二维码过期器 设置一下属性,给它一些东西,让它去生成图片吧,那些属性呢,跳进去看
    NSLog(@"%@",qrfilter.inputKeys);
    /*
     inputMessage,            //二维码的信息
     inputCorrectionLevel     //二维码的容错率 ()到达一定值后,就不能识别二维码了
     */
    
    //我们需要给 二维码 的 inputMessage 设置值,  这是私有属性,我们 使用KVC.给其私有属性赋值
    
    //将字符串转为NSData,去获取图片
    NSData * qrimgardata = [self.meModel.token dataUsingEncoding:NSUTF8StringEncoding];
    
    //去获取对应的图片(因为测试,直接用字符串会崩溃)
    [qrfilter setValue:qrimgardata forKey:@"inputMessage"];
    
    //去获得对应图片 outPut
    CIImage *qrImage = qrfilter.outputImage;
    
    //图片不清除,打印知道其 大小 为 (27,27). 进入 CIImage,看属性,
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    //创建彩色过滤器   (彩色的用的不多)-----------------------------------------------------
    CIFilter * colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    
    //设置默认值
    [colorFilter setDefaults];
    
    //同样打印这样的 输入属性  inputKeys
    NSLog(@"%@",colorFilter.inputKeys);
    /*
     inputImage,   //输入的图片
     inputColor0,  //前景色
     inputColor1   //背景色
     */
    
    //KVC 给私有属性赋值
    [colorFilter setValue:qrImage forKey:@"inputImage"];
    
    //需要使用 CIColor
    [colorFilter setValue:[CIColor colorWithRed:145 green:100 blue:214] forKey:@"inputColor0"];
    [colorFilter setValue:[CIColor colorWithRed:145 green:100 blue:214] forKey:@"inputColor1"];
    
    
    //设置输出
    CIImage *colorImage = [colorFilter outputImage];
    UIImage *image = [UIImage imageWithCIImage:colorImage];
    return image;
}


//- (void)layoutUI {
//       //用于生成二维码的字符串source
//         NSString *source = self.meModel.token;
//    
//        //使用iOS 7后的CIFilter对象操作，生成二维码图片imgQRCode（会拉伸图片，比较模糊，效果不佳）
//             CIImage *imgQRCode = [KMQRCode createQRCodeImage:source];
//
//             //使用核心绘图框架CG（Core Graphics）对象操作，进一步针对大小生成二维码图片imgAdaptiveQRCode（图片大小适合，清晰，效果好）
//             UIImage *imgAdaptiveQRCode = [KMQRCode resizeQRCodeImage:imgQRCode
//                                                                                                  withSize:_imgVQRCode.frame.size.width];
//
//             //默认产生的黑白色的二维码图片；我们可以让它产生其它颜色的二维码图片，例如：蓝白色的二维码图片
//             imgAdaptiveQRCode = [KMQRCode specialColorImage:imgAdaptiveQRCode
//                                                                                 withRed:33.0
//                                                                                   green:114.0
//                                                                                    blue:237.0]; //0~255
//
//             //使用核心绘图框架CG（Core Graphics）对象操作，创建带圆角效果的图片
//             UIImage *imgIcon = [UIImage createRoundedRectImage:[UIImage imageNamed:@"QRCode"]
//                                                                             withSize:CGSizeMake(70.0, 93.0)
//                                                                          withRadius:10];
//         //使用核心绘图框架CG（Core Graphics）对象操作，合并二维码图片和用于中间显示的图标图片
//        imgAdaptiveQRCode = [KMQRCode addIconToQRCodeImage:imgAdaptiveQRCode
//                                                                             withIcon:imgIcon
//                                                                           withIconSize:imgIcon.size];
//
//       imgAdaptiveQRCode = [KMQRCode addIconToQRCodeImage:imgAdaptiveQRCode
//                                               withIcon:imgIcon
//                                                withScale:3];
//
//             _imgVQRCode.image = imgAdaptiveQRCode;
//             //设置图片视图的圆角边框效果
//             _imgVQRCode.layer.masksToBounds = YES;
//             _imgVQRCode.layer.cornerRadius = 10.0;
//             _imgVQRCode.layer.borderColor = [UIColor lightGrayColor].CGColor;
//             _imgVQRCode.layer.borderWidth = 4.0;
//         }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
