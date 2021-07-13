Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566DC3C7097
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jul 2021 14:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbhGMMqY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 08:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236098AbhGMMqY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 08:46:24 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AB3C0613DD;
        Tue, 13 Jul 2021 05:43:34 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4GPL0P1WJVzQk9t;
        Tue, 13 Jul 2021 14:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:from:from
        :date:date:received; s=mail20150812; t=1626180209; bh=XdCFFgBWRD
        UCGB4TseCEQHZoH2XbPOIN5YL4HrfJklI=; b=Tc/6jsNd8cOZBF5pDBoQabWjY2
        a22peb4Dxiwv2famydz8cK+9x4rWWutHtqxZXQFscTd2H27fw37t+VZPEp8w3R6n
        bTS65xPjVxPgoa5mYot7kKV6Q/NjMM4YlahtxP0o7J3KIl+w8qpd+yVvOeXDiYmH
        pUWIKcFacRkz0+wOLHL7mKZftExrnIww9wouj3a3Lc2RYsbm2DwCrNzc/kHG3sUI
        wNDXBJTzRi+GZGyLU1J87IDmEae6iux6yD2z4NaSIhT76DPal9KGKMoqKslYNtiU
        Q95qqaP8dTZaaI2uuVZmI+7R9vkCJK1eC60aZJRV6BZlToTJqNYebveDZdTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1626180211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uXS7RkS7M9LEfQKQ0Js/p3lAa+kHFpTYNkuyQeip5MY=;
        b=paaC/r3JB9kA4YNagUxMhK/Rms+LTHhZpWnfDUMmU8An2Gd5Q0qVmKMnq7XvbdCPSHK2l+
        Qe6DbBO+wYV68nlJsdeNvnzLcIXTXQv5sgs0l6UzXEnqbx8LB2MkWG0h/9F92FrYO6y8gl
        Q98z9y0N+rgvTNONY17KsHqOlu09fb1etwDiUxlGAZBCgEzKPY7H9U0nLSBFYaj6xK+AFD
        36pvGKLf8HdctuLp4HjzZGkSKskJ0jjCnEHToBQHo7XL9AydJhpbtkCWD6RaNsHJqHpXiU
        ax8wFndxSY3V2eQSvLzwZpofXIMa1A+yTeQgnjLeHLtShuUuzkyb2oiqfi0WAA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id BLBFdGFgjsUH; Tue, 13 Jul 2021 14:43:29 +0200 (CEST)
Date:   Tue, 13 Jul 2021 14:43:29 +0200 (CEST)
From:   torvic9@mailbox.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Message-ID: <868773411.91110.1626180209155@office.mailbox.org>
In-Reply-To: <CAK7LNAT3bAg164L7mWDk0sfsvxZvMukezSSu1BYu3M425SWeaQ@mail.gmail.com>
References: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
 <CAK7LNAT3bAg164L7mWDk0sfsvxZvMukezSSu1BYu3M425SWeaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Kbuild, clang: add option for choosing a ThinLTO
 cache directory
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.44 / 15.00 / 15.00
X-Rspamd-Queue-Id: 160421825
X-Rspamd-UID: 9d2495
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


> Masahiro Yamada <masahiroy@kernel.org> hat am 13.07.2021 12:45 geschrieben:
> 
>  
> On Mon, Jul 12, 2021 at 8:10 PM Tor Vic <torvic9@mailbox.org> wrote:
> >
> > On some distros and configurations, it might be useful to allow for
> > specifying a directory where Clang stores its ThinLTO cache.
> >
> > More specifically, when building the VirtualBox extramodules on Arch with
> > its proper 'makepkg' build system and DKMS, against an already installed
> > ThinLTO kernel, the build fails because it tries to create the ThinLTO
> > cache in a directory that is not user-writable.
> >
> > A similar problem has been reported with openSUSE's OBS build system.
> >
> > Add a Kconfig option that allows users to choose a directory in which
> > Clang's ThinLTO can store its cache.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1104
> > Signed-off-by: Tor Vic <torvic9@mailbox.org>
> 
> 
> I do not understand.
> 
> Currently, .thinlto-cache is created in the same directory
> as the other objects.  (right under $(KBUILD_EXTMOD))
> 
> If you build in a read-only directory, you cannot put
> any build artifact (not limited to the thinlto cache) there.
> 
> Why did changing the location of .thinlto-cache
> solve your problem?
> 

