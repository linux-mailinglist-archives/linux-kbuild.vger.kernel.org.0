Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E234D3D7113
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 10:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235740AbhG0IVY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 04:21:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:55220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0IVY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 04:21:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE487610A7;
        Tue, 27 Jul 2021 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627374084;
        bh=Jo2YoktZXTB3TdSFh8pxyFvdMsYz7fo2gCON1BnBrLA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PoFu9gDS127p5vKfHa2MG0BMMMBEPMeBsbXA2qR+KuCRtUP1Jv/Xyew2fdHMKqZSS
         J4OAI15N03/dXlyvKWiZO5/pXfjqnnWwQdCJnXiF8JMgJA9dKTP0LRfORTNkvT7uYG
         HKVGogk9WLpSEtZzaE+9ulGZb2a8f2hi6N67t3TCGsqAaiVoh8UUzkzJC6p1lDC+oY
         2Bqni8EHcR4cyZzScm56MrF4G62XlKmf5rhNbXGAqSsJHYj9XECNLT7vMMicruGYjy
         xQ8qvHmtBt4LFBET7uKdJPaDjRq6OTrk+klm1Vx+aRQxpM6YLGGX2Nj1smnAH/2eDs
         0L+t2ETTOAZpQ==
Received: by mail-wr1-f50.google.com with SMTP id h14so6166045wrx.10;
        Tue, 27 Jul 2021 01:21:24 -0700 (PDT)
X-Gm-Message-State: AOAM530VZC5TbNckLL2a45ZwlVf605nfZN5q1HAYWIDEbqE2pkgPffae
        IxOAb5mdt3qen3H5W/ZzT5GSr8F52GwsaHG8uwg=
X-Google-Smtp-Source: ABdhPJxT+Hm4V40nfAGAupZHhEYk9xletb+W0gHabQacQlQUBljdCdtnazoSDFlFmTXrKryEgsU+QpKGK2oy+ZOoJFg=
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr4588576wrq.99.1627374083332;
 Tue, 27 Jul 2021 01:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
 <87r1fkizxl.fsf@disp2133> <CAMuHMdVzNFqAdxK+QTp7ub7LyhDL_3GbVMoAah_s3nGuJ5JN_Q@mail.gmail.com>
 <CAK8P3a2kb2Zzgd1wvi4m2fJeHWA9aONXUriEVfnsOfYTquJ3eA@mail.gmail.com> <CAMuHMdWDDM5pugT8KkP7cRQ4jOGJ43aUO1mic16Bsiv5eN7+Tg@mail.gmail.com>
In-Reply-To: <CAMuHMdWDDM5pugT8KkP7cRQ4jOGJ43aUO1mic16Bsiv5eN7+Tg@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 27 Jul 2021 10:21:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1G4pFR+R2=DiMALLpCn=24=KDfBBeycf_THLk_GoPnbQ@mail.gmail.com>
Message-ID: <CAK8P3a1G4pFR+R2=DiMALLpCn=24=KDfBBeycf_THLk_GoPnbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, Jul 27, 2021 at 9:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jul 27, 2021 at 9:49 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > make -skj30 kernel/ mm/ init/
> >
> > works with the normal Makefile, but fails spectacularly with my nested
> > GNUmakefile because it starts multiple sub-processes that each try to
> > build the same preparation files (I did not try your version).
>
> Seems to work fine with mine...
>

Ok, nevermind. I tried your version and it works for me too. The next
time I get annoyed by this, I'll figure out what I did wrong then;-)

       Arnd
