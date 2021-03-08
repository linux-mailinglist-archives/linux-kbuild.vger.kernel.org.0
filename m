Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D02331045
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 15:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCHOA2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 09:00:28 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37179 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCHOAP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 09:00:15 -0500
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 128E01Mi004085;
        Mon, 8 Mar 2021 23:00:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 128E01Mi004085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615212002;
        bh=gzhSmz17oaFgKOrAhHhvVHj9muKOmMP9AqzFQpD1CY8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PLpQmDpUQ8qyOe2SDRCDgji+uPoYl5+x9gQRsa9lSxWlM7DUoFdgAFJZIuSmh/rFZ
         jmCbY2StzfwYUTx4fQ+p0CH143YWVzIftTseszsFJgZX0EJxyD0NMQ6W+YS97WJ/V9
         rmmXt3Xzo6+CZaVpDVndKplrhX5yBR6iz3IAM8oswq0SWFec/uuNb7pBig+MNaTl7N
         ZLRgSlJQhOya32poEVh/pbLcy/1ZBhnriIc/JXOLctK0otXAcW0tN1yglkM+k35lhh
         jJ3+ogaQvjBke1XXDcMC4QrD1bxmGEu6MoiZ5V6nd7POLX9NMQFcy2Y1tce8whc8QS
         wdMp4NGV2WywA==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so3168812pjg.5;
        Mon, 08 Mar 2021 06:00:01 -0800 (PST)
X-Gm-Message-State: AOAM532N/23CdRnQ21cw787CMs7gQE9iqhswcwMfXPgGeVtrmApD2f14
        4ikp9++mnTU80bflm1RSsX/7uIIkot/JVhY4wk8=
X-Google-Smtp-Source: ABdhPJw79S+HYkOLTwxVFtVjWCUuSFCrAu7aoH6RMGy4FuejEaw8XzwlqSB3DX4L4Gt2VLi6jsLRmA654BM3MGBVRfA=
X-Received: by 2002:a17:902:c48c:b029:e4:c093:593a with SMTP id
 n12-20020a170902c48cb02900e4c093593amr20779549plx.1.1615212000926; Mon, 08
 Mar 2021 06:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20210303230708.l6pbk5o5nc2qa5of@google.com>
