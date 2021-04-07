Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA29C356DED
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 15:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344044AbhDGNzI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 09:55:08 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:19099 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235459AbhDGNzH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 09:55:07 -0400
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 137DsbUd007920;
        Wed, 7 Apr 2021 22:54:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 137DsbUd007920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617803678;
        bh=YtWoUN3ZPsUWhPhbrshNrDHcCOmHnarOdLlXttpNK3g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ysf+BHQyyPgeAE7Gemq5BbZP2UUxSJsxCRX5etujSXPnHvaqNJK83p+4644S34uw6
         2pRg1/dmSMGmuC/u1oG/qp9EvpCdYfQmtVJ6Liwzb+MWqzvYPIeXey+t+rRnZRujNe
         r688WsB02YstjER1cGw+clL+NAMwVXTPSfHsEAQ0OBKe/7qMyMe/tTDwEqit2urPZg
         Op2/9M3px/K3L2q1SbdNTHhS0dEA34MvS5bo7ibkS0zlpzoza+RrGG5R2pcITa1f9a
         JUNVAWUBw6JNoKeNku+5ZjXZUj4e5b4HOid9gMm3gO7hd13SAR/oSWfYz1zPITAdA7
         eMuzHDRpqikdQ==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id d124so4121981pfa.13;
        Wed, 07 Apr 2021 06:54:37 -0700 (PDT)
X-Gm-Message-State: AOAM533OBev1zj9nSFSUVVMZ21i74gYXc5zNVg7c8icTuF033EHpyNI+
        acxuvtqlKAaw4kqLTPpfDYRV2YpuFUq/d6tTBVM=
X-Google-Smtp-Source: ABdhPJydeWb3fTOWXvuk/N29VmGSA+vZG3zSPWbsHiieZfXU4PWLt8U2nVdcTEw4SkcgvxDf/6djSdyOkwGzhz29c58=
X-Received: by 2002:a65:428b:: with SMTP id j11mr3431463pgp.47.1617803676818;
 Wed, 07 Apr 2021 06:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
 <20210330115023.qt742qsdekwiroey@spock.localdomain> <33D7F6C9-6F53-471A-A146-7F128F6918F5@fb.com>
 <20210331174826.uhunfmkhlpyteb3d@spock.localdomain> <5288EB41-5257-4B4C-9D37-3C314FA90573@fb.com>
In-Reply-To: <5288EB41-5257-4B4C-9D37-3C314FA90573@fb.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 22:53:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARiB5mDJGjg1Fi1iAHbiP99Z=0_uC9069mQhZ86hE4Vtg@mail.gmail.com>
Message-ID: <CAK7LNARiB5mDJGjg1Fi1iAHbiP99Z=0_uC9069mQhZ86hE4Vtg@mail.gmail.com>
Subject: Re: [PATCH] init: add support for zstd compressed modules
To:     Nick Terrell <terrelln@fb.com>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Valentin Schneider <valentin.schneider@arm.com>,
        "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 1, 2021 at 4:21 AM Nick Terrell <terrelln@fb.com> wrote:
>
>
>
> > On Mar 31, 2021, at 10:48 AM, Oleksandr Natalenko <oleksandr@natalenko.=
name> wrote:
> >
> > Hello.
> >
> > On Wed, Mar 31, 2021 at 05:39:25PM +0000, Nick Terrell wrote:
> >>
> >>
> >>> On Mar 30, 2021, at 4:50 AM, Oleksandr Natalenko <oleksandr@natalenko=
.name> wrote:
> >>>
> >>> On Tue, Mar 30, 2021 at 01:32:35PM +0200, Piotr Gorski wrote:
> >>>> kmod 28 supports modules compressed in zstd format so let's add this=
 possibility to kernel.
> >>>>
> >>>> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> >>>> ---
> >>>> Makefile     | 7 +++++--
> >>>> init/Kconfig | 9 ++++++---
> >>>> 2 files changed, 11 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/Makefile b/Makefile
> >>>> index 5160ff8903c1..82f4f4cc2955 100644
> >>>> --- a/Makefile
> >>>> +++ b/Makefile
> >>>> @@ -1156,8 +1156,8 @@ endif # INSTALL_MOD_STRIP
> >>>> export mod_strip_cmd
> >>>>
> >>>> # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compre=
ssed
> >>>> -# after they are installed in agreement with CONFIG_MODULE_COMPRESS=
_GZIP
> >>>> -# or CONFIG_MODULE_COMPRESS_XZ.
> >>>> +# after they are installed in agreement with CONFIG_MODULE_COMPRESS=
_GZIP,
> >>>> +# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
> >>>>
> >>>> mod_compress_cmd =3D true
> >>>> ifdef CONFIG_MODULE_COMPRESS
> >>>> @@ -1167,6 +1167,9 @@ ifdef CONFIG_MODULE_COMPRESS
> >>>>  ifdef CONFIG_MODULE_COMPRESS_XZ
> >>>>    mod_compress_cmd =3D $(XZ) --lzma2=3Ddict=3D2MiB -f
> >>>>  endif # CONFIG_MODULE_COMPRESS_XZ
> >>>> +  ifdef CONFIG_MODULE_COMPRESS_ZSTD
> >>>> +    mod_compress_cmd =3D $(ZSTD) -T0 --rm -f -q
> >>
> >> This will use the default zstd level, level 3. I think it would make m=
ore sense to use a high
> >> compression level. Level 19 would probably be a good choice. That will=
 choose a window
