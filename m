Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2AA3234DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 02:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhBXBGP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 20:06:15 -0500
Received: from condef-04.nifty.com ([202.248.20.69]:49578 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234092AbhBXBBg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 20:01:36 -0500
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-04.nifty.com with ESMTP id 11O0qc5Y004522
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Feb 2021 09:52:38 +0900
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11O0ljmQ003720;
        Wed, 24 Feb 2021 09:47:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11O0ljmQ003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614127666;
        bh=NX9wZLU424txO2nja/pZe5fdgVq+LLr9hlOUOtdxrHM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TKwOO0hjrrlu8qhQNqAtJJxXaN3BInoIfMuZVH6bTBUDWZ6Dqb/6KlTxMy9z+HOxa
         69nEJJ9wzz3w4eWTCLX9B+duw8RoYQS1OscBohtm8jwZwIhBNCiH/z93kjb92JKzPh
         uyfNWumYxuvuwBfXLz9yj0tFMSXjakByQxGwFg76wSKgaK29wo1ss9b+BWAK52Clve
         M+XSpCa3+2fkD/Wey6iD8h/ZwmF2ZNPR+tg5AxrHW92tWWUfuAPVpVehorl8Off0Fr
         ACIHXGZMTVOty3dbLwtmmO4+kQak4d0jD0Qw7sP8S0V631sQIBReYa/8dQFzpz2QK1
         XLPOUbULx+9Gw==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id d16so115741plg.0;
        Tue, 23 Feb 2021 16:47:45 -0800 (PST)
X-Gm-Message-State: AOAM532GMke11jaQy7PAB/PRWJTd2prW0xzTAeBxBYU98Pen/xEqNETX
        KNPQ2bVV7ecjiHtwAETJcvvlaBcyC6lgZZKttfM=
X-Google-Smtp-Source: ABdhPJzEiV46eHqYk065Me9rG6slTcxUJtAGYvm9Wy+O3hVgqP28f+Nz4C4ALZv3OBndQszlinkAERxZx7fUvN6fSmo=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr1462765pji.87.1614127665221;
 Tue, 23 Feb 2021 16:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20210223181425.4010665-1-robh@kernel.org> <20210223181425.4010665-3-robh@kernel.org>
In-Reply-To: <20210223181425.4010665-3-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Feb 2021 09:47:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzTpczHuuHam5kHkaG1UhFE05knp5KeEcd5=Cv_EQEsw@mail.gmail.com>
Message-ID: <CAK7LNARzTpczHuuHam5kHkaG1UhFE05knp5KeEcd5=Cv_EQEsw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: Drop generated syscall headers from 'targets'
To:     Rob Herring <robh@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 24, 2021 at 3:14 AM Rob Herring <robh@kernel.org> wrote:
>
> Including the generated syscall headers in 'targets' is wrong because they
> are not built in $(obj)/ and the Makefile does its own path prefix and
> build rules.
>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/x86/entry/syscalls/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
> index 6fb9b57ed5ba..b0dcb7e41554 100644
> --- a/arch/x86/entry/syscalls/Makefile
> +++ b/arch/x86/entry/syscalls/Makefile
> @@ -62,8 +62,6 @@ syshdr-$(CONFIG_X86_64)               += unistd_32_ia32.h unistd_64_x32.h
>  syshdr-$(CONFIG_X86_64)                += syscalls_64.h
>  syshdr-$(CONFIG_XEN)           += xen-hypercalls.h
>
> -targets        += $(uapisyshdr-y) $(syshdr-y)
> -

This is also a wrong fix.

The correct fix exists in linux-next.

commit 865fa29f7dd1b6af8498fe08f19b4028c1c8a153
Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon Feb 15 09:48:22 2021 +0900

    arch: syscalls: add missing FORCE and fix 'targets' to make if_changed work


I will send a PR this week.



>  PHONY += all
>  all: $(addprefix $(uapi)/,$(uapisyshdr-y))
>  all: $(addprefix $(out)/,$(syshdr-y))
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