In-Reply-To: <20210303230708.l6pbk5o5nc2qa5of@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 8 Mar 2021 22:59:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3hcOWWK764ddpUPzPFBidoQHyC+b5M-Kbdy+Z093DPA@mail.gmail.com>
Message-ID: <CAK7LNAS3hcOWWK764ddpUPzPFBidoQHyC+b5M-Kbdy+Z093DPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Fangrui Song <maskray@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 8:07 AM Fangrui Song <maskray@google.com> wrote:
>
>
> On 2021-03-03, Masahiro Yamada wrote:
> >Hi.
> >
> >On Wed, Mar 3, 2021 at 6:44 AM Fangrui Song <maskray@google.com> wrote:
> >>
> >> Reviewed-by: Fangrui Song <maskray@google.com>
> >>
> >> Thanks for the clean-up!
> >> --gcc-toolchain= is an obsscure way searching for GCC installation prefixes (--prefix).
> >> The logic is complex and different for different distributions/architectures.
> >>
> >> If we specify --prefix= (-B) explicitly, --gcc-toolchain is not needed.
> >
> >
> >I tested this, and worked for me too.
> >
> >Before applying this patch, could you please
> >help me understand the logic?
> >
> >
> >
> >
> >I checked the manual
> >(https://clang.llvm.org/docs/ClangCommandLineReference.html#cmdoption-clang-b-dir)
> >
> >
> >
> >-B<dir>, --prefix <arg>, --prefix=<arg>
> >    Add <dir> to search path for binaries and object files used implicitly
> >
> >--gcc-toolchain=<arg>, -gcc-toolchain <arg>
> >    Use the gcc toolchain at the given directory
> >
> >
> >Hmm, this description is too concise
> >to understand how it works...
> >
> >
> >
> >I use Ubuntu 20.10.
> >
> >I use distro's default clang
> >located in /usr/bin/clang.
> >
> >I place my aarch64 linaro toolchain in
> >/home/masahiro/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-gcc,
> >which is not in my PATH environment.
> >
> >
> >
> >
> >From my some experiments,
> >
> >clang --target=aarch64-linux-gnu -no-integrated-as \
> >--prefix=/home/masahiro/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-  ...
> >
> >works almost equivalent to
> >
> >PATH=/home/masahiro/tools/aarch64-linaro-7.5/bin:$PATH \
> >clang --target=aarch64-linux-gnu -no-integrated-as ...
> >
> >
> >Then, clang will pick up aarch64-linux-gnu-as
> >found in the search path.
> >
> >Is this correct?
> >
> >
> >On the other hand, I could not understand
> >what the purpose of --gcc-toolchain= is.
> >
> >
> >Even if I add --gcc-toolchain=/home/masahiro/tools/aarch64-linaro-7.5,
> >it does not make any difference, and it is completely useless.
> >
> >
> >I read the comment from stephenhines:
> >https://github.com/ClangBuiltLinux/linux/issues/78
> >
> >How could --gcc-toolchain be used
> >in a useful way?
>
> --gcc-toolchain was introduced in
> https://reviews.llvm.org/rG1af7c219c7113a35415651127f05cdf056b63110
> to provide a flexible alternative to autoconf configure-time --with-gcc-toolchain (now cmake variable GCC_INSTALL_PREFIX).
>
> I agree the option is confusing, the documentation is poor, and probably very few people understand what it does.
> I apologize that my previous reply is not particular correct.
> So the more correct answer is below:
>
>
> A --prefix option can specify either of
>
> 1) A directory (for something like /a/b/lib/gcc/arm-linux-androideabi, this should be /a/b, the parent directory of 'lib')
> 2) A path fragment like /usr/bin/aarch64-linux-gnu-
>
> The directory values of the --prefix list and --gcc-toolchain are used to detect GCC installation directories. The directory is used to fetch include directories, system library directories and binutils directories (as, objcopy).
> (See below, Linux kernel only needs the binutils executables, so the include/library logic is really useless to us)
>
> The logic is around https://github.com/llvm/llvm-project/blob/main/clang/lib/Driver/ToolChains/Gnu.cpp#L1910
>
>    Prefixes = --prefix/-B list (only the directory subset is effective)
>    StringRef GCCToolchainDir = --gcc-toolchain= or CMake variable GCC_INSTALL_PREFIX
>    if (GCCToolchainDir != "") {
>      Prefixes.push_back(std::string(GCCToolchainDir));
>    } else {
>      if (!D.SysRoot.empty()) {
>        Prefixes.push_back(D.SysRoot);
>        // Add D.SysRoot+"/usr" to Prefixes. Some distributions add more directories.
>        AddDefaultGCCPrefixes(TargetTriple, Prefixes, D.SysRoot);
>      }
>
>      // D.InstalledDir is the directory of the clang executable, e.g. /usr/bin
>      Prefixes.push_back(D.InstalledDir + "/..");
>
>      if (D.SysRoot.empty())
>        AddDefaultGCCPrefixes(TargetTriple, Prefixes, D.SysRoot);
>    }
>
>    // Gentoo / ChromeOS specific logic.
>    // I think this block is misplaced.
>    if (GCCToolchainDir == "" || GCCToolchainDir == D.SysRoot + "/usr") {
>      ...
>    }
>
>    // Loop over the various components which exist and select the best GCC
>    // installation available. GCC installs are ranked by version number.
>    Version = GCCVersion::Parse("0.0.0");
>    for (const std::string &Prefix : Prefixes) {
>      auto &VFS = D.getVFS();
>      if (!VFS.exists(Prefix))
>        continue;
>
>      // CandidateLibDirs is a subset of {/lib64, /lib32, /lib}.
>      for (StringRef Suffix : CandidateLibDirs) {
>        const std::string LibDir = Prefix + Suffix.str();
>        if (!VFS.exists(LibDir))
>          continue;
>        bool GCCDirExists = VFS.exists(LibDir + "/gcc");
>        bool GCCCrossDirExists = VFS.exists(LibDir + "/gcc-cross");
>
>        // Precise match. Detect $Prefix/lib/$--target
>        ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, TargetTriple.str(),
>                               false, GCCDirExists, GCCCrossDirExists);
>        // Usually empty.
>        for (StringRef Candidate : ExtraTripleAliases) // Try these first.
>          ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, Candidate, false,
>                                 GCCDirExists, GCCCrossDirExists);
>        // CandidateTripleAliases is a set with "x86_64-linux-gnu", "x86_64-unknown-linux-gnu", ...
>        // This loop detects directories like $Prefix/lib/x86_64-linux-gnu.
>        for (StringRef Candidate : CandidateTripleAliases)
>          ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, Candidate, false,
>                                 GCCDirExists, GCCCrossDirExists);
>      }
>      for (StringRef Suffix : CandidateBiarchLibDirs) {
>        const std::string LibDir = Prefix + Suffix.str();
>        if (!VFS.exists(LibDir))
>          continue;
>        bool GCCDirExists = VFS.exists(LibDir + "/gcc");
>        bool GCCCrossDirExists = VFS.exists(LibDir + "/gcc-cross");
>        for (StringRef Candidate : CandidateBiarchTripleAliases)
>          ScanLibDirForGCCTriple(TargetTriple, Args, LibDir, Candidate, true,
>                                 GCCDirExists, GCCCrossDirExists);
>      }
>    }
>
>
> The comment
> // Loop over the various components which exist and select the best GCC
> // installation available. GCC installs are ranked by version number.
>
> is important. If you specify --prefix=$dir but not --gcc-toolchain,
> the system cross toolchains (/usr/lib/gcc-cross) are also candidates and they may win.
>
> Specifying just --gcc-toolchain (due to if (GCCToolchainDir != "")) can effectively ignore system cross toolchains.
>


