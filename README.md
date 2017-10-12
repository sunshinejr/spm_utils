# SPM fixers
Hey there! This is my repo for a bunch of fixers for SPM. All of this is mostly work in progress and written in Ruby.
Which means this is probably not the best code you'll see these days and I recommend you to do a **backup/commit before using this scripts**. 
These were not tested on many projects yet, so please bear in mind that this is really experimental.
Fortunately, I accept PRs to fix anything you see that is wrong! I will be really grateful for that, actually.

## Quick fixer
See issue [Quick#751](https://github.com/Quick/Quick/issues/751) and PR [swift-package-manager#955](https://github.com/apple/swift-package-manager/pull/955). TL;DR because of SPM, Quick can't set `CLANG_ENABLE_MODULES` by itself.
This script does it for you.

Steps:
1. Go to your SPM project.
1. Clean your packages by using `swift package clean`
1. Run `swift build & swift package generate-xcodeproj` (make sure it passes)
1. Run `gem install xcodeproj` to install additional library for our scrip.
1. Run `ruby path/to/spm_fixquick.rb` to fix your Xcodeproj.
1. If everything goes correcly, you should have fixed project by then :)

## Swift4All - update all your dependencies to Swift 4
By running `swift build & swift package generate-xcodeproj` you don't necessarily get all your dependencies built with Swift 4 (see [SR-5940](https://bugs.swift.org/browse/SR-5940)). This script fixes that for you.

Steps:
1. Go to your SPM project.
1. Clean your packages by using `swift package clean`
1. Run `swift build & swift package generate-xcodeproj` (make sure it passes)
1. Run `gem install xcodeproj` to install additional library for our scrip.
1. Run `ruby path/to/spm_swift4all.rb` to update your Xcodeproj.
1. If everything goes correcly, you should have your project updated.

## [WIP] Inhibit deps warnings - Basically `inhibit_all_warnings` copy.
This currently does not work, but it would be awesome to have it working sometime in future.