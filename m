Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9806222BB20
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 02:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgGXAtT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 20:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgGXAtT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 20:49:19 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCC3C0619D3;
        Thu, 23 Jul 2020 17:49:19 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id d18so8241837ion.0;
        Thu, 23 Jul 2020 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=0YxoCeDqJs02B84WCrpwbrG/eJ2jA4Hj8Q3Ee+a5ncc=;
        b=pNbdkZ2rPZYrSE2vEgNNzRo2cr7huzlqVZG0yaKdUSPAq15ltVvxA8ooETrrUihPtx
         boT4hqDJe8Jk4e9Nr9vXIHNjR64yGPXihqHvphd8MqnKjhzmJLiV9WF3MN1BqR9qrz5/
         TFVWmLnVrV4JW0KNSlV6qxEB7fdg6CefPCEQntZ8pQ+ldDG0XVnrERtsvL//g9DZa/Qw
         aOIOCxyleo5GNhLwReMQu/G3Oe+uCZ+HcjojwkpycSJrWvsLsjhYivfxHOZg4DUvx9pG
         LFdJc6vd2SmPYigIYrfgMSUDjUZm9wy3Mm5ppxBkJjHG9bQzkuZNkPNirkkyu9rsjFoU
         F2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=0YxoCeDqJs02B84WCrpwbrG/eJ2jA4Hj8Q3Ee+a5ncc=;
        b=hUkmLUnuxQ3dSH5bL/ikHYBmaYmg18yJVut6pjgDLWUWAYTVG0Nl1JMkiQ9KRT0nXu
         /srTsXkczfHFf7jwIA3hj4rWjMPifk4fTrcmQuTcRE09DAxpiIJ0uZkhyOQFSklz+DMX
         XxK59HG0kT4M1/zXnq5JUYNY1VKvfTInIvKclWCY0OXc/wkt0RwE78KwMOuI0NfsuimM
         xxzFi1rpJARxrk0wnoyIJknNG+/Gy8E448cG0uTaightQypqwwGt/kX/i//HZDLgB0lL
         f5FcmnHNpp8ATtgJuf5o2L0zos/PeG0ODMs/GOUUw7YF1hnHyypFQfcb0h1i9p30wzw8
         nVAg==
X-Gm-Message-State: AOAM531BPQV40QxeLqXNEabhODjER276gW94C20ujEhLcEcgV403Ab+A
        8QCJKWMScrm20bdESa6pBTTy6m09qe4dz0F+p2E=
X-Google-Smtp-Source: ABdhPJwIH/npkVdClHXcPMHOQ1wTdqQ+u/xtBUCN9+Z1E87nUtVjvd0VIWRK5vJZGAhTT2OrJfZ4Kxwc+slPh6o9fbI=
X-Received: by 2002:a05:6602:1555:: with SMTP id h21mr1029212iow.163.1595551758230;
 Thu, 23 Jul 2020 17:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200723192801.351114-1-nickrterrell@gmail.com>
In-Reply-To: <20200723192801.351114-1-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 24 Jul 2020 02:49:06 +0200
Message-ID: <CA+icZUX--O_vmNJq_n-uO75FLE+FPtx-hvNP9HPSN+h6X9en9g@mail.gmail.com>
Subject: Re: [GIT PULL][PATCH v8 0/7] Add support for ZSTD-compressed kernel
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
> Please pull from
>
>   git@github.com:terrelln/linux.git tags/v8-zstd
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

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

> Best,
> Nick Terrell
>
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
>  arch/x86/boot/compressed/misc.c   |   9 +
>  arch/x86/boot/header.S            |   8 +-
>  arch/x86/include/asm/boot.h       |   6 +-
>  include/linux/decompress/unzstd.h |  11 +
>  init/Kconfig                      |  15 +-
>  lib/Kconfig                       |   4 +
>  lib/Makefile                      |   1 +
>  lib/decompress.c                  |   5 +
>  lib/decompress_unzstd.c           | 344 ++++++++++++++++++++++++++++++
>  lib/zstd/fse_decompress.c         |   9 +-
>  lib/zstd/zstd_internal.h          |  14 +-
>  scripts/Makefile.lib              |  22 ++
>  usr/Kconfig                       |  20 ++
>  usr/Makefile                      |   1 +
>  19 files changed, 466 insertions(+), 19 deletions(-)
>  create mode 100644 include/linux/decompress/unzstd.h
>  create mode 100644 lib/decompress_unzstd.c
>
> --
> 2.27.0
>
