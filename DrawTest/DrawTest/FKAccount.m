//
//  FKAccount.m
//  DrawTest
//
//  Created by 李世爽 on 15-10-28.
//  Copyright (c) 2015年 crazyit.org. All rights reserved.
//

#import "FKAccount.h"

@implementation FKAccount
- (id)initWithAccountNo:(NSString*)aAccount
				balance:(CGFloat)aBalance
{
	self = [super init];
	if (self) {
		_accountNo = aAccount;
		_balance = aBalance;
	}
	return self;
}
// 提供一个draw方法来完成取钱操作
- (void) draw:(CGFloat)drawAmount
{
	// 账户余额大于取钱数目
	if (self.balance >= drawAmount)
	{
		// 吐出钞票
		NSLog(@"%@取钱成功！吐出钞票:%g", [NSThread currentThread].name
			, drawAmount);
//		[NSThread sleepForTimeInterval:0.001];
		// 修改余额
		_balance = _balance - drawAmount;
		NSLog(@"\t余额为: %g" , self.balance);
	}
	else
	{
		NSLog(@"%@取钱失败！余额不足！", [NSThread currentThread].name);
	}
}
- (NSUInteger) hash
{
	return [self.accountNo hash];
}
- (BOOL)isEqual:(id)anObject
{
	if(self == anObject)
		return YES;
	if (anObject != nil
		&& [anObject class] == [FKAccount class])
	{
		FKAccount* target = (FKAccount*)anObject;
		return [target.accountNo isEqualToString:self.accountNo];
	}
	return NO;
}
@end
