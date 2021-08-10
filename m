Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AD33E5044
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Aug 2021 02:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbhHJAH4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Aug 2021 20:07:56 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16916 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237108AbhHJAHz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Aug 2021 20:07:55 -0400
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17A073gm027642;
        Tue, 10 Aug 2021 09:07:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17A073gm027642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628554023;
        bh=YHT1wdO9BJeEnVYWadet580A1QtIyBQoR9aiFtvfZGQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qpeaZfj1S52In9OqzugDwJq7LR5sf7DfsN2Ra4D4/7Mj7Sk8kVQ+Ze4SEJu9nxAWr
         zuOtjmoizVRjdYz+IQ1+0hk8/3F2IkCEiA2JrFs51NCRM2ZTqC5Oz6bzK7nbjxIe86
         Z4E0Ot1qLc47QDixlLSWr2EeR9DD9eoLOPKsiB/dE4KOQ+zO2rG8SnFmK9m//xIJyL
         IzO79wsh46l09Bdey5qYnr7xjz6Mp0DFimoh1qGoaQeyaHrOihwNammcKKBbKJDr2d
         Q0l6y+oOFPYo0z0mNu9C0TpATi4L3yAjIbTSVJ2i+uAHpW8cmyS4JrZDGyxB7uj4bb
         KYwCOXGXlc7XA==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id j3so18531277plx.4;
        Mon, 09 Aug 2021 17:07:03 -0700 (PDT)
X-Gm-Message-State: AOAM531hLOgbSq7Md+AJ3QkWY66rLc67hOigjihaUpsY84xskrgxQs6F
        qvHaWI/gIFhQlpeGGkqhjvbkS99C5g6YR9cK2tg=
X-Google-Smtp-Source: ABdhPJz5g2UH5l3Gvz6QSJjrySe0RZ6IE4VBgrreB7tp3UOmjppEP2ZS0P89yIPjgFj+aYeVphRC5LeTe/8xavReZBE=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr282732pgj.47.1628554022572;
 Mon, 09 Aug 2021 17:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210806172701.3993843-1-ndesaulniers@google.com> <YQ2TGPwjvn8w4rKs@archlinux-ax161>
In-Reply-To: <YQ2TGPwjvn8w4rKs@archlinux-ax161>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 10 Aug 2021 09:06:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARitJhPF5sggQ_k2885TSS3VbKQ0APAE7G8ANsYxxmz1g@mail.gmail.com>
Message-ID: <CAK7LNARitJhPF5sggQ_k2885TSS3VbKQ0APAE7G8ANsYxxmz1g@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/Makefile.clang: default to LLVM_IAS=1
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Khem Raj <raj.khem@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 7, 2021 at 4:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Aug 06, 2021 at 10:27:01AM -0700, Nick Desaulniers wrote:
> > LLVM_IAS=1 controls enabling clang's integrated assembler via
> > -integrated-as. This was an explicit opt in until we could enable
> > assembler support in Clang for more architecures. Now we have support
> > and CI coverage of LLVM_IAS=1 for all architecures except a few more
> > bugs affecting s390 and powerpc.
>
> The powerpc and s390 folks have been testing with clang, I think they
> should have been on CC for this change (done now).
>
> > This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> > LLVM_IAS=0.  CI systems or developers that were previously doing builds
> > with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> > explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> > opted-in.
> >
> > This finally shortens the command line invocation when cross compiling
> > with LLVM to simply:
> >
> > $ make ARCH=arm64 LLVM=1
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I am still not really sure how I feel about this. I would prefer not to
> break people's builds but I suppose this is inevitabile eventually.
>
> A little support matrix that I drafted up where based on ARCH and clang
> version for LLVM_IAS=1 support:
>
>              | 10.x | 11.x | 12.x | 13.x | 14.x |
> ARCH=arm     |  NO  |  NO  |  NO  |  YES |  YES |
> ARCH=arm64   |  NO  |  YES |  YES |  YES |  YES |
> ARCH=i386    |  YES |  YES |  YES |  YES |  YES |
> ARCH=mips*   |  YES |  YES |  YES |  YES |  YES |
> ARCH=powerpc |  NO  |  NO  |  NO  |  NO  |  NO  |
> ARCH=s390    |  NO  |  NO  |  NO  |  NO  |  NO  |
> ARCH=x86_64  |  NO  |  YES |  YES |  YES |  YES |
>
> The main issue that I have with this change is that all of these
> architectures work fine with CC=clang and their build commands that used
> to work fine will not with this change, as they will have to specify
> LLVM_IAS=0. I think that making this change for LLVM=1 makes sense but
> changing the default for just CC=clang feels like a bit much at this
> point in time. I would love to hear from others on this though, I am not
> going to object much further than this.
>
> Regardless of that concern, this patch does what it says so:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>


Applied to linux-kbuild.
Thanks.


-- 
Best Regards
Masahiro Yamada
