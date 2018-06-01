//
//  WBAudioPlayerHelper.h
//  LongLianLive
//
//  Created by HL on 2017/12/20.
//  Copyright © 2017年 北京华信龙链科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

/**
 *  播放器播放文件类型枚举
 */
typedef NS_ENUM(NSUInteger, WBAudioFileTyle) {
    WBAudioFileTyle_Network = 0,  //网络URL
    WBAudioFileTyle_Local,        //本地文件路径
};

/**
 *  声明定义协议
 */
@protocol WBAudioPlayerHelperDelegate <NSObject>

@optional

//开始播放
- (void)didAudioPlayerBeginPlay:(AVAudioPlayer*)audioPlayer;
//停止播放
- (void)didAudioPlayerStopPlay:(AVAudioPlayer*)audioPlayer;
//暂停播放
- (void)didAudioPlayerPausePlay:(AVAudioPlayer*)audioPlayer;
//播放完成
- (void)didAudioPlayerFinishPlay:(AVAudioPlayer*)audioPlayer;

@end

@interface WBAudioPlayerHelper : NSObject <AVAudioPlayerDelegate>

//第一步：创建声明单例方法
+ (WBAudioPlayerHelper *)shareInstance;

//声明播放器
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

//声明文件路径名
@property (nonatomic, copy) NSString *pathName;

//声明协议代理
@property (nonatomic, assign) id <WBAudioPlayerHelperDelegate> delegate;

//网络音频
- (void)managerAudioWithUrlPath:(NSString *)urlPath playOrPause:(BOOL)isPlaying;

//本地音频
- (void)managerAudioWithLocalPath:(NSString *)localPath playOrPause:(BOOL)isPlaying;

//暂停播放
- (void)pausePlayingAudio;

//停止播放
- (void)stopAudio;

//删除网络加载缓存文件
- (void)deleteFile;

@end

