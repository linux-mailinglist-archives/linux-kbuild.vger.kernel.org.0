Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0499C2B7494
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Nov 2020 04:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgKRDMm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 22:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRDMl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 22:12:41 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90299C0613D4;
        Tue, 17 Nov 2020 19:12:41 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id d28so462132qka.11;
        Tue, 17 Nov 2020 19:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fXDEaamCc9cNe2G88QdF1xReSrB2zl6AsnQsnXkLyag=;
        b=o34wWzdFzmcx7vctOlyVIm1v/vOD52euxvC5/0IRwXvWpPsX0HtVO/9j9aWaLYpvk9
         897ozEq9m0Bs/UoxUTQ/ZIGRmjQZ0WSOTFG/+eURnM3N8O93IiqHc8xh0m8DTbPirtMA
         OaZcKmrPSdpROFajH7KTUuExrkwpOSIH7PL6PHDNU8Bj90WykAg5GbXW0Q8JCuDeDxUI
         ZLP7pnWHERDGyMYc2sDH9rAWwHUElv4cN0parrlHQYFN3G5gmq9AqO//4d7IWazCRlz0
         x3Hi2YRP2C9ONd2/4scTDMrfKhNQcp1+5zafHC16hN//uOW7/G3SGoQcuntAOA+M7GC/
         5fNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fXDEaamCc9cNe2G88QdF1xReSrB2zl6AsnQsnXkLyag=;
        b=L8uDWf3qOcFQaavQSTfd5U6oUjFJs5rb9f69X8q23Lkx9oq/APfcyyJrGB2Vw1BfIA
         Qh9yZSg9j/4jXkoHjUnBz0p/SGRvg4I1UJNUX4Gy4XyCuZ9OQzj+5FptM+ol6uoCho1f
         s46XuPu6ldHEAkeaJnD1FlxAvePhXl2JUi3OERl4XA44aGHaKsoYyD4tXPNxKVBZPBvu
         4ejJSV++Av7PyeE8BVqjtR0ou/0E1FIVSOosEoPjtiQXb+PEL9aK72ecp+2wyVYCXHNe
         a1pn0Gjc9CynfnnqvtxY+PdgazhxOnLzpZxYQVcPFvjf0sUOqQ8My5pknYvVo5EtfS82
         cP/g==
X-Gm-Message-State: AOAM532sIHBPdchchaiO4xxAm8FFJtmFEqYi9gTLvTa4N/jKCmEHDmh0
        AuTWXRxQOA6fYq6ICWeqS0k=
X-Google-Smtp-Source: ABdhPJylfE4BKVnK/nYhBplDrg1IDIsJMBfSGYffTkTaRtdFtRK0synkHeRjnafx4SzFZO5PcgGuGA==
X-Received: by 2002:a37:4a8e:: with SMTP id x136mr2917466qka.434.1605669160339;
        Tue, 17 Nov 2020 19:12:40 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id a6sm1877666qkg.136.2020.11.17.19.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 19:12:39 -0800 (PST)
Date:   Tue, 17 Nov 2020 20:12:37 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <20201118031237.GA1001457@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201113195553.1487659-2-natechancellor@gmail.com>
 <CAKwvOdni24b_70xm+xK_7r2N77WrsOk4_OgoLiwSzZ5f+6vqfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdni24b_70xm+xK_7r2N77WrsOk4_OgoLiwSzZ5f+6vqfA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 17, 2020 at 11:41:15AM -0800, Nick Desaulniers wrote:
