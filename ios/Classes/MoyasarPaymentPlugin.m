#import "MoyasarPaymentPlugin.h"
#if __has_include(<moyasar_payment/moyasar_payment-Swift.h>)
#import <moyasar_payment/moyasar_payment-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "moyasar_payment-Swift.h"
#endif

@implementation MoyasarPaymentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMoyasarPaymentPlugin registerWithRegistrar:registrar];
}
@end
