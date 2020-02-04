Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1C315142A
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2020 03:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgBDCXV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 21:23:21 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:30282 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgBDCXV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 21:23:21 -0500
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0142MuYg018302;
        Tue, 4 Feb 2020 11:22:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0142MuYg018302
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580782977;
        bh=SYP8mvlfp4LCPh04gPtjz20E46u6IAmKwTPA0CfKfIg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jrLmykN6mxtJ2Yiw5lxGloq0DJZsOChCO2Q8riNsOhvk9hDZTKz32eGG2bDpnzroi
         rat2PzTluadDcT5oR4WCQ+PXYv6KW50pfmlYuk+UQ9QcmDx2t3EKoJUZNAjjrDdoaZ
         qg2wsVzgqq/uqYYDZyElMnvA7IDmUqihTeXMTPzH7UR1/PCgYjkW08vKlmezfKQ9gQ
         fVQyeIDp41HcStofal8ProdtEhlTkvM99gdlvxFiLa3qy6fnwCDvEn8NNiZ84yx75K
         wzVd/14HsFe/hma+UXPDtyJw0nImiaGywSnqXM2uS2daLtQYWg7Rd2Cgy941FVDHzy
         fCCkYywnQGI4w==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id g7so4735061vkl.12;
        Mon, 03 Feb 2020 18:22:57 -0800 (PST)
X-Gm-Message-State: APjAAAWxZD1yEZt6R8CmX0vUSrb7xi1XJVa07dPRQ3OvcZ2GXnwqtqq6
        zWJDsOFcVR/nDx2WsIjDGTYBsegI9JH0V4Snme8=
X-Google-Smtp-Source: APXvYqwe3zxe9hfuDke5qn1vv3ofqQynPyNCI/LCnIO5Ligc29RBUCW4iDTumBajiO3sMQze/jhP7vGscjlIqr5vvns=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr15815541vkd.66.1580782975866;
 Mon, 03 Feb 2020 18:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20200203200656.GA455151@rani.riverdale.lan> <20200203211644.39847-1-nivedita@alum.mit.edu>
In-Reply-To: <20200203211644.39847-1-nivedita@alum.mit.edu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 4 Feb 2020 11:22:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQq7ah1yLOr-fgH-Oo7_NHzvYiy6huY1=4DxJoCGi+cmw@mail.gmail.com>
Message-ID: <CAK7LNAQq7ah1yLOr-fgH-Oo7_NHzvYiy6huY1=4DxJoCGi+cmw@mail.gmail.com>
Subject: Re: [PATCH] initramfs: don't double-compress built-in initramfs if
 the kernel is compressed
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Tue, Feb 4, 2020 at 6:16 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> If the kernel is going to be compressed anyway, there is no point in
> double-compressing the built-in initramfs. Hide the built-in initramfs
> compression choice in this case.
>
> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>


Double-compression slightly reduces the data size.
And, keeping the bare vmlinux small is beneficial, IMHO.




> ---
>  init/Kconfig | 9 +++++++++
>  usr/Kconfig  | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 24b23d843df1..88da0976bbfa 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -176,6 +176,9 @@ config HAVE_KERNEL_LZ4
>  config HAVE_KERNEL_UNCOMPRESSED
>         bool
>
> +config KERNEL_COMPRESSED
> +       bool
> +
>  choice
>         prompt "Kernel compression mode"
>         default KERNEL_GZIP
> @@ -201,6 +204,7 @@ choice
>  config KERNEL_GZIP
>         bool "Gzip"
>         depends on HAVE_KERNEL_GZIP
> +       select KERNEL_COMPRESSED
>         help
>           The old and tried gzip compression. It provides a good balance
>           between compression ratio and decompression speed.
> @@ -208,6 +212,7 @@ config KERNEL_GZIP
>  config KERNEL_BZIP2
>         bool "Bzip2"
>         depends on HAVE_KERNEL_BZIP2
> +       select KERNEL_COMPRESSED
>         help
>           Its compression ratio and speed is intermediate.
>           Decompression speed is slowest among the choices.  The kernel
> @@ -218,6 +223,7 @@ config KERNEL_BZIP2
>  config KERNEL_LZMA
>         bool "LZMA"
>         depends on HAVE_KERNEL_LZMA
> +       select KERNEL_COMPRESSED
>         help
>           This compression algorithm's ratio is best.  Decompression speed
>           is between gzip and bzip2.  Compression is slowest.
> @@ -226,6 +232,7 @@ config KERNEL_LZMA
>  config KERNEL_XZ
>         bool "XZ"
>         depends on HAVE_KERNEL_XZ
> +       select KERNEL_COMPRESSED
>         help
>           XZ uses the LZMA2 algorithm and instruction set specific
>           BCJ filters which can improve compression ratio of executable
> @@ -241,6 +248,7 @@ config KERNEL_XZ
>  config KERNEL_LZO
>         bool "LZO"
>         depends on HAVE_KERNEL_LZO
> +       select KERNEL_COMPRESSED
>         help
>           Its compression ratio is the poorest among the choices. The kernel
>           size is about 10% bigger than gzip; however its speed
> @@ -249,6 +257,7 @@ config KERNEL_LZO
>  config KERNEL_LZ4
>         bool "LZ4"
>         depends on HAVE_KERNEL_LZ4
> +       select KERNEL_COMPRESSED
>         help
>           LZ4 is an LZ77-type compressor with a fixed, byte-oriented encoding.
>           A preliminary version of LZ4 de/compression tool is available at
> diff --git a/usr/Kconfig b/usr/Kconfig
> index bdf5bbd40727..f39eeb9ea2e3 100644
> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -102,7 +102,7 @@ config RD_LZ4
>
>  choice
>         prompt "Built-in initramfs compression mode"
> -       depends on INITRAMFS_SOURCE != ""
> +       depends on INITRAMFS_SOURCE != "" && !KERNEL_COMPRESSED
>         help
>           This option allows you to decide by which algorithm the builtin
>           initramfs will be compressed.  Several compression algorithms are
> --
> 2.24.1
>


-- 
Best Regards
Masahiro Yamada
