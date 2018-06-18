//
//  customClassViewController.m
//  LookUp
//
//  Created by Rakesh
//  Copyright (c) Rakesh. All rights reserved.
//

#import "customClassViewController.h"
#import "Bridge.h"
#import <AVFoundation/AVFoundation.h>
@interface customClassViewController ()
{
    NSDictionary *dictToReturn;
    UIView *bounceView;
    
    NSURLConnection *ReqCon;
    NSMutableData *ReqData;
    
    NSString *strNotificationName;
    UIView *hudView;
    UIViewController *homeobj;
    NSString *strFrom;
}

@end

@implementation customClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma -mark Alert

-(void)alertMessage:(NSString *)message
{
    if([message isEqualToString:@"Error on server side"])
    {
        //message = ERROR_MESSAGE;
    }
    else if([message isEqualToString:@"Successfull Transaction"])
    {
        message = @"Done! 👍";
    }
    else if([message isEqualToString:@"Invalid User Token"])
    {
        message = @"Your session is expired! Please login again";
    }
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:ALERT_TITLE message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [av show];
//    UIAlertController * alert = [UIAlertController
//                                 alertControllerWithTitle:ALERT_TITLE
//                                 message:message
//                                 preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* okButton = [UIAlertAction
//                                actionWithTitle:@"Okay"
//                                style:UIAlertActionStyleDefault
//                                handler:^(UIAlertAction * action) {
//                                    //Handle your yes please button action here
//                                }];
//    [alert addAction:okButton];
//    
//    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)alertMessageWithTitle:(NSString *)message with :(NSString*)title
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [av show];
    
//    UIAlertController * alert = [UIAlertController
//                                 alertControllerWithTitle:title
//                                 message:message
//                                 preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* okButton = [UIAlertAction
//                               actionWithTitle:@"Okay"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action) {
//                                   //Handle your yes please button action here
//                               }];
//    [alert addAction:okButton];
//    [self presentViewController:alert animated:YES completion:nil];
}


#pragma -mark LeftView In Out
-(void)moveLeftViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = self.view.frame.size.width - pickerFrame.size.width;
    float animDuration = 0;
    if (animate)
    {
        if(view1.tag == 5555)
        {
            animDuration = 3;
        }
        else
        {
            animDuration = 0.3;
        }
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

-(void)moveLeftViewOut:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = self.view.frame.size.width+500;
    
    float animDuration = 0;
    
    if (animate)
    {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -mark RightView In Out
-(void)moveRightViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = 0;
    float animDuration = 0;
    if (animate)
    {
        if(view1.tag == 5556)
        {
             animDuration = 3;
        }
        else
        {
             animDuration = 0.3;
        }
       
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

-(void)moveRightViewOut:(BOOL) animate view:(UIView *)view1
{
    
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x =  0 - self.view.frame.size.width;
    
    float animDuration = 0;
    
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -mark Bottom Up Down
-(void)moveBottomViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = self.view.frame.size.height - pickerFrame.size.height;
    float animDuration = 0;
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}
-(void)moveBottomViewOut:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = self.view.frame.size.height;
    
    float animDuration = 0;
    
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -mark Top Up Down
-(void)moveTopViewIn:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = 64;
    float animDuration = 0;
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}
-(void)moveTopViewOut:(BOOL) animate view:(UIView *)view1
{
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.y = 0 - pickerFrame.size.height;
    
    float animDuration = 0;
    
    if (animate) {
        animDuration = 0.3;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animDuration];
    
    view1.frame = pickerFrame;
    
    [UIView commitAnimations];
}

#pragma -HUD
-(void)showSVHud:(NSString *)str
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setRingThickness:2.0];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:25/255.0 green:118/255.0 blue:210/255.0 alpha:1]];
    [SVProgressHUD setCornerRadius:3];
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
}
-(void)hideSVHud
{
    [SVProgressHUD dismiss];
}

#pragma -mark Bounce Animation
-(void)bounceViewIn:(BOOL) animate view:(UIView *)view1
{
    bounceView = view1;
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = self.view.frame.size.width - pickerFrame.size.width;
    view1.frame = pickerFrame;
     [self openOverlayViewCreateAccount];
}
-(void)bounceViewOut:(BOOL) animate view:(UIView *)view1;
{
    bounceView = view1;
    CGRect pickerFrame = view1.frame;
    pickerFrame.origin.x = self.view.frame.size.width+500;
    view1.frame = pickerFrame;
    
}

-(void)openOverlayViewCreateAccount
{
    bounceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
    bounceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    [UIView commitAnimations];
    
}

- (void)bounce1AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
    bounceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    [UIView commitAnimations];
}

- (void)bounce2AnimationStopped
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3/2];
    bounceView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}
