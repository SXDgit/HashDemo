//
//  SingleLinkedNode.m
//  ZBSingleLinkedList
//
//  Created by Sangxiedong on 2019/1/28.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "SingleLinkedNode.h"

@implementation SingleLinkedNode

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value {
    if (self = [super init]) {
        _key = key;
        _value = value;
    }
    return self;
}

+ (instancetype)nodeWithKey:(NSString *)key value:(NSString *)value {
    return [[[self class] alloc]initWithKey:key value:value];
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    SingleLinkedNode *newNode = [[SingleLinkedNode allocWithZone:zone]init];
    newNode.key = self.key;
    newNode.value = self.value;
    newNode.next = self.next;
    return newNode;
}

@end
