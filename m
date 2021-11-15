Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A12C44FC8E
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 01:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhKOAUx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 19:20:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:45860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhKOAUu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 19:20:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFE1860F44;
        Mon, 15 Nov 2021 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636935476;
        bh=+oQE67zSDKDG/9Y86hCe3ln8eOzRm82kVNTPNRyu5pQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=okPlKD2nsAQNoWuuKOM6ZQcOiMejAiLGDtuRM7TtGJI4O766HmvTSVQKdc05p7T/4
         i9wPSVHz3jC804hlxMytLb08YArasA6bc3LosWBs4+7edJt00t5cWpoTYLOYF8TumP
         kHydrz4TrDyQDhYf4mPd/QwGNTUMYbWebGY03xYMmXqqsBUpNPFRXzCxIli05tUJxn
         4F/C5Cx/2riov8Kb3e/3t1bbkzKHfhQBh4ki6/o2QyUnhK1fqD4ehWDbR5OFiUAkvJ
         8gSJxH+bwwwUyUPoJY8fED+0Jwjm06C/QCWKwoqctlOLfQuH8rxh2m/XOQ9qd42ppn
         IJ6+64rdkBK9g==
Date:   Sun, 14 Nov 2021 17:17:51 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
Message-ID: <YZGnL3nfA5876hX3@archlinux-ax161>
References: <20211114005725.GA27075@embeddedor>
 <YZF9MY6rRLQwdTgM@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZF9MY6rRLQwdTgM@archlinux-ax161>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Nov 14, 2021 at 02:18:41PM -0700, Nathan Chancellor wrote:
> On Sat, Nov 13, 2021 at 06:57:25PM -0600, Gustavo A. R. Silva wrote:
> > Add Kconfig support for -Wimplicit-fallthrough for both GCC and Clang.
> > 
> > The compiler option is under configuration CC_IMPLICIT_FALLTHROUGH,
> > which is enabled by default.
> > 
> > Special thanks to Nathan Chancellor who fixed the Clang bug[1][2]. This
> > bugfix only appears in Clang 14.0.0, so older versions still contain
> > the bug and -Wimplicit-fallthrough won't be enabled for them, for now.
> > 
> > This concludes a long journey and now we are finally getting rid
> > of the unintentional fallthrough bug-class in the kernel, entirely. :)
> > 
> > [1] https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
> > [2] https://bugs.llvm.org/show_bug.cgi?id=51094
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Link: https://github.com/ClangBuiltLinux/linux/issues/236
> > Co-developed-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Co-developed-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> This appears to do the right thing with both clang-13 and clang-14.

Now that I gave this a look for the GCC side, I think it is wrong.

-Wimplicit-fallthrough=5 was under cc-option because it was only
available in GCC 7.x and newer so the build is now broken for GCC 5.x
and 6.x:

gcc: error: unrecognized command line option '-Wimplicit-fallthrough=5';
did you mean '-Wno-fallthrough'?

I think this needs to be added (I can send a formal patch tomorrow
unless someone wants to beat me to it):

diff --git a/init/Kconfig b/init/Kconfig
index 036b750e8d8a..85882c317235 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -887,7 +887,7 @@ config CC_HAS_INT128
 
 config CC_IMPLICIT_FALLTHROUGH
 	string
-	default "-Wimplicit-fallthrough=5" if CC_IS_GCC
+	default "-Wimplicit-fallthrough=5" if $(cc-option,-Wimplicit-fallthrough=5)
 	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
 
 #

Cheers,
Nathan

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> It feels a little odd to have this in Kconfig but if it works and gets
> the warning enabled, then so be it.
> 
> > ---
> >  Makefile     | 6 +-----
> >  init/Kconfig | 5 +++++
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 30c7c81d0437..f18a50daad00 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -786,7 +786,7 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> >  KBUILD_CFLAGS += $(stackp-flags-y)
> >  
> >  KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
> > -KBUILD_CFLAGS += $(KBUILD_CFLAGS-y)
> > +KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
> >  
> >  ifdef CONFIG_CC_IS_CLANG
> >  KBUILD_CPPFLAGS += -Qunused-arguments
> > @@ -798,10 +798,6 @@ KBUILD_CFLAGS += -Wno-gnu
> >  KBUILD_CFLAGS += -mno-global-merge
> >  else
> >  
> > -# Warn about unmarked fall-throughs in switch statement.
> > -# Disabled for clang while comment to attribute conversion happens and
> > -# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
> > -KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
> >  # gcc inanely warns about local variables called 'main'
> >  KBUILD_CFLAGS += -Wno-main
> >  endif
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 11f8a845f259..b0582cd3e096 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -885,6 +885,11 @@ config ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >  config CC_HAS_INT128
> >  	def_bool !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) && 64BIT
> >  
> > +config CC_IMPLICIT_FALLTHROUGH
> > +	string
> > +	default "-Wimplicit-fallthrough=5" if CC_IS_GCC
> > +	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
> > +
> >  #
> >  # For architectures that know their GCC __int128 support is sound
> >  #
> > -- 
> > 2.27.0
> > 
> > 
> 
