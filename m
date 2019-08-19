Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 380CF92815
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 17:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHSPMD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 11:12:03 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38703 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfHSPMC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 11:12:02 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x7JFBfjG029268;
        Tue, 20 Aug 2019 00:11:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x7JFBfjG029268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566227502;
        bh=vL3Z7j5SeJ0aDHILIlZfbZIFzUpyY8SuPcSJhgiwvOM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uRzTcPfrAk4VzJ5SbZGG0Kl2fAU2lBFnqrWuZGvKzDaQQgIWdLofdk3HF+oOPEBGN
         bCLYwpAL+4O5s+6hCVO6CmyJlGp2YT6axmnqHaNsx/E685cFr5TLHK89JMKwDnnuti
         hystVIWSRRzbncDqA9onrkea6rDUEuGru5BpCnbljexqAzaPy0o+6lzavt6/EOvy/M
         5S7O2g6ZW4aTRu4Wx4IEoXG7it7PL+3PwPUNXwdeN30EpJoMBACDf9QHNSWNhJ8PPB
         m/VvGv8odhe0uhUfHCS8fJLyQHHq2ixV6TKiR76xErLExgY2kMeOaBveSmf/NxWKNc
         lJ/JkYTfBF1Jg==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id j21so772656uap.2;
        Mon, 19 Aug 2019 08:11:42 -0700 (PDT)
X-Gm-Message-State: APjAAAX1FmRgA8lZ/ZURSrOdIm9powQM/vahBJ3bRcrYWPYIzpgAegqc
        F79iyx5K22oJN7j9EA/4ZVdKio5qmAtnEiVCPts=
X-Google-Smtp-Source: APXvYqzPZQNuP/5kcGI1YxzfK+nM3S/m3vTXLeDQu6Si58yshTzDliAN4R6WeTf4PGDCnAQg3AssiAvHFTGLtqlWcPU=
X-Received: by 2002:ab0:32d8:: with SMTP id f24mr7470615uao.121.1566227500514;
 Mon, 19 Aug 2019 08:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814160623.24802-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190814160623.24802-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 20 Aug 2019 00:11:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrP29_WBCUqH1FddoO3j_FrbO=8obzEGj6FDn8ukUTgg@mail.gmail.com>
Message-ID: <CAK7LNATrP29_WBCUqH1FddoO3j_FrbO=8obzEGj6FDn8ukUTgg@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: move KBUILD_LDS, KBUILD_VMLINUX_{OBJS,LIBS}
 to makefiles.rst
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

On Thu, Aug 15, 2019 at 1:06 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> These three variables are not intended to be tweaked by users.
> Move them from kbuild.rst to makefiles.rst.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild.


> I will apply to linux-kbuild this
> to avoid conflicts.
>
>
>  Documentation/kbuild/kbuild.rst    | 14 --------------
>  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 61b2181ed3ea..62f9d86c082c 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -258,17 +258,3 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>  These two variables allow to override the user@host string displayed during
>  boot and in /proc/version. The default value is the output of the commands
>  whoami and host, respectively.
> -
> -KBUILD_LDS
> -----------
> -The linker script with full path. Assigned by the top-level Makefile.
> -
> -KBUILD_VMLINUX_OBJS
> --------------------
> -All object files for vmlinux. They are linked to vmlinux in the same
> -order as listed in KBUILD_VMLINUX_OBJS.
> -
> -KBUILD_VMLINUX_LIBS
> --------------------
> -All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS
> -together specify all the object files used to link vmlinux.
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index f4f0f7ffde2b..d3448d2c8017 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -995,6 +995,20 @@ When kbuild executes, the following steps are followed (roughly):
>         top-level Makefile has set any other flags. This provides a
>         means for an architecture to override the defaults.
>
> +    KBUILD_LDS
> +
> +       The linker script with full path. Assigned by the top-level Makefile.
> +
> +    KBUILD_VMLINUX_OBJS
> +
> +       All object files for vmlinux. They are linked to vmlinux in the same
> +       order as listed in KBUILD_VMLINUX_OBJS.
> +
> +    KBUILD_VMLINUX_LIBS
> +
> +       All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and
> +       KBUILD_VMLINUX_LIBS together specify all the object files used to
> +       link vmlinux.
>
>  6.2 Add prerequisites to archheaders
>  ------------------------------------
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
