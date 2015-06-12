//
//  AppDelegate.m
//  AHHelpPopoverExample
//
//  Created by Eldon on 6/12/15.
//  Copyright (c) 2015 Eldon Ahrold. All rights reserved.
//


#import "AppDelegate.h"
#import "AHHelpPopover.h"

@interface AppDelegate () <NSTextFieldDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet AHHelpPopoverButton *button1;
@property (weak) IBOutlet AHHelpPopoverButton *button2;
@property (weak) IBOutlet NSButton *button3;


@property (weak) IBOutlet NSTextField *aPopoverTitleTF;
@property (weak) IBOutlet NSTextField *aPopoverTextTF;
@property (weak) IBOutlet NSTextField *aPopoverLinkTF;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _aPopoverTitleTF.delegate = self;
    _aPopoverTextTF.delegate = self;
    _aPopoverLinkTF.delegate = self;

    _aPopoverTextTF.stringValue = NSLocalizedString(@"loremIpsum", nil);

    _button1.helpText = _aPopoverTextTF.stringValue;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (void)controlTextDidChange:(NSNotification *)note {
    if ([note.object isEqualTo:_aPopoverTextTF ]) {
        _button1.helpText = [note.object stringValue];
    } else if ([note.object isEqualTo:_aPopoverTitleTF]){
        _button1.helpTitle = [note.object stringValue];
    }  else if ([note.object isEqualTo:_aPopoverLinkTF]){
        _button1.helpLink = [note.object stringValue];
    }
}

- (IBAction)openPopoverWithAttributedString:(id)sender {

    AHHelpPopover *popover = [[AHHelpPopover alloc] initWithSender:sender];
    popover.textAlignment = NSCenterTextAlignment;
    
    NSString *helpText = NSLocalizedString(@"attributedStringMessage", nil);

    NSFont *defaultFont = [NSFont fontWithName:@"Verdana" size:24];
    NSFont *boldFont = [[NSFontManager sharedFontManager] convertFont:defaultFont toHaveTrait:NSBoldFontMask];
    NSFont *italicsFont = [[NSFontManager sharedFontManager] convertFont:defaultFont toHaveTrait:NSItalicFontMask];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:helpText];

    NSRange thisIsAnExampleRange = [helpText rangeOfString:@"This is an example"];
    [string addAttribute:NSFontAttributeName value:boldFont range:thisIsAnExampleRange];
    [string addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:thisIsAnExampleRange];

    NSRange ibStringRange = [helpText rangeOfString:@"IBAction"];
    [string addAttribute:NSFontAttributeName value:boldFont range:ibStringRange];
    [string addAttribute:NSForegroundColorAttributeName value:[NSColor orangeColor] range:ibStringRange];

    NSRange identKeyRange = [helpText rangeOfString:@"NSButton"];
    [string addAttribute:NSFontAttributeName value:italicsFont range:identKeyRange];
    [string addAttribute:NSForegroundColorAttributeName value:[NSColor purpleColor] range:identKeyRange];

    popover.helpURL = [NSURL URLWithString:@"https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSAttributedString_Class/index.html"];

    popover.attributedHelpText = [string copy];
    [popover openPopover];

}

@end