> >> size of up to 8MB, meaning the decompressor needs to allocate that muc=
h memory. If that
> >> is unacceptable, you could use `zstd -T0 --rm -f -q -19 --zstd=3Dwlog=
=3D21`, which will use a
> >> window size of up to 2MB, to match the XZ command. Note that if the fi=
le is smaller than
> >> the window size, it will be shrunk to the smallest power of two at lea=
st as large as the file.
> >
> > Please no. We've already done that with initramfs in Arch, and it
> > increased the time to generate it enormously.
> >
> > I understand that building a kernel is a more rare operation than
> > regenerating initramfs, but still I'd go against hard-coding the level.
> > And if it should be specified anyway, I'd opt in for an explicit
> > configuration option. Remember, not all the kernel are built on
> > build farms...
> >
> > FWIW, Piotr originally used level 9 which worked okay, but I insisted
> > on sending the patch initially without specifying level at all like it =
is
> > done for other compressors. If this is a wrong approach, then oh meh,
> > mea culpa ;).
> >
> > Whatever default non-standard compression level you choose, I'm fine
> > as long as I can change it without editing Makefile.
>
> That makes sense to me. I have a deep seated need to compress files as
> efficiently as possible for widely distributed packages. But, I understan=
d that
> slow compression significantly impacts build times for quick iteration. I=
=E2=80=99d be
> happy with a compression level parameter that defaults to a happy middle.
>
> I=E2=80=99m also fine with taking this patch as-is if it is easier, and I=
 can put up another
> patch that adds a compression level parameter, since I don=E2=80=99t want=
 to block
> merging this.


I do not want to take such a patch.
Meeking everyone's requirement
results in a bad project for everyone.


Does this work for you?

make modules_install ZSTD=3D"zstd -19"












> Best,
> Nick Terrell
>
> > Thanks!
> >
> >>
> >> Best,
> >> Nick Terrell
> >>
> >>>> +  endif # CONFIG_MODULE_COMPRESS_ZSTD
> >>>> endif # CONFIG_MODULE_COMPRESS
> >>>> export mod_compress_cmd
> >>>>
> >>>> diff --git a/init/Kconfig b/init/Kconfig
> >>>> index 8c2cfd88f6ef..86a452bc2747 100644
> >>>> --- a/init/Kconfig
> >>>> +++ b/init/Kconfig
> >>>> @@ -2250,8 +2250,8 @@ config MODULE_COMPRESS
> >>>>    bool "Compress modules on installation"
> >>>>    help
> >>>>
> >>>> -    Compresses kernel modules when 'make modules_install' is run; g=
zip or
> >>>> -    xz depending on "Compression algorithm" below.
> >>>> +    Compresses kernel modules when 'make modules_install' is run; g=
zip,
> >>>> +    xz, or zstd depending on "Compression algorithm" below.
> >>>>
> >>>>      module-init-tools MAY support gzip, and kmod MAY support gzip a=
nd xz.
> >>>>
> >>>> @@ -2273,7 +2273,7 @@ choice
> >>>>      This determines which sort of compression will be used during
> >>>>      'make modules_install'.
> >>>>
> >>>> -    GZIP (default) and XZ are supported.
> >>>> +    GZIP (default), XZ, and ZSTD are supported.
> >>>>
> >>>> config MODULE_COMPRESS_GZIP
> >>>>    bool "GZIP"
> >>>> @@ -2281,6 +2281,9 @@ config MODULE_COMPRESS_GZIP
> >>>> config MODULE_COMPRESS_XZ
> >>>>    bool "XZ"
> >>>>
> >>>> +config MODULE_COMPRESS_ZSTD
> >>>> +  bool "ZSTD"
> >>>> +
> >>>> endchoice
> >>>>
> >>>> config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
> >>>> --
> >>>> 2.31.0.97.g1424303384
> >>>>
> >>>
> >>> Great!
> >>>
> >>> Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> >>>
> >>> This works perfectly fine in Arch Linux if accompanied by the
> >>> following mkinitcpio amendment: [1].
> >>>
> >>> I'm also Cc'ing other people from get_maintainers output just
> >>> to make this submission more visible.
> >>>
> >>> Thanks.
> >>>
> >>> [1] https://github.com/archlinux/mkinitcpio/pull/43
> >>>
> >>> --
> >>> Oleksandr Natalenko (post-factum)
> >>
> >
> > --
> >  Oleksandr Natalenko (post-factum)
>


--=20
Best Regards
Masahiro Yamada
