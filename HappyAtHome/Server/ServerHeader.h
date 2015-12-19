//
//  ServerHeader.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerAFNetworking.h"
#import "MyHeader.h"
#import "AFNetworking.h"

typedef void(^NSDictionaryBlock)    (NSDictionary *dictblock);
typedef void(^NSArrayBlock)         (NSArray *arrayblock);
typedef void(^NSStringBlock)        (NSString *stringblock);

#ifndef ServerHeader_h
#define ServerHeader_h


#define ServerURL                   @"http://61.142.211.110:92//EnjoyLiveHome/MainRequest"
#define ServerImgURL                @"http://192.168.1.146:8080//EnjoyLiveHome/"

#define operateLogin                @"001"
#define operateRegister             @"002"
#define operateUserInfoGet          @"003"
#define operateUserInfoChange       @"003"
#define operateOldticket            @"043"
#define operateReback               @"010"
#define operateSorderSet            @"048"
#define operateSorderGet            @"049"
#define operateServiceLook          @"021"
#define operateAdvertisingLook      @"072"
#define operateDiscuss              @"051"
#define operateApk                  @"057"
#define operateExGet                @"058"
#define operateExChanged            @"059"
#define operateGoodsInfo            @"053"
#define operateGoodsFind            @"054"
#define operateGoodsDetail          @"062"
#define operateGoodsType            @"055"
#define operateCollectGet           @"060"
#define operateCollectAdd           @"063"
#define operateCollectDelete        @"064"
#define operateShoppingCartGet      @"061"
#define operateShoppingCartAdd      @"065"
#define operateShoppingCartDelete   @"066"
#define operateShoppingCartChange   @"068"
#define operateCommentGet           @"067"
#define operateCommentSet           @"070"
#define operateGorderGet            @"069"
#define operateGorderClear          @"071"
#define operateActivityAll          @"075"
#define operateActivityDetail       @"076"
#define operateCompettorGet         @"077"
#define operateCompettorAdd         @"078"
#define operateCompettroSign        @"079"

#import "ServerLoginOrRegister.h"
#import "ServerUserInfo.h"
#import "ServerOtherFeatures.h"
#import "ServerShopping.h"
#import "ServerService.h"
#import "ServerActivity.h"
#import "NSDictionary+Safe.h"

#endif /* ServerHeader_h */