> On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > along with a few others. Newer versions of ld.lld do not have these
> > warnings. As a result, do not add '--orphan-handling=warn' to
> > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> >
> > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  MAINTAINERS            |  1 +
> >  init/Kconfig           |  6 +++++-
> >  scripts/lld-version.sh | 20 ++++++++++++++++++++
> >  3 files changed, 26 insertions(+), 1 deletion(-)
> >  create mode 100755 scripts/lld-version.sh
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3da6d8c154e4..4b83d3591ec7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4284,6 +4284,7 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
> >  C:     irc://chat.freenode.net/clangbuiltlinux
> >  F:     Documentation/kbuild/llvm.rst
> >  F:     scripts/clang-tools/
> > +F:     scripts/lld-version.sh
> >  K:     \b(?i:clang|llvm)\b
> >
> >  CLEANCACHE API
> > diff --git a/init/Kconfig b/init/Kconfig
> > index a270716562de..40c9ca60ac1d 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -47,6 +47,10 @@ config CLANG_VERSION
> >         int
> >         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> >
> > +config LLD_VERSION
> > +       int
> > +       default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
> > +
> >  config CC_CAN_LINK
> >         bool
> >         default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> > @@ -1349,7 +1353,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
> >           own risk.
> >
> >  config LD_ORPHAN_WARN
> > -       def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
> > +       def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
> >
> >  config SYSCTL
> >         bool
> > diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> > new file mode 100755
> > index 000000000000..cc779f412e39
> > --- /dev/null
> > +++ b/scripts/lld-version.sh
> > @@ -0,0 +1,20 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# ld.lld-version ld.lld-command
> 
> ^ it looks like this format was copied from scripts/gcc-version, but
> it's kind of curious/cryptic to me for a comment about usage.  Is it
> necessary?  A comment in the form:
> 
> # Usage: ./scripts/lld-version.sh ld.lld
> 
> Would be clearer to me.
> 
> > +#
> > +# Print the linker version of `ld.lld-command' in a 5 or 6-digit form
> > +# such as `100001' for ld.lld 10.0.1 etc.
> > +
> > +linker="$*"
> > +
> > +if ! ( $linker --version | grep -q LLD ); then
> > +       echo 0
> > +       exit 1
> > +fi
> > +
> > +VERSION=$($linker --version | cut -d ' ' -f 2)
> 
> This is going to invoke the linker potentially twice if it's LLD.
> Would it be nicer to capture the output of `$linker --version`, check
> which linker it is, then slice that up via `cut` to get the version?
> 
> This version is fine to me, but if you're going to send a v2, that
> might be a nice slight cleanup.  Otherwise,
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> (Please drop those tags if you modify this for v2 and I'll rereview/retest).

Below is the impending v2 if you wanted to give it an early test, I plan
to send it along formally Thursday morning with all of the addressed
feedback so far.

Cheers,
Nathan

======================================================================

From 1ef9b12daf2b19ed6687423483d5bb1f5cf82e13 Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 17 Nov 2020 20:11:26 -0700
Subject: [PATCH] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1

ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
along with a few others. Newer versions of ld.lld do not have these
warnings. As a result, do not add '--orphan-handling=warn' to
LDFLAGS_vmlinux if ld.lld's version is not new enough.

Link: https://github.com/ClangBuiltLinux/linux/issues/1187
Link: https://github.com/ClangBuiltLinux/linux/issues/1193
Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
Reported-by: kernelci.org bot <bot@kernelci.org>
Reported-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 MAINTAINERS            |  1 +
 init/Kconfig           |  9 ++++++++-
 scripts/lld-version.sh | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100755 scripts/lld-version.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index e451dcce054f..e6f74f130ae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4284,6 +4284,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	scripts/clang-tools/
+F:	scripts/lld-version.sh
 K:	\b(?i:clang|llvm)\b
 
 CLEANCACHE API
diff --git a/init/Kconfig b/init/Kconfig
index a270716562de..b9037d6c5ab3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -47,6 +47,10 @@ config CLANG_VERSION
 	int
 	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
+config LLD_VERSION
+	int
+	default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
@@ -1349,7 +1353,10 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	  own risk.
 
 config LD_ORPHAN_WARN
-	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
+	def_bool y
+	depends on ARCH_WANT_LD_ORPHAN_WARN
+	depends on !LD_IS_LLD || LLD_VERSION >= 110000
+	depends on $(ld-option,--orphan-handling=warn)
 
 config SYSCTL
 	bool
diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
new file mode 100755
index 000000000000..d70edb4d8a4f
--- /dev/null
+++ b/scripts/lld-version.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Usage: $ ./scripts/lld-version.sh ld.lld
+#
+# Print the linker version of `ld.lld' in a 5 or 6-digit form
+# such as `100001' for ld.lld 10.0.1 etc.
+
+linker_string="$($* --version)"
+
+if ! ( echo $linker_string | grep -q LLD ); then
+	echo 0
+	exit 1
+fi
+
+VERSION=$(echo $linker_string | cut -d ' ' -f 2)
+MAJOR=$(echo $VERSION | cut -d . -f 1)
+MINOR=$(echo $VERSION | cut -d . -f 2)
+PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.29.2

