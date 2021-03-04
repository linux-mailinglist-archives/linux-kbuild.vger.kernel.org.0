Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BE232DA20
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 20:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhCDTMT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 14:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCDTLz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 14:11:55 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9F2C061760
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Mar 2021 11:11:15 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id ch11so1779638pjb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 11:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=55l/p5w7xRBRzeE5LFWuLvvcDqxofKt6XTrgAWZQcus=;
        b=IilvZn5VSKOXpIHzzLZvKEuln8wWilduJnGjegs0g3RarCpl8F7UbpX1kZqY7bczML
         G3RAhQQnQSyJMgEbFDOpbGxnIcmyH3AQC0K6rJXuh5nZmMkod/dNm2KsIlqgIlfLvHVf
         VB6grb+6yQSQ02V+CUXakJL/jeeN5q+264PiQaEm3gbogALQoMqyilRm0aErdE4ko9mr
         wC8wgrAGSfehRiwplRrKFAoqZRFHkVB5qeYgSf6AdEvvkwjO+k9oFrAbkyF8KB1H3chH
         t2LL6qBXMdWZMEvEtRzTkSDGKBv5kCDsosIALhuffuV418ZssCqW/3kuiXOuHk+SUEIz
         WEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55l/p5w7xRBRzeE5LFWuLvvcDqxofKt6XTrgAWZQcus=;
        b=ZDoZgJXj+U/4jMLR8QbccuuBWjdBNx8BHf0G6uSQxdmU52rd11pRV8+QOCP6AD+d2h
         onb1ZwH3TFEt2le6KujGi6FYxBtppG6TSM47v3utcL32encFOg3Gpx3ENYw8fchXIZ2U
         nEpHSzBJN2MgXqFMOsCZZx3th2B2eKEn24UUUeRbDDPOq9c9ZXb58LMG3rs5FKFF3Jf3
         WyY2HnJD3zcma+opqjSdiIyoEQxOv4LFV9UNN86rZuxYwcC369pffolAa3tcEuuZgaeO
         5z94C+Jso6712pB9rEJ6zPnSQWiICQCftpQkH9/3PdZhC0l/HFFBSuEaKmyRwyY25elY
         e5dA==
X-Gm-Message-State: AOAM530wHLSDrohHnVBJAVm4hIhV+23NuOcnb0rcuot8o4WSB112RsZt
        n63PWnlWW//dQB2qU1lbyocw/OUYf6a8LtQ5vzwSMA==
X-Google-Smtp-Source: ABdhPJwSYy2SaIQFCQOpcJs3PX+1umaXrTCU564PRNLkiXd/ZSWfoy3k3JWeDYfcxUBlANNfdQcU9lfe78fenX4KfTw=
X-Received: by 2002:a17:90b:3550:: with SMTP id lt16mr5870688pjb.47.1614885074754;
 Thu, 04 Mar 2021 11:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20210303230708.l6pbk5o5nc2qa5of@google.com>
In-Reply-To: <20210303230708.l6pbk5o5nc2qa5of@google.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Thu, 4 Mar 2021 11:11:03 -0800
Message-ID: <CAFP8O3Jn7G5=8W-FiFRZoa-JhuTYsA=r_DJW_9OgWm3K-K_H5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, Mar 3, 2021 at 3:07 PM Fangrui Song <maskray@google.com> wrote:
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
>
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

I've sent https://reviews.llvm.org/D97902 to improve the -B and
--gcc-toolchain documentation, and posted
https://lists.llvm.org/pipermail/cfe-dev/2021-March/067820.html
(Message-Id: CAFP8O3JZBWx6OYm14KhP0f+RNU_OHLPLZnyX7jDtCL_yvnJDfA@mail.gmail.com)
to discuss Clang's current weird behaviors.

* --gcc-toolchain suppresses GCC detection under sysroot, -B doesn't.
 I'd like that -B suppresses GCC detection under sysroot as well but
unsure whether some folks are dependent on this behavior.
* With -B -B -B --gcc-toolchain, the largest version instead of the
first wins. I think it makes sense to select the first option where a
GCC installation is found.

Hey, this list has a lot developers using cross compilers. Do you have
thoughts to share? :)
