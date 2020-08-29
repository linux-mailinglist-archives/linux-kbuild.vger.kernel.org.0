Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857F0256513
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 08:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgH2G3W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 02:29:22 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:57369 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgH2G3V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 02:29:21 -0400
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07T6Sxov013611;
        Sat, 29 Aug 2020 15:28:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07T6Sxov013611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598682539;
        bh=D0KDDfZRswDZUpbRNqoXENgbaSZ1/hZOTYmHbtoCsdE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cWXQxthh2n73pWOHxkf8aYe5Nm6wkQrWxISZ3qlLkywglNRU2Fr07JYAabPCBOQZe
         ATg20QO2nEJbZTkbV2QdT3tNKyCcKFnBt6hmq5cR2J7xoIf1CHepwEY8nHHA+n1a8f
         Q0vESdgZiLfwbPtY5kF6mscE8J7h1MhNyx9glWM6G687Cd2NwVP7rwlDSwW8WOMfpi
         CwI1yMWivLUcOUiYgGMDEu6DKpjF4KG/Tr+BcWMif+89BB2LkyqChDTdCp439xx5Yk
         jLN2jE067H70nhx4fULPjSadxQYd2TBUNLzHAaBPW3bWV5N8i+5H9XkgtZzjuB49pm
         IQhAmZe/dQBdw==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id v16so677282plo.1;
        Fri, 28 Aug 2020 23:28:59 -0700 (PDT)
X-Gm-Message-State: AOAM531/KFEaJ8c8zK32KJ3u6RcDsHgd0emyY+PCq3sUK5Qd3bG1x4Jo
        ZQVE7HLrSRFoctFN/HjAgedp70PUVkqgnNqIlRE=
X-Google-Smtp-Source: ABdhPJwvhbZW7ZeMw5RrwwUFv/gAzHE/i2Jwa8e06clO7+Y+fLN5/snjiw/k41ofQ5rYMAeyvyJwjxugYdwBXenMQew=
X-Received: by 2002:a17:90a:6f01:: with SMTP id d1mr2007164pjk.198.1598682538080;
 Fri, 28 Aug 2020 23:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <21eddfa7-2b7c-00c4-ad5b-40878036f987@infradead.org>
In-Reply-To: <21eddfa7-2b7c-00c4-ad5b-40878036f987@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Aug 2020 15:28:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATA5vpEaPHXEgnzR3PDpPZbXYXNtr2ZOgyL2QqVxcmE_g@mail.gmail.com>
Message-ID: <CAK7LNATA5vpEaPHXEgnzR3PDpPZbXYXNtr2ZOgyL2QqVxcmE_g@mail.gmail.com>
Subject: Re: [PATCH] microblaze: fix kbuild redundant file warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 29, 2020 at 3:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build warning since this file is already listed in
> include/asm-generic/Kbuild.
>
> ../scripts/Makefile.asm-generic:25: redundant generic-y found in arch/microblaze/include/asm/Kbuild: hw_irq.h
>
> Fixes: 7e8f54cd4e26 ("microblaze: Remove empty headers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



> ---
>  arch/microblaze/include/asm/Kbuild |    1 -
>  1 file changed, 1 deletion(-)
>
> --- linux-next-20200825.orig/arch/microblaze/include/asm/Kbuild
> +++ linux-next-20200825/arch/microblaze/include/asm/Kbuild
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generated-y += syscall_table.h
>  generic-y += extable.h
> -generic-y += hw_irq.h
>  generic-y += kvm_para.h
>  generic-y += local64.h
>  generic-y += mcs_spinlock.h
>


-- 
Best Regards
Masahiro Yamada
