//
//  DataBase.m
//  FMDBDemo
//
//  Created by Zeno on 16/5/18.
//  Copyright © 2016年 zenoV. All rights reserved.
//

#import "DataBase.h"



static DataBase *_DBCtl = nil;

@interface DataBase()<NSCopying,NSMutableCopying>{
    FMDatabase  *_db;
    
}




@end

@implementation DataBase

+(instancetype)sharedDataBase{
    
    if (_DBCtl == nil) {
        
        _DBCtl = [[DataBase alloc] init];
        
        [_DBCtl initDataBase];
        
    }
    
    return _DBCtl;
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if (_DBCtl == nil) {
        
        _DBCtl = [super allocWithZone:zone];
        
    }
    
    return _DBCtl;
    
}
//+ (DataBase *)sharedManager
//{
//    static DataBase *sharedAccountManagerInstance = nil;
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        sharedAccountManagerInstance = [[self alloc] init];
//    });
//    return sharedAccountManagerInstance;
//}

-(id)copy{
    
    return self;
    
}

-(id)mutableCopy{
    
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    return self;
    
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    
    return self;
    
}


-(void)initDataBase{
    // 获得Documents目录路径
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 文件路径
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"messageModel.sqlite"];
   
    
    // 实例化FMDataBase对象
    
    _db = [FMDatabase databaseWithPath:filePath];
    
    [_db open];
    
  
    // 初始化数据表
    NSString *SAMessageModelSql = @"CREATE TABLE 'SAMessage' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL ,'msg_content' VARCHAR(255),'msg_title' VARCHAR(255),'msg_type' VARCHAR(255),'skip_id' VARCHAR(255),'skip_type' VARCHAR(255),'timeStr' VARCHAR(255),'msg_tag' VARCHAR(255),'msg_id' VARCHAR(255),'bageVlue' VARCHAR(255))";
//    if (![_db columnExists:@"timeStr" inTableWithName:@"SAMessage"]){
//        NSString *alertStr = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ INTEGER",@"SAMessage",@"timeStr"];
//        BOOL worked = [_db executeUpdate:alertStr];
//        if(worked){
//            NSLog(@"插入成功");
//        }else{
//            NSLog(@"插入失败");
//        }
//
//    }
   
       [_db executeUpdate:SAMessageModelSql];
   
    
    
    [_db close];

}
#pragma mark - 接口

- (void)addMessage:(SAMessageModel *)messageModel{
    [_db open];
    LFLog(@"%@",messageModel.bageVlue);
   
   BOOL result = [_db executeUpdate:@"INSERT INTO SAMessage(msg_content,msg_title,msg_type,skip_id,skip_type,timeStr,msg_tag,msg_id,bageVlue)VALUES(?,?,?,?,?,?,?,?,?)",messageModel.msg_content,messageModel.msg_title,messageModel.msg_type,messageModel.skip_id,messageModel.skip_type,messageModel.timeStr,messageModel.msg_tag,messageModel.msg_id,messageModel.bageVlue];
    LFLog(@"%d",result);
    [_db close];
    
}

- (void)deleteMessage:(SAMessageModel *)messageModel{
    [_db open];
    
    [_db executeUpdate:@"DELETE FROM SAMessage WHERE msg_id = ?",messageModel.msg_id];

    [_db close];
}

- (void)updateMessage:(SAMessageModel *)messageModel{
    [_db open];
    
//    [_db executeUpdate:@"UPDATE 'SAMessage' SET extra1 = ? ",messageModel.extra1];
    
     BOOL result =  [_db executeUpdate:@"UPDATE 'SAMessage' SET bageVlue = ?  WHERE msg_id = ? ",@"1",messageModel.msg_id];
//    [_db executeUpdate:@"UPDATE 'SAMessage' SET SAMessageModel_number = ?  WHERE SAMessageModel_id = ? ",@(SAMessageModel.number + 1),SAMessageModel.ID];

    LFLog(@"%d",result);
    
    [_db close];
}
//标记全部已读
- (void)readMessage{
    [_db open];
    
    
    [_db executeUpdate:@"UPDATE 'SAMessage' SET msg_id = ?  WHERE msg_type = ? or  msg_type = ? or  msg_type = ?",@"1",@"0",@"1",@"2"];
    
    
    [_db close];
}



