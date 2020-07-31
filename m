Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D66C2343A5
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jul 2020 11:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732134AbgGaJsK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jul 2020 05:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732075AbgGaJsJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jul 2020 05:48:09 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B49C061574;
        Fri, 31 Jul 2020 02:48:09 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id u24so16354478oiv.7;
        Fri, 31 Jul 2020 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=kL/TSt+LdFVrf5GHtACUE/XD2tJJzDN/udRxE/191Xw=;
        b=ED/foMsj1nSwUHlYdZkYd96Y7m/20DqOLgv3otkCpSFCiGU5Rl2U41teCdXoSeNHV9
         zSpTFLAtkmrT+P2b2Ku3LxePob0PUY1CdqHYhSMryKehBcfHEkIcyOajNSIhzYEp4c/S
         tnFhcBPmKpJ++XF1prlTOV0fx89yHj4vp3xrn7lf+kWnzHeLu+UEUOs/qaS1Ec39vnG8
         fbKC8c/ZttPMFqTIGmb4Y8pxfHLM+mI2Gd6n9tn7Y1Q7Q8DDTa9j6/c+fJ78nowyV4PT
         s6BXlZydQiokUDDM/nNSexSJg7TJ9gY1U8ql3359k+g3N76ED4QbsHRmQwLvGn1J8bbH
         vTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=kL/TSt+LdFVrf5GHtACUE/XD2tJJzDN/udRxE/191Xw=;
        b=Ppk1k32/GnBAjPzTjbEbtkVF2XZkUcaApli83ey3U5dEV9An/uzumXmvNLUVdDyt6b
         qm85CnetmGUj68KJAMrTm6uftMeZpohZdohEcMax+4zachYFDsSAaeylDhcbhqpq/rbe
         fWCbfcmivztqQsBkpya5kfHlQFo2wZ8Y129HiIt3QnQFT3dTBiaKyHiJI7qG3VWLorKy
         2sh8ILO2uaW7WatlWMTe50NAQlHVQRxMbjgqRQNASNvrCwnR60D7FZewFQBGA53e9wNP
         SnTnFT45WBd99SB1gheFowVNYguBqBEZxW1aQ2Shx897BLC4FrDKj43JlvP9qfK6q/gT
         Jj9w==
X-Gm-Message-State: AOAM532Q+8oUnqvmYsTEBYA5rsaQ6LKyK5ftI5SUzZqItAfiVnj1FFQ1
        3cUGsYnl5QV5okvsp3+UDrRmA9c0D1sH0+Ih8EPX+ykvubU=
X-Google-Smtp-Source: ABdhPJxUZYp3VeFBEoNe1JgaNj1GOeEgwWJAE4b5wz0Z83TIizdmlGoYzGKvdGw0jk39tZ8P+cddKkdSSAKnhw2Bsz0=
X-Received: by 2002:aca:724f:: with SMTP id p76mr2290303oic.35.1596188888723;
 Fri, 31 Jul 2020 02:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
In-Reply-To: <20200730190841.2071656-1-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 31 Jul 2020 11:47:57 +0200
Message-ID: <CA+icZUVpgNe6yes1fwb3MdhertFweVTgTL=aOrAOnUB8wkLQaA@mail.gmail.com>
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

Hi Nick,

Hope with version 10 of your patchset the review process has an end
and it will picked up into tip Git.

Again: Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Build-environments (more details see [1]):
#0: Debian/unstable AMD64
#1: LLVM v11.0.0-rc1 (clang-11, ld.lld-11 and LLVM "bin"utils)
#2: GCC v10.2 and GNU/ld.bfd v2.35 and GNU/binutils

With the best wishes,
- Sedat -

[1] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-667036028


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
