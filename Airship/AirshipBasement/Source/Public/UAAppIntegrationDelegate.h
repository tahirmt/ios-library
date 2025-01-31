/* Copyright Airship and Contributors */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * App integration delegate.
 * @note For internal use only. :nodoc:
 */
NS_SWIFT_NAME(AppIntegrationDelegate)
@protocol UAAppIntegrationDelegate <NSObject>

- (void)onBackgroundAppRefresh;

- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_SWIFT_NAME(didRegisterForRemoteNotifications(deviceToken:));

- (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_SWIFT_NAME(didFailToRegisterForRemoteNotifications(error:));

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo
                        isForeground:(BOOL)isForeground
                   completionHandler:(void (^)(UIBackgroundFetchResult))completionHandler NS_SWIFT_NAME(didReceiveRemoteNotification(userInfo:isForeground:completionHandler:));

- (void)willPresentNotification:(UNNotification *)notification
            presentationOptions:(UNNotificationPresentationOptions)options
              completionHandler:(void (^)(void))completionHandler NS_SWIFT_NAME(willPresentNotification(notification:presentationOptions:completionHandler:));


- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(void))completionHandler API_UNAVAILABLE(tvos) NS_SWIFT_NAME(didReceiveNotificationResponse(response:completionHandler:));

- (UNNotificationPresentationOptions)presentationOptionsForNotification:(UNNotification *)notification;

@end


NS_ASSUME_NONNULL_END

