Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F82BFFC65
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 01:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfKRAP6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Nov 2019 19:15:58 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47071 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfKRAP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 19:15:58 -0500
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id xAI0Fot3021357;
        Mon, 18 Nov 2019 09:15:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com xAI0Fot3021357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574036151;
        bh=2fdS7kMfmR6oyNZKoCSS091Xe4zADe96xKwvxeaKDak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fY4VifiOns06P1Ey+PAugS+QTyjD1WTe+KjIbURzNMtI5bOh6fCR1QcHycIB33zdH
         rDzqHZTdvXKFWA0zcPqXsbv4/M5qKSRL+6qZ9DbMxc0XbFnJJeifpamKtL8obJxD1M
         WtLjccZ4l/esCrIDVpAU6BUo9Tu2JxC4fFadxPZIWzpK5PhXFXLiEYA+OjOGagG5N5
         749VDAr8F2TaOrkjc5xovvMQJsZIoVftfo1J8L6QhQsUiJw+DTULQPrV6fdYBvgoSO
         4oVoQmrBubpNSfFX2SVR9WHdFrAoKIQ9ZgDRxJDhnjcmwqeLYlAdjKsGQ9TXlfNjx1
         YCN7rHRtpxHmQ==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id k24so3671303vko.7;
        Sun, 17 Nov 2019 16:15:51 -0800 (PST)
X-Gm-Message-State: APjAAAWR+nWVz29whKOxn/ZIAh34v+ZdkU4fAfHnK49Yhjf+a92Q9ExR
        JcCs8fOqTJnw0NZnBq2nGwzH6R+ojBpbQ1JJIGg=
X-Google-Smtp-Source: APXvYqyG2Pe51fyDlRjckYvMpaRTqiNxqoXQNw1oMo/NUFnv31lJiYCQua9/O34kkWJPpnuo/Djji7ILtpRKOp+nWmw=
X-Received: by 2002:ac5:cc43:: with SMTP id l3mr6251229vkm.96.1574036150024;
 Sun, 17 Nov 2019 16:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20190528121148.GA18162@lst.de> <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
In-Reply-To: <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 18 Nov 2019 09:15:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
Message-ID: <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
Subject: Re: building individual files in subdirectories
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jens,


(related to  https://lkml.org/lkml/2019/11/15/1152)


I received questions about single builds not working properly
some times in the past.

For example, the following is a post from Christoph to kbuild ML,
and my reply to it.




On Wed, May 29, 2019 at 10:12 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Tue, May 28, 2019 at 9:12 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > A few kernel modules have source files in multiple subdirectories.
> > Trying to build just a single object of a source file in such a
> > subdirectory currently doesn't work.
> >
> > For example:
> >
> > hch@brick:~/work/xfs$ make fs/xfs/libxfs/xfs_alloc.o
> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   DESCEND  objtool
> > scripts/Makefile.build:42: fs/xfs/libxfs/Makefile: No such file or directory
> > make[1]: *** No rule to make target 'fs/xfs/libxfs/Makefile'.  Stop.
> > make: *** [Makefile:1747: fs/xfs/libxfs/xfs_alloc.o] Error 2
> >
> > Is there any reasonably easy way to get this to work?
>
>
> While single targets are useful,
> they never work correctly.
> subdir-ccflags-y from upper Makefiles
> are not inherited.
>
> I want to implement single targets correctly, but
> I have never got around to it.
>
> "make fs/xfs/" is an alternative solution
> although it will compile much more than you want.
>
> Another solution is to put a dummy
> fs/xfs/libxfs/Makefile
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
