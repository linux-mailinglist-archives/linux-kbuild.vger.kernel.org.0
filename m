Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 730E819B4BE
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 19:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732624AbgDARgS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 13:36:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35172 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732137AbgDARgS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 13:36:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id d5so1093703wrn.2;
        Wed, 01 Apr 2020 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=hVnY+iUETxvaa53KF+7YlVvPnziBRpZNnbmz4JpnwDM=;
        b=d5JZaFqZvsBaz5wutHwy1rZca+QVneLtZZWozxNbYfuM2tiqTCszBuWe6nInOEc3rY
         lizhQAnK4KprShLY0a0l90Q0NiZztyjhvmMS4PtF7S0QGyTvOkmlyIxoHcVH1JjiplXA
         j+3tdCU0D9BMXbYagczDDHnaKTwIBx4JATf153M6Xdats0fOV/ALmNYVJ2rqrYVb2KSL
         bQhvuO03+FnQ2ABKfnC2SDfEhwVcZMlQI9NwHqN09RlLmwOHRcVdt8CIWQx7s+m8U+/P
         67SoOFv8dnNWzuJ9Jn0St6XJYQOLSeE/xyhQW3rIRCxVqzbwM5R/UkIW//dqpkKiTuRM
         u5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=hVnY+iUETxvaa53KF+7YlVvPnziBRpZNnbmz4JpnwDM=;
        b=DVMYeNpQDz725h0mcuv2qRNSxUymLAzGxNSHl8CELwfkKGcVhuoHjDKnNVaGeRfFaS
         Ky1tJa6lca1pT4M7vZVhAzUFzrr1KbquhLsoZCY5xT9DuHQdOQ/OXxgnFc2Y1AjK5WEe
         YG1KwWa3CCcwPOPpXdi4jYeEwLJUITw6ULfKcSGGr0BvVY8IQr7PLoJTrn7FV5QUIUv3
         +q9N7RYtTMOz45Svp4BW0bUCKzm228aFmA336fab9tPlJ9cX5Y65USPyWdK99p007t7k
         OsNPdcck+fdN8djvWkdlVyswBt0sT90R2fi/5dqz+uCPdyiZPNT5HJ83l6OP8Yq/OjFG
         hxPQ==
X-Gm-Message-State: ANhLgQ1R79JVW281aInusVNfSAPTkkM0TzwkqdV2VWwPhtLTmE/ycP+Y
        BRVmN1vLKGCWjfNpRMJEQ7N5h0t4bHzL4qV/Lzw=
X-Google-Smtp-Source: ADFU+vuHCaEDXrO+7S2ZUFMtSBmkn1kVDPA6g9ATFQebVzqniiUTC1RS/20eGcww7xUVGOka0VrAoCruRq/o7Ksf7wY=
X-Received: by 2002:adf:a319:: with SMTP id c25mr27093384wrb.197.1585762575967;
 Wed, 01 Apr 2020 10:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200401053913.216783-1-nickrterrell@gmail.com>
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 1 Apr 2020 19:36:20 +0200
Message-ID: <CA+icZUVBqpaeL3KYoasA9nViFEUofA6DUZ5=ZeV48Q19i1QNMQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Add support for ZSTD-compressed kernel and initramfs
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org,
        Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org,
        x86@kernel.org, gregkh@linuxfoundation.org,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 1, 2020 at 7:38 AM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
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

Hi Nick,

thanks for version 4.

I have re-tested against Linux v5.6 final and it boots fine with a
ZSTD-compressed initramfs on Debian/testing AMD64.

Regards,
- Sedat -

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
> 2.26.0
>
