//
//  SingleLinkedNode.h
//  ZBSingleLinkedList
//
//  Created by Sangxiedong on 2019/1/28.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleLinkedNode : NSObject <NSCopying>

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) SingleLinkedNode *next;
@property (nonatomic, assign) NSInteger hashValue;

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value;
+ (instancetype)nodeWithKey:(NSString *)key value:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
