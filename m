Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4850D19631E
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2020 03:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgC1CcD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Mar 2020 22:32:03 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49679 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgC1CcD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Mar 2020 22:32:03 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 02S2Vp09014469;
        Sat, 28 Mar 2020 11:31:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02S2Vp09014469
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585362712;
        bh=/ZEaW0yPGHKvef0V6hd8Q9DEEPXiu5PxlMmlJIXs6xg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pUU+MHCfWDegu6eR1u7P6awdMqkW6+AQBNAvPH/tcBtpk+V2qpXXqqyw/t8w4NwPG
         9HEzb2yk3Ebm1VioHNLFCpGwdYmtGKWIhL7Dq6VAP+OfTCDBjWxE/CTrCe3UXr1qQI
         Rv2k7LrFXAszfXsbsF4z6qUY2nDKCL2ihh6XLvnasN0nD1MbhLaOmsNmLgCrXwC2Qu
         rbjhcMg2Jq7t7YQKHbgj4PnN2qCKjQHW+XLI/58XjgjM/ERDVnRx+wgIEkwj4ewT8b
         ZJ96UytYxbpIyG6ea5bb8Rfvop6LunlFF9vqi/qcsLZf7IqcKVxJPwrrshXoSWNapB
         ObbLTPRO5rluQ==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id a6so4279463uao.2;
        Fri, 27 Mar 2020 19:31:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuaXqWNX8xs/lAoLouTG6G8d/rJtgJcYtUtCbeWyfyjHo/Jdb4tw
        S1o42suXAGoaZeY8j/kRDAUD43x78VKQGja0rZY=
X-Google-Smtp-Source: APiQypK23EjdTQD1xVPdKR3KGXNRW+Ex1NC2FB1LcAQVe4qOJOwHDw8va0r/6dbcy2pP23EsKwTSvrlwuEN5LNQ6jKU=
X-Received: by 2002:a9f:32da:: with SMTP id f26mr1521588uac.40.1585362710955;
 Fri, 27 Mar 2020 19:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200326192933.14091-1-david.engraf@sysgo.com>
In-Reply-To: <20200326192933.14091-1-david.engraf@sysgo.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Mar 2020 11:31:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2Mojdcu7hg+_q5VopnDPEtx=LK9m-3df6m2TCncrNfA@mail.gmail.com>
Message-ID: <CAK7LNAQ2Mojdcu7hg+_q5VopnDPEtx=LK9m-3df6m2TCncrNfA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add outputmakefile to no-dot-config-targets
To:     David Engraf <david.engraf@sysgo.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 27, 2020 at 4:37 AM David Engraf <david.engraf@sysgo.com> wrote:
>
> The target outputmakefile is used to generate a Makefile
> for out-of-tree builds and does not depend on the kernel
> configuration.
>
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Applied to linux-kbuild.

Thanks.


> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e56bf7ef182d..45be0e5b0cef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -255,7 +255,7 @@ clean-targets := %clean mrproper cleandocs
>  no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
> -                        %asm-generic kernelversion %src-pkg
> +                        %asm-generic kernelversion %src-pkg outputmakefile
>  no-sync-config-targets := $(no-dot-config-targets) install %install \
>                            kernelrelease
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