- (NSMutableArray *)getAllMessage{
    [_db open];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM SAMessage"];

    while ([res next]) {
        SAMessageModel * messageModel = [[SAMessageModel alloc] init];
      
        messageModel.msg_content = [res stringForColumn:@"msg_content"];
        messageModel.msg_title = [res stringForColumn:@"msg_title"];
        messageModel.msg_type = [res stringForColumn:@"msg_type"];
        messageModel.skip_id = [res stringForColumn:@"skip_id"];
        messageModel.skip_type = [res stringForColumn:@"skip_type"];
        messageModel.timeStr = [res stringForColumn:@"timeStr"];
         messageModel.msg_tag = [res stringForColumn:@"msg_tag"];
           messageModel.msg_id = [res stringForColumn:@"msg_id"];
          messageModel.bageVlue = [res stringForColumn:@"bageVlue"];
        
        [dataArray addObject:messageModel];
        
    }
    
    [_db close];
    
    
    
    return dataArray;
    
    
}

// 删除数据
- (void)deleteAllMessage {
    [_db open];
    NSLog(@"%s", __func__);
//    FMDatabase *db = [FMDatabase databaseWithPath:self.dbPath];
    if ([_db open]) {
        NSString *sql = @"delete from SAMessage";
        BOOL res = [_db executeUpdate:sql];
        if (!res) {
            NSLog(@"error to delete db data");
        } else {
            NSLog(@"success to delete db data");
            
                   }
        [_db close];
    }
}


-(NSMutableArray*)lookUpWith:(NSString *)extra1
{

    [_db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    FMResultSet *res = [_db executeQuery:@"select * from SAMessage where extra1 = ?;",extra1];
    
    
    while(res.next)
        
    {
        
        SAMessageModel * messageModel = [[SAMessageModel alloc]init];
        

        messageModel.msg_content = [res stringForColumn:@"msg_content"];
        messageModel.msg_title = [res stringForColumn:@"msg_title"];
        messageModel.msg_type = [res stringForColumn:@"msg_type"];
        messageModel.skip_id = [res stringForColumn:@"skip_id"];
        messageModel.skip_type = [res stringForColumn:@"skip_type"];
         messageModel.timeStr = [res stringForColumn:@"timeStr"];
         messageModel.msg_tag = [res stringForColumn:@"msg_tag"];
           messageModel.msg_id = [res stringForColumn:@"msg_id"];
         messageModel.bageVlue = [res stringForColumn:@"bageVlue"];
        
        [array addObject:messageModel];
        
    }
    
    
    return array;
    

}

-(NSMutableArray*)selectitemDream_desc:(NSString *)msg_type
{
    [_db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    FMResultSet *res = [_db executeQuery:@"select * from SAMessage where msg_type = ?;",msg_type];
    
    
    while(res.next)
        
    {
        
        SAMessageModel * messageModel = [[SAMessageModel alloc]init];
        
      
        messageModel.msg_content = [res stringForColumn:@"msg_content"];
        messageModel.msg_title = [res stringForColumn:@"msg_title"];
        messageModel.msg_type = [res stringForColumn:@"msg_type"];
        messageModel.skip_id = [res stringForColumn:@"skip_id"];
        messageModel.skip_type = [res stringForColumn:@"skip_type"];
         messageModel.timeStr = [res stringForColumn:@"timeStr"];
         messageModel.msg_tag = [res stringForColumn:@"msg_tag"];
            messageModel.msg_id = [res stringForColumn:@"msg_id"];
          messageModel.bageVlue = [res stringForColumn:@"bageVlue"];
        [array addObject:messageModel];
        
    }
    
    
    return array;
    
}


@end
