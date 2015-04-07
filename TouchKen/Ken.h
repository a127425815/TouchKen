//
//  Ken.h
//  TouchKen
//
//  Created by Mac User on 2015/1/30.
//  Copyright (c) 2015年 Mac User. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ken;

// this is protocol
@protocol KenDelegate <NSObject>

@optional   //註解掉的話主程式必須要有下列程式
-(void)Ken:(Ken *)ken didFinishedMovedWithStatus:(NSDictionary *)status;
-(void)didTouchedKenTag:(long)tag;
-(void)didDropInGray:(long)tag;
@end

@interface Ken : UIView
{
    CGPoint location;
}
@property (strong,nonatomic) id <KenDelegate> delegate;
-(Ken *) initWithPoint:(CGPoint)point atDirection:(int)direction;

-(void)GoRight;
-(void)GoLeft;

@end
