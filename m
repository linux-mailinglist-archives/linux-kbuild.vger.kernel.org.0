Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830A11AEDE
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfEMCYc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:24:32 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27992 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCYc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:24:32 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4D2ORAM010526;
        Mon, 13 May 2019 11:24:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4D2ORAM010526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714268;
        bh=EjdlPoSEz//GSOzFbKG40Hv0vI25bYnqXLD2D/sxgIU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SYFYhFdBXDv+jwms5kpIy7Ezs5LGXwoQXyPhL2Ht/TI3udC7OcCqENtR+OKpwfKv/
         /mdPuPtrKN5wBN1iLUpaGzA1JVhNTrKWMDvZBa/lTs1lDq++m0YVuYty68jqYh4wtV
         Fta7ATCv5LSiMgihsQegd/Qw61EzSgDTTo3eaI0dgr/xY5BjIvgkIKT6VfWy2Ymt7q
         Wt4NOsfFrOyplI1DF7UKYBzQypjWWIh8mB36NvQ8C7yKbaRkz99zQYMId2dvNHdHKh
         U8+WQ58sszbrzeJcQ0f2246ACOfbosmmQtrFsK53f8Q3/4QpY/htOqXbbKwYrqQSEV
         ZPJOGDnkH9YZQ==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id s30so4212654uas.8;
        Sun, 12 May 2019 19:24:27 -0700 (PDT)
X-Gm-Message-State: APjAAAVGI7vIr+UVU4SVCOVC1+8quejwVwXiFZTjD2tTydhmK2tiYq87
        rfAEBsmFJ/TbgtNTgUQxpN5/NdXMk9ngm8hl7p4=
X-Google-Smtp-Source: APXvYqzRqZvOMRNJIsSJC6YBJA5OafXqidmDyHeDPeNQ53TrOpcHDAYCYUlDWNPXg3pPtH1TcQa5AOIMR3fXD2M0+G4=
X-Received: by 2002:ab0:3058:: with SMTP id x24mr9143479ual.95.1557714266828;
 Sun, 12 May 2019 19:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
 <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com>
 <CAK7LNATgQaHU+6WiMvx0AAf=9AJ5nrL8f8=SJMOCJNQNb_=X1w@mail.gmail.com> <CAKwvOdn7bUOeiE8LobyENmPvYGO3j7rt1N+Ht7tcDWaOBuHhdg@mail.gmail.com>
In-Reply-To: <CAKwvOdn7bUOeiE8LobyENmPvYGO3j7rt1N+Ht7tcDWaOBuHhdg@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:23:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJiQcBSSkdyr6HKQd_v4uWD-2D1S9nhrponaYzivOABg@mail.gmail.com>
Message-ID: <CAK7LNARJiQcBSSkdyr6HKQd_v4uWD-2D1S9nhrponaYzivOABg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        chromeos-toolchain <chromeos-toolchain@google.com>,
        Android-LLVM <android-llvm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 10, 2019 at 1:47 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> > On Thu, May 9, 2019 at 4:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > BTW, is this a speedup when doing CC/LD FLAGS etc checks unconditionally?
> >
> > Yes.
> > cc-option is somewhat costly because it invoked the compiler to
> > check if the given flag is supported.
> >
> > So, I want to get rid of as many cc-option calls as possible.
> >
> >
> > > Asking in general - do you have any numbers :-)?
> >
> > Removing a couple of cc-options does not make
> > a measurable difference in general use-cases.
> >
> > But, this might be more beneficial for chrome OS
> > because $(CC) is a wrapper and invoking it is much more expensive.
>
> Android does too, which we plan on removing as we recently measured
> the performance cost of 5% for having a Python wrapper to aid in
> bisection.
>
> Anyways, I checked these options with clang 4 and gcc 4.6.4 in godbolt.
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> --
> Thanks,
> ~Nick Desaulniers

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
