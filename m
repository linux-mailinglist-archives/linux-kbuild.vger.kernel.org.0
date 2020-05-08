Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917FF1CA2E3
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2020 07:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgEHFjH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 May 2020 01:39:07 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:44662 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgEHFjG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 May 2020 01:39:06 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0485cZxi031330;
        Fri, 8 May 2020 14:38:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0485cZxi031330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588916316;
        bh=6uORqD6LGkuneE9UyXFpz3pdT+rI/NDAz27a1vvxrh8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NUwDqeXXELLcOkjKZCwue1/kEnY37m9GUWM+cTPyPaxnBZRcDu1hLVRvCZLOS0RmJ
         4L3slMUg4i1PWM7d7E+6wbDQVaS3Bg/lCQD9LysZ0wKJb5Zd4kSOzXLu4ZYnYpJzM3
         lflOZ3cEBWv+HOZbG1/ZFu15JWSVnFl9VoxHPFkwP8AnVuo/bhpGIeXPmHp4qk2KCl
         /4Tg0eVk6SG69UUrWxm1TAWHWTv1je/zmmezvxpkmH8fZTodwBmHbrBhEqvwAkx89m
         +uB6RM4J748frMWQ5+egYqcIq6FjEVStRJDgblvsoKPoZakL7iGYQ45x40+vs8F8T8
         YvOj+anNx+WRg==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id b14so121371vkk.10;
        Thu, 07 May 2020 22:38:35 -0700 (PDT)
X-Gm-Message-State: AGi0PuYpnA4OQtpyRealflGhbPL/Wzo56CydWQuMd+9thdOtGE6pkuID
        2+9JiAu4X8u+ef8SzCqTV9Qu7VnwTC+srUGBnrQ=
X-Google-Smtp-Source: APiQypK2KtQbOWcXkPz3bng6woQqwWOOLWMJV6Iwtcl08hNJrkuCDHARFryG0giTq8cybfg6KE2ohPiN1TCNuzkRumM=
X-Received: by 2002:a1f:8fc1:: with SMTP id r184mr496087vkd.12.1588916314505;
 Thu, 07 May 2020 22:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200507185601.GA14759@embeddedor>
In-Reply-To: <20200507185601.GA14759@embeddedor>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 8 May 2020 14:37:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS1bjKcczLADzP8JQ=CVe4VOFb1L3C4bb+0eS5zfBHubg@mail.gmail.com>
Message-ID: <CAK7LNAS1bjKcczLADzP8JQ=CVe4VOFb1L3C4bb+0eS5zfBHubg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Replace zero-length array with flexible-array
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 8, 2020 at 3:51 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>


Applied to linux-kbuild. Thanks.



-- 
Best Regards
Masahiro Yamada
