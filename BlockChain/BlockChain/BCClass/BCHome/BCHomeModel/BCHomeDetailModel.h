//
//  BCHomeDetailModel.h
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CandyProcessMOdel : NSObject
@property(nonatomic,strong)NSString * ID;//" = 17,
@property(nonatomic,strong)NSString * partnerId;// = 10014,
@property(nonatomic,strong)NSString * slogan;// = 赋能与成就·雷鹿财富,
@property(nonatomic,strong)NSString * totalCoin;// = 2000,
@property(nonatomic,strong)NSString * count;// = 1000,
@property(nonatomic,strong)NSString * candyId;// = 17,
@property(nonatomic,strong)NSString * getCount;// = 2,
@property(nonatomic,strong)NSString * code;// = LLMC,
@property(nonatomic,strong)NSString * eachCoin;// = 2,
@property(nonatomic,strong)NSString * icon;// = http://101.200.74.83/upload/images/72d77a45-6e73-462b-8201-b5f2d940ac6c.jpg,
@property(nonatomic,strong)NSString * eachCost;// = 0.0001,
@property(nonatomic,strong)NSString * createTime;//= 1527662760000,
@property(nonatomic,strong)NSString * canGain;// = 0,
@property(nonatomic,strong)NSString * status;//= 0,
@property(nonatomic,strong)NSString * cost;//= 0.1,
@end
@interface PartnerInfoMOdel : NSObject
@property(nonatomic,strong)NSString * projectName;//= 雷鹿财富,
@property(nonatomic,strong)NSString * brief;// = 雷鹿财富，赋能与成就区块链投资者，多维度深入分析项目方，提供项目方和用户零距离接触的平台，多种数据工具、人工智能行情分析，并不定期发放糖果福利，让粉丝够一站式深入了解项目方、以及互动交流、领取糖果、挖矿积累财富、分析行情、财富供项目方和用户零距离接触的平台，多种数据工具、人工智能行情分析，并不定期发放糖果福利，让粉丝能够一站式深入了解项目方、以及互动交流、领取糖果、挖矿积累财富、分析行情、财富\347\256管理等,
@property(nonatomic,strong)NSString * partnerId;// = 10014,
@property(nonatomic,strong)NSString * mobile;// = 13777364088,
@property(nonatomic,strong)NSString * contact;// = 摩卡的跟班,
@property(nonatomic,strong)NSString * slogan;//= 赋能与成就·雷鹿财富,
@property(nonatomic,strong)NSString * code;// = LLMC,
@property(nonatomic,strong)NSString * price;// = 5000,
@property(nonatomic,strong)NSString * icon;//= http://101.200.74.83/upload/images/72d77a45-6e73-462b-8201-b5f2d940ac6c.jpg,
@property(nonatomic,strong)NSString * createTime;// = 1527575249000,
@property(nonatomic,strong)NSString * tel;//= 13777364086,
@property(nonatomic,strong)NSString * site;//= welth.leilook.com,
@property(nonatomic,strong)NSString * email;//= jack@leilook.com,
@property(nonatomic,strong)NSString * name;//= leilookcs,
@property(nonatomic,strong)NSString * pubCount;// = 1000000000,
@end
@interface BCHomeDetailModel : NSObject
@property(nonatomic,strong)CandyProcessMOdel * candyProcess;
@property(nonatomic,strong)PartnerInfoMOdel * partnerInfo;

@end
