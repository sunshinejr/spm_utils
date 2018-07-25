# SPM utils

Hey there! This is a repo with a bunch of utility scripts for SPM compiled to a ruby gem. I really like working with SPM nowadays, but I needed to automate some things that I could reuse both on my local computer and also on the CI - maybe you want to use them too!
If you have an idea for a cool fixer/utility - don't hesitate to file and issue or make a PR!

Current utilities:
1. [#cleaning-your-project](Clean your project (remove cache, builds, xcodeproj etc))
1. [#quick-fixer](Fix Quick on SPM)
1. [#swift-version---update-your-targets-to-swift-3-or-4](Update Swift version in given target or all targets)
1. [#inhibit-warnings](Inhibit all warnings in given target or all targets)

## Before you use the script:

1.  Go to your SPM project.
1.  Backup/commit your files.
1.  Clean your project if needed.
1.  Run `swift package generate-xcodeproj` (make sure it passes)
1.  Install this gem using `gem install spm_utils`

## Cleaning your project

Whenever something goes wrong with building/caching/resolving, try cleaning your project:

```bash
spm_utils clean_project
```

## Quick fixer

See issue [Quick#751](https://github.com/Quick/Quick/issues/751) and PR [swift-package-manager#955](https://github.com/apple/swift-package-manager/pull/955). TL;DR because of SPM, Quick can't set `CLANG_ENABLE_MODULES` by itself.
This script automates it for you:

```bash
spm_utils fix_quick
```

## Swift version - update your targets to Swift 3 or 4

By running `swift package generate-xcodeproj` you don't necessarily get all your targets built with Swift 4 (see [SR-5940](https://bugs.swift.org/browse/SR-5940)). You might also want to change one of the targets to use Swift 3 or 4. This script fixes that for you!

### To use my fork of Quick fix a temporary fix:

```swift
.package(url: "https://github.com/sunshinejr/Quick.git", .branch("fix/spm_swift4"))
```

### To update all targets to use Swift 3:

```bash
spm_utils swift 3.0
```

### To update all targets to use Swift 4:

```bash
spm_utils swift 4.0
```

### To update all targets to use Swift 4.2:

```bash
spm_utils swift 4.2
```

### To update few targets to use Swift 4.2:

```bash
spm_utils swift --target Quick --target Nimble 4.2
```

## Inhibit warnings

In [CocoaPods](https://cocoapods.org) there is an option to hide your dependencies warnings. This basically does the same thing.

### To inhibit warnings for all targets

```bash
spm_utils inhibit_all_warnings
```

### To inhibit warnings for only one target

```bash
spm_utils inhibit_all_warnings --target Nimble
```

### To inhibit warnings for multiple targets

```bash
spm_utils inhibit_all_warnings --target Nimble --target Moya
```

## License

[MIT](https://github.com/sunshinejr/spm_fixers/blob/master/LICENSE).
