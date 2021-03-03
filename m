Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D2D32C3B7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhCCX7i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382270AbhCCXIP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 18:08:15 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB582C0613E0
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Mar 2021 15:07:14 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id g4so17533582pgj.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 15:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TFaM8t9jUylFBQoMqrkAf69dnUf3tqhRo/if2M1bURU=;
        b=g8WXhnhQ3T4L163ridynbRQURahvjUmZXKORdM2D6bzYG2VQotvdQcYoFX6aSkR772
         aDrtYmb1OOSlOP/I/EJSGaRJ7htbqfNS9g6NYPUgfdogze+msl3982V0y2MTwPHEoAaG
         OpF4/y5hm1vKml80p3+PdZYEkFrxjZKQf+COIq7LPOYaVQ2TcRuJ7MdCTb+hqMR2kErz
         REsHmK6OztDW5HpCEBRvs0t+IKd7Macgr/75MbUSjR/Hp31JFiScx7dxH/lqmAY7jcDk
         5oL4a66DatIHzRNSbIG9kee2upE9BvDr+xW331rd2BuwXE0+PcW9qTbb//DRywOwdGOw
         iY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TFaM8t9jUylFBQoMqrkAf69dnUf3tqhRo/if2M1bURU=;
        b=Alo/cjmrO+taz0ghGN2J5hXSRz8qGcwbg+BOcCTPRP0looVOhuaWlFdKW6SJjrbXF+
         9lfTJByvsl7HIfqH2pcDD6V4A3SsJPDi89emgB7B4Nd+M5WkGGfUMG/ztXbfkeEq9pdi
         HucAxlE+5hzWHefseUjocC4rx8YpsQruzw0uZuvk7ScRf74+K4AUyUqSia8ivpGBQp9/
         Xb0SOHakNFN7Jzq3AScTWzjvukTK3gApZ1tbCUCo5rVbO3QKYFMVKPJuMOhRzcYQeAZT
         gLSkiJSF/m0K1gBRVbqwZwC7ZlWlG190aa5tS4DZjNJZA/zJVnHFfo2uJM/kFsbKgtFq
         nVfg==
X-Gm-Message-State: AOAM532m/D5jE2AgjZIkhqIB4Wgyb44mOSOPgL6z8e1sNBvXvWy8wxcc
        q015mFvVoD3dvIeeeLsTaRKM5w==
X-Google-Smtp-Source: ABdhPJwd9OOrY6Nw77GCLkPAJowIaEx4jP/WnzO6ftTZjojnDqnj3Z5C9XlzIFBJImlGBCPN90Lz/g==
X-Received: by 2002:a63:f549:: with SMTP id e9mr1158204pgk.114.1614812834191;
        Wed, 03 Mar 2021 15:07:14 -0800 (PST)
Received: from google.com ([2620:15c:2ce:0:fce5:88bc:1857:36b4])
        by smtp.gmail.com with ESMTPSA id c78sm25651274pfc.212.2021.03.03.15.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 15:07:13 -0800 (PST)
