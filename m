Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC22C08D2
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 17:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0PoU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 11:44:20 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39500 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbfI0PoU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 11:44:20 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x8RFi4eA009542;
        Sat, 28 Sep 2019 00:44:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x8RFi4eA009542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569599044;
        bh=gzJo/aONCarQ6b7tWSpu8o7T3okifDbbFuC/WDn1Xi0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vZt4KX24r+2VqIonDXQ8Or866HDZfY0HYBwQ56Pd4gTZD3NXViXf4dr7jwy3Oat7x
         6M2PCB6mS0owXlC0SWqMKwG7JepJbDUGU9vR54jl6cCPt67K8lCc0vkOwLxsZaTrUk
         6oyCzwhmWnuQQlxKhgbpFGjHCuKDge8nlKtTRFanx7pNXteNfIpfnyDwTFnwMeQ9Jq
         HtoszZ9bIRBnM4hdxkwCNAPx+MCoeUL2fWFiEknLR6NjYo4gDw+S1OibzWV4ajRIyr
         L3Lhj0ddpuwRJ7vqdAMkMsNo/qE8W+mQqX04h5yXdAyOE6Zcr0AfaZshAVtKvrSgLo
         FE/zjvLOJLmaQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id w195so2146655vsw.11;
        Fri, 27 Sep 2019 08:44:04 -0700 (PDT)
X-Gm-Message-State: APjAAAVNqyNWfmJHkFzjJnPYR4R297hK6A0IpylxRs8bRvjywRHlk7sr
        2a2nModBhS3bOQyhTl/I566qCAROUVLKT5CRIOc=
X-Google-Smtp-Source: APXvYqzkPP+5+gW7UOVviZCc+AsV04mkGbcmhsmIvYpdLtePMFmTpuoMLKu5pZnHmSoI5rPhRho7b9WDFJhyIn7/u5U=
X-Received: by 2002:a67:88c9:: with SMTP id k192mr2745631vsd.181.1569599043639;
 Fri, 27 Sep 2019 08:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190927093603.9140-1-yamada.masahiro@socionext.com> <20190927134108.GC187147@google.com>
In-Reply-To: <20190927134108.GC187147@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 28 Sep 2019 00:43:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARc+jA5MYr7E5hBn2ALJ29o=AQ5j51fU_Z7h7Mc++BHUQ@mail.gmail.com>
Message-ID: <CAK7LNARc+jA5MYr7E5hBn2ALJ29o=AQ5j51fU_Z7h7Mc++BHUQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module namespace
To:     Matthias Maennich <maennich@google.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Matthias,

On Fri, Sep 27, 2019 at 10:41 PM Matthias Maennich <maennich@google.com> wrote:
>
> On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
> >
> >I was hit by some problems caused by the module namespace feature
> >that was merged recently. At least, the breakage of
> >external module builds is a fatal one. I just took a look at the code
> >closer, and I noticed some more issues and improvements.
> >
> >I hope these patches are mostly OK.
> >The 4th patch might have room for argument since it is a trade-off
> >of "cleaner implermentation" vs "code size".
> >
> Thanks Masahiro for taking the time to improve the implementation of the
> symbol namespaces. These are all good points that you addressed!
>
> For [04/07], I can work on this if you do not mind.


Please feel free to.

Thanks for your review.


-- 
Best Regards
Masahiro Yamada
