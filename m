Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF54C22D5AE
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Jul 2020 09:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgGYHLg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Jul 2020 03:11:36 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:43336 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgGYHLe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Jul 2020 03:11:34 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 06P7B5Nd005519;
        Sat, 25 Jul 2020 16:11:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 06P7B5Nd005519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595661066;
        bh=d3InI1VVfElwvZtiK1EJpZoPZ0MHQAF4lkyE7t5IMCY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ug3AMUv+aVybHO8RrqxkRdu03RrhhjXlmafDHXXs+8G4SR3Xh9v+C8V9I9tllnsTl
         zEZBW8clLMT8YDbQFEfiLlvmzddvI7bTjxLnZT2tUPvNGcth2+oaJrqmVUhuPyMtiq
         2wrecwUuzvMkcu9/2x0u8V+df4TunERG2XznU0duiS28mhSloGAt3IhFLmzz+utHCC
         T4EOhgtgkOc+2hlGLaGYObGZHcEtH3Vgwozl07xU+ZmJL2msJM4plnmZN8vs82tVKW
         UEf77wJccM4bahGV6+9w4NlWJCfdTeqsOqh0sZvBuojQOrdeOdHsNBOH1lkAjsY7B/
         hAbsLh9XuALbA==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id o184so6087067vsc.0;
        Sat, 25 Jul 2020 00:11:06 -0700 (PDT)
X-Gm-Message-State: AOAM531gbPo4NkvUwBpYbCVQLK/2oV17LrhyifweKViCQCd/Wr4xr5Mj
        3ld0ULt+JdojvvYBNNFgFFz05ZHE7K+0VJGZkPU=
X-Google-Smtp-Source: ABdhPJxnn0cDW4QfE/Cqf45OS5FtAHclEj0aonCizfe3lqDX0oeFHWbBwI2ZiDRXD6JduLFgjHpexLY8DeowjAJmIVE=
X-Received: by 2002:a67:6c84:: with SMTP id h126mr10186763vsc.181.1595661064889;
 Sat, 25 Jul 2020 00:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200722004707.779601-1-masahiroy@kernel.org> <CAMo8BfJv38cPOAOOMGn8R7-CtBy2BCbMRkMAeXNZ=A4YbtTPbw@mail.gmail.com>
In-Reply-To: <CAMo8BfJv38cPOAOOMGn8R7-CtBy2BCbMRkMAeXNZ=A4YbtTPbw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Jul 2020 16:10:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNASexG=PFPSRFSsVyrM1CTy-NN9aJC1TFAt_4HCJ+XU48g@mail.gmail.com>
Message-ID: <CAK7LNASexG=PFPSRFSsVyrM1CTy-NN9aJC1TFAt_4HCJ+XU48g@mail.gmail.com>
Subject: Re: [PATCH] xtensa: add boot subdirectories build artifacts to 'targets'
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 22, 2020 at 12:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 5:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Xtensa always rebuilds the following even if nothing in the source code
> > has been changed. Passing V=2 shows the reason.
> >
> >   AS      arch/xtensa/boot/boot-elf/bootstrap.o - due to bootstrap.o not in $(targets)
> >   LDS     arch/xtensa/boot/boot-elf/boot.lds - due to boot.lds not in $(targets)
> >
> > They are built by if_changed(_dep). Add them to 'targets' so .*.cmd files
> > are included.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/xtensa/boot/boot-elf/Makefile     | 1 +
> >  arch/xtensa/boot/boot-redboot/Makefile | 1 +
> >  2 files changed, 2 insertions(+)
>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
>
> --
> Thanks.
> -- Max


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