Date:   Wed, 3 Mar 2021 15:07:08 -0800
From:   Fangrui Song <maskray@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
Message-ID: <20210303230708.l6pbk5o5nc2qa5of@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 2021-03-03, Masahiro Yamada wrote:
>Hi.
>
>On Wed, Mar 3, 2021 at 6:44 AM Fangrui Song <maskray@google.com> wrote:
>>
>> Reviewed-by: Fangrui Song <maskray@google.com>
>>
>> Thanks for the clean-up!
>> --gcc-toolchain= is an obsscure way searching for GCC installation prefixes (--prefix).
>> The logic is complex and different for different distributions/architectures.
>>
>> If we specify --prefix= (-B) explicitly, --gcc-toolchain is not needed.
>
>
>I tested this, and worked for me too.
>
>Before applying this patch, could you please
>help me understand the logic?
>
>
>
>
>I checked the manual
>(https://clang.llvm.org/docs/ClangCommandLineReference.html#cmdoption-clang-b-dir)
>
>
>
>-B<dir>, --prefix <arg>, --prefix=<arg>
>    Add <dir> to search path for binaries and object files used implicitly
>
>--gcc-toolchain=<arg>, -gcc-toolchain <arg>
>    Use the gcc toolchain at the given directory
>
>
>Hmm, this description is too concise
>to understand how it works...
>
>
>
>I use Ubuntu 20.10.
>
>I use distro's default clang
>located in /usr/bin/clang.
>
>I place my aarch64 linaro toolchain in
>/home/masahiro/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-gcc,
>which is not in my PATH environment.
>
>
>
>
>From my some experiments,
>
>clang --target=aarch64-linux-gnu -no-integrated-as \
>--prefix=/home/masahiro/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-  ...
>
>works almost equivalent to
>
>PATH=/home/masahiro/tools/aarch64-linaro-7.5/bin:$PATH \
>clang --target=aarch64-linux-gnu -no-integrated-as ...
>
>
>Then, clang will pick up aarch64-linux-gnu-as
>found in the search path.
>
>Is this correct?
>
>
>On the other hand, I could not understand
>what the purpose of --gcc-toolchain= is.
>
>
>Even if I add --gcc-toolchain=/home/masahiro/tools/aarch64-linaro-7.5,
>it does not make any difference, and it is completely useless.
>
>
>I read the comment from stephenhines:
>https://github.com/ClangBuiltLinux/linux/issues/78
>
>How could --gcc-toolchain be used
>in a useful way?

--gcc-toolchain was introduced in
https://reviews.llvm.org/rG1af7c219c7113a35415651127f05cdf056b63110
to provide a flexible alternative to autoconf configure-time --with-gcc-toolchain (now cmake variable GCC_INSTALL_PREFIX).

I agree the option is confusing, the documentation is poor, and probably very few people understand what it does.
I apologize that my previous reply is not particular correct.
So the more correct answer is below: 


A --prefix option can specify either of

1) A directory (for something like /a/b/lib/gcc/arm-linux-androideabi, this should be /a/b, the parent directory of 'lib')
2) A path fragment like /usr/bin/aarch64-linux-gnu-

The directory values of the --prefix list and --gcc-toolchain are used to detect GCC installation directories. The directory is used to fetch include directories, system library directories and binutils directories (as, objcopy).
(See below, Linux kernel only needs the binutils executables, so the include/library logic is really useless to us)

The logic is around https://github.com/llvm/llvm-project/blob/main/clang/lib/Driver/ToolChains/Gnu.cpp#L1910

   Prefixes = --prefix/-B list (only the directory subset is effective)
   StringRef GCCToolchainDir = --gcc-toolchain= or CMake variable GCC_INSTALL_PREFIX
   if (GCCToolchainDir != "") {
     Prefixes.push_back(std::string(GCCToolchainDir));
   } else {
     if (!D.SysRoot.empty()) {
       Prefixes.push_back(D.SysRoot);
       // Add D.SysRoot+"/usr" to Prefixes. Some distributions add more directories.
       AddDefaultGCCPrefixes(TargetTriple, Prefixes, D.SysRoot);
     }

     // D.InstalledDir is the directory of the clang executable, e.g. /usr/bin
     Prefixes.push_back(D.InstalledDir + "/..");

     if (D.SysRoot.empty())
       AddDefaultGCCPrefixes(TargetTriple, Prefixes, D.SysRoot);
   }

   // Gentoo / ChromeOS specific logic.
   // I think this block is misplaced.
   if (GCCToolchainDir == "" || GCCToolchainDir == D.SysRoot + "/usr") {
     ...
   }

   // Loop over the various components which exist and select the best GCC
   // installation available. GCC installs are ranked by version number.
   Version = GCCVersion::Parse("0.0.0");
   for (const std::string &Prefix : Prefixes) {
     auto &VFS = D.getVFS();
     if (!VFS.exists(Prefix))
       continue;

     // CandidateLibDirs is a subset of {/lib64, /lib32, /lib}.
     for (StringRef Suffix : CandidateLibDirs) {
       const std::string LibDir = Prefix + Suffix.str();
       if (!VFS.exists(LibDir))
         continue;
       bool GCCDirExists = VFS.exists(LibDir + "/gcc");
       bool GCCCrossDirExists = VFS.exists(LibDir + "/gcc-cross");

       // Precise match. Detect $Prefix/lib/$--target
       ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, TargetTriple.str(),
                              false, GCCDirExists, GCCCrossDirExists);
       // Usually empty.
       for (StringRef Candidate : ExtraTripleAliases) // Try these first.
         ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, Candidate, false,
                                GCCDirExists, GCCCrossDirExists);
       // CandidateTripleAliases is a set with "x86_64-linux-gnu", "x86_64-unknown-linux-gnu", ...
       // This loop detects directories like $Prefix/lib/x86_64-linux-gnu.
       for (StringRef Candidate : CandidateTripleAliases)
         ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, Candidate, false,
                                GCCDirExists, GCCCrossDirExists);
     }
     for (StringRef Suffix : CandidateBiarchLibDirs) {
       const std::string LibDir = Prefix + Suffix.str();
       if (!VFS.exists(LibDir))
         continue;
       bool GCCDirExists = VFS.exists(LibDir + "/gcc");
       bool GCCCrossDirExists = VFS.exists(LibDir + "/gcc-cross");
       for (StringRef Candidate : CandidateBiarchTripleAliases)
         ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, Candidate, true,
                                GCCDirExists, GCCCrossDirExists);
     }
   }


