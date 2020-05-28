## QIIME 2 issues

### 01

#### Sandboxing

An error pertaining to the `qiime tools view [Visualization]` command (see Block 1) was present throughout the project. No obvious solution could be found, but the error is not believed to have caused any effect to the results.

By the looks of it, it is a local issue, related to the Google Chrome application.

__Block 1__ Shows the encountered CLI error.

```
[0528/112706.070279:ERROR:nacl_helper_linux.cc(308)] NaCl helper process running without a sandbox!
Most likely you need to configure your SUID sandbox correctly
```
