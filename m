Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A2D1DFCBE
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 05:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387451AbgEXD54 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 May 2020 23:57:56 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65498 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgEXD5z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 23:57:55 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 04O3vQ3b032394;
        Sun, 24 May 2020 12:57:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 04O3vQ3b032394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590292647;
        bh=Ae2qcMGFAABdhXLru/aLLCokI5YSUeFUt7ZWMrSWTDY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mVLLRMxTZheTVuaihOIPLR9FHvL3USxoNpqzBiaEIbD45Pm0iBhxdJarV64cPRcrx
         94IgtDjo+7u+HYh5sEOtkV+QiOf2N1tAEqEmDsr+wrU37jFAnStQxdoDEc2F1KylXj
         F4NEA5AAILyORIiskCijCOZg4QPjTRm1IMFnGBcb6+P8NupWopMBUHGG+eMWiiGZyQ
         T2+6mN2JC9n7FAmBm21hkPFzfvqL8i3tsPbCh4yFmQiEYphfrr06Lh6pJtCH0X0V4a
         rDWz/KcsUJpS1IDnGjlMAAzyhw7aguB0aRHm1eSsWK/LgUVWhfHcHNtJeYT2pfKLsD
         MQqx8MolUTSFw==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id a11so5115138uah.12;
        Sat, 23 May 2020 20:57:26 -0700 (PDT)
X-Gm-Message-State: AOAM530Jiy7OhcAidwedSm8mJUwrgFTET8gamKO9DZfD3yZKez1uxhu0
        irGexBE3BK8XBdoI7tNZpGS57055UKvWd2OHv9Y=
X-Google-Smtp-Source: ABdhPJyTCoFzjog8MZtkEAj+WFUAH+ZZvuTXLVjCiE2UuCXN9H99E0/lVgHzD+pTjfGBXrbjmwD8tcLJuFCkahrq5m4=
X-Received: by 2002:ab0:7313:: with SMTP id v19mr15854792uao.121.1590292645381;
 Sat, 23 May 2020 20:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
 <20200520193637.6015-1-ndesaulniers@google.com> <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
 <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
In-Reply-To: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 24 May 2020 12:56:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARofo7wawEF4EcA2-wxnQkKw+WFoJ36EOeYFTUrthRfrA@mail.gmail.com>
Message-ID: <CAK7LNARofo7wawEF4EcA2-wxnQkKw+WFoJ36EOeYFTUrthRfrA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: support compressed debug info
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blakie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 22, 2020 at 6:57 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Wed, May 20, 2020 at 7:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > Suggested-by: Fangrui Song <maskray@google.com>
> >
> >
> > Suggested-by -> Reviewed-by
> >
> > https://patchwork.kernel.org/patch/11524939/#23349551
>
> Yes, my mistake.
>
> > > Suggested-by: Nick Clifton <nickc@redhat.com>
> >
> >
> > I do not know where this tag came from.
> >
> > Nick Clifton taught us the version rule of binutils,but did not state
> > anything about this patch itself.
> >
> > https://patchwork.kernel.org/patch/11524939/#23355175
> >
> >
> > > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> >
> > I do not see the source of this tag, either...
>
> Not all contributions to open source need to be in the form of
> patches.  Both Sedat and Nick gave suggestions which ultimately
> informed the contents of this patch.  They should be rewarded for
> their efforts, and incentivized to help improve the code base further.
> I think suggested by tags are a good way to do that; but if it's
> against a written convention or if you still disagree, it's not the
> end of the world to me, and you may drop those tags from the v3.


Documentation/process/submitting-patches.rst
gives the guideline.


"A Suggested-by: tag indicates that the patch idea is suggested by the person
named and ensures credit to the person for the idea. Please note that this
tag should not be added without the reporter's permission, especially if the
idea was not posted in a public forum. That said, if we diligently credit our
idea reporters, they will, hopefully, be inspired to help us again in the
future."


I think this tag should be given to people who
gave the main idea to come up with
the main part of the patch.


Is that David Blaikie who suggested to
compress the debug info ?
If so, definitely he deserves to have Suggested-by tag.

For the others, I do not think Suggested-by is a good fit.

I appreciate their contribution to improve this patch.
So, maybe you can give credit in other form, for example,
mention it in the commit log explicitly?

Nick Clifton helped us to provide the minimal binutils version.
Sedat Dilet found an increase in size of debug .deb package.


Thanks.

>
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -225,6 +225,21 @@ config DEBUG_INFO_REDUCED
> > >           DEBUG_INFO build and compile times are reduced too.
> > >           Only works with newer gcc versions.
> > >
> > > +config DEBUG_INFO_COMPRESSED
> > > +       bool "Compressed debugging information"
> > > +       depends on DEBUG_INFO
> > > +       depends on $(cc-option,-gz=zlib)
> > > +       depends on $(as-option,-Wa,--compress-debug-sections=zlib)
> >
> > This does not work. (always false)
>
> Technically, always true. `-Wa` disables all warnings from the
> assembler.  Also, I did test this via `make menuconfig`.
>
> > You cannot enable this option.
> >
> > The comma between -Wa and --compress-debug-sections=zlib
> > is eaten by Kconfig parser because commas are delimiters
> > of function parameters.
> >
> >
> > Please write like this.
> >
> >     depends on $(as-option,-Wa$(comma)--compress-debug-sections=zlib)
>
> You're right, I knew this bug forgot. Will fix in v3.
>
> > > +       depends on $(ld-option,--compress-debug-sections=zlib)
> > > +       help
> > > +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> > > +         5.0+, binutils 2.26+, and zlib.
> > > +
> > > +         Users of dpkg-deb via scripts/package/builddeb may
> > > +         wish to set the $KDEB_COMPRESS env var to "none" to avoid recompressing
> > > +         the debug info again with a different compression scheme, which can
> > > +         result in larger binaries.
> >
> > No. This is not correct.
> >
> > CONFIG_DEBUG_INFO_COMPRESSED compresses the only debug info part.
> > The other parts still get by benefit from the default KDEB_COMPRESS=xz.
> >
> >
> > The numbers are here:
> >
> >
> > CONFIG_DEBUG_INFO_COMPRESSED=y
> > -rw-r--r-- 1 masahiro masahiro 209077584 May 21 11:19
> > linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-26_amd64.deb
> >
> >
> > CONFIG_DEBUG_INFO_COMPRESSED=y and KDEB_COMPRESS=none
> > -rw-r--r-- 1 masahiro masahiro 643051712 May 21 11:22
> > linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-27_amd64.deb
> >
> >
> > CONFIG_DEBUG_INFO_COMPRESSED=n
> > -rw-r--r-- 1 masahiro masahiro 112200308 May 21 11:40
> > linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-30_amd64.deb
> >
> >
> >
> >
> > For the deb package size perspective,
> > it is better to keep KDEB_COMPRESS as default.
> >
> > The main motivation for changing KDEB_COMPRESS
> > is the build speed.  (see commit 1a7f0a34ea7d05)
> >
> >
> >
> >
> > CONFIG_DEBUG_INFO_COMPRESSED has a downside
> > for the debug deb package, but we need to accept it.
>
> Ah, I see. Thank you for those measurements.  I'll send a v3 with
> fixed up help text, but ultimately, I don't really care what it says
> here.  Please feel empowered to reword it should you choose to accept
> + apply it.
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOd%3DjOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH%3DUjnw%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
