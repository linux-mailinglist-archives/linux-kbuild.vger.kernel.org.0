Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF0677D3
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 05:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfGMDnF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 23:43:05 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55707 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbfGMDnF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 23:43:05 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6D3glSi020261;
        Sat, 13 Jul 2019 12:42:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6D3glSi020261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562989367;
        bh=57jXn/kli5cGXMKS10omqKGu33q3IQPitAGnq/f/wAk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S3Yk/6271A1r9mPbgrfSCi8D/oJIYfKqbiW7rY+gJ/cBVwXIggZOUgV481psWnEMK
         4VmTiMr5UFp5PvgpPuWYg1UNWV1P0sZl+PDpmS2O9/2fFPqsdy7RE9cxjBjGCGTuVT
         s0aODElamWOlXatjXIe5TNRtvGmCxxRaHgW0kbVxnaEmokFw3cfmI7KI5KeLs/nEoQ
         w6oluOSzfC7VRxL9JBE4ebYI8faG8PbCKU4YiuGGpLNd0h+UoZQluklGeA/xWGUgdJ
         qiH9kJnGQsx2Z68RHgLv3A7uyArwgbCAbFM7eHZP/nZfS26xjXvmxaccEBO3TEtXff
         nkkjyyIuU+iSQ==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id 130so2483257vkn.9;
        Fri, 12 Jul 2019 20:42:47 -0700 (PDT)
X-Gm-Message-State: APjAAAWMbMDsTHGIcymR0/bSYQ86vOy33UOLIt4X9PZkFv1wreo3Vnee
        MFjUbIVm5B12SfgGVGBs9BmNMxQ/61nV3ve8MOM=
X-Google-Smtp-Source: APXvYqyg/6KeYQzaEoOOt9CzsL8EPmgeV88YwIhhEwlw31RKFn3sQIjIXzEsEhjpNkzFcU2a+DMNwxjPIeIEuF+n2q4=
X-Received: by 2002:a1f:4107:: with SMTP id o7mr7211911vka.34.1562989366294;
 Fri, 12 Jul 2019 20:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190713024558.27214-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190713024558.27214-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 13 Jul 2019 12:42:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATY4B2OG2GpTePNquNFqdesM8e+2stX4WVGQcCVcVgM0w@mail.gmail.com>
Message-ID: <CAK7LNATY4B2OG2GpTePNquNFqdesM8e+2stX4WVGQcCVcVgM0w@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: get rid of misleading $(AS) from documents
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 13, 2019 at 11:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The assembler files in the kernel are *.S instead of *.s, so they must
> be preprocessed. Since 'as' of GNU binutils is not able to preprocess,
> we always use $(CC) as an assembler driver.
>
> $(AS) is almost unused in Kbuild. As of v5.2, there is just one place
> that directly invokes $(AS).
>
>   $ git grep -e '$(AS)' -e '${AS}' -e '$AS' -e '$(AS:' -e '${AS:' -- :^Documentation
>   drivers/net/wan/Makefile:  AS68K = $(AS)
>
> The documentation about *_AFLAGS* sounds like the flags were passed
> to $(AS). This is somewhat misleading.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Applied to linux-kbuild.



> Changes in v3:
>   - Rebase
>
> Changes in v2:
>   - Rephrase without using "assembling"
>
>  Documentation/kbuild/kbuild.rst    |  5 ++---
>  Documentation/kbuild/makefiles.rst | 12 ++++++------
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index b25548963d70..727520b3d7b1 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -38,12 +38,11 @@ Additional options to the assembler (for built-in and modules).
>
>  AFLAGS_MODULE
>  -------------
> -Additional module specific options to use for $(AS).
> +Additional assembler options for modules.
>
>  AFLAGS_KERNEL
>  -------------
> -Additional options for $(AS) when used for assembler
> -code for code that is compiled as built-in.
> +Additional assembler options for built-in.
>
>  KCFLAGS
>  -------
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 093f2d79ab95..67e47589d9d2 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -328,7 +328,7 @@ more details, with real examples.
>         variable $(KBUILD_CFLAGS) and uses it for compilation flags for the
>         entire tree.
>
> -       asflags-y specifies options for assembling with $(AS).
> +       asflags-y specifies assembler options.
>
>         Example::
>
> @@ -489,7 +489,7 @@ more details, with real examples.
>         as-instr checks if the assembler reports a specific instruction
>         and then outputs either option1 or option2
>         C escapes are supported in the test instruction
> -       Note: as-instr-option uses KBUILD_AFLAGS for $(AS) options
> +       Note: as-instr-option uses KBUILD_AFLAGS for assembler options
>
>      cc-option
>         cc-option is used to check if $(CC) supports a given option, and if
> @@ -905,7 +905,7 @@ When kbuild executes, the following steps are followed (roughly):
>         vmlinux. The usage of $(call if_changed,xxx) will be described later.
>
>      KBUILD_AFLAGS
> -       $(AS) assembler flags
> +       Assembler flags
>
>         Default value - see top level Makefile
>         Append or modify as required per architecture.
> @@ -948,16 +948,16 @@ When kbuild executes, the following steps are followed (roughly):
>         to 'y' when selected.
>
>      KBUILD_AFLAGS_KERNEL
> -       $(AS) options specific for built-in
> +       Assembler options specific for built-in
>
>         $(KBUILD_AFLAGS_KERNEL) contains extra C compiler flags used to compile
>         resident kernel code.
>
>      KBUILD_AFLAGS_MODULE
> -       Options for $(AS) when building modules
> +       Assembler options specific for modules
>
>         $(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
> -       are used for $(AS).
> +       are used for assembler.
>
>         From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
