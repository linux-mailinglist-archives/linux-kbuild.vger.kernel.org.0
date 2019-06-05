Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444E835B44
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2019 13:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfFEL3v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Jun 2019 07:29:51 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:18127 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfFEL3v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Jun 2019 07:29:51 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x55BThr4023935;
        Wed, 5 Jun 2019 20:29:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x55BThr4023935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559734184;
        bh=bujSVOPDmVIdKwoGDrNqagrzcEvHKAapyl9W5rclyIQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M8e3A4paeWv1Rk+ChhYRKbpXvwUYCnXFa300HtyGKnu30uU09n5eP56Lmb7R2CQD3
         aciaaB/myHE4qvEJf5yE5wda9vr8QZVcgFGqlWn+ok0fWb5RVVFpootXwQZJmYf3ZH
         WbkuTAJn3ow0O9cLjtOJsrPebgEd2fFzLKOqWUA/h92hoUMS/S+BH8AG7jn7urVabf
         jNgH4K0cCVYPDSXE1/PUYHriY74TpLtEfeUBDr1RD2PE2ELqSA4zDhZ50tMBg3zRsv
         MGf2nGa5A3p6yJYf0XYJuR2iSTlw8CxdUFpCIDpOZCRWGGs9UDykRSbfmMHYMvrvnA
         kSKlcUSkhGx4g==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id l125so15412314vsl.13;
        Wed, 05 Jun 2019 04:29:43 -0700 (PDT)
X-Gm-Message-State: APjAAAXXePtbcQOYhv3bHI8B2Rmaj2A/uCeJyaeAHeWZ2SGa5Wlvorh3
        I2DTRA2VZjLZzsrR6rSNizK3IbJe0FEIbENSHM4=
X-Google-Smtp-Source: APXvYqzJue7ZjLWp60MMqbuwjVbzlIfqBJ8ddQ/y7vWB10W5mIJYautJKHwqVx0dSshy76SivadMhOYQn3yJisMYKyI=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr1403661vsl.155.1559734182801;
 Wed, 05 Jun 2019 04:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190605111416.13341-1-jslaby@suse.cz>
In-Reply-To: <20190605111416.13341-1-jslaby@suse.cz>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 5 Jun 2019 20:29:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQxW9x1mVa742vD7-NJuUNh=pTNqfT8BRUt=hs_7EiE2w@mail.gmail.com>
Message-ID: <CAK7LNAQxW9x1mVa742vD7-NJuUNh=pTNqfT8BRUt=hs_7EiE2w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: s390, do not remove autogenerated headers on clean
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 5, 2019 at 8:14 PM Jiri Slaby <jslaby@suse.cz> wrote:
>
> 'make clean' does NOT remove autogenerated headers generated from
> arch/s390/kernel/syscalls/. For example:
> asm-offsets.h
> irq_regs.h
> irq_work.h
> unistd_nr.h
>
> But 'make clean' DOES currently remove dis-defs.h and facility-defs.h
> generated from arch/s390/tools/.
>
> The issue is that facility-defs.h is included from <asm/facility.h> and
> builds of external modules fail due to missing header. (When cleaned
> build directory is used.)
>
> Fix this by adding these targets to no-clean-files.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>
> I would love to see comments from KBuild guys as I am not sure if this
> fix is correct at all.


This issue had already been fixed by the side-effect of
another patch, which is in linux-next.



See this:


commit 10077c9f2dae1afabab2808a0326ecf3e8e5a82c
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri May 17 16:54:27 2019 +0900

    s390: drop meaningless 'targets' from tools Makefile

    'targets' should be specified to include .*.cmd files to evaluate
    if_changed or friends.

    Here, facility-defs.h and dis-defs.h are generated by filechk.

    Because filechk does not generate .*.cmd file, the 'targets' addition
    is meaningless. The filechk correctly updates the target when its
    content is changed.

    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
    Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>


Thanks.


-- 
Best Regards
Masahiro Yamada
