//
//  SeaFood.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/27.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "SeaFood.h"

@implementation SeaFood

- (id)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        self.foodImage = dic[@"image"];
        self.foodTitle = dic[@"title"];
        self.foodPrice = dic[@"price"];
        self.foodInfo  = dic[@"info"];
    }
    return self;
}

+ (id)seafoodWithDictionary:(NSDictionary *)dic{
    SeaFood *food = [[SeaFood alloc] initWithDictionary:dic];
    return food;
}

@end
