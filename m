Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C89023B541
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Aug 2020 08:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgHDGwv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Aug 2020 02:52:51 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40070 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgHDGwv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Aug 2020 02:52:51 -0400
Received: by mail-oi1-f194.google.com with SMTP id u24so25599100oiv.7;
        Mon, 03 Aug 2020 23:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YjoIFzh9jDU8UWoCt7/Wn0DBpRmUwyFzM9/YPPK7imw=;
        b=STgyjJJVqnqx3ixwHe52rNq4BumDhAjgmSgLW/O52KUqRvRoDpSSIgtMU+dN+mIYYw
         e6lmneuTy0w3cSPwpZNye18su3IaXFTiZ7+sGpHoEdiXHOmF/3Invd46j82Jwm8VGcJ3
         emTAAA2eSmyCmb3SPtVvEfAvRC/zdiknjXZLHRyeIJdlOrhJLm9LGeH/Tkf1Kd9kT0bw
         YylSbW1MGqVJO142Wk7a4jAQrGdKs/3jQzp+YJ8CLSB05Ph7IesuC4NtrwwjsyinGOhy
         Nq/rPD2Ky7+ubRfo6h211NNnjeOCMq+Lf9a+mdBX6AoyUC/geaF2H98C+TehRtdOVpuW
         7P6w==
X-Gm-Message-State: AOAM532j2pTBQXrAcPK77+Wd+x14mnAsqbmB6j41mpKlqUm9wnh2WjGI
        TN5HC7O2bKrHn/yFnk9aD4/qwnXq1t3uRzIuGTA=
X-Google-Smtp-Source: ABdhPJxFTAkjpZMVeiV3uuc77tz+ACjHfNblvrN7DrWnLuH3m4wUZZRm1qoHrkEuv4rBUUxZpjMT02uM5m/KDrmwPHs=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr2146263oie.153.1596523970050;
 Mon, 03 Aug 2020 23:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200730190841.2071656-1-nickrterrell@gmail.com> <20200730190841.2071656-5-nickrterrell@gmail.com>
In-Reply-To: <20200730190841.2071656-5-nickrterrell@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Aug 2020 08:52:38 +0200
Message-ID: <CAMuHMdUo5tfcEUaq4x_b9HJy25HXWmBZ3GPfqJy491zDsct5Rg@mail.gmail.com>
Subject: Re: [PATCH v10 4/8] usr: add support for zstd compressed initramfs
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
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
        Sedat Dilek <sedat.dilek@gmail.com>,
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

Hi Nick,

On Thu, Jul 30, 2020 at 9:13 PM Nick Terrell <nickrterrell@gmail.com> wrote:
> From: Nick Terrell <terrelln@fb.com>
>
> * Add support for a zstd compressed initramfs.
> * Add compression for compressing built-in initramfs with zstd.
>
> I have tested this patch by boot testing with buildroot and QEMU.
> Specifically, I booted the kernel with both a zstd and gzip compressed
> initramfs, both built into the kernel and separate. I ensured that the
> correct compression algorithm was used. I tested on arm, aarch64, i386,
> and x86_64.
>
> This patch has been tested in production on aarch64 and x86_64 devices.
>
> Additionally, I have performance measurements from internal use in
> production. On an aarch64 device we saw 19 second boot time improvement
> from switching from lzma to zstd (27 seconds to 8 seconds). On an x86_64
> device we saw a 9 second boot time reduction from switching from xz to
> zstd.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Terrell <terrelln@fb.com>

Thanks for your patch, which is now commit a30d8a39f0571425 ("usr: Add
support for zstd compressed initramfs").

> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -100,6 +100,15 @@ config RD_LZ4
>           Support loading of a LZ4 encoded initial ramdisk or cpio buffer
>           If unsure, say N.
>
> +config RD_ZSTD
> +       bool "Support initial ramdisk/ramfs compressed using ZSTD"
> +       default y
> +       depends on BLK_DEV_INITRD
> +       select DECOMPRESS_ZSTD
> +       help
> +         Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
> +         If unsure, say N.

I'm aware you copied this from the other entries, but IMHO "default y",
and "If unsure, say N" are not a good combination.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
