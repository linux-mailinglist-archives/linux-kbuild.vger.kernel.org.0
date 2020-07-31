Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24B82347E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jul 2020 16:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgGaOgv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jul 2020 10:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbgGaOgv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jul 2020 10:36:51 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366F5C061574;
        Fri, 31 Jul 2020 07:36:51 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 93so12622000otx.2;
        Fri, 31 Jul 2020 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=0s74CoRQx9G2oGbEWX9C4xO3AxwKq60685FFXFdf9YE=;
        b=dXYC4xyQNXW+ZlZmJxASnoGlRMvgFEggncOqjkLK7FymRc/yLhqvrqAPPIreaudJbA
         NIxYJaOI5T+0b+Jd5jpJvsV60p96Z+b2hz+fnR1jR+H3yGcagUfYBAsRLrFrmGyaiIwC
         j+PFVtg3V0ekmziJPn2unQTHp0jr1CuwpwMyyFstPENmL5FbsbWUfdx7TG3PhtKsC8Fc
         AqHi0i9e5euVQYmwHzMWFHpOmsFAUYA+MS0w11vE6FjZgJzz0v6u5HeaLCegsEyhXjft
         E8ukExHq8EpnC1smuw8WYGWZN4jjoNIGIcBWb7rED14E4gwpBTpIvKf+GzPwZJ/3gDb+
         HWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=0s74CoRQx9G2oGbEWX9C4xO3AxwKq60685FFXFdf9YE=;
        b=kxPp89JMp2/mWUFfHg0lgSsf/xBrX6RvQ6EtyoHHo+lTwLBEphNx7DTzfNQxv5zBU1
         ZPHclUNykPviInjzwy3CpR6Ip0YWUlKHbIQlqgbUYhZocmyjo+nwGGCdEpXt9g2KbfSL
         IWktiKSHPM8UiKl+jxaq6gLX/zgLw4Kqki3+aR+8AQxDthz5lD5xGDcmbI0nrXOgjMxT
         eMJdeFldzrrdaRIZZPsTJuU8mu35qDeNK03nsb+tOYu7DYUP6f3pK59senGMOjdCCemv
         JQs5WpWQ1+QrHdWus2PxRsNFQ7MqBAHn2zMM0Vy2WI7ogEf43PrWeDYfeIFv+BRuYEso
         xZMg==
X-Gm-Message-State: AOAM533IWP5I+GaxIzu77ybdaExfG0ZQdOPgM/cwfW76m5FM4lFk+MeB
        Wk2u/DwmL22TJImB/p7OFccn1Y//GAGBH/0UOFo=
X-Google-Smtp-Source: ABdhPJwaHK6ReBPoDVG6TtMdV2nbhGWOR5+HYYEzZfMAsCrT2JpR3y5cRk/2YwX3rMdaoAqtx4qj3+Iljuyxq5iNVsE=
X-Received: by 2002:a9d:5e5:: with SMTP id 92mr3411933otd.9.1596206210481;
 Fri, 31 Jul 2020 07:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
In-Reply-To: <20200730190841.2071656-1-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 31 Jul 2020 16:36:39 +0200
Message-ID: <CA+icZUV4FOMG0vAyoEPcqbjmNYEE0oPDw=A2kYD=s72K=0GpTA@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v10 0/8] Add support for ZSTD-compressed kernel
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 30, 2020 at 9:11 PM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
>
> Please pull from
>
>   git@github.com:terrelln/linux.git tags/v10-zstd
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
> v7 -> v8:
> - (2/7) Don't define '__DISABLE_EXPORTS'
> - (6/7) Define '__DISABLE_EXPORTS' in misc.c
>
> v8 -> v9:
> - Rebase onto v5.8-rc7
> - (2/7) Fix nits about comment style & typos
> - (3/7) Fix typo in init/Kconfig description
> - (6/7) Explain BOOT_HEAP_SIZE increase and define __DISABLE_EXPORTS in
>         Makefile KBUILD_CFLAGS and remove definitions from kaslr.c and misc.c
>
> v9 -> v10:
> - (6/8) Fix commit message regarding __DISABLE_EXPORTS
> - (8/8) Add .zst files to Documentation/dontdiff
>

Looks like v10 was pushed to <tip.git#x86/boot>.

Thanks to all involved people!

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/boot

> Best,
> Nick Terrell
>
> Adam Borowski (1):
>   .gitignore: add ZSTD-compressed files
>
> Nick Terrell (7):
>   lib: prepare zstd for preboot environment
>   lib: add zstd support to decompress
>   init: add support for zstd compressed kernel
>   usr: add support for zstd compressed initramfs
>   x86: bump ZO_z_extra_bytes margin for zstd
>   x86: Add support for ZSTD compressed kernel
>   Documentation: dontdiff: Add zstd compressed files
>
>  .gitignore                        |   1 +
>  Documentation/dontdiff            |   1 +
>  Documentation/x86/boot.rst        |   6 +-
>  Makefile                          |   3 +-
>  arch/x86/Kconfig                  |   1 +
>  arch/x86/boot/compressed/Makefile |   6 +-
>  arch/x86/boot/compressed/kaslr.c  |   7 -
>  arch/x86/boot/compressed/misc.c   |   4 +
>  arch/x86/boot/header.S            |   8 +-
>  arch/x86/include/asm/boot.h       |  11 +-
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
>  21 files changed, 469 insertions(+), 26 deletions(-)
>  create mode 100644 include/linux/decompress/unzstd.h
>  create mode 100644 lib/decompress_unzstd.c
>
> --
> 2.27.0
>