Sorry, I accidentally sent the message before completing it...

So, when building an out-of-tree module on Arch using DKMS,
I get the following error message:

    Error: Permission denied
    LLVM ERROR: ThinLTO: Can't get a temporary file

The reason for this seems to be that DKMS looks for the cache inside
the installed kernel's modules/headers folder, which on Arch is in
/usr/lib/modules/$kernelversion/build, and this folder is of course not
writeable by the user.
With the patch, a user-writable directory can be selected and DKMS seems
to pick it up.
But yes, I also have more questions than answers unfortunately...

Maybe it is more of an issue with DKMS itself than with the kernel, in
any way, DKMS needs a few fixes for Clang-built kernels, see [1].

[1] https://github.com/dell/dkms/issues/124

> 
> 
> > ---
> >  Makefile                  |  5 +++--
> >  arch/Kconfig              | 10 ++++++++++
> >  scripts/Makefile.lib      |  4 ++++
> >  scripts/Makefile.modfinal |  4 ++++
> >  4 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index c3f9bd191b89..472bc8bfff03 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -932,7 +932,8 @@ endif
> >  ifdef CONFIG_LTO_CLANG
> >  ifdef CONFIG_LTO_CLANG_THIN
> >  CC_FLAGS_LTO   := -flto=thin -fsplit-lto-unit
> > -KBUILD_LDFLAGS += --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
> > +export thinlto-dir = $(if
> > $(CONFIG_LTO_CLANG_THIN_CACHEDIR),$(CONFIG_LTO_CLANG_THIN_CACHEDIR)/)
> > +KBUILD_LDFLAGS +=
> > --thinlto-cache-dir=$(thinlto-dir)$(extmod_prefix).thinlto-cache
> >  else
> >  CC_FLAGS_LTO   := -flto
> >  endif
> > @@ -1728,7 +1729,7 @@ PHONY += compile_commands.json
> >
> >  clean-dirs := $(KBUILD_EXTMOD)
> >  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
> > $(KBUILD_EXTMOD)/modules.nsdeps \
> > -       $(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
> > +       $(KBUILD_EXTMOD)/compile_commands.json
> > $(thinlto-dir)$(KBUILD_EXTMOD)/.thinlto-cache
> >
> >  PHONY += help
> >  help:
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 129df498a8e1..19e4d140e12a 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -696,6 +696,16 @@ config LTO_CLANG_THIN
> >             https://clang.llvm.org/docs/ThinLTO.html
> >
> >           If unsure, say Y.
> > +
> > +config LTO_CLANG_THIN_CACHEDIR
> > +       string "Clang ThinLTO cache directory"
> > +       depends on LTO_CLANG_THIN
> > +       default ""
> > +       help
> > +         This option allows users to choose a directory that stores
> > +         Clang's ThinLTO cache.
> > +         Leave empty for default.
> > +
> >  endchoice
> >
> >  config ARCH_SUPPORTS_CFI_CLANG
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 10950559b223..bca87a6aa35b 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -197,6 +197,10 @@ endif
> >  part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
> >  quiet_modtag = $(if $(part-of-module),[M],   )
> >
> > +ifdef CONFIG_LTO_CLANG_THIN
> > +KBUILD_LDFLAGS +=
> > --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> > +endif
> > +
> >  modkern_cflags =                                          \
> >         $(if $(part-of-module),                           \
> >                 $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 5e9b8057fb24..ab0d72e21318 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -35,6 +35,10 @@ ifdef CONFIG_LTO_CLANG
> >  # avoid a second slow LTO link
> >  prelink-ext := .lto
> >
> > +ifdef CONFIG_LTO_CLANG_THIN
> > +KBUILD_LDFLAGS +=
> > --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> > +endif # CONFIG_LTO_CLANG_THIN
> > +
> >  # ELF processing was skipped earlier because we didn't have native code,
> >  # so let's now process the prelinked binary before we link the module.
> >
> > --
> > 2.32.0
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
