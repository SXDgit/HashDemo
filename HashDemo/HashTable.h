//
//  HashTable.h
//  ZBSingleLinkedList
//
//  Created by Sangxiedong on 2019/1/28.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SingleLinkedNode;

NS_ASSUME_NONNULL_BEGIN

@interface HashTable : NSObject

@property (nonatomic, strong) NSMutableArray *elementArray;
@property (nonatomic, assign) NSInteger capacity;       // 容量  数组（hash表）长度
@property (nonatomic, assign) NSInteger modCount;       // 计数器，计算put的元素个数（不包括重复的元素）

@property (nonatomic, assign) float threshold;      // 阈值
@property (nonatomic, assign) float loadFactor;         // 加载因子

/**
 初始化Hash表
 
 @param capacity 数组的长度
 @return hash表
 */
- (instancetype)initWithCapacity:(NSInteger)capacity;

/**
 插入
 
 @param newNode 存入的键值对newNode
 */
- (void)insertElementByNode:(SingleLinkedNode *)newNode;

/**
 查询
 
 @param key key值
 @return 想要获取的value
 */
- (NSString *)findElementByKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
