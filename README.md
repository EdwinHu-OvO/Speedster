Speedster
=========
Faster or slower iOS animation.\
An iOS extension (tweak) that adjusts iOS animation speed.\
Support iOS and iPadOS from 13 to 16 (newer might still be supported)

[<img src="https://github.com/Hoangdus/Speedster/blob/main/havoc_get_square.png" alt="drawing" width="500"/>](https://havoc.app/package/speedster)

Function
========
- Speed up app open and close animation.
- Speed up in-app animation.
- Speed up folder open and close animation.
- Add bounce to app open, close and switcher animation.
- Adjust how fast the screen turn on and off.
- Disable icons fly in when unlock.
- Disable icons jitter when editing.
- Disable folder open and close animation
- Disable icons and wallpaper zoom out when enter switcher.

Slow motion
===========
In Settings → Speedster → Slow Motion, adjust Playback Speed from **0.1× to 1×**.
At 0.1×, supported animations take ten times as long as their original timing.
Values below 1 override the existing acceleration settings; 1 restores those settings.
The default is 1, so existing configurations keep their behavior.

This covers the existing app open/close, folder and screen wake/sleep hooks,
plus Core Animation animations added to layers inside apps. Disable **Instant Folder**
to slow folder animations. Respring and reopen apps after changing the setting.
Custom rendering engines, gesture tracking and app completion timers may not follow
the visual slowdown; verify behavior on your iOS version and target apps.

Building
========
### GitHub Actions (no local SDK required)

Push the source and `.github/workflows/build.yml` to GitHub. Changes to the tweak
or workflow trigger **Build Speedster** automatically. You can also start it from
**Actions → Build Speedster → Run workflow** once the workflow is on the default branch.
For a fork, enable Actions in the repository if GitHub prompts you.

After a successful run, download the appropriate ZIP under **Artifacts** and
extract the `.deb`:

- `Speedster-rootless-…`: rootless jailbreaks, iOS 15 or later.
- `Speedster-rootful-…`: rootful jailbreaks, iOS 14 or later.

The workflow installs Theos and the patched iOS 16.5 SDK on a GitHub-hosted macOS
runner and builds both `arm64` and `arm64e`. It overrides the local SDK path in
both Makefiles. No SDK, Apple signing certificate or extra repository secret is
needed on your Mac. Artifacts are kept for 30 days.

These CI packages target iOS 14+ (rootful) and iOS 15+ (rootless). Building for
iOS 13 arm64e requires an older toolchain; see the
[Theos arm64e compatibility notes](https://theos.dev/docs/rootless).
Compilation alone does not verify runtime compatibility with a jailbreak or iOS version.

### Local builds

Install and configure [Theos](https://theos.dev/), including the iOS 13.7 SDK
expected by the local Makefiles. Run these commands from the `Speedster` subdirectory.

Build for rootful
```
make clean package
```

Build for rootless
```
make clean package THEOS_PACKAGE_SCHEME=rootless
```

License 
=======
Speedster is licensed under [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html)
