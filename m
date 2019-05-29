Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61FAF2D31B
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2019 03:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfE2BN0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 May 2019 21:13:26 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62786 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfE2BNZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 21:13:25 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4T1DEj4010106
        for <linux-kbuild@vger.kernel.org>; Wed, 29 May 2019 10:13:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x4T1DEj4010106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559092394;
        bh=JVo7Gu4s6uCXMWUmPFWX1Tl9nkw2D7/1iYwZy2KQgjM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hbwihhhKTN7JqmNYetwOOt8tfjxiVPwZYZsVeIzRlkua8E7iMLPI1Is81PFnqhIT/
         aFiHk0TyTK5bhr40XQcMlTZyJ7l4YKSXlVqIeuWXSm1anIxMZE8eHY3i56gKqHUj7L
         X6AQZf/aqAL53/lX53DlhP/TO/jGdn6EHNrt/YkYDM7O9xBW3IgJUKAFWY23ahMVIG
         cun+poPXMLZPp4lTSTJHq/JVfh3294yGV7zoT60StFErl1LvWwLG9ignqNhnq8zHAb
         4JkiXYCWDFOtcxn7izZly36k45pqo9RstgBfke1t+6GkTVQOUVt1d9lrlGGrNRaMBW
         T0bEOSL4mFK3w==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id 7so230785uah.1
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2019 18:13:14 -0700 (PDT)
X-Gm-Message-State: APjAAAVW1LLYbYGK33CZKO66q8i6r2uj++0Er7h1vkoPYd9sft4BY1YP
        02T5+Lzj1Njy7i7NO/VWkal188C9374czSB3CE8=
X-Google-Smtp-Source: APXvYqyazbtH+h+SfG6ruKEJWYuaebYqZTHWAQ5FaWtp3DXwAp71P1lMSbJrD22GtDkGIDBa1hgrFfv1gFsnOfMQ8yE=
X-Received: by 2002:a9f:366b:: with SMTP id s40mr29423810uad.121.1559092393373;
 Tue, 28 May 2019 18:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190528121148.GA18162@lst.de>
In-Reply-To: <20190528121148.GA18162@lst.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 29 May 2019 10:12:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
Message-ID: <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
Subject: Re: building individual files in subdirectories
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 28, 2019 at 9:12 PM Christoph Hellwig <hch@lst.de> wrote:
>
> A few kernel modules have source files in multiple subdirectories.
> Trying to build just a single object of a source file in such a
> subdirectory currently doesn't work.
>
> For example:
>
> hch@brick:~/work/xfs$ make fs/xfs/libxfs/xfs_alloc.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   DESCEND  objtool
> scripts/Makefile.build:42: fs/xfs/libxfs/Makefile: No such file or directory
> make[1]: *** No rule to make target 'fs/xfs/libxfs/Makefile'.  Stop.
> make: *** [Makefile:1747: fs/xfs/libxfs/xfs_alloc.o] Error 2
>
> Is there any reasonably easy way to get this to work?


While single targets are useful,
they never work correctly.
subdir-ccflags-y from upper Makefiles
are not inherited.

I want to implement single targets correctly, but
I have never got around to it.

"make fs/xfs/" is an alternative solution
although it will compile much more than you want.

Another solution is to put a dummy
fs/xfs/libxfs/Makefile

-- 
Best Regards
Masahiro Yamada
