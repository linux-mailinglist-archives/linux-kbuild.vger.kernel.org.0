Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 667361853D7
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2020 02:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgCNBaE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Mar 2020 21:30:04 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:40396 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgCNBaE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Mar 2020 21:30:04 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02E1TwYt031818;
        Sat, 14 Mar 2020 10:29:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02E1TwYt031818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584149399;
        bh=s+MLlPHJBKXrpuiK/f0t8GUAtsMBrB5F071oJPbl8vI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ED+w/hULkW6n1anfIyoGOTMM/5oIAJDxoVFphJoOi1Ia95t/7M8QFVXKBjoVSUYBF
         loBRrmRtNKr6XnDGhCEO7/65FnYD2PrFkBlwQNKQcQXZ85i5A14dCRwWrYad1M5Xaj
         7XyHagz14YQp8qxYIXh0qNWseSY8Vd1ZI3I+OK4ioPMJZ6+/LzhBuLXB94XZ+EoBHT
         NCAA1ncM1sonPjQR4d8/NWjXuqAOs5bpXnzYp3kiUKcltWpWXtDub4am//bmrUmoir
         NKLyJ89rrqzEYH1EQq+jexYR8PjoweRD8PWhF28/ZObc4Q1D3uX18Vse8Hw9Rbprgv
         sdRKKfp3/8zeg==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id c18so7591989vsq.7;
        Fri, 13 Mar 2020 18:29:58 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2TfjCspXjzvMF5+QGGYLdo3rvU42rYiKTDWtNOlksXgj4E4z/l
        ILZeTQ1hKEqWtzC/ljGij0QNVxjNXP+ZM7H4txI=
X-Google-Smtp-Source: ADFU+vs+Ei+coS5nmQYJ3m/p8jpM2R7rWBOFjjjJU8mvIZotzPAjx5d+zMNUiyTqlzLFL88Xz3l+0c7SsV0WqGBk52I=
X-Received: by 2002:a67:2d55:: with SMTP id t82mr2322834vst.215.1584149397781;
 Fri, 13 Mar 2020 18:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200311225044.29502-1-masahiroy@kernel.org>
In-Reply-To: <20200311225044.29502-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 14 Mar 2020 10:29:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ=AVRwXxErOvs=2iK2vKYU3GrF_am7JUUFBiVGPchWXw@mail.gmail.com>
Message-ID: <CAK7LNAQ=AVRwXxErOvs=2iK2vKYU3GrF_am7JUUFBiVGPchWXw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix references to other documents
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2020 at 7:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> All the files in Documentation/kbuild/ were converted to reST.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
>  Documentation/kbuild/kbuild.rst                 | 2 +-
>  Documentation/kbuild/kconfig-macro-language.rst | 2 +-
>  Documentation/kbuild/makefiles.rst              | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index f1e5dce86af7..510f38d7e78a 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -237,7 +237,7 @@ This is solely useful to speed up test compiles.
>  KBUILD_EXTRA_SYMBOLS
>  --------------------
>  For modules that use symbols from other modules.
> -See more details in modules.txt.
> +See more details in modules.rst.
>
>  ALLSOURCE_ARCHS
>  ---------------
> diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
> index 35b3263b7e40..8b413ef9603d 100644
> --- a/Documentation/kbuild/kconfig-macro-language.rst
> +++ b/Documentation/kbuild/kconfig-macro-language.rst
> @@ -44,7 +44,7 @@ intermediate::
>              def_bool y
>
>  Then, Kconfig moves onto the evaluation stage to resolve inter-symbol
> -dependency as explained in kconfig-language.txt.
> +dependency as explained in kconfig-language.rst.
>
>
>  Variables
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 6bc126a14b3d..04d5c01a2e99 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -924,7 +924,7 @@ When kbuild executes, the following steps are followed (roughly):
>         $(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
>         are used for assembler.
>
> -       From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
> +       From commandline AFLAGS_MODULE shall be used (see kbuild.rst).
>
>      KBUILD_CFLAGS_KERNEL
>         $(CC) options specific for built-in
> @@ -937,7 +937,7 @@ When kbuild executes, the following steps are followed (roughly):
>
>         $(KBUILD_CFLAGS_MODULE) is used to add arch-specific options that
>         are used for $(CC).
> -       From commandline CFLAGS_MODULE shall be used (see kbuild.txt).
> +       From commandline CFLAGS_MODULE shall be used (see kbuild.rst).
>
>      KBUILD_LDFLAGS_MODULE
>         Options for $(LD) when linking modules
> @@ -945,7 +945,7 @@ When kbuild executes, the following steps are followed (roughly):
>         $(KBUILD_LDFLAGS_MODULE) is used to add arch-specific options
>         used when linking modules. This is often a linker script.
>
> -       From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
> +       From commandline LDFLAGS_MODULE shall be used (see kbuild.rst).
>
>      KBUILD_LDS
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
