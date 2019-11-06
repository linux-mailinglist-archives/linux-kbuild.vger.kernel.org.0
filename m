Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC27F0C0F
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 03:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730776AbfKFCeI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 21:34:08 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28580 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfKFCeI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:34:08 -0500
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id xA62XpjV021324;
        Wed, 6 Nov 2019 11:33:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xA62XpjV021324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573007632;
        bh=/TXcE6OfMZXDdJv5sMUD2FGVJpUEeYyJ4vY6yI1UleU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=thpc6CWqdASAPqL82vEL/e8XvpBBc0WEaVOSC+q2QoIFvfJI3MBGii1rrtTvcdgfC
         vimXTZDI3SA83A7pcECoeC6Z2WvCv8KElIFdah/S7sCMuphDWRtTJCsMVpx10XEPbD
         Plm63mps4QywDAN9IGbsIhIgRCe19bqw6t/ff8Tdux/ESK8V5haqLM5QHKN1c7Ggs8
         flqeYIa+8yV9/xBSsmprFhdBUymusUsbl92RwHvB4kVRaCSrB+aAVTaouHMksDtlzA
         C5uHQxC1jDlvOP+O2vSOhhsQAix0jHB0NSeLfzI34phX6gdR161OKv/H0AXxs7WZ4q
         1jiVpMj6k4UMA==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id o9so5114029uat.8;
        Tue, 05 Nov 2019 18:33:51 -0800 (PST)
X-Gm-Message-State: APjAAAWd3JLoP1gLyBStfKVQXHaGskuYWHpnwtIjTLRPkgSstSgwg534
        oxb8oOzNYuQu08HXlCKLDpfcRJUgQdkv4SIf0BM=
X-Google-Smtp-Source: APXvYqxIt8W1O7xMD6iraEuArwv+Kw/pLDf5f+KgRdcdIcYDBoWLYqFeBekIwrHoID/jX2Cg/6ahqYYGExNLBFv8yCw=
X-Received: by 2002:a9f:2382:: with SMTP id 2mr172837uao.95.1573007630854;
 Tue, 05 Nov 2019 18:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20191105113100.521-1-unixbhaskar@gmail.com>
In-Reply-To: <20191105113100.521-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 6 Nov 2019 11:33:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
Message-ID: <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
Subject: Re: [PATCH] scripts: ver_linux:add flex, bison and yacc to the checklist
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 5, 2019 at 8:31 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> This patch add three ulities explicitly to the checklist,namely
> flex,bison and yacc.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/ver_linux | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/ver_linux b/scripts/ver_linux
> index 810e608baa24..397497cf9430 100755
> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux
> @@ -32,6 +32,9 @@ BEGIN {
>         printversion("PPP", version("pppd --version"))
>         printversion("Isdn4k-utils", version("isdnctrl"))
>         printversion("Nfs-utils", version("showmount --version"))
> +       printversion("Bison", version("bison --version"))
> +       printversion("Flex", version("flex --version"))
> +       printversion("Yacc", version("yacc --version"))

I think adding only "Bison" an "Flex" is enough.



>         while (getline <"/proc/self/maps" > 0) {
>                 if (/libc.*\.so$/) {
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
