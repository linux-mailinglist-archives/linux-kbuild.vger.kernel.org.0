Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BD82577BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Aug 2020 12:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgHaKwH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 Aug 2020 06:52:07 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:58101 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgHaKvu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Aug 2020 06:51:50 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 07VApMxL022661;
        Mon, 31 Aug 2020 19:51:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 07VApMxL022661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598871082;
        bh=wKbrE85v981WXDPiQLiXWWfJWxnP8Gc5ttwDy8z7Dzw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EVmQNvTGA1lk7Ssdmb/uCxyH/g/38W5zkj7hrY5Hj4lo4Kd/BTmOZKKTcYhgMTKMb
         JLhaJ/G0oFw5+p+3TkPOiPhuvq9acLcdtExFGhmadB/mKmSgfjLZDLDeVVKxz4K88b
         0rF6khC0P7qUDQcm8EoHFo25IBhI2lVQq/aA2vm3d+IOqRIe0YV1j1KPd07FFIKH2g
         FCDMn5ckkTo1zKcf59U5XzxKaVRlB9bOwpUOp88NHgZrCnMnkKVNNyratEivE4ha7j
         LqpoyJmN49n1rmWTtX95cVcV3soq+08SBc9+fwb38H2FZXnfw5VWJ7JVgn+dAyRWj5
         WquoELf/TEtjQ==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id ls14so2758434pjb.3;
        Mon, 31 Aug 2020 03:51:22 -0700 (PDT)
X-Gm-Message-State: AOAM533m+m88gYnIBM6+YvCL6YvkNX3W5gd0rzMM8zY+ZTyxd2obaX7+
        SApnhBMVbVxHGY5fFf8Y8Y4tnPl0NYS2q1bwATI=
X-Google-Smtp-Source: ABdhPJy3F0F/AITivxE6ZFqBBnNyFmRERV4g59yN27GzaTQZZqMqRk1OzvDYJ7fa4nFBWAm9EfM9XRgyziJfuSgyGMs=
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr847822pjb.153.1598871081699;
 Mon, 31 Aug 2020 03:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200831065223.6304-1-efremov@linux.com>
In-Reply-To: <20200831065223.6304-1-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 31 Aug 2020 19:50:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARgMRG8B3DRqWJvbVpq80PjRRFyesMqmUbKXxR9MRfbaQ@mail.gmail.com>
Message-ID: <CAK7LNARgMRG8B3DRqWJvbVpq80PjRRFyesMqmUbKXxR9MRfbaQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove redundant assignment prompt = prompt
To:     Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 31, 2020 at 3:52 PM Denis Efremov <efremov@linux.com> wrote:
>
> Semi-automatic removing of localization macros changed the line
> from "prompt = _(prompt);" to "prompt = prompt;". Drop the
> reduntand assignment.
>
> Fixes: 694c49a7c01c ("kconfig: drop localization support")
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---

Applied to linux-kbuild/fixes. Thanks.


>  scripts/kconfig/nconf.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index daf1c1506ec4..e0f965529166 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -755,7 +755,6 @@ static void build_conf(struct menu *menu)
>                         switch (ptype) {
>                         case P_MENU:
>                                 child_count++;
> -                               prompt = prompt;
>                                 if (single_menu_mode) {
>                                         item_make(menu, 'm',
>                                                 "%s%*c%s",
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
