#AHHelpPopover & AHHelpPopoverButton
A pair of classes to make displaying help info easy.

##AHHelpPopover
Set a string value and the popover will auto-calculate the required size for the popover.


###Example Usage:
```Objective-c
- (IBAction)openPopoverWithAttributedString:(id)sender {
    AHHelpPopover *popover = [[AHHelpPopover alloc] initWithSender:sender];
    popover.helpText = @"This is a little bit of info you may want to know";

	[popover openPopover]
	// or 
	[popover openPopoverWithCompletionHandler:^{
        NSLog(@"Done with Popover...");
    }];
}
```
In addition you can set a title or a link for the help.
```
popover.helpTitle = @"Usage:"
popover.helpURL = [NSURL URLWithString:@"https://github.com/eahrold/AHHelpPopover"];
```

You can also set the attributedHelpText property (NSAttributedString), letting you add a fully formatted message with additional links, coloring, etc.

See [AHHelpPopover.h](AHHelpPopover/AHHelpPopover.h) for full usage.

##AHHelpPopoverButton
This makes it even easier to display help. Simply add a button in your xib, set the class to AHHelpPopover, and set the button's identifier. Then add a corresponding key and entry to the project's Localizable.strings 
```
/* 
 * LocalizedStrings.strings
 */
 
"myHelpButtonIdentifier" = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.";

"myHelpButtonIdentifierTitle" = "Finding Lorem ipsum"
"myHelpButtonIdentifierURL" = "http://www.lipsum.com"
```

Including a key-message(s) with "Title" and/or "URL" as the suffix will add those elements to the popover.

###Demo:
![demo]

-

Take a look at the AHHelpPopoverExample project for some other use case examples.

Comments, suggestions, and especially PR's are welcome.

[demo]: media/button_demo.gif "Demo Video"