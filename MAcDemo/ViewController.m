//
//  ViewController.m
//  MAcDemo
//
//  Created by cao longjian on 16/11/5.
//  Copyright © 2016年 Jiji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (unsafe_unretained) IBOutlet NSTextView *textView1;
@property (unsafe_unretained) IBOutlet NSTextView *textView2;
@property (nonatomic, strong) NSMutableString *arrModelStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrModelStr = [NSMutableString string];
}

- (IBAction)buttonClick:(NSButton *)sender {
    NSDictionary *dict = [self dictionaryWithJsonString:[self.textView1 string]];
    if (dict) {
        NSString *modelStr = [self createModelWithDictionary:dict modelName:@"model"];
        NSMutableString *endString = [NSMutableString stringWithString:modelStr];
        [endString appendFormat:@"%@",self.arrModelStr];
        [self.textView2 setString:endString];
    }else{
        [self.textView2 setString:@"请输入{：}格式"];
    }
}

//json字符串转成字典
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        //NSLog(@"json解析失败：%@",err);
        [self.textView2 setString:[NSString stringWithFormat:@"json解析失败：%@",err]];
        return nil;
    }
    return dic;
}

//代码创建model类
- (NSString *)createModelWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName
{
    NSMutableString *mStr = [NSMutableString string];
    NSString *type1 = @"NSString";
    NSString *type2 = @"strong";
    NSArray  *arr   = nil;
    
    [mStr appendFormat:@"\n@interface %s : NSObject\n\n",modelName.UTF8String];
    for (NSString *key in dict) {
        type1 = ([dict[key] isKindOfClass:[NSNumber class]])?@"NSNumber":@"NSString";
        
        if ([dict[key] isKindOfClass:[NSNumber class]]) {
            type1 = @"NSNumber";
            type2 = @"strong";
        }else if ([dict[key] isKindOfClass:[NSString class]]){
            type1 = @"NSString";
            type2 = @"copy  ";
        }else if ([dict[key] isKindOfClass:[NSArray class]]){
            type1 = [NSString stringWithFormat:@"NSArray<%@ *>",[self capStrModel:key]];
            type2 = @"strong";
            arr = dict[key];
    
            NSString *strr = [self createModelWithArray:dict[key] name:key];
            [self.arrModelStr appendString:strr];
        }else if ([dict[key] isKindOfClass:[NSDictionary class]]){
            type1 = @"NSDictionary";
            type2 = @"strong";
        }else if ([dict[key] isKindOfClass:[NSData class]]){//json
            type1 = @"######";
            type2 = @"######";
        }else if ([dict[key] isKindOfClass:[NSNull class]]){//json
            type1 = @"NSString";
            type2 = @"copy  ";
        }else{//
            type1 = @"######";
            type2 = @"######";
        }
        [mStr appendString:[NSString stringWithFormat:@"@property (nonatomic, %s) %s *%s;\n",type2.UTF8String,type1.UTF8String,key.UTF8String]];
        
    }
    [mStr appendString:@"\n@end\n"];
    
    return mStr;
}

//解析数组
- (NSString *)createModelWithArray:(NSArray *)array name:(NSString *)name{
    [self.arrModelStr appendFormat:@"\n/**************************************-model-****************************************/\n"];
    if (array.firstObject) {
        if ([array.firstObject isKindOfClass:[NSDictionary class]]) {
            return [self createModelWithDictionary:array.firstObject modelName:[self capStrModel:name]];
        }
    }
    return @"------------Array is nil------------";
}

//首字母大写+Model
- (NSString *)capStrModel:(NSString *)str{
    return [NSString stringWithFormat:@"%@Model",[str capitalizedString]];
}

//printf("@property (nonatomic,copy) %s *%s;\n",type.UTF8String,key.UTF8String);
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    
}


@end