The comment
// Loop over the various components which exist and select the best GCC
// installation available. GCC installs are ranked by version number.

is important. If you specify --prefix=$dir but not --gcc-toolchain, 
the system cross toolchains (/usr/lib/gcc-cross) are also candidates and they may win.

Specifying just --gcc-toolchain (due to if (GCCToolchainDir != "")) can effectively ignore system cross toolchains.



In the Linux kernel use case, We specify -nostdinc and -nostdlib so GCC include/library directories are not used.
We seem to prefer the non-directory use of --prefix: CROSS_COMPILE=arm-linux-gnueabi-
So all the directory detection logic can be dropped.


A better commit message is along the lines of:
--gcc-toolchain specified directory is used to detect GCC installations
for include/library directories and binutils executables.

We already specify something like --prefix=aarch64-linux-gnu- to inform
Clang of the binutils executables, and we do not need include/library
directories, so we can drop --gcc-toolchain.
>
>
>
>
>
>
>
>> On 2021-03-02, Nathan Chancellor wrote:
>> >This is not necessary anymore now that we specify '--prefix=', which
>> >tells clang exactly where to find the GNU cross tools. This has been
>> >verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
>> >distribution version of LLVM 11.1.0 without binutils in the LLVM
>> >toolchain locations.
>> >
>> >Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> >---
>> > Makefile | 4 ----
>> > 1 file changed, 4 deletions(-)
>> >
>> >diff --git a/Makefile b/Makefile
>> >index f9b54da2fca0..c20f0ad8be73 100644
>> >--- a/Makefile
>> >+++ b/Makefile
>> >@@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
>> > CLANG_FLAGS   += --target=$(notdir $(CROSS_COMPILE:%-=%))
>> > GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>> > CLANG_FLAGS   += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>> >-GCC_TOOLCHAIN := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>> >-endif
>> >-ifneq ($(GCC_TOOLCHAIN),)
>> >-CLANG_FLAGS   += --gcc-toolchain=$(GCC_TOOLCHAIN)
>> > endif
>> > ifneq ($(LLVM_IAS),1)
>> > CLANG_FLAGS   += -no-integrated-as
>> >
>> >base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
>> >--
>> >2.31.0.rc0.75.gec125d1bc1
>> >
>> >--
>> >You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>> >To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>> >To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210302210646.3044738-1-nathan%40kernel.org.
>
>
>
>--
>Best Regards
>
>Masahiro Yamada
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNAS4Ri%3DK6M39hYU%2B17JVf0Z%3DhbRgSxuTdX5ZaVYLpmJRtA%40mail.gmail.com.
