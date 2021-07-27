Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788433D6FFB
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 09:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbhG0HHr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 03:07:47 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:34574 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbhG0HHq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 03:07:46 -0400
Received: by mail-vs1-f45.google.com with SMTP id y18so6641614vsc.1;
        Tue, 27 Jul 2021 00:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OWWpSAtCNA4RpYoScDMo7iZfNSeN3Kj8E95aS29aW0c=;
        b=V976LsZYohJ4nHeda6z6+o/+suyeUu85TMu/Apv2qkGMcnyH6v3Costu+TfnwX5tEa
         t5qDGOC1YzahSbFTZUYI45cFveoQ5OuZwufcXzXJ8x7GKLT2GGhUtTbO609iOZIpt5In
         9Mauo4OPC65cvQQrQSzfHbvCE01P8iyC6oyapGplXsorsRYH8a3/RoccREdvDQ6BNJyy
         8pisd6q3kcDO46MTOefO361eXyck7249V163Te4q95nJORsc1W4ODaPsjGTCjyVOSyIt
         ev1VEycGLDkxetLETOM3Sefi/hh3S4y0Pv3aKq/O8JAJ9OGbcJHTLevAZuDkOoECL+Qx
         7bAw==
X-Gm-Message-State: AOAM532CO5QMR4IIfd/N1SBlryBKBB3a3GxYEO14oIpxePj4JBpvnHtY
        nh1EPxc3PyNm3y33J0BAFbw/rIfII3PG/qiSVXk=
X-Google-Smtp-Source: ABdhPJw0ZvB7KfTIPyQMU7lOmZQ2F3W1oomxQeOtTJVZJNeTgSOlBZmBscSZNKbCFLNzatcaBK5s6wMWU7v4+lVTipU=
X-Received: by 2002:a67:7789:: with SMTP id s131mr12340280vsc.40.1627369666722;
 Tue, 27 Jul 2021 00:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com> <87r1fkizxl.fsf@disp2133>
In-Reply-To: <87r1fkizxl.fsf@disp2133>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Jul 2021 09:07:35 +0200
Message-ID: <CAMuHMdVzNFqAdxK+QTp7ub7LyhDL_3GbVMoAah_s3nGuJ5JN_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
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
Content-Type: multipart/mixed; boundary="000000000000e7813405c815864b"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000e7813405c815864b
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Mon, Jul 26, 2021 at 10:27 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> >> <torvalds@linux-foundation.org> wrote:
> >> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> >
> >> > We do most of the other heavy lifting in this area in Kconfig anyway,
> >> > why not add that compiler choice?
> >> >
> >> > Obviously it would be gated by the tests to see which compilers are
> >> > _installed_ (and that they are valid versions), so that it doesn't ask
> >> > stupid things ("do you want gcc or clang" when only one of them is
> >> > installed and/or viable).
> >>
> >> I don't see a good way of making Kconfig options both select the
> >> compiler and defining variables based on the compiler, since that
> >> would mean teaching Kconfig about re-evaluating all compiler
> >> dependent settings whenever the first option changes.
> >>
> >> I do have another idea that I think would work though.
> >>
> >> > Hmm? So then any "LLVM=1" thing would be about the "make config"
> >> > stage, not the actual build stage.
> >> >
> >> > (It has annoyed me for years that if you want to cross-compile, you
> >> > first have to do "make ARCH=xyz config" and then remember to do "make
> >> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> >> > never really cared).
> >>
> >> The best thing that I have come up with is a pre-configure step, where
> >> an object tree gets seeded with a makefile fragment that gets included
> >> for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
> >> 'CC=' and possibly any other option that gets passed to 'make' as
> >> a variable and has to exist before calling 'make *config'.
> >
> >
> > There is no need to add a hook to include such makefile fragment(s).
> >
> > Quite opposite, you can put your Makefile (in a different filename)
> > that includes the top Makefile.
> >
> >
> > I think this is what people are already doing:
> >
> >
> > GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
> > in this order.
> >
> >
> > So, you can put 'GNUmakefile' with your favorite setups.
> >
> >
> > $ cat GNUmakefile
> > ARCH=arm64
> > CROSS_COMPILE=aarch64-linux-gnu-
> > CC=clang
> > include Makefile
>
> Very weird.
>
> I just tested this and it does not work.
> I did this:
>
> $ cat GNUmakefile
> ARCH = alpha
> CROSS_COMPILE = $(arch-prefix alpha)
> include Makefile
>
> In one of my build directories and the main makefile simply does not see
> the value of ARCH or CROSS_COMPILE I set.  I have confirmed that my
> GNUmakefile is being read, because everything breaks if I remove the
> include line.
>
> Does anyone have any ideas?
>
> Something so we don't have to specify all of these variables on the make
> command line would be nice.

Just including the main Makefile does not work.
That's why I went with the more convoluted solution in
https://lore.kernel.org/linux-kbuild/CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g@mail.gmail.com/

Please try the attached, which combines everything above in a single
file, and which works for me. Note that "$(arch-prefix alpha)" didn't
work for me (it resolved to "gcc"?), so I used "alpha-linux-gnu-"
instead.

Good luck!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--000000000000e7813405c815864b
Content-Type: application/octet-stream; name=GNUmakefile
Content-Disposition: attachment; filename=GNUmakefile
Content-Transfer-Encoding: base64
Content-ID: <f_krlpouog0>
X-Attachment-Id: f_krlpouog0

TUFLRUFSR1MgPSBBUkNIPWFscGhhIENST1NTX0NPTVBJTEU9YWxwaGEtbGludXgtZ251LQoKTUFL
RUZMQUdTICs9IC0tbm8tcHJpbnQtZGlyZWN0b3J5CgouUEhPTlk6IGFsbCAkKE1BS0VDTURHT0FM
UykKCmFsbAk6PSAkKGZpbHRlci1vdXQgYWxsIE1ha2VmaWxlLCQoTUFLRUNNREdPQUxTKSkKCmFs
bDoKCUAkKE1BS0UpICQoTUFLRUFSR1MpICQoYWxsKSAtZiBNYWtlZmlsZQoKTWFrZWZpbGU6OwoK
JChhbGwpOiBhbGwKCUA6CgolLzogYWxsCglAOgo=
--000000000000e7813405c815864b--
