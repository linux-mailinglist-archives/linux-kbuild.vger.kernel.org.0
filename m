Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C004747C97F
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Dec 2021 00:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbhLUXJ4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Dec 2021 18:09:56 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:32364 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235435AbhLUXJ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Dec 2021 18:09:56 -0500
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1BLN9NcI025170
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 08:09:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1BLN9NcI025170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1640128163;
        bh=7ghHEC5zMeaZ9cAWekt874db1AAG4xjmi08/W4tY3pw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LLmrDcqEtgL4cYtUhNBmkLv+gAx7AXzL7yW4DFZDC7uNn40uHJkABB6dZzTQJ0KZc
         zOItWy7lR6DJBhbDe+IRiTVyuYbS3UuN3lmE/prTx1K5jugLs8NPF+DzgpI7KfpOXU
         jx1AfNZVfjbnemjsKDPCGHL4aeaBT7P3Clo7RX49gecRc1fb61e3pva4bXRNWVtJCA
         DB9WtA5Qucl8Wrq2vznzLMj73e0O1bV8EL1Q/zflMsFcesAZ2D7eJVH/bLgIJhRnbV
         pQtZ9ptUONeMDFu53LW5R84syCEIjQcLx6iAMKDEWSaXF2LiYHyAdZn1HX//BJPYID
         rUUQMLznY9tgQ==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id jw3so581221pjb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2021 15:09:23 -0800 (PST)
X-Gm-Message-State: AOAM5335V897TQOIXQ9OOgOMnCQpqVHmBLD1ac+s5SJL9U/TjZFYArwS
        0YpkdhP24QkVDRFTQfXVeCf9vmbzYzwsrMQRgHw=
X-Google-Smtp-Source: ABdhPJwLvuUdyhT9h+rrZntqar5HZlO5Y6f12kHeITWxSjtrdzUzmuKI1G/g2fAdmOsRa/Esx6S3ARO/j4BnVtYDbG0=
X-Received: by 2002:a17:90a:680a:: with SMTP id p10mr485621pjj.144.1640128162702;
 Tue, 21 Dec 2021 15:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20211220162925.14441-1-ysionneau@kalray.eu>
In-Reply-To: <20211220162925.14441-1-ysionneau@kalray.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Dec 2021 08:08:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARL-S45PxLsN5c52e6WD=SSth8eq2QDe6dJcLv7YA0nGA@mail.gmail.com>
Message-ID: <CAK7LNARL-S45PxLsN5c52e6WD=SSth8eq2QDe6dJcLv7YA0nGA@mail.gmail.com>
Subject: Re: [PATCH 0/1] Use target CPP to pre-process dts as supported flag
 checks are done on target toolchain
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 21, 2021 at 1:37 AM Yann Sionneau <ysionneau@kalray.eu> wrote:
>
> Hello,
>
> I have encountered an issue with the following setup:
> * host toolchain gcc 7.5.0 (Ubuntu 18.04 LTS)
> * target toolchain gcc 9.4.1
>
> In this case I got build error while compiling DTBs because of the following flag: -fmacro-prefix-map

-fmacro-prefix-map is never used for compiling DTBs.

If it is, it is a bug.
But, I do not see such a case.



> This flag was known to my target toolchain (CC) but not by my HOSTCC.
> One might say that Ubuntu 18.04 is pretty old and I should upgrade but I think it's fundamentally broken to check flags on toolchain A and use them on toolchain B. We could have other issues like this in the future.
> I'm proposing this change to open the discussion.
> Regards,
>
> Yann Sionneau (1):
>   Use target CPP to pre-process dts as supported flag checks are done on
>     target toolchain
>
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
