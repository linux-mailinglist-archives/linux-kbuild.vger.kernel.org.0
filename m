Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 171F2161008
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 11:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgBQK3B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 05:29:01 -0500
Received: from ozlabs.org ([203.11.71.1]:35505 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728698AbgBQK3B (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 05:29:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LgFQ6rZlz9sRJ;
        Mon, 17 Feb 2020 21:28:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1581935339;
        bh=nEmdpQuucobTW6rpdULzizRAsoI2rsTmZ9yAx2qGur4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NyHWaVkSyuF7cTzcZbwuW426SYGM0A8R3gWMojjCaz5LjwOgg7Rj3F1/oC7p/ONiy
         fVOHT7y6qbWC1pZwURPjZjLVjYLufuM/MOBJjUcpFyZfZK6JinutuyMOw1UqFEftec
         61qlu07DPFeSjZlL/reQfz30XSDIFdJtQ0XGzxqT5TOZgDC1+hNegOvEblHtkQ4pB7
         nyISu8uHKRuOpfitYFzzCM9YwRrIAaLgrO8j+USQi57ZnbZWagEoPHlZFgY8kU4/km
         cRciaA89kOerKA7VsFcU4egklotTxSym5pOge5YOCKwWSTj2xhz0CekhhPruKJuUFk
         NUFzbkw0aJTdg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: install is no longer PHONY?
In-Reply-To: <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
References: <874kvz10rx.fsf@mpe.ellerman.id.au> <CAK7LNASePHZ78O6fnScU_fVHkDOKJEgT+B+OC7NPxkW+tb7q1Q@mail.gmail.com>
Date:   Mon, 17 Feb 2020 21:28:55 +1100
Message-ID: <87d0adfqxk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> Hi Michael,
>
> On Mon, Feb 10, 2020 at 2:15 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Hi Masahiro,
>>
>> I noticed that "install" seems to be no longer PHONY, or at least if I
>> have a file/directory called install then the build doesn't run.
>>
>> eg:
>>   $ touch install
>>   $ make install
>>   make: 'install' is up to date.
>>   $ rm install
>>   $ make install
>>     LDS     arch/powerpc/boot/zImage.lds
>>     WRAP    arch/powerpc/boot/zImage.pseries
>>     WRAP    arch/powerpc/boot/zImage.epapr
>
>
> I think the reason is
> 'install' is not specified as a phony target.
>
> You can add 'PHONY += install' to fix it.
>
>
> PHONY += install    # please add this!
> install:
>         $(Q)$(MAKE) $(build)=$(boot) install
>
>
> Please do so in both arch/powerpc/Makefile and
> arch/powerpc/boot/Makefile.

Oh lol, sorry I didn't realise install was in the arch Makefile.


>> In the past the presence of an install file/directory didn't have any
>> affect.
>>
>> It seems this changed in:
>>   d79424137a73 ("kbuild: do not update config when running install targets")
>>
>> Was that expected?
>>
>> cheers
>
>
> I do not think commit is related.
>
> Prior to this commit, I still see the same issue.
>
>
> $ git checkout d7942413^
> $ touch install
> $ make -s ARCH=powerpc allnoconfig
> $ make  ARCH=powerpc install
> make: 'install' is up to date.

Hmm weird. I did bisect it:

  # bad: [d79424137a7312d381d131d707a462440c0e8df9] kbuild: do not update config when running install targets
  git bisect bad d79424137a7312d381d131d707a462440c0e8df9
  # good: [9c2af1c7377a8a6ef86e5cabf80978f3dbbb25c0] kbuild: add .DELETE_ON_ERROR special target
  git bisect good 9c2af1c7377a8a6ef86e5cabf80978f3dbbb25c0
  # first bad commit: [d79424137a7312d381d131d707a462440c0e8df9] kbuild: do not update config when running install targets

But you're right. I must have messed something up while bisecting.

Sorry for the noise.

cheers
