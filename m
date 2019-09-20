Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DADD2B8E76
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2019 12:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393388AbfITKZb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 06:25:31 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47801 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393353AbfITKZb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 06:25:31 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x8KAPMv2021207;
        Fri, 20 Sep 2019 19:25:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x8KAPMv2021207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568975123;
        bh=x8h/QdahB32w+A67J8Ue+J9ol9InBAuxaObhvYQ5Ojc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YJd4pRm/54og7lERv0DoZoctbfD7Loo8bI0VHzyotIfG+Yox0aB8XS96o+iEuU/np
         BKLHCkPCU+T80UbGm1AELtOhnNEfd2MIseTSToj6gi6Br9PTcb26j8mV+G2dnwYsHC
         9UzUL0VUWpLLeRBx13klVSTVRea492fhvgZ2Qhk3PRr4mwchNaAwKD6ghmnoM+F76a
         SE0VZBJzGJOHkB58DbR1hbPwxYvQyicA/k2Pk9VxaS2ZiGF1fAdex/LaKbWYwoDS3p
         zXiMmQr3ggUmT9BR120fve5yTQ2pNKdTBrxI5UOcqAWw+uDTXWYFbPr+tcGBORToZ7
         3gb15UyjHt4pQ==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id r25so2057315uam.3;
        Fri, 20 Sep 2019 03:25:23 -0700 (PDT)
X-Gm-Message-State: APjAAAUTKVuHZ/LCD/BS4UOEHNfyaWT+b22xSzB8+pxVROq2ICDFyYeT
        HagsaH1sXvDv0oPl+5unHw3iWJ5KSzAYlvB+DdA=
X-Google-Smtp-Source: APXvYqzEP9HL+yVsFxZjdyv2WygoXfujkTJMYHuYNswBuVjdSdDTK7GIGWd9j8k3udiku3pig2vbM+of2xYndHQT1ho=
X-Received: by 2002:ab0:261a:: with SMTP id c26mr6581313uao.121.1568975121837;
 Fri, 20 Sep 2019 03:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <1568898377.5576.186.camel@lca.pw>
In-Reply-To: <1568898377.5576.186.camel@lca.pw>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 20 Sep 2019 19:24:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
Message-ID: <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
Subject: Re: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild warning
To:     Qian Cai <cai@lca.pw>
Cc:     Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Qian,

On Thu, Sep 19, 2019 at 10:06 PM Qian Cai <cai@lca.pw> wrote:
>
> The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
> kbuild warning,
>
> scripts/Makefile.asm-generic:25: redundant generic-y found in
> arch/arm64/include/asm/Kbuild: dma-mapping.h
>
>

Which tree did you test?

I tried the latest Linus tree (, which contains 5489c8e0cf03),
but I did not see this warning.



-- 
Best Regards
Masahiro Yamada
