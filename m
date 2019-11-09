Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2130F5F80
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2019 15:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfKIOYk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Nov 2019 09:24:40 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28350 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfKIOYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Nov 2019 09:24:40 -0500
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xA9EOQ29020824;
        Sat, 9 Nov 2019 23:24:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xA9EOQ29020824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573309467;
        bh=we+lWwQKgiRWTuKBGrRbQkLgZvihSe+fisYez56gxuA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=15hRcZka3kIGQ2ELqjKXhpN+kEUoi45ySQ3QfWoN1dL/YNtDMUlQQfaTbo36YXZWU
         jJ1/q+iB9jSGKKJ37iZgmuvAXFtkdEOjOcBNF1xEp+17uKR0XfpmVvPN6MRu/9pAyl
         t4MYD9Rb+idCR7NN8jjrKlkTOOgudDLGsTUg6mqrALcAMREyQozQ71XVow2JJ3/Pay
         doabGTNqvm+mTvBobWBO6a7oJyJ8iDcOkpD6mUGLcZFwsLCc9ViZjNZMItaCW21MLA
         C71nGKKzmnV/FO1AYl9CCA5AiglbsrNZAI5+7ChwU4lEgM34ZV4aFyhd1rPWqIwVXv
         Z3Aa3tXw5hvOA==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id b184so5815631vsc.5;
        Sat, 09 Nov 2019 06:24:26 -0800 (PST)
X-Gm-Message-State: APjAAAVhTKgOrY7Z2cR8j9ia1cL2YrwVVnQ/UODfVLGugWElVNzHE16I
        W3kmzHerohQOLGKX7U2JcTYfN9isgrveEhgAhS0=
X-Google-Smtp-Source: APXvYqz9jnMycilN1M14eemMTFyNvlE61uJArpoC4cDJCpFnhpepDXDcpFtIaiDigbtXLlgGoQzeaLY/bF14gNt2dXI=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr13089811vst.155.1573309465580;
 Sat, 09 Nov 2019 06:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20191109121216.61381-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20191109121216.61381-1-luc.vanoostenryck@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 9 Nov 2019 23:23:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQops2qF9Ljf+1xg8SKif89mLrjfaKosWrCbfMCzfwnOA@mail.gmail.com>
Message-ID: <CAK7LNAQops2qF9Ljf+1xg8SKif89mLrjfaKosWrCbfMCzfwnOA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: tell sparse about the $ARCH
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 9, 2019 at 9:12 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Sparse uses the same executable for all archs and uses flags
> like -m64, -mbig-endian or -D__arm__ for arch-specific parameters.
> But Sparse also uses value from the host machine used to build
> Sparse as default value for the target machine.
>
> This works, of course, well for native build but can create
> problems when cross-compiling, like defining both '__i386__'
> and '__arm__' when cross-compiling for arm on a x86-64 machine.
>
> Fix this by explicitely telling sparse the target architecture.
>
> Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---

Applied to linux-kbuild. Thanks.


>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 6f54f2f95743..05a8906dde63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -937,6 +937,9 @@ ifeq ($(CONFIG_RELR),y)
>  LDFLAGS_vmlinux        += --pack-dyn-relocs=relr
>  endif
>
> +# make the checker run with the right architecture
> +CHECKFLAGS += --arch=$(ARCH)
> +
>  # insure the checker run with the right endianness
>  CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
>
> --
> 2.24.0
>


-- 
Best Regards
Masahiro Yamada
