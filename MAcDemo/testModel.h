//
//  testModel.h
//  MAcDemo
//
//  Created by cao longjian on 16/11/5.
//  Copyright © 2016年 Jiji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *storeId;
@property (nonatomic, copy  ) NSString *accountNo;
@property (nonatomic, strong) NSNumber *currentBalance;
@property (nonatomic, strong) NSNumber *updateTime;
@property (nonatomic, copy  ) NSString *accountHolder;
@property (nonatomic, strong) NSNumber *isDel;
@property (nonatomic, strong) NSNumber *createPerson;
@property (nonatomic, copy  ) NSString *accountType;
@property (nonatomic, strong) NSNumber *createTime;
@property (nonatomic, copy  ) NSString *remark;
@property (nonatomic, copy  ) NSString *updatePerson;
@property (nonatomic, copy  ) NSString *doubleOfcurrentBalance;
@property (nonatomic, strong) NSNumber *sort;
@property (nonatomic, strong) NSNumber *companyId;






@end
