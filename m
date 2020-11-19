Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1012B9CCC
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Nov 2020 22:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgKSVNk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Nov 2020 16:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbgKSVNk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Nov 2020 16:13:40 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27337C0613D4
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2020 13:13:40 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id i13so5365681pgm.9
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Nov 2020 13:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v4GZ/jYkXszE1mls+kEMDdrPEPVfJzO/2ICpEIaBNDQ=;
        b=VX9vMNKumxYjb1MaiOgA8BYXWmZVJDiTW6P01b9rG1rPFKPOjSfowk4zaRH1rXRNir
         BtNu2L/lhkEgxsDBVm5+hwahoKlcdKx8DSfHEvvF9koYNFXSPx+TqpjXadTh2ckpyrEn
         LPRrqR2nTFG9fkBNgO6K7sSMsjq9j5w7XVC/YqMh/5mCy4tlsbZt8u5jaaCN7inZBCZ3
         KqCnmRWetMpK1EIMWJnCEmxwayXO5SCYdsiunWSlbvt5gCFY4m7Mqnk47VBIHFU1IKw2
         se5KST+MC+lt9D5LyUhQiwfEntRz78UomESsMPm9dc/J0TdU7KKuOC0d0zDuJvAGm00a
         Yt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v4GZ/jYkXszE1mls+kEMDdrPEPVfJzO/2ICpEIaBNDQ=;
        b=YUBuy2mNOeMdDlbR9Gbc97D0v6KFsJA3N2kbmpKjiR+Ze13VOn+Arno2w65qZBUSOm
         JocI7TlxCzqIVZ02Bzjfmg+uR9GJlGByJ8chHUSjljEcYE3qJ/PiPuvJiN2f9vHFAkxv
         oNIVoSr4aRzYExPsnZrQvk+VBnZAQm9XhkYVrwKWWQ1sUe111fEqR2vo8C3nR9mZqOpF
         TgVsCSAUS4DIuZbqLZuAlJgdwh4tTQhM8i5r3YwfVGHTlksfQqNs6rJqnuRAAFlSd42t
         VCZbQ/LxVxymNiKryzrIOp8/ScZ6emR10PKVjIMK8fZoMkoQ3+kGXTLkkMx2lNx8odgS
         kSkg==
X-Gm-Message-State: AOAM532rrJz9SDmkjJ3Bjp8f/vxxz8bp+Hi76GOg7ICXR/m1XdEQcYit
        YdVseuUaIrbdyCc3au8jU0FmzkZ5kGnJ+6OTe52MNA==
X-Google-Smtp-Source: ABdhPJxZrPh18rHCKywSfaLz+afmz6qeTTM23n3N+yG4DUvwsOZWdSWRDWD6fR2nhxs02pK/JPvBxMBwXKRZ5ZsZb4M=
X-Received: by 2002:a65:4485:: with SMTP id l5mr14014104pgq.10.1605820419400;
 Thu, 19 Nov 2020 13:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com> <20201119204656.3261686-2-natechancellor@gmail.com>
In-Reply-To: <20201119204656.3261686-2-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 19 Nov 2020 13:13:27 -0800
Message-ID: <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
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

On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> along with a few others. Newer versions of ld.lld do not have these
> warnings. As a result, do not add '--orphan-handling=warn' to
> LDFLAGS_vmlinux if ld.lld's version is not new enough.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Reported-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the additions in v2.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2:
>
> * Add condition as a depends on line (Kees Cook)
>
> * Capture output of "$* --version" to avoid invoking linker twice (Nick
>   Desaulniers)
>
> * Improve documentation of script in comments (Nick Desaulniers)
>
> * Pick up review tag from Kees
>
>  MAINTAINERS            |  1 +
>  init/Kconfig           |  5 +++++
>  scripts/lld-version.sh | 20 ++++++++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100755 scripts/lld-version.sh
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e451dcce054f..e6f74f130ae1 100644
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
> index 92c58b45abb8..b9037d6c5ab3 100644
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
> @@ -1351,6 +1355,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
>  config LD_ORPHAN_WARN
>         def_bool y
>         depends on ARCH_WANT_LD_ORPHAN_WARN
> +       depends on !LD_IS_LLD || LLD_VERSION >= 110000
>         depends on $(ld-option,--orphan-handling=warn)
>
>  config SYSCTL
> diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> new file mode 100755
> index 000000000000..d70edb4d8a4f
> --- /dev/null
> +++ b/scripts/lld-version.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Usage: $ ./scripts/lld-version.sh ld.lld
> +#
> +# Print the linker version of `ld.lld' in a 5 or 6-digit form
> +# such as `100001' for ld.lld 10.0.1 etc.
> +
> +linker_string="$($* --version)"
> +
> +if ! ( echo $linker_string | grep -q LLD ); then
> +       echo 0
> +       exit 1
> +fi
> +
> +VERSION=$(echo $linker_string | cut -d ' ' -f 2)
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
