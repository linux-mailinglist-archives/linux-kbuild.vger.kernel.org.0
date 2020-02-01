Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD9D14F5FB
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 04:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgBADO0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jan 2020 22:14:26 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:40973 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBADO0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 22:14:26 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0113EJhX017981;
        Sat, 1 Feb 2020 12:14:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0113EJhX017981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580526860;
        bh=SpEVhcXDXuPsdCOPC4BokQaYPPdG1pDRUWgyKpmixrk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Nq4NBmZVHTjuu5OkE0V0DrCaQzhhabJfPIZw2MHtJNbQuAZiBObP1Ul522b1imSVu
         mp7jJXh67/cqVaZ9BuNl6JoyKj3wHgtyspkXuB67gRxi75nkDKk2qAjISjR9MR80no
         j1MmWjPIeGaWaJzSn4/8jBQYH+QUCa2QjCzTaIQFlsUBosgAY4EMGnL7lvJGd1fHCk
         OVaKiSFaDcXxiXjYQaLs62abFZ8i8vCrloN0+8sGVZ+lWsB7xeQX4gfUL8M+cjzOHg
         MtrKaX7dmvaMnK7KJmXmWAtth1EsMjgyefcAJgNqxQlbAXOwRY1/jyOLA+RJh1TvGB
         A6yb5snlQx4sg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id c7so3348557uaf.5;
        Fri, 31 Jan 2020 19:14:19 -0800 (PST)
X-Gm-Message-State: APjAAAWgSmPpN7FR93ZYbr4MQ+HUwR0bmQyU3OeY4EreBnAo+fJfDvhy
        SIyr4o5xa8LR8x6nFU5ef4SL55zVu0Y45vzayAo=
X-Google-Smtp-Source: APXvYqzfsy7KTw00w2jxYwV+WWhsHT5hZ7Uaa0u+rW7DCkIBgNFYqwyaOJRQAmrb/t+HKSpdiLyemyR0ZbahDCsXKM0=
X-Received: by 2002:ab0:2bc1:: with SMTP id s1mr6076074uar.109.1580526858755;
 Fri, 31 Jan 2020 19:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20200125041235.8856-1-masahiroy@kernel.org>
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 1 Feb 2020 12:13:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARxO7krvxb1TgJpHkaWwvgZ7JNRsOULhgP=AZ4SHht9aw@mail.gmail.com>
Message-ID: <CAK7LNARxO7krvxb1TgJpHkaWwvgZ7JNRsOULhgP=AZ4SHht9aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] builddeb: remove unneeded files in hdrobjfiles for
 headers package
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 25, 2020 at 1:13 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - We do not need tools/objtool/fixdep or tools/objtool/sync-check.sh
>    for building external modules. Including tools/objtool/objtool is
>    enough.
>
>  - gcc-common.h is a check-in file. I do not see any point to search
>    for it in objtree.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v3: None

Series, applied.


> Changes in v2: None
>
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f903ba947daf..d4bb28fbd3de 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -170,11 +170,11 @@ done
>  (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
>  if is_enabled CONFIG_STACK_VALIDATION; then
> -       (cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
> +       echo tools/objtool/objtool >> "$objtree/debian/hdrobjfiles"
>  fi
>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
>  if is_enabled CONFIG_GCC_PLUGINS; then
> -       (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> +       (cd $objtree; find scripts/gcc-plugins -name \*.so) >> "$objtree/debian/hdrobjfiles"
>  fi
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
