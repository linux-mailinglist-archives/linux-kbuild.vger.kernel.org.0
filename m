Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E66219B85
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2020 10:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgGIIyU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jul 2020 04:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgGIIyT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jul 2020 04:54:19 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489D1C061A0B;
        Thu,  9 Jul 2020 01:54:19 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id a6so1341932ilq.13;
        Thu, 09 Jul 2020 01:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=6EBAlhyT2LqnCvhAp5nm2Oc+mt6CCfGyEk4uocdE6Qs=;
        b=IIElqN7QwKl0uE6aNTZKcsfK0HLjoK3IKmLSai3s3CHISpD124XQ4Xc4f1AlmxItL4
         RCZbCzcnFtHEp+uNpuy9/ufVOw5MoKECkulKWU2wcXdVf2Eqri1jztUxL1jmvd9RJOog
         jt9Vl6Uqr2ypFlwV0cmNhE/L3+fH7rJN/+AcgkuTtpMHMIZJIhOkhU/tq6aAjG1hg1L6
         PJ3DSy5UMbueiYkZo2jLsvetiz9zDqhpkdEzV3nq6bKqtwOpLAN0rCOJ2uGdytgP15Dx
         t5tUA0yFz3x+msBhbRXQunOJs9eBhzRfxdO/Itl7kl7uIM6fvYRF9clHd4bJEvsIP4kv
         9fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=6EBAlhyT2LqnCvhAp5nm2Oc+mt6CCfGyEk4uocdE6Qs=;
        b=LiO1fdoGMMilSJ0wajULzDuGfLeRQsP/U/8DUdihkjN6vU1G93+eoXy5QX8re+i8ks
         7IKLctdGwZ00ggPqJ/v9VJXiBA8uOMSzdaflgeQqUIOBQslLz6EppSCPmPfs49s0HctO
         IDk1yLdGbwPynvNYVWjiuNlI0SQpbmWej3LMIrvO0x0pErZpSqha0mhFKefpjHl2ZS8C
         PqxPUy4kR+oObPR0HP2dCjGHp+kY7Z4RVLoRQ/2L7+9jMYqHiPK2h4aAVAg7YXFU7OkI
         MXrQh8BO+K5pcUu3fxkS6Uws5G4Dj3HsxqVAqkqQmUfN+/oBcJTfkYWteQINLZWoqQ2k
         Pl7g==
X-Gm-Message-State: AOAM530UaoweD1a0cDna3a9ucTRvkmKJaKTB8Akpztk6S/Og7BkogBhD
        C/J3vKWhyKs/CaL0rUl3SBvArls0zirGpBsQcZY=
X-Google-Smtp-Source: ABdhPJxwtbPG7W/rhlhBrRkD3l1jrUaB1vUqCjVW96u8BSHagLJfY836C/WmFcST7MKHOpjY3f2nP7BObfRGStbqvaw=
X-Received: by 2002:a92:5fc9:: with SMTP id i70mr47971850ill.176.1594284858531;
 Thu, 09 Jul 2020 01:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
