Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C452E04D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 04:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgLVDrj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 22:47:39 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:24231 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgLVDrj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 22:47:39 -0500
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0BM3ki7I019190;
        Tue, 22 Dec 2020 12:46:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0BM3ki7I019190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608608804;
        bh=XUEAOLTh11mEaQ+qWVQoEUBOJ/w8rUwPR4QKMBXeAkE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cHnTJZj78Yhnu3jFOAQBhLF50wUyGcLGyBQvHPg06rMN1C0RQcJXVhnhBqyfnMmxn
         aR6+pZPifUdWEliqxXGHt3OZUwMgw6p4ihjBQXqcRCmRXH44tWyhF7BgMtC5+WmsHQ
         9vyzXZLYM82t/fejYPe5vqtJdZqxsxQ6PdGHYvNRAXCRmuiGxVQ5l53WrPzplMbRu2
         TBpFucmWNHw3+rSykDJlWe1iUq4/4GX7gkPbcypHWuptvQaUctltEbadTTiQ7FhgdT
         hAMBn8JLJlOYZCBxcHqmFfsj8qlCZVIavgWGGQDQ9iGyg/6z+cJfTJBl2NyZzdX1Qx
         sUJB+hR1r5K+g==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id y8so6720347plp.8;
        Mon, 21 Dec 2020 19:46:44 -0800 (PST)
X-Gm-Message-State: AOAM532cIzcMRoehiz6GD/Shci9+P3vfWvtwjSwMYx/MWNoBC5rnaIPo
        3JnwGnIM39w5rQvK+68ov05shxdXm3QkuoysqNQ=
X-Google-Smtp-Source: ABdhPJxYUMWlJsnjQta17tSqzOnB7nxHplGIb8h74uXsnFg73lmcXJ6QansVqw7+3reXorZ11Opdow82ORJiwW5BNEE=
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr19640523pjb.153.1608608803604;
 Mon, 21 Dec 2020 19:46:43 -0800 (PST)
MIME-Version: 1.0
References: <1608606010-7412-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1608606010-7412-1-git-send-email-yangtiezhu@loongson.cn>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 22 Dec 2020 12:46:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcDYrBj-k72=ZSrFxwoBtQOwO=6c8_DyW2rY-C37g3Og@mail.gmail.com>
Message-ID: <CAK7LNATcDYrBj-k72=ZSrFxwoBtQOwO=6c8_DyW2rY-C37g3Og@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Remove Module.symvers when make clean
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 22, 2020 at 12:00 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Module.symvers still exists when make clean, remove it.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>


NACK.

Module.symver is removed by "make mrproper"
since it is needed for building external modules.



> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e30cf02..8235bb7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1468,7 +1468,7 @@ endif # CONFIG_MODULES
>
>  # Directories & files removed with 'make clean'
>  CLEAN_FILES += include/ksym vmlinux.symvers \
> -              modules.builtin modules.builtin.modinfo modules.nsdeps \
> +              modules.builtin modules.builtin.modinfo modules.nsdeps Module.symvers\
>                compile_commands.json
>
>  # Directories & files removed with 'make mrproper'
> --
> 2.1.0
>


-- 
Best Regards
Masahiro Yamada
