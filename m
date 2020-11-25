Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A482C380A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 05:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgKYEVi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 23:21:38 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49281 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgKYEVh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 23:21:37 -0500
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0AP4LGLe023838;
        Wed, 25 Nov 2020 13:21:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0AP4LGLe023838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606278077;
        bh=ooRzKz+xea3vITaQ6iu7qbgvOHqjZFJJkld/4o49MH4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HiiUZCzMQznWUyqeypBgzCNTUOQtn5kRBrDQR4ZREFrlK2e+wtOmdPOFosym7+w8/
         mSLF7GoiwwfQNatfCOZJ5CNwG5HRLikhvJ2KB3rZZvFa6aRisSLr3zFsKcShVFAn3+
         PDqRg1CgT09F8ZGAbjp2LK5Jq+dDYnD7Oy5HJsFxykPDe1aUuBQ5QThZd9y5N+I9o3
         DyZ4brprbkZra3EeNZLJ4EnVWTeBQPYmLoFWX45x3shrGYxXDdNFeToSAWp0RHqIwr
         lFfq2wBUAVyTCkYS3205VqlfAR2sk0cuNHz2W16bFvWPN5hjCmXG3IXlcJwYQ6Nsw9
         jM2KYUmmaXmnw==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id f17so1217562pge.6;
        Tue, 24 Nov 2020 20:21:16 -0800 (PST)
X-Gm-Message-State: AOAM531SONrYFmErmaV4PLf6Z43XcjyRigePRJJKEGQnMWXgpBFYCmxS
        yu9fE89koIj2fJkMh4niY/wInvSKSAVezMyxD5Y=
X-Google-Smtp-Source: ABdhPJyq8N9UqhJ4ipccgxI03Bq0Yt5jiNDdSTa642fCRyckZtA/iY1YmWWkbRb8ZbXqPD94QZTkf/XJh0UnazY1L7g=
X-Received: by 2002:a63:3205:: with SMTP id y5mr1533249pgy.47.1606278076158;
 Tue, 24 Nov 2020 20:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20201124154339.173752-1-arnd@kernel.org>
In-Reply-To: <20201124154339.173752-1-arnd@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Nov 2020 13:20:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNASsVeKzRp2cevv8RvPWvH_X9_FW4kp4C76BynTLSHJuRA@mail.gmail.com>
Message-ID: <CAK7LNASsVeKzRp2cevv8RvPWvH_X9_FW4kp4C76BynTLSHJuRA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: remove -Wnested-externs warning
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 25, 2020 at 12:43 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The -Wnested-externs warning has become useless with gcc, since
> this warns every time that BUILD_BUG_ON() or similar macros
> are used.
>
> With clang, the warning option does nothing to start with, so
> just remove it entirely.
>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 6baee1200615..d53825503874 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -61,7 +61,6 @@ endif
>  ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
>
>  KBUILD_CFLAGS += -Wdisabled-optimization
> -KBUILD_CFLAGS += -Wnested-externs
>  KBUILD_CFLAGS += -Wshadow
>  KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
>  KBUILD_CFLAGS += -Wmissing-field-initializers
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