Thanks for all the detailed info.
I cannot say I understood them all,
but this information is worth knowing.
(I didn't even know --prefix can take a directory).

I applied these patches.
Thanks.





>
> In the Linux kernel use case, We specify -nostdinc and -nostdlib so GCC include/library directories are not used.
> We seem to prefer the non-directory use of --prefix: CROSS_COMPILE=arm-linux-gnueabi-
> So all the directory detection logic can be dropped.
>
>
> A better commit message is along the lines of:
> --gcc-toolchain specified directory is used to detect GCC installations
> for include/library directories and binutils executables.
>
> We already specify something like --prefix=aarch64-linux-gnu- to inform
> Clang of the binutils executables, and we do not need include/library
> directories, so we can drop --gcc-toolchain.
> >
> >
> >
> >
> >
> >
> >
> >> On 2021-03-02, Nathan Chancellor wrote:
> >> >This is not necessary anymore now that we specify '--prefix=', which
> >> >tells clang exactly where to find the GNU cross tools. This has been
> >> >verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
> >> >distribution version of LLVM 11.1.0 without binutils in the LLVM
> >> >toolchain locations.
> >> >
> >> >Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >> >---
> >> > Makefile | 4 ----
> >> > 1 file changed, 4 deletions(-)
> >> >
> >> >diff --git a/Makefile b/Makefile
> >> >index f9b54da2fca0..c20f0ad8be73 100644
> >> >--- a/Makefile
> >> >+++ b/Makefile
> >> >@@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
> >> > CLANG_FLAGS   += --target=$(notdir $(CROSS_COMPILE:%-=%))
> >> > GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >> > CLANG_FLAGS   += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> >> >-GCC_TOOLCHAIN := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> >> >-endif
> >> >-ifneq ($(GCC_TOOLCHAIN),)
> >> >-CLANG_FLAGS   += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >> > endif
> >> > ifneq ($(LLVM_IAS),1)
> >> > CLANG_FLAGS   += -no-integrated-as
> >> >
> >> >base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
> >> >--
> >> >2.31.0.rc0.75.gec125d1bc1
> >> >
> >> >--
> >> >You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> >> >To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> >> >To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210302210646.3044738-1-nathan%40kernel.org.
> >
> >
> >
> >--
> >Best Regards
> >
> >Masahiro Yamada
> >
> >--
> >You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> >To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> >To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNAS4Ri%3DK6M39hYU%2B17JVf0Z%3DhbRgSxuTdX5ZaVYLpmJRtA%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
