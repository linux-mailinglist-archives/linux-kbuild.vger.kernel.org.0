Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B95255FE6
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 19:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgH1RmI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 13:42:08 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31220 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgH1RmG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 13:42:06 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 07SHfn14017731
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2020 02:41:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 07SHfn14017731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598636510;
        bh=YyeaZh5P2LRoACaJc8jYnm0u6w5cCMnIvgPPR6e+mbA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=abxnd15UYqNZFSitmrESX1jYwY0tTVMBnYDe/6EsJDfZgeS04+MZlA+/5uiLaVb/E
         P30AUpAkWv5dlmVNcl/eXee9syhpf52oBNfc0tt+03tCkK3kUZl5hYj5Xi5WVUhv+8
         QpdB+ioy+6ycagf+zuvCZUe4pIOrGg8VmArKWvKPOmQZLC1W15njal4D67UEaQWtIR
         LRgDoxp7SWD+lGS5QtOSeadt6CDfMvxpRXZWYt4l3PRB6rt8jjlH59zT8jJRdVM2Bj
         zWKHalHM4yYMaKH5vlBRTYkDCf6rQNhitewf2YMLsC7fy8nWjOVtIfIKnmMAJlPTsA
         aN5YAUqrZzOCw==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id bh1so820252plb.12
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2020 10:41:50 -0700 (PDT)
X-Gm-Message-State: AOAM5314cTxSm7TnysYz1KhvVYxD9oWEtxD4nhUnxnOKn/q3GWN3Nhpb
        kKQfT0F4TYkEHAYG/cV8wq7ZyR4vw5xgFZIbT2M=
X-Google-Smtp-Source: ABdhPJys62xA5tzba78PiECn2vP3arIlzmk0w0sMj+yLFTL0Dw1mV+uq3YxaiRbCwWkhkxNHzl8HG6yUZg9ieuNRibk=
X-Received: by 2002:a17:902:301:: with SMTP id 1mr25378pld.198.1598636509168;
 Fri, 28 Aug 2020 10:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <9c333a75-a851-a055-e879-0967c32e2300@infradead.org>
In-Reply-To: <9c333a75-a851-a055-e879-0967c32e2300@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Aug 2020 02:41:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ25mHHZJaShczfiS=YiZ77EqhjX5QaYubpyPE2Axw4vw@mail.gmail.com>
Message-ID: <CAK7LNAQ25mHHZJaShczfiS=YiZ77EqhjX5QaYubpyPE2Axw4vw@mail.gmail.com>
Subject: Re: ia64 kbuild warning message
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 29, 2020 at 1:34 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Yamada-san,
>
> I am seeing this on ia64 builds:
>
> ../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
> ../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.
>
> with CONFIG_IA64_PALINFO=y
>
> Can you explain, please?
>


This warning is emitted in the archprepare stage.


The following code in arch/ia64/Makefile:

make_nr_irqs_h:
        $(Q)$(MAKE) $(build)=arch/ia64/kernel include/generated/nr-irqs.h



I am wondering if we could merge
arch/ia64/kernel/nr-irqs.c into
arch/ia64/kernel/asm-offsets.c



-- 
Best Regards
Masahiro Yamada
