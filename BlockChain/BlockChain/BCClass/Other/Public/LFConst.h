#import <UIKit/UIKit.h>
/** 主页banner的高度*/
UIKIT_EXTERN CGFloat  const bannerH;
/**跑马灯的高度*/
UIKIT_EXTERN CGFloat  const houseLabeH;
/**中间按钮的高度*/
UIKIT_EXTERN CGFloat  const segmentedControlH;
/**普通间隔*/
UIKIT_EXTERN CGFloat  const spacingW;
/** 详情页banner的高度*/
UIKIT_EXTERN CGFloat  const dateilsBannerH;
///**详情页的进行中的头部的沟渎*/
//UIKIT_EXTERN CGFloat  const BeginViewH;
///**详情页的进行中的头部的高度*/
//UIKIT_EXTERN CGFloat  const HaveInhandIngH;
///**详情页的已经完成的头部的沟渎*/
//UIKIT_EXTERN CGFloat  const CompleteHeartViewH;
//






/**设备的token*/

UIKIT_EXTERN NSString  *const userdevicToken;
/**点击进入队列刷新UI*/
UIKIT_EXTERN NSString  *const enterQueueRefresh;
/**减少一个队列*/
UIKIT_EXTERN NSString  *const subQueueRefresh;

/**增加一个队列*/
UIKIT_EXTERN NSString  *const addQueueRefresh;
/**离开房间*/
UIKIT_EXTERN NSString  *const leaveRoomRefresh;
/**删除房间*/
UIKIT_EXTERN NSString  *const deleRoomRefresh;

/**进入聊天页面*/
UIKIT_EXTERN NSString  *const enterChatPage;

/**剔除队列*/
UIKIT_EXTERN NSString  *const kickRoom;
/**剔除房间*/
UIKIT_EXTERN NSString  *const removeQueue;
/**改变队列*/
UIKIT_EXTERN NSString  *const changeQueue;
/**用户退出队列*/
UIKIT_EXTERN NSString  *const quitQueue;
/**开房间第一次弹框*/
UIKIT_EXTERN NSString  *const enterGameHint;
/**前台到后台*/
UIKIT_EXTERN NSString  *const enterBackgroundRoom;
/**后台到前台*/
UIKIT_EXTERN NSString  *const enterForegroundRoom;



/**环信参数*/
UIKIT_EXTERN NSString  *const infotype;
/**启动*/
UIKIT_EXTERN NSString  *const launch;
/**结束*/
UIKIT_EXTERN NSString  *const end;
/**加入队列*/
UIKIT_EXTERN NSString  *const join_queue;
/**离开队列*/
UIKIT_EXTERN NSString  *const leave_queue;
/**踢出队列*/
UIKIT_EXTERN NSString  *const kick_queue;
/**踢出房间*/
UIKIT_EXTERN NSString  *const kick_room;
/**打开位置*/
UIKIT_EXTERN NSString  *const open_queue;
/**关闭位置*/
UIKIT_EXTERN NSString  *const close_queue;
/**的环信消息，是启动链接*/
UIKIT_EXTERN NSString  *const startgame;
/**支付成功*/
UIKIT_EXTERN NSString  *const paySucess;
/**房主举报这局游戏*/
UIKIT_EXTERN NSString  *const masterReportPlayGame;

/**查看代金券的lasttime*/
UIKIT_EXTERN NSString  *const cheackVourcherLastTime;
/**跳转到首页通知*/
UIKIT_EXTERN NSString  *const skipHomeNotice;
/**下载地址*/
UIKIT_EXTERN NSString  *const downUrl;

UIKIT_EXTERN CGFloat    noDataHeight;

UIKIT_EXTERN CGFloat    PDCHeaderHeight;

//请求
/** 返回的code码 */
#define REQUEST_CODE responseObject[@"code"]
/** 返回的data */
#define REQUEST_DATA responseObject[@"data"]
/** 请求成功 */
#define REQUEST_OK @"000000"
/** 没有更多数据 */
#define REQUEST_NOMORE_DATA @"000110"
/** 返回的message */
#define REQUEST_MESSAGE returnValue[@"message"]

