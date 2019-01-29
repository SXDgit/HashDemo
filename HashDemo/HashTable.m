//
//  HashTable.m
//  ZBSingleLinkedList
//
//  Created by Sangxiedong on 2019/1/28.
//  Copyright © 2019 ZB. All rights reserved.
//

#define MAX_CAPACITY pow(2, 30)

#import "HashTable.h"
#import "SingleLinkedNode.h"

@implementation HashTable

- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _capacity = capacity;
        _loadFactor = 0.75;
        _threshold = (NSInteger) _loadFactor * _capacity;
        _modCount = 0;
        // 直接初始化数组，这里为了方便理解hash，所以就直接给定capacity，java中默认是16
        _elementArray = [NSMutableArray arrayWithCapacity:capacity];
        for (int i = 0; i < capacity; i ++) {
            [_elementArray addObject:@""];
        }
    }
    return self;
}

- (void)insertElementByNode:(SingleLinkedNode *)newNode {
    if (newNode.key.length == 0) {
        return;
    }
    
    // 判断是否需要扩容
    if (_threshold < _modCount * _capacity) {
        _capacity *= 2;
        [self resizeOfNewCapacity:_capacity];
    }
    
    // 计算存储位置
    NSInteger keyValue = [newNode.key integerValue]; // F(x) = x; 得到hash值
    NSInteger index = keyValue % _capacity;         // hash值 MOD 容量 = 数组下标
    
    newNode.hashValue = keyValue;
    
    
    // 如果插入的区域是空闲的，则直接把数据存入该空间区域
    if (![[[_elementArray objectAtIndex:index] class] isEqual:[SingleLinkedNode class]]) {
        [_elementArray replaceObjectAtIndex:index withObject:newNode];
        _modCount++;
    }else {
        // 发生冲突，通过链表法解决冲突
        SingleLinkedNode *headNode = [_elementArray objectAtIndex:index];
        while (headNode != NULL) {
            // 插入的key重复，则覆盖原来的元素
            if ([headNode.key isEqualToString:newNode.key]) {
                headNode.value = newNode.value;
                return;
            }
            headNode = headNode.next;
        }
        _modCount++;
        // 直接把元素插入
        headNode.next = newNode;
    }
}

- (NSString *)findElementByKey:(NSString *)key {
    if (key.length == 0) {
        return nil;
    }
    
    // 计算存储位置
    NSInteger keyValue = [key integerValue];
    NSInteger index = keyValue % _capacity;    // hash函数keyValue % _capacity (0~9)
    
    if (index >= _capacity) {
        return nil;
    }
    
    if (![[[_elementArray objectAtIndex:index] class] isEqual:[SingleLinkedNode class]]) {
        return nil;
    }else {
        // 遍历链表，知道找到key值相等的node，然后返回value
        SingleLinkedNode *headNode = [_elementArray objectAtIndex:index];
        while (headNode != NULL) {
            if ([headNode.key isEqualToString:key]) {
                return headNode.value;
            }
            headNode = headNode.next;
        }
        return nil;
    }
}

- (void)resizeOfNewCapacity:(NSInteger)newCapacity {
    NSInteger oldCapacity = _elementArray.count;
    if (oldCapacity == MAX_CAPACITY) {         // 扩容前的数组大小如果已经达到最大2^30
        _threshold = oldCapacity - 1;       // 修改阈值为int的最大值（2^30 - 1），这样以后就不会扩容了
        return;
    }
    
    // 初始化一个新的数组
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:newCapacity];
    for (int i = 0; i < newCapacity; i ++) {
        [newArray addObject:@""];
    }
    
    [self transferWithNewTable:newArray];            // 将数据转移到新的数组里
    [_elementArray removeAllObjects];
    [_elementArray addObjectsFromArray:newArray];    // hash表的数组引用新建的数组
    _threshold = (NSInteger)_capacity * _loadFactor; // 修改阈值
}

- (void)transferWithNewTable:(NSMutableArray *)array {
    // 遍历旧数组，将元素转移到新数组中
    for (int i = 0; i < _elementArray.count; i ++) {
        if ([[[_elementArray objectAtIndex:i] class] isEqual:[SingleLinkedNode class]]) {
            SingleLinkedNode *node = _elementArray[i];
            if (node != NULL) {
                do {
                    [self insertElementToArrayWith:array andNode:node];
                    node = node.next;
                } while (node != NULL);
            }
        }
    }
}

- (NSInteger)indexForHashValue:(NSInteger)hash andNewCapacity:(NSInteger)newCapacity {
    return hash & (newCapacity - 1);
}

- (void)insertElementToArrayWith:(NSMutableArray *)array andNode:(SingleLinkedNode *)node {
    
    //    NSInteger index = [self indexForHashValue:node.hashValue andNewCapacity:array.count];
    
    NSInteger index = [node.key integerValue] % _capacity;                      // 计算每个元素在新数组中的位置
    
    if (![[[array objectAtIndex:index] class] isEqual:[SingleLinkedNode class]]) {
        [array replaceObjectAtIndex:index withObject:node];
    }else {
        SingleLinkedNode *headNode = [array objectAtIndex:index];
        while (headNode != NULL) {
            headNode = headNode.next;
        }
        // 直接把元素插入
        headNode.next = node;
    }
}

@end
