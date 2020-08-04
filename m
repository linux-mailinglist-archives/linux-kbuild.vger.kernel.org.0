Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C31B23B596
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Aug 2020 09:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgHDHZg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Aug 2020 03:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbgHDHZf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Aug 2020 03:25:35 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B14C06174A;
        Tue,  4 Aug 2020 00:25:35 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id z11so1020042oon.5;
        Tue, 04 Aug 2020 00:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=3G6duaqKS+iqVSYEuxdfn+liPqqsSiNQMWQkrp/rtcA=;
        b=P+oC1ONX4KhsZvaMwr9JFGsSROK1t2WF8nWhL5Hb8WlbFKQcfjnffuj5cHtyDXhTQe
         RtZ2sbTg4+PrRlYLSiyDjOOOnYVQbPjoeqHiOnUxGAs/YqTy1MkqtHmAeXR537w3YEbf
         BhQ+AeypP5X7Qz2CxJPJ/VX/W8AYeiTh6dyQTbQRnC6MgKKSPMS1yzts1edOkNPNcsls
         BAeHs8BqCJsk0tMUbC525jtBsTJNnhrPSEfmKInyz42f2CGeNyYv/LoW9Df+k1R/3HEq
         PWtqACBeJGC1XbRWBkibV9geaauVi1aWrie/ld1nlJa4l3F3rN+y3HuDVw93r7k6LUTs
         j72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=3G6duaqKS+iqVSYEuxdfn+liPqqsSiNQMWQkrp/rtcA=;
        b=k4ge71sBwNIZk6XAj4E7AGQStzc7S6aPI7xWbc9Td52HnE0t74pRCksaOojj7ZI2wq
         aqvpyuFXkmvtxiSHjp8vaLCY4FNhbp+7n4JLMiUxCIuv3RB+ea92R0FMMx9y8zRRkPpi
         TtvM9QAG/7lg7cAhZTyYYZKpVsjHCaljc+E/PhM4Fhil5GWtU1lYcWbofZCoIiBKjlK6
         eTDBJ8BgUTU2vS89IRbpos5FCtwC8rFR9H2SZ2pQ7vI7kzbDlFcem4csqrF5xuiJlGXR
         mf9RUKJMB8GzfaqYC1rKGY8xgIweBmqqmA7HytiMRGV3HeBCiGTqWcuBub075UulDnrh
         rpWg==
X-Gm-Message-State: AOAM530+U24lF/1Um5XmkLSX9KdOGoqgvx3jfQy45k4sDMRro0Sul0CI
        fXdZ2cGWp3suGgUWuHkcD6EqSlTgwfpu3iLFOkI=
X-Google-Smtp-Source: ABdhPJxRuEKIkrFsD8hgOom6KFNXxJ1GrBXHYx0gjfD8gbX84cPUXN3kfUBPjtHwww2sbHWbMVw7OYS2H0mw+tE+r/w=
X-Received: by 2002:a4a:dfd4:: with SMTP id p20mr7546616ood.86.1596525934626;
 Tue, 04 Aug 2020 00:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
 <20200730190841.2071656-5-nickrterrell@gmail.com> <CAMuHMdUo5tfcEUaq4x_b9HJy25HXWmBZ3GPfqJy491zDsct5Rg@mail.gmail.com>
In-Reply-To: <CAMuHMdUo5tfcEUaq4x_b9HJy25HXWmBZ3GPfqJy491zDsct5Rg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 4 Aug 2020 09:25:23 +0200
Message-ID: <CA+icZUXGbV1x0YJn-0mLA2TtU2jWS6PO3bqdDrqJBMYOMS9Eog@mail.gmail.com>
Subject: Re: [PATCH v10 4/8] usr: add support for zstd compressed initramfs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Ingo Molnar <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 4, 2020 at 8:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Nick,
>
> On Thu, Jul 30, 2020 at 9:13 PM Nick Terrell <nickrterrell@gmail.com> wrote:
> > From: Nick Terrell <terrelln@fb.com>
> >
> > * Add support for a zstd compressed initramfs.
> > * Add compression for compressing built-in initramfs with zstd.
> >
> > I have tested this patch by boot testing with buildroot and QEMU.
> > Specifically, I booted the kernel with both a zstd and gzip compressed
> > initramfs, both built into the kernel and separate. I ensured that the
> > correct compression algorithm was used. I tested on arm, aarch64, i386,
> > and x86_64.
> >
> > This patch has been tested in production on aarch64 and x86_64 devices.
> >
> > Additionally, I have performance measurements from internal use in
> > production. On an aarch64 device we saw 19 second boot time improvement
> > from switching from lzma to zstd (27 seconds to 8 seconds). On an x86_64
> > device we saw a 9 second boot time reduction from switching from xz to
> > zstd.
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Signed-off-by: Nick Terrell <terrelln@fb.com>
>
> Thanks for your patch, which is now commit a30d8a39f0571425 ("usr: Add
> support for zstd compressed initramfs").
>
> > --- a/usr/Kconfig
> > +++ b/usr/Kconfig
> > @@ -100,6 +100,15 @@ config RD_LZ4
> >           Support loading of a LZ4 encoded initial ramdisk or cpio buffer
> >           If unsure, say N.
> >
> > +config RD_ZSTD
> > +       bool "Support initial ramdisk/ramfs compressed using ZSTD"
> > +       default y
> > +       depends on BLK_DEV_INITRD
> > +       select DECOMPRESS_ZSTD
> > +       help
> > +         Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
> > +         If unsure, say N.
>
> I'm aware you copied this from the other entries, but IMHO "default y",
> and "If unsure, say N" are not a good combination.
>

Hi Geert,

you are right - for new stuff it should be "default n".

What I am missing - still - is a note - that your user-space should
have the correct bits to support zstd-initramfs.
Unsure where to place such an information.

If you send a patch for above feel free to add my:

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

Thanks.

Regards,
- Sedat -

[1] https://bugs.debian.org/955469

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
