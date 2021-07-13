Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567BB3C7087
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jul 2021 14:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbhGMMlb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 08:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236098AbhGMMla (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 08:41:30 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CB2C0613DD;
        Tue, 13 Jul 2021 05:38:40 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4GPKtl2594zQkBt;
        Tue, 13 Jul 2021 14:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:from:from
        :date:date:received; s=mail20150812; t=1626179915; bh=lUqHxW+lRq
        lmCYY6cc2CGIHqpQG5J5kdsYhP7CZJSPA=; b=Wrc9uwlQ6L9ZcHk8h0brEm4tgw
        l/mVQ0aLSP2VILL48qBrB9JvQROw7afWNBebubSnQFDp198/bDeEBRr40wYlDHjX
        ZhLulQC/MsudE6PLneIxHXOFjCHxof+qv0B76qpsD6T/Fot5gCZLE0tjcoO0DsQ5
        V8+yq4p8vLVo2YZd2W73ans9FTfr9FJgb7boue9HWEEc9GNL757edOJXPLhyASKR
        h9sZLm7Tt009C3sISOH0F1JhzZE1qut2bJWo0lQ7YS0Q9RkFyMXcfwVcH6voPrdl
        VdXDIel43riELbL/yvmwF7/j09kjd8EahDghyPpp2uBZ+Vl4mZSMbsp5xpZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1626179917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SUCNKqqfXSbqAKrKQjDh3fqlkLX5sIqyN/ql4Wth49k=;
        b=c9in/e+ToXDQTNsFvP0DM9urTzf/fOnrNPemO+FcHL3Mt2vbyGV2B6TeyII34GVSsy55Rw
        qaRUfM2UXhp/MywVE9K+frquz5rhZda/5kqHVzHPfygm57vME5mB5VycTMciE9SkrbVAuL
        VCpRlsA97IpTSKNkCmlG5DK6DkcBfZAbVtSHOgXsLJsG7+ZDqY1iLTljhShldm3hUCl9RI
        43O9MvyOKILeUuaoigKbX21hUmry3tHtcon67dVqokCnfFB4QzhqSOZ5gYs6XI6pW/4woO
        9kK93ReFhxOjZEybnMVmwxPBuZOZVmi8vYH9NnFYwTwXUv+cIzZuwymdJ+n8BA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id Zm4_MsTcE__S; Tue, 13 Jul 2021 14:38:35 +0200 (CEST)
Date:   Tue, 13 Jul 2021 14:38:34 +0200 (CEST)
From:   torvic9@mailbox.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Message-ID: <1989306485.91043.1626179914866@office.mailbox.org>
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
X-Rspamd-Score: -0.80 / 15.00 / 15.00
X-Rspamd-Queue-Id: 26D511857
X-Rspamd-UID: 443bc2
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

I'm still not 100% what is going on, but, on Arch using DKMS,
I get the following error message:
    Error: Permission denied
LLVM ERROR: ThinLTO: Can't get a temporary file


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
