Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10F82B6EEF
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 20:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730233AbgKQTl1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 14:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbgKQTl1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 14:41:27 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79664C0613CF
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 11:41:27 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id j5so10813510plk.7
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 11:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Ha3Pf7m43xGsOqdVk/c2fh9M5AzkQhemcyhlHdZ12E=;
        b=dRx9LRqtNTIEGpbdDyf15y725bNfdo/TKBV27AztcI9HXmR3EvdD0CAGZSMmvl6Dfy
         70FVnIF1ExZyAqsmYE5/5N3a3+ExBgngbr7ZbSeVOEYOHg5W3/mxPh7gjYu7zV7gnFLw
         HbbVR856G85VrUeI22aF75L9XnbkWBI7l+RpMGNgJuGvegZulJGCQe9+XRorN47pNKBr
         9UvQwR0KP9gRyKk3i8s5FonExGNLRDhAbnDFv9EhWFqphul4JiipLpwjnR0BrJcMfMnv
         ZXthiqEgvHVcoqJnoS/DVun0sodQvm6v0yBPkWaf2q431cbMTJQYIx+7+EfTFvOl9IG0
         VhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Ha3Pf7m43xGsOqdVk/c2fh9M5AzkQhemcyhlHdZ12E=;
        b=Zkrespb2tfn90/gC0Q3YF0VBFwQ9D5W4DOUE/DreF4eYeO6BHnYZgctEy7QrvXXzhc
         UXINiet+0WwKFcn7pHJo5TtAe69b26421pVKPhdfNAmKfYyxye2jof2FuTk3TO4naTTy
         vkWiUiGUn0mg2DWI7fbgbsq/lWbtXrG8WT7IKMILWTN4NY8tshxwlksNM3vpkzdAszjN
         g0Vz5QJJ5bgEcHzrZvrNcIw6IAxG8Fw020MV+NmzREbuR1nBjhiGAAddLJ3oznhDZqy8
         YCIN1UEzrzfuBAsFtzywAC0LnNe8nIausVEe3jg4yvFtXyt4E10bzYVyh95LSuiH76ky
         om9w==
X-Gm-Message-State: AOAM533PXf4+WlRMEAMOGojUcvSZ0ePQ2y9sNp9ayQKbVG1+jkLSoTGk
        6hMqpRFxmNtGRyDHGfr5EIFIkc2GesiaajcAZ/8cEw==
X-Google-Smtp-Source: ABdhPJwDity6T8yzzbWGKSDq/bdE3JNe9KWacLBcdOoRoKbH+pmtyjSTnlkogXOyLkkn+mwymDhBgdSpMrc0Vv23Rik=
X-Received: by 2002:a17:902:221:b029:d8:f938:b112 with SMTP id
 30-20020a1709020221b02900d8f938b112mr1006063plc.10.1605642086810; Tue, 17 Nov
 2020 11:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com> <20201113195553.1487659-2-natechancellor@gmail.com>
In-Reply-To: <20201113195553.1487659-2-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 17 Nov 2020 11:41:15 -0800
Message-ID: <CAKwvOdni24b_70xm+xK_7r2N77WrsOk4_OgoLiwSzZ5f+6vqfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
To:     Nathan Chancellor <natechancellor@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> along with a few others. Newer versions of ld.lld do not have these
> warnings. As a result, do not add '--orphan-handling=warn' to
> LDFLAGS_vmlinux if ld.lld's version is not new enough.
>
> Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Reported-by: Mark Brown <broonie@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  MAINTAINERS            |  1 +
>  init/Kconfig           |  6 +++++-
>  scripts/lld-version.sh | 20 ++++++++++++++++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/lld-version.sh
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3da6d8c154e4..4b83d3591ec7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4284,6 +4284,7 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
>  F:     scripts/clang-tools/
> +F:     scripts/lld-version.sh
>  K:     \b(?i:clang|llvm)\b
>
>  CLEANCACHE API
> diff --git a/init/Kconfig b/init/Kconfig
> index a270716562de..40c9ca60ac1d 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -47,6 +47,10 @@ config CLANG_VERSION
>         int
>         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>
> +config LLD_VERSION
> +       int
> +       default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
> +
>  config CC_CAN_LINK
>         bool
>         default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> @@ -1349,7 +1353,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
>           own risk.
>
>  config LD_ORPHAN_WARN
> -       def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
> +       def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
>
>  config SYSCTL
>         bool
> diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> new file mode 100755
> index 000000000000..cc779f412e39
> --- /dev/null
> +++ b/scripts/lld-version.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# ld.lld-version ld.lld-command

^ it looks like this format was copied from scripts/gcc-version, but
it's kind of curious/cryptic to me for a comment about usage.  Is it
necessary?  A comment in the form:

# Usage: ./scripts/lld-version.sh ld.lld

Would be clearer to me.

> +#
> +# Print the linker version of `ld.lld-command' in a 5 or 6-digit form
> +# such as `100001' for ld.lld 10.0.1 etc.
> +
> +linker="$*"
> +
> +if ! ( $linker --version | grep -q LLD ); then
> +       echo 0
> +       exit 1
> +fi
> +
> +VERSION=$($linker --version | cut -d ' ' -f 2)

This is going to invoke the linker potentially twice if it's LLD.
Would it be nicer to capture the output of `$linker --version`, check
which linker it is, then slice that up via `cut` to get the version?

This version is fine to me, but if you're going to send a v2, that
might be a nice slight cleanup.  Otherwise,

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

(Please drop those tags if you modify this for v2 and I'll rereview/retest).

> +MAJOR=$(echo $VERSION | cut -d . -f 1)
> +MINOR=$(echo $VERSION | cut -d . -f 2)
> +PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
