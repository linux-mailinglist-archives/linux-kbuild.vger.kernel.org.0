Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62B8CE8C8
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2019 18:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfJGQMf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 12:12:35 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:65271 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfJGQMf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 12:12:35 -0400
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x97GCH8x026939;
        Tue, 8 Oct 2019 01:12:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x97GCH8x026939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570464738;
        bh=NPa8YpRQHzD38z1zgTrtNvaEwRdTmAWhu5DjV8yIWJA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uE3pcn6OyjahUmYjOcGsgJs2vr47HmpyZKQVcOJ15qr2Nr3UO7DM4np2skn86bjJx
         3XagAJt7WUMLTR2IsraMM4NscvJk4LxmN2HOg7ruxmPtk0NJXpekwZdNwnkTSzSc5k
         Uv2CQz2mtNdR2m0zmuBwa8TaTEUlNAyOmvZza+/a4BjLd99C6lSqeY0hCfput55h/V
         7v8f0omrhZlw27TW2WMTon3ONd9dUpgKqATmyaDF8ArZPfI8WopwYPNrSvxfYSsLc9
         8xZ43CRTDtegXIULL0LvNzx/Hk4fBBArZhYz57f4Tr3YoIQycTpPW8eKIN58zsYdmc
         doLxj8qu/elkw==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id f1so3085831vkh.9;
        Mon, 07 Oct 2019 09:12:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVA2nn/0VN5pGp+yPQ+Hxm5jC0BPuhp/nH/f7/ej+cJmFlNnswy
        9epRHrDvSUkHB0S/yh/gPDbkzXpOvCXwm1WLkqY=
X-Google-Smtp-Source: APXvYqz8jDbBaSAALL0wkk3X5+X0AhSNNwJCs33YMBPBKD4Ivvh0dvzxyjv6ORdCfCNeR1NlqrA9KGzvYYCWEUUho/k=
X-Received: by 2002:a1f:9344:: with SMTP id v65mr10019860vkd.96.1570464736366;
 Mon, 07 Oct 2019 09:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <f5cb4272-4cb8-4253-77fd-56aaf73a0dbc@infradead.org>
In-Reply-To: <f5cb4272-4cb8-4253-77fd-56aaf73a0dbc@infradead.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 8 Oct 2019 01:11:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCzEQNAJa1-ub6Ga1VcC6pQHtqc8P1dutscyfQZFzTmQ@mail.gmail.com>
Message-ID: <CAK7LNARCzEQNAJa1-ub6Ga1VcC6pQHtqc8P1dutscyfQZFzTmQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: setlocalversion: fix a bashism
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Mike Crowe <mcrowe@zipitwireless.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 6, 2019 at 12:02 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix bashism reported by checkbashisms by using only one '=':
>
> possible bashism in scripts/setlocalversion line 96 (should be 'b = a'):
>         if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
>
> Fixes: 38b3439d84f4 ("setlocalversion: update mercurial tag parsing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mike Crowe <mcrowe@zipitwireless.com>

Applied to linux-kbuild. Thanks.

> ---
> Does anyone still use hg for kernel development?

I have also been wondering in which situation
this code is used...


>
>  scripts/setlocalversion |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- lnx-54-rc1.orig/scripts/setlocalversion
> +++ lnx-54-rc1/scripts/setlocalversion
> @@ -93,7 +93,7 @@ scm_version()
>         # Check for mercurial and a mercurial repo.
>         if test -d .hg && hgid=`hg id 2>/dev/null`; then
>                 # Do we have an tagged version?  If so, latesttagdistance == 1
> -               if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
> +               if [ "`hg log -r . --template '{latesttagdistance}'`" = "1" ]; then
>                         id=`hg log -r . --template '{latesttag}'`
>                         printf '%s%s' -hg "$id"
>                 else
>


-- 
Best Regards
Masahiro Yamada
