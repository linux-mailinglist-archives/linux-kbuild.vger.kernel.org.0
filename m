Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E12622BB24
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 02:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgGXAur (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 20:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgGXAur (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 20:50:47 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35B7C0619D3;
        Thu, 23 Jul 2020 17:50:46 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id i18so5914367ilk.10;
        Thu, 23 Jul 2020 17:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ifKaXZeiPHIEultDZ5bkkiqe2SdELJPeAy8i17powzw=;
        b=VRTt5xyIZwRDcn6SBkzxXZp2qt/yStopOOAQFlDj/ZWfTcc1PGH5vghraL/YN2XTl2
         OgJHAswgmkJhBP2kZgT5u8i9tXAKoksgXixNMW46SN5W1p5/bLJwdy29caFM0kFOFbZw
         uzygmT5/kSNq/l2z5fg+8W77pGbEZ61gYM4QC5Fh7bhfuNl9+EiLpMVtTrCZ+CxaG1sk
         gUXRempdZ5SNEq/KsOtbxCtF5YIPrpj137vsco3hTCv+exNpPuYGgfNSb7OR10T6ffQI
         u8q5uq94xLvtzEt6zltVl0Pd2wseW1/GgohBpL5jeB6gatXQ+aY3pucxqQpgYo5AlcNb
         Rs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ifKaXZeiPHIEultDZ5bkkiqe2SdELJPeAy8i17powzw=;
        b=VTVhYT6L04pZUXjLGph4h1GnGtCZG/5x1ZXkkZwrK+h2yFfZa0C8ySi55f/RVk46zr
         8qvTrc7TeVUEdavISkd3ftg4J9Gcl6Je3K8Fgsl/gFsq1M1CB0nlUojhT+2TfdVVi2k7
         MSVreI1+II5fi23ZHyBEk2zq6rZQ6v4ftpQffpsBaXSlCLiDdXLYxbJwQYxqc6LF1egF
         3hx0mam9sG5d8xRP+IUGT0PM74AodEkbkL0MlQps6jzu14isNI31iCwzKlVKcQ6FL+jX
         ddswZwXXL07o5BcJEHRsgTFc8rsgni9x+HzHNiaRFSxbANYTj35niuluuHNndbGuJJwP
         V0vg==
X-Gm-Message-State: AOAM532F6JFfs/b0z4JGkrVZ4KkgQc5nrkdkNnj9qt3nqxonxORTVo5z
        AmNQWVsd1Sa1ObrB9tugKFsTj9mvyou4L69v6SA=
X-Google-Smtp-Source: ABdhPJwDEIkpDnmM+MbKOZDluYvj5ve5dUEgKRkgss245BC2wevpXUbBcBFcVdwctbOrQBKtlTKZWNkZU+N2pE69n/4=
X-Received: by 2002:a92:b705:: with SMTP id k5mr4273672ili.176.1595551846207;
 Thu, 23 Jul 2020 17:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200723192801.351114-1-nickrterrell@gmail.com> <20200723192801.351114-7-nickrterrell@gmail.com>
In-Reply-To: <20200723192801.351114-7-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 24 Jul 2020 02:50:34 +0200
Message-ID: <CA+icZUWV3ANmBj08QZKBtEE38Y-iyCGGxLWtiFkdpKqkGP7ZqQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 23, 2020 at 9:30 PM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
>
> * Add support for zstd compressed kernel
> * Define __DISABLE_EXPORTS in misc.c
> * Bump the heap size for zstd.
> * Update the documentation.
>
> Integrates the ZSTD decompression code to the x86 pre-boot code.
>
> Zstandard requires slightly more memory during the kernel decompression
> on x86 (192 KB vs 64 KB), and the memory usage is independent of the
> window size.
>
> __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
> kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
> duplicate definition warnings.
>

That was reported by Arvind - feel free to add a Reported-by: ...

- Sedat -

> This patch has been boot tested with both a zstd and gzip compressed
> kernel on i386 and x86_64 using buildroot and QEMU.
>
> Additionally, this has been tested in production on x86_64 devices.
> We saw a 2 second boot time reduction by switching kernel compression
> from xz to zstd.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> ---
>  Documentation/x86/boot.rst        | 6 +++---
>  arch/x86/Kconfig                  | 1 +
>  arch/x86/boot/compressed/Makefile | 5 ++++-
>  arch/x86/boot/compressed/misc.c   | 9 +++++++++
>  arch/x86/include/asm/boot.h       | 6 ++++--
>  5 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
> index 5325c71ca877..7fafc7ac00d7 100644
> --- a/Documentation/x86/boot.rst
> +++ b/Documentation/x86/boot.rst
> @@ -782,9 +782,9 @@ Protocol:   2.08+
>    uncompressed data should be determined using the standard magic
>    numbers.  The currently supported compression formats are gzip
>    (magic numbers 1F 8B or 1F 9E), bzip2 (magic number 42 5A), LZMA
> -  (magic number 5D 00), XZ (magic number FD 37), and LZ4 (magic number
> -  02 21).  The uncompressed payload is currently always ELF (magic
> -  number 7F 45 4C 46).
> +  (magic number 5D 00), XZ (magic number FD 37), LZ4 (magic number
> +  02 21) and ZSTD (magic number 28 B5). The uncompressed payload is
> +  currently always ELF (magic number 7F 45 4C 46).
>
>  ============   ==============
>  Field name:    payload_length
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 883da0abf779..4a64395bc35d 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -188,6 +188,7 @@ config X86
>         select HAVE_KERNEL_LZMA
>         select HAVE_KERNEL_LZO
>         select HAVE_KERNEL_XZ
> +       select HAVE_KERNEL_ZSTD
>         select HAVE_KPROBES
>         select HAVE_KPROBES_ON_FTRACE
>         select HAVE_FUNCTION_ERROR_INJECTION
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index 7619742f91c9..3498cd990869 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -26,7 +26,7 @@ OBJECT_FILES_NON_STANDARD     := y
>  KCOV_INSTRUMENT                := n
>
>  targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
> -       vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4
> +       vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4 vmlinux.bin.zst
>
>  KBUILD_CFLAGS := -m$(BITS) -O2
>  KBUILD_CFLAGS += -fno-strict-aliasing $(call cc-option, -fPIE, -fPIC)
> @@ -145,6 +145,8 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
>         $(call if_changed,lzo)
>  $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
>         $(call if_changed,lz4)
> +$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
> +       $(call if_changed,zstd22)
>
>  suffix-$(CONFIG_KERNEL_GZIP)   := gz
>  suffix-$(CONFIG_KERNEL_BZIP2)  := bz2
> @@ -152,6 +154,7 @@ suffix-$(CONFIG_KERNEL_LZMA)        := lzma
>  suffix-$(CONFIG_KERNEL_XZ)     := xz
>  suffix-$(CONFIG_KERNEL_LZO)    := lzo
>  suffix-$(CONFIG_KERNEL_LZ4)    := lz4
> +suffix-$(CONFIG_KERNEL_ZSTD)   := zst
>
>  quiet_cmd_mkpiggy = MKPIGGY $@
>        cmd_mkpiggy = $(obj)/mkpiggy $< > $@
> diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
> index 9652d5c2afda..885dc20680c2 100644
> --- a/arch/x86/boot/compressed/misc.c
> +++ b/arch/x86/boot/compressed/misc.c
> @@ -12,6 +12,11 @@
>   * High loaded stuff by Hans Lermen & Werner Almesberger, Feb. 1996
>   */
>
> +/* decompressors bring in EXPORT_SYMBOL which is meaningless and will
> + * cause compiler errors in some cases.
> + */
> +#define __DISABLE_EXPORTS
> +
>  #include "misc.h"
>  #include "error.h"
>  #include "pgtable.h"
> @@ -77,6 +82,10 @@ static int lines, cols;
>  #ifdef CONFIG_KERNEL_LZ4
>  #include "../../../../lib/decompress_unlz4.c"
>  #endif
> +
> +#ifdef CONFIG_KERNEL_ZSTD
> +#include "../../../../lib/decompress_unzstd.c"
> +#endif
>  /*
>   * NOTE: When adding a new decompressor, please update the analysis in
>   * ../header.S.
> diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
> index 680c320363db..d6dd43d25d9f 100644
> --- a/arch/x86/include/asm/boot.h
> +++ b/arch/x86/include/asm/boot.h
> @@ -24,9 +24,11 @@
>  # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
>  #endif
>
> -#ifdef CONFIG_KERNEL_BZIP2
> +#if defined(CONFIG_KERNEL_BZIP2)
>  # define BOOT_HEAP_SIZE                0x400000
> -#else /* !CONFIG_KERNEL_BZIP2 */
> +#elif defined(CONFIG_KERNEL_ZSTD)
> +# define BOOT_HEAP_SIZE                 0x30000
> +#else
>  # define BOOT_HEAP_SIZE                 0x10000
>  #endif
>
> --
> 2.27.0
>