#pragma -mark Check Internet Connectivity
-(BOOL)checkInternet
{
    Reachability *networkRachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkRachable currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"No Internet connection" message:@"Your request cannot be completed because you are not connected to Internet. Verify your data connection and try again." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [av show];
        return NO;
    }
    return YES;
}
-(BOOL)checkInternetWithoutMsg
{
    Reachability *networkRachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkRachable currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        return NO;
    }
    return YES;
}
#pragma -mark Replace Null with String
- (NSMutableDictionary *)dictionaryByReplacingNullsWithStrings:(NSMutableDictionary *)jobList
{
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:jobList];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in [replaced allKeys])
    {
        id object = [replaced objectForKey:key];
        if (object == nul)
        {
            [replaced setObject:blank
                         forKey:key];
        }
        else
            if ([object isKindOfClass:[NSDictionary class]])
            {
                [replaced setObject:[self replaceNullInNested:object]
                             forKey:key];
            }
            else
                if ([object isKindOfClass:[NSArray class]])
                {
                    NSMutableArray *dc = [[NSMutableArray alloc] init];
                    for (NSDictionary *tempDict in object)
                    {
                        [dc addObject:[self dictionaryByReplacingNullsWithStrings:tempDict]];
                    }
                    [replaced setObject:dc
                                 forKey:key];
                }
    }
    return replaced;
}

- (NSMutableDictionary *)replaceNullInNested:(NSMutableDictionary *)targetDict
{
    // make it to be NSMutableDictionary in case that it is nsdictionary
    NSMutableDictionary *m = [targetDict mutableCopy];
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:m];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in [replaced allKeys])
    {
        const id object = [replaced objectForKey:key];
        if (object == nul)
        {
            [replaced setObject:blank
                         forKey:key];
        }
        else
            if ([object isKindOfClass:[NSArray class]])
            {
                //            NSLog(@"found null inside and key is %@", key);
                // make it to be able to set value by create a new one
                NSMutableArray *a = [object mutableCopy];
                for (int i = 0; i < [a count]; i++)
                {
                    for (NSString *subKey in [[a objectAtIndex:i] allKeys])
                    {
                        if ([[object objectAtIndex:i] valueForKey:subKey] == nul)
                        {
                            [[object objectAtIndex:i] setValue:blank
                                                        forKey:subKey];
                        }
                    }
                }
                // replace the updated one with old one
                [replaced setObject:a
                             forKey:key];
            }
    }
    return replaced;
}

- (NSDictionary *) dictionaryByReplacingNullsWithNil:(NSDictionary*)sourceDictionary {
    
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:sourceDictionary];
    const id nul = [NSNull null];
    
    for(NSString *key in replaced) {
        const id object = [sourceDictionary objectForKey:key];
        if(object == nul) {
            [replaced setValue:@"" forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:replaced];
}

-(NSDictionary *) nestedDictionaryByReplacingNullsWithNil:(NSDictionary*)sourceDictionary
{
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:sourceDictionary];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    [sourceDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        object = [sourceDictionary objectForKey:key];
        if([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *innerDict = object;
            [replaced setObject:[self nestedDictionaryByReplacingNullsWithNil:innerDict] forKey:key];
            
        }
        else if([object isKindOfClass:[NSArray class]]){
            NSMutableArray *nullFreeRecords = [NSMutableArray array];
            for (id record in object) {
                
                if([record isKindOfClass:[NSDictionary class]])
                {
                    NSDictionary *nullFreeRecord = [self nestedDictionaryByReplacingNullsWithNil:record];
                    [nullFreeRecords addObject:nullFreeRecord];
                }
            }
            [replaced setObject:nullFreeRecords forKey:key];
        }
        else
        {
            if(object == nul) {
                [replaced setObject:blank forKey:key];
            }
        }
    }];
    
    return [NSDictionary dictionaryWithDictionary:replaced];
}


-(NSString *) randomStringWithLength: (int) len
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

-(NSString *)convertDictToJSON:(NSMutableDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict // Here you can pass array or dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonString;
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //This is your JSON String
        //NSUTF8StringEncoding encodes special characters using an escaping scheme
    } else {
        NSLog(@"Got an error: %@", error);
        jsonString = @"";
    }
    NSLog(@"Your JSON String is %@", jsonString);
    
    return jsonString;
}
-(NSString *)encodeURLWithUTF8:(NSString *)str
{
    //   NSString *strNew = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = [NSString stringWithFormat:@"%@", [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    return url;
}
-(NSString *)convertArrayToJSON:(NSMutableArray *)array
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array // Here you can pass array or dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonString;
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //This is your JSON String
        //NSUTF8StringEncoding encodes special characters using an escaping scheme
    } else {
        NSLog(@"Got an error: %@", error);
        jsonString = @"";
    }
    NSLog(@"Your JSON String is %@", jsonString);
    
    return jsonString;
}
-(void)getAudioFromVideo:(NSURL *)videoPath toAudio:(NSString *)audioPath {
    
    AVAsset *myasset = [AVAsset assetWithURL:videoPath];
    
    AVAssetExportSession *exportSession=[AVAssetExportSession exportSessionWithAsset:myasset presetName:AVAssetExportPresetAppleM4A];
    
    exportSession.outputURL=[[NSURL alloc] initWithString:audioPath];
    exportSession.outputFileType=AVFileTypeAppleM4A;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        if (exportSession.status==AVAssetExportSessionStatusFailed) {
            NSLog(@"failed");
        }
        else {
            NSLog(@"AudioLocation : %@",audioPath);
        }
    }];
}
-(NSString *)dictToJson:(NSMutableDictionary *)dict
{
    NSError * err;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&err];
    NSString * myString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return myString;
}

-(NSArray *)dataToArray:(NSData *)data
{
    NSError *error = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
    return jsonArray;
}

@end
