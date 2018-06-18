//
//  customClassViewController.h
//  LookUp
//
//  Created by Rakesh
//  Copyright (c) Rakesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBHud.h"
#import "constant.h"
@interface customClassViewController : UIViewController


-(void)alertMessage:(NSString *)message;
-(void)alertMessageWithTitle:(NSString *)message with :(NSString*)title;
-(BOOL)checkInternet;
-(BOOL)checkInternetWithoutMsg;
-(void)showSVHud:(NSString *)str;
-(void)hideSVHud;



-(void)moveLeftViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveLeftViewOut:(BOOL) animate view:(UIView *)view1;

-(void)moveRightViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveRightViewOut:(BOOL) animate view:(UIView *)view1;


-(void)moveBottomViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveBottomViewOut:(BOOL) animate view:(UIView *)view1;

-(void)moveTopViewIn:(BOOL) animate view:(UIView *)view1;
-(void)moveTopViewOut:(BOOL) animate view:(UIView *)view1;

-(void)bounceViewIn:(BOOL) animate view:(UIView *)view1;
-(void)bounceViewOut:(BOOL) animate view:(UIView *)view1;

- (NSMutableDictionary *)dictionaryByReplacingNullsWithStrings:(NSMutableDictionary *)jobList;
- (NSMutableDictionary *)replaceNullInNested:(NSMutableDictionary *)targetDict;

-(NSDictionary *) nestedDictionaryByReplacingNullsWithNil:(NSDictionary*)sourceDictionary;

-(BOOL)validateABN : (NSString*) abn;


-(NSString *)encodeURLWithUTF8:(NSString *)str;

-(void)callAuthentication;
-(NSString *) randomStringWithLength: (int) len;
-(NSString*)authenticationMethod:(NSString*)nonce;
- (CGFloat)heightForAttributedText:(NSAttributedString*)text font:(UIFont*)font withinWidth:(CGFloat)width;

-(NSString *)convertDictToJSON:(NSMutableDictionary *)dict;
-(NSString *)convertArrayToJSON:(NSMutableArray *)array;

-(void) scan:(UIViewController *) obj : (NSString *) strFromm;
-(void)getAudioFromVideo:(NSURL *)videoPath toAudio:(NSString *)audioPath;

-(NSString *)dictToJson:(NSMutableDictionary *)dict;
-(NSArray *)dataToArray:(NSData *)data;
@end
