Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6BC3C6FFC
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jul 2021 13:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235981AbhGMLz1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 07:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235891AbhGMLz1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 07:55:27 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6039C0613DD;
        Tue, 13 Jul 2021 04:52:37 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4GPJsZ2NP6zQkF0;
        Tue, 13 Jul 2021 13:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:from:from
        :date:date:received; s=mail20150812; t=1626177150; bh=C70kHArExG
        w4iVosCEPnnelCJbTQVnk3pggo7Ik3oxc=; b=Vy3n/kcPZEmDOit2C1qrkvxpaT
        qAVu+2v/RagruTRiDeSz8DgBm9PCa2clmOpWYMIS+USeyyipz0iyn0JNvR4q/3x6
        jXRQ/KYhwP5Sn1t8Ii60jA27Enk0jqeQsgX3X163xTJKl0jnEGlpURlLzZSaizBE
        URgtJ09TwnPpYlBPOPFli3ciZf45c1UiQaNOqMJvLbDnfRr2cy2aZYyBVTkYxhKc
        3OnAokNuXkcuKnm5KLsy5yHIo1EtJSRaQVBcQ8+t4vGmU/dIlrQoYXH+81ujNZOq
        XlQk25dlpurk8wLStK4n3/DzhX71EdddV3BVcOAw4bY23SdhFJJwxAW688ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1626177152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z9w+E1u391qZJye63/G0NxSG+CzU/S7Pa+YeTpB3RRs=;
        b=aa1Ia+wW35HAkZORdZLv21eOQtO/wha8Pm6zkPzgAtu8C1JCrjSdDwyrj1JtHqCUN6rwyx
        rE1IDpaydHq7l6MZumD9dQxQoIsdWNFTUJrIHFYxeGKeptXpQf4LwCApBRfJ8OtJebdz5+
        2TXUEJzukz/M9jqRpPhFUJGPDQxlyfa4s/iS66AF/ccO8fOIG6y9wnwhO2axao73oHt7Mp
        RS5snHP5VD0l7VJz942ZZTrGD7uYXf4nUL727/NYA3kQnHe7RplfCrf2UiG6/JH0X+0WYU
        v0pdovuPCn2iDGnux7lHqltcmWF9pfW6VZDdEoK13l2lv0oCjdF//sGx9vPyqQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id KzELcVTqACe8; Tue, 13 Jul 2021 13:52:30 +0200 (CEST)
Date:   Tue, 13 Jul 2021 13:52:29 +0200 (CEST)
From:   torvic9@mailbox.org
To:     Kees Cook <keescook@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Message-ID: <1402692321.81994.1626177149669@office.mailbox.org>
In-Reply-To: <202107121021.38F447EBE4@keescook>
References: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
 <202107121021.38F447EBE4@keescook>
Subject: Re: [PATCH 1/1] Kbuild, clang: add option for choosing a ThinLTO
 cache directory
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -1.01 / 15.00 / 15.00
X-Rspamd-Queue-Id: 0720F18B6
X-Rspamd-UID: b7bb32
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Kees Cook <keescook@chromium.org> hat am 12.07.2021 19:22 geschrieben:
> 
>  
> On Mon, Jul 12, 2021 at 11:10:04AM +0000, Tor Vic wrote:
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
> 
> Ah-ha, good idea. Thanks! Question below...
> 
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1104
> > Signed-off-by: Tor Vic <torvic9@mailbox.org>
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
> >  CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
> > -KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
> > +export thinlto-dir = $(if
> > $(CONFIG_LTO_CLANG_THIN_CACHEDIR),$(CONFIG_LTO_CLANG_THIN_CACHEDIR)/)
> > +KBUILD_LDFLAGS	+=
> > --thinlto-cache-dir=$(thinlto-dir)$(extmod_prefix).thinlto-cache
> >  else
> >  CC_FLAGS_LTO	:= -flto
> >  endif
> > @@ -1728,7 +1729,7 @@ PHONY += compile_commands.json
> > 
> >  clean-dirs := $(KBUILD_EXTMOD)
> >  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
> > $(KBUILD_EXTMOD)/modules.nsdeps \
> > -	$(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
> > +	$(KBUILD_EXTMOD)/compile_commands.json
> > $(thinlto-dir)$(KBUILD_EXTMOD)/.thinlto-cache
> > 
> >  PHONY += help
> >  help:
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 129df498a8e1..19e4d140e12a 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -696,6 +696,16 @@ config LTO_CLANG_THIN
> >  	    https://clang.llvm.org/docs/ThinLTO.html
> > 
> >  	  If unsure, say Y.
> > +
> > +config LTO_CLANG_THIN_CACHEDIR
> > +	string "Clang ThinLTO cache directory"
> > +	depends on LTO_CLANG_THIN
> > +	default ""
> > +	help
> > +	  This option allows users to choose a directory that stores
> > +	  Clang's ThinLTO cache.
> > +	  Leave empty for default.
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
> > +KBUILD_LDFLAGS	+=
> > --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> > +endif
> > +
> >  modkern_cflags =                                          \
> >  	$(if $(part-of-module),                           \
> >  		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 5e9b8057fb24..ab0d72e21318 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -35,6 +35,10 @@ ifdef CONFIG_LTO_CLANG
> >  # avoid a second slow LTO link
> >  prelink-ext := .lto
> > 
> > +ifdef CONFIG_LTO_CLANG_THIN
> > +KBUILD_LDFLAGS	+=
> > --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> > +endif # CONFIG_LTO_CLANG_THIN
> > +
> >  # ELF processing was skipped earlier because we didn't have native code,
> >  # so let's now process the prelinked binary before we link the module.
> 
> Why are these changes needed in Makefile.lib and Makefile.modfinal?
> Isn't KBUILD_LDFLAGS already populated from the top-level Makefile?

Hi Kees,
I think you are right.
It seems that the changes to scripts/Makefile.{lib,modfinal} are not needed.
I'll do some more testing and report back/send a v2.

> 
> -- 
> Kees Cook