In-Reply-To: <20200708185024.2767937-1-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 9 Jul 2020 10:54:07 +0200
Message-ID: <CA+icZUV4WM3oLpRYBTeNqikqP1VeWqKjA_yOdQqg_jTEWah8Qg@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v7 0/7] Add support for ZSTD-compressed kernel
 and initramfs
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
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 8, 2020 at 8:55 PM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
>
> Please pull from
>
>   git@github.com:terrelln/linux.git tags/v7-zstd
>
> to get these changes. Alternatively the patchset is included.
>
> Hi all,
>
> This patch set adds support for a ZSTD-compressed kernel, ramdisk, and
> initramfs in the kernel boot process. ZSTD-compressed ramdisk and initramfs
> are supported on all architectures. The ZSTD-compressed kernel is only
> hooked up to x86 in this patch set.
>
> Zstandard requires slightly more memory during the kernel decompression
> on x86 (192 KB vs 64 KB), and the memory usage is independent of the
> window size.
>
> Zstandard requires memory proprortional to the window size used during
> compression for decompressing the ramdisk image, since streaming mode is
> used. Newer versions of zstd (1.3.2+) list the window size of a file
> with `zstd -lv <file>'. The absolute maximum amount of memory required
> is just over 8 MB, but it can be controlled at compression time.
>
> This patch set has been boot tested with buildroot and QEMU based off
> of linux-5.6-rc6.
>
> On i386 and x86_64 I have tested the following configurations:
> * zstd compressed kernel and a separate zstd compressed initramfs
> * zstd compressed kernel and a built-in zstd compressed initramfs
> * gzip compressed kernel and a separate gzip compressed initramfs
> * gzip compressed kernel and a built-in gzip compressed initramfs
>
> On arm and aarch64 I tested the same configurations, except that the kernel is
> always gzip compressed.
>
> Facebook has been using v1 of these patches on x86_64 devices for more than 6
> months. When we switched from a xz compressed initramfs to a zstd compressed
> initramfs decompression time shrunk from 12 seconds to 3 seconds. When we
> switched from a xz compressed kernel to a zstd compressed kernel we saved 2
> seconds of boot time.
>
> Facebook has been using v2 of these patches on aarch64 devices for a few weeks.
> When we switched from an lzma compressed initramfs to a zstd compressed initramfs
> decompression time shrunk from 27 seconds to 8 seconds.
>
> The zstd compressed kernel is smaller than the gzip compressed kernel but larger
> than the xz or lzma compressed kernels, and it decompresses faster than
> everything except lz4. See the table below for the measurement of an x86_64
> kernel ordered by compressed size:
>
> algo    size
> xz       6,509,792
> lzma     6,856,576
> zstd     7,399,157
> gzip     8,522,527
> bzip     8,629,603
> lzo      9,808,035
> lz4     10,705,570
> none    32,565,672
>
> Alex Xu ran benchmarks in https://lkml.org/lkml/2020/7/1/722.
>
> v1 -> v2:
> - Rebase
>   - usr/Makefile and init/Kconfig were changed so the patches were updated
> - No functional changes except to rebase
> - Split the patches up into smaller chunks
>
> v2 -> v3:
> - Add *.zst to the .gitignore in patch 8
> - Style nits in patch 3
> - Rename the PREBOOT macro to ZSTD_PREBOOT and XXH_PREBOOT in patches
>   1 through 3
>
> v3 -> v4:
> - Increase the ZSTD_IOBUF_SIZE from 4KB to 128KB to improve performance.
>   With this change I switch from malloc() to large_malloc() for the
>   buffers.
> - Increase the maximum allowed window size from 8 MB to 128 MB, which is
>   the max that zstd in the kernel supports.
>
> v4 -> v5:
> - Update commit message for patch 6 in response to comments
> - Rebase onto next-20200408
>
> v5 -> v6:
> - Rebase onto v5.8-rc4
>
> v6 -> v7:
> - (1/7) Don't define or use 'ZSTD_PREBOOT' to hide exports
> - (2/8) Drop 'lib: prepare xxhash for preboot environment'
> - (2/7) Use '__DISABLE_EXPORTS' in unzstd to hide exports
> - (3/7) Update zstd compression cmd to follow other compressors
> - (3/7) Add zstd22 cmd
> - (6/7) Use zstd -22 --ultra (zstd22) for x86 kernel compression
>

Hi Nick,

I have tested version 7 on top of Linux v5.8-rc4+ with LLVM/Clang
version 1:11~++20200701093119+ffee8040534-1~exp1 from
Debian/experimental.

I changed initramfs-tools accordingly:

--- /usr/sbin/mkinitramfs.orig  2020-04-28 05:56:17.000000000 +0200
+++ /usr/sbin/mkinitramfs.zstd-v7       2020-07-09 10:35:35.119280519 +0200
@@ -189,6 +189,7 @@ xz) compress="xz --check=crc32"
        # If we're not doing a reproducible build, enable multithreading
        test -z "${SOURCE_DATE_EPOCH}" && compress="$compress --threads=0"
        ;;
+zstd)  compress="zstd -22 --ultra -v" ;;
 bzip2|lzma|lzop)
        # no parameters needed
        ;;

build-log says:

{ cat arch/x86/boot/compressed/vmlinux.bin
arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
\010\015\315\001; } > arch/x86/boot/compressed/vmlinux.bin.zst

It's a disc-usage save of approx. 500kiB between zstd-v6 and zstd-v7
concerning initrd-images.

Regards,
- Sedat -

> Best,
> Nick Terrell
>
> Adam Borowski (1):
>   .gitignore: add ZSTD-compressed files
>
> Nick Terrell (6):
>   lib: prepare zstd for preboot environment
>   lib: add zstd support to decompress
>   init: add support for zstd compressed kernel
>   usr: add support for zstd compressed initramfs
>   x86: bump ZO_z_extra_bytes margin for zstd
>   x86: Add support for ZSTD compressed kernel
>
>  .gitignore                        |   1 +
>  Documentation/x86/boot.rst        |   6 +-
>  Makefile                          |   3 +-
>  arch/x86/Kconfig                  |   1 +
>  arch/x86/boot/compressed/Makefile |   5 +-
>  arch/x86/boot/compressed/misc.c   |   4 +
>  arch/x86/boot/header.S            |   8 +-
>  arch/x86/include/asm/boot.h       |   6 +-
>  include/linux/decompress/unzstd.h |  11 +
>  init/Kconfig                      |  15 +-
>  lib/Kconfig                       |   4 +
>  lib/Makefile                      |   1 +
>  lib/decompress.c                  |   5 +
>  lib/decompress_unzstd.c           | 345 ++++++++++++++++++++++++++++++
>  lib/zstd/fse_decompress.c         |   9 +-
>  lib/zstd/zstd_internal.h          |  14 +-
>  scripts/Makefile.lib              |  22 ++
>  usr/Kconfig                       |  20 ++
>  usr/Makefile                      |   1 +
>  19 files changed, 462 insertions(+), 19 deletions(-)
>  create mode 100644 include/linux/decompress/unzstd.h
>  create mode 100644 lib/decompress_unzstd.c
>
> --
> 2.27.0
>
