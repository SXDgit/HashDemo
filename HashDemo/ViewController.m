//
//  ViewController.m
//  ZBSingleLinkedList
//
//  Created by Sangxiedong on 2019/1/28.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "ViewController.h"
#import "HashTable.h"
#import "SingleLinkedNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HashTable *hashTable = [[HashTable alloc]initWithCapacity:10];
    
    SingleLinkedNode *node1 = [[SingleLinkedNode alloc]initWithKey:@"10" value:@"1000"];
    SingleLinkedNode *node2 = [[SingleLinkedNode alloc]initWithKey:@"21" value:@"1001"];
    SingleLinkedNode *node3 = [[SingleLinkedNode alloc]initWithKey:@"32" value:@"1002"];
    SingleLinkedNode *node4 = [[SingleLinkedNode alloc]initWithKey:@"103" value:@"1003"];
    SingleLinkedNode *node5 = [[SingleLinkedNode alloc]initWithKey:@"14" value:@"9000"];
    SingleLinkedNode *node6 = [[SingleLinkedNode alloc]initWithKey:@"15" value:@"9001"];
    SingleLinkedNode *node7 = [[SingleLinkedNode alloc]initWithKey:@"18" value:@"9002"];
    SingleLinkedNode *node8 = [[SingleLinkedNode alloc]initWithKey:@"20" value:@"9003"];
    SingleLinkedNode *node9 = [[SingleLinkedNode alloc]initWithKey:@"26" value:@"9003"];
    
    [hashTable insertElementByNode:node1];
    [hashTable insertElementByNode:node2];
    [hashTable insertElementByNode:node3];
    [hashTable insertElementByNode:node4];
    [hashTable insertElementByNode:node5];
    [hashTable insertElementByNode:node6];
    [hashTable insertElementByNode:node7];
    [hashTable insertElementByNode:node8];
    [hashTable insertElementByNode:node9];
    
    NSString *value = [hashTable findElementByKey:@"26"];
    NSLog(@"获取key为26的值为=== %@", value);
    
    NSLog(@"插入的元素个数== %ld", hashTable.modCount);
}


@end
