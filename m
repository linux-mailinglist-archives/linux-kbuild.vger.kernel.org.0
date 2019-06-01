Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C298E318F2
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2019 04:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfFACKP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 May 2019 22:10:15 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31466 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfFACKO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 22:10:14 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x5129pxC020572;
        Sat, 1 Jun 2019 11:09:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5129pxC020572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559354992;
        bh=m5mAnMPwjDlz809r+I3TRHdaHgJqPbJUfMA2Ks6nXoQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OXeFWh5kuMc7PTux0tSwL10409K9U7aOGxjnZO1hWJNDnwx1LePGzmlGuDCbgxoMD
         QpZwvldZiivIxLEHn7dLcZYzH3PIGLliMHztJ5fJZbpo4DVCq0MTyqjeaauCxwewT7
         q7zQF9p9V58dK1SRNhWQNNF6pN+kRbEhj3B1yPyKWCsNvyOGE6t20dbEH5HNUqY50M
         tC+3iaysZEfZ4Oar2sIKZ8pCVUx0bcRkn9r54NiEYO3758lkucCz5NfVrNqe9pMb3C
         eQgktkwUR4/y41lamVDG6kf+D5Evp8dx0l8VtjFQNZzqA7WIvhKY/t8nHkzpMLxlDB
         TlP9QFI1AE87Q==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id f20so2900823ual.0;
        Fri, 31 May 2019 19:09:52 -0700 (PDT)
X-Gm-Message-State: APjAAAW0vJ7+NUTq5IPBh+tnAZAKSNul4dTGGi6X9LkInAnae5ilvXn2
        5npbaH6jzZdNQWr62gNdkP0d/n3FVLqOFc3W6Hw=
X-Google-Smtp-Source: APXvYqwB4BA9jCIMiyU3B9xWJ0d64yGLFmvT3Mp/7QBMvJ549t1LuK/enpEv26YsyVU68yhuPMAWs/m0Dcps68fsJt0=
X-Received: by 2002:ab0:234d:: with SMTP id h13mr6905688uao.95.1559354991160;
 Fri, 31 May 2019 19:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
 <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
 <20190531163908.GB10644@mam-gdavis-lt> <CAK7LNASq8eW0D8fpbxFGhAgR5D158emTR2quCD5ufyC+kK-2GQ@mail.gmail.com>
 <20190531174506.GC10644@mam-gdavis-lt>
In-Reply-To: <20190531174506.GC10644@mam-gdavis-lt>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 1 Jun 2019 11:09:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASazA2496=GkJdJFVw3S7mQ8LaVqHc6dX=FU0DGYtRTBg@mail.gmail.com>
Message-ID: <CAK7LNASazA2496=GkJdJFVw3S7mQ8LaVqHc6dX=FU0DGYtRTBg@mail.gmail.com>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown architecture
To:     "George G. Davis" <george_davis@mentor.com>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 1, 2019 at 2:45 AM George G. Davis <george_davis@mentor.com> wrote:
> > Following this pattern, does this work for you?
> >
> > diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> > index 122aef5e4e14..371bd17a4983 100755
> > --- a/scripts/checkstack.pl
> > +++ b/scripts/checkstack.pl
> > @@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
> >         $x      = "[0-9a-f]";   # hex character
> >         $xs     = "[0-9a-f ]";  # hex character or space
> >         $funcre = qr/^$x* <(.*)>:$/;
> > -       if ($arch eq 'aarch64') {
> > +       if ($arch =~ '^(aarch|arm)64$') {
>
> Yes, that works, thanks!
>
> Will you submit a fix or would you like me to resubmit with the above suggested
> fix?

Please send v2.

Thanks.

-- 
Best Regards
Masahiro Yamada
