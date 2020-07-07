Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55DC216504
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 06:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgGGEDd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 00:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGGEDc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 00:03:32 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E5AC061755;
        Mon,  6 Jul 2020 21:03:32 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id f23so41746230iof.6;
        Mon, 06 Jul 2020 21:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=D+tVi04ud61P4NPjNc+goY8OYQ1gw/FJ7KDohH2bELM=;
        b=pqe9A/D+LZBFHOlFWSczZDbINuXZFbPcwwRKHfG9MF/FoCsLNat+5kvqnoxEmXpUuT
         3LXyoeq1cROgoTF6UVIPa2FAC2jtkcWywlCe1N/SSSgFVzHJakAlm8ddoJZapjF19iHJ
         OdMs+NGK/L8l4TpMgIQQ4LGcbvYHjra/3RPMV9+J19bPAJQAbJor/uk57bq3i30l1v+q
         6TTh60qBdQZ+iEf72fR4LC8x0QX63QHMNw/6n16VzYWUUyDNkXy+bc/0rZQGjH+f2gkw
         ykLcG1+I1obAKyelvg4Ual1YrkL/00KZGVKYfC1asdB38FuYDRc1ypU7eBWFWa7Dkj/T
         s/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=D+tVi04ud61P4NPjNc+goY8OYQ1gw/FJ7KDohH2bELM=;
        b=kWS5G2Kh9wnPJ2KoaiJcxTmVuqJihtXs4HwskOqEmvso9PYHcyo5Z/1h1PaPrlXVpq
         CuXUsM1J7rOa4EHOZDfwnBSP1UfNvWm6ZlICH+Wai3DRgzOmxt6vlxweu2rnRfU4WtxR
         Xl8xDGCYOYahU2siZZPeJgMXA6RTak9xFOIvpf98IFldlheIxqSNypt8X4dvo+9frzdq
         rp/rnmJ9brXXL1HQUxYPDJJN1Bo7pLBDhY+tbi0oPVeB2xDXrlGLZSIGJcruX/h169bS
         SAnhpR0wckqhJJjVhTaM2tLQniPsXT+S1scgVQ+0PDtPQn9jb3vexMbwZ8OYU/JdY5y8
         DAcw==
X-Gm-Message-State: AOAM533JRmX2mZLK2p/JwtSk2cHCtyka0+HMXz9/w0GnejxfMnxW0vcy
        XodLOzVKah0rDYygyARYQKfaAxlAWO4wIalRJwU=
X-Google-Smtp-Source: ABdhPJzOlQ24ev7zzBaNpMhWH2aWI2Hg5sjYwyQvINhBGbupT9BNBD4F0TMyZRi55+gpmQqdKVfqGdItbRM1ERiMwQI=
X-Received: by 2002:a02:ce9a:: with SMTP id y26mr25428631jaq.121.1594094610524;
 Mon, 06 Jul 2020 21:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
In-Reply-To: <20200707034604.1539157-1-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 7 Jul 2020 06:03:18 +0200
Message-ID: <CA+icZUXvHWj7rDXNXpGL+kTRqC9UMkeUKuCCGiHJnhG6vP4VRQ@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v6 0/8] Add support for ZSTD-compressed kernel
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
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 7, 2020 at 5:50 AM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
>
> Please pull from
>
>   git@github.com:terrelln/linux.git tags/v6-zstd
>
> to get these changes. Alternatively the patchset is included.
>

Hi Nick,

cool, I just pulled from their.
Yesterday, I switched over from Linux v5.7.y to v5.8-rc4.
What a good timing :-).

I will report later.

Regards,
- Sedat -

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
> of linux-5.8-rc4.
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
> Best,
> Nick Terrell
>
> Adam Borowski (1):
>   .gitignore: add ZSTD-compressed files
>
> Nick Terrell (7):
>   lib: prepare zstd for preboot environment
>   lib: prepare xxhash for preboot environment
>   lib: add zstd support to decompress
>   init: add support for zstd compressed kernel
>   usr: add support for zstd compressed initramfs
>   x86: bump ZO_z_extra_bytes margin for zstd
>   x86: Add support for ZSTD compressed kernel
>
>  .gitignore                        |   1 +
>  Documentation/x86/boot.rst        |   6 +-
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
>  lib/decompress_unzstd.c           | 342 ++++++++++++++++++++++++++++++
>  lib/xxhash.c                      |  21 +-
>  lib/zstd/decompress.c             |   2 +
>  lib/zstd/fse_decompress.c         |   9 +-
>  lib/zstd/zstd_internal.h          |  14 +-
>  scripts/Makefile.lib              |  15 ++
>  usr/Kconfig                       |  20 ++
>  usr/Makefile                      |   1 +
>  20 files changed, 464 insertions(+), 27 deletions(-)
>  create mode 100644 include/linux/decompress/unzstd.h
>  create mode 100644 lib/decompress_unzstd.c
>
> --
> 2.27.0
>
