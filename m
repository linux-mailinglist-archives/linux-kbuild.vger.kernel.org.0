Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F8A3D70A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 09:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235897AbhG0Hz0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 03:55:26 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:34596 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbhG0HzZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 03:55:25 -0400
Received: by mail-vs1-f54.google.com with SMTP id y18so6695604vsc.1;
        Tue, 27 Jul 2021 00:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pv0Mfi+cKjdrDoWz9Rec/UJjvSyq7O+mu5kO7UGzN8=;
        b=dod+eGFqIphjkO/ZWLQv+EULTBo/u7y0Z2S4c/geWwDEIjfxu9XiOPjPAArMxGevW1
         9Vw0x4mt3x4xYCwz9ArLs6y9hDCj3W2fNlp8vvKV6GASyrfZM0UGV2yyH1hPtURubQns
         SbPZvyGD2iS8Z4bnj3iyTef34qJ9aIryhu4/OouvTG1WUlPQlLADSgAHM4Bul0kOX20x
         1c34fGnUSyH8h3sBZQ9q5OpxT1gKXq2x0vzBCIeOW5h99wu5sil7yMNSVzywqvDkrf+U
         MCNCA6q8vpgtwpFYpMnNa9Aks/IKyrSuLHoFFEEGQ24nuxSLgXMBcCDEOBE1ek6q9qjQ
         rqkw==
X-Gm-Message-State: AOAM530oj+IZ+YWBn9YkiKA9H2Bo3SKliMYdGElntQ6sBRUO4weYsZMf
        wqIzHKzkGNjM4PutbwSmb3F9omYygLwQQdgoI78=
X-Google-Smtp-Source: ABdhPJwUAZPGx2BHHBkEv4ba5/SIZrCbq1DOT4PMkSmrS9hsNFm5jgL/jcz++rg3rSdNjZKQaxO1AHKE+2HyH0CpmCM=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr15392078vsf.40.1627372525463;
 Tue, 27 Jul 2021 00:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
 <87r1fkizxl.fsf@disp2133> <CAMuHMdVzNFqAdxK+QTp7ub7LyhDL_3GbVMoAah_s3nGuJ5JN_Q@mail.gmail.com>
 <CAK8P3a2kb2Zzgd1wvi4m2fJeHWA9aONXUriEVfnsOfYTquJ3eA@mail.gmail.com>
In-Reply-To: <CAK8P3a2kb2Zzgd1wvi4m2fJeHWA9aONXUriEVfnsOfYTquJ3eA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Jul 2021 09:55:14 +0200
Message-ID: <CAMuHMdWDDM5pugT8KkP7cRQ4jOGJ43aUO1mic16Bsiv5eN7+Tg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Arnd,

On Tue, Jul 27, 2021 at 9:49 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Jul 27, 2021 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jul 26, 2021 at 10:27 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> > > Masahiro Yamada <masahiroy@kernel.org> writes:
> > > > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > Does anyone have any ideas?
> > >
> > > Something so we don't have to specify all of these variables on the make
> > > command line would be nice.
> >
> > Just including the main Makefile does not work.
> > That's why I went with the more convoluted solution in
> > https://lore.kernel.org/linux-kbuild/CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g@mail.gmail.com/
>
> This is roughly what I use as well, but it does have the downside that
> it confuses
> the inner 'make' when you build multiple targets in parallel, e.g.
>
> make -skj30 kernel/ mm/ init/
>
> works with the normal Makefile, but fails spectacularly with my nested
> GNUmakefile because it starts multiple sub-processes that each try to
> build the same preparation files (I did not try your version).

Seems to work fine with mine...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
