Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2C92F6A5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 20:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbhANTBq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 14:01:46 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24341 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbhANTBq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 14:01:46 -0500
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10EJ0p2F020399;
        Fri, 15 Jan 2021 04:00:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10EJ0p2F020399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610650851;
        bh=v2AYBQlJ05bi3CulFwutOGp/6+jUWQd6ecahrfOvaoY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=su9Y8puERPenWCFdRsCvTk694wDpn2e3U5AIfTbBbua9j3ao3NYwDrYy4oNqlaWNE
         guCm0R3HpMBuXPRE7A95bs/6ODv24lLkWStrSnjG+fOd9qyJRgZqdGayCCt/n0kRwR
         i7cdLVpIpy9xGFn5pvR85jHJUv//R6ReIO+Fed0sbIOiUAvOI5Z4XWhBRVvLtoMxsT
         jG8arEv1eo8CMwIygn48QADpvrU/Gd+iWF9eJjkDQl0ApulLS6WsCQdUM+OAN48pnJ
         Q+PqjEiIwnjfhPXX3IgEraTT2dZ0hoB6ds3b1O8x8/7K6C7I8p6YaScP4opW3GLCGH
         1xP5d9JsdPiow==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id md11so3624724pjb.0;
        Thu, 14 Jan 2021 11:00:51 -0800 (PST)
X-Gm-Message-State: AOAM530S9XhzjbOlQNrkqUgOGJfey1ATGQIJBopcVHZETWRPU0mn/sNh
        veWRFFO1WtRDFCAOF1ptw938u7aXSC2hRCg8B/4=
X-Google-Smtp-Source: ABdhPJzQpbxA5mkeLQ2IVek4ulR9or8pQGqgOmX2tiWXzncDVrwn0Db05P7K4bcnLLWZD5dU5CFfDmLkuSbkWf5VUZQ=
X-Received: by 2002:a17:902:d713:b029:de:4450:ee0d with SMTP id
 w19-20020a170902d713b02900de4450ee0dmr6213522ply.47.1610650850513; Thu, 14
 Jan 2021 11:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20210114100216.11787-1-info@metux.net>
In-Reply-To: <20210114100216.11787-1-info@metux.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 15 Jan 2021 04:00:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARE2nGgRGgux9jRcv1ogfFBgBzxKygHxeHwy_GcnZO7sg@mail.gmail.com>
Message-ID: <CAK7LNARE2nGgRGgux9jRcv1ogfFBgBzxKygHxeHwy_GcnZO7sg@mail.gmail.com>
Subject: Re: [PATCH] scripts: kconfig: fix HOSTCC call
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 7:05 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>

Thanks for catching this.


> The change c0f975af1745391749e4306aa8081b9a4d2cced8 introduces a bug when

Please use 12-digit hash ("subject") style.


Commit c0f975af1745 ("kconfig: Support building mconf with vendor
sysroot ncurses")



> HOSTCC contains parameters: the whole command line is treated as the program
> name (with spaces in it). Therefore, we have to remove the quotes.
>
> Fixes: c0f975af1745391749e4306aa8081b9a4d2cced8

Ditto.

Fixes: c0f975af1745 ("kconfig: Support building mconf with vendor
sysroot ncurses")



> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  scripts/kconfig/mconf-cfg.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> index fcd4acd4e9cb..40fa449ed049 100755
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -35,7 +35,7 @@ fi
>
>  # As a final fallback before giving up, check if $HOSTCC knows of a default
>  # ncurses installation (e.g. from a vendor-specific sysroot).
> -if echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1; then
> +if echo '#include <ncurses.h>' | ${HOSTCC} -E - >/dev/null ; then


Please keep 2>&1.

This script will display the enough error message at the end.



>         echo cflags=\"-D_GNU_SOURCE\"
>         echo libs=\"-lncurses\"
>         exit 0
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
