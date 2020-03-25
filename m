Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24F71931A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 21:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCYUKh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 16:10:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34827 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727280AbgCYUKh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 16:10:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id g6so1247037plt.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2020 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jNzyH7EnpWUf8Zb+Itt1+uHYTbc8/5pBIyHGqaUSrO4=;
        b=MEGiICJVD1Daf2cbxxrPQ0bmN7kE511daNuEf5YVKbSSU2fc8eGqlezUG6hF5WAWWN
         4Z29itskZCX43JaPGxgVCCfwcgR7A1FJ2drYNDTMQGykPlEuY6XGU7FqQpPoSz6Qmdpf
         EjY6ys62ECz5N1bvBAw9OHQ1TY8+Bh7xiiKgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jNzyH7EnpWUf8Zb+Itt1+uHYTbc8/5pBIyHGqaUSrO4=;
        b=LgSfawNFk7ZOxrMVikyiBt1NamPjIdIhbm9qKJTeJ3qKzTI8WMbbpiOU6n1n3Ulr8N
         Mur1tHWWhA6SXafIVUHYg+EF2RwFXDXFOygB15QIpp+fuSgfc4z2AXHV+frFPK9iuISm
         WA250clC61pmb8xO+uMSe/iJgGQJFK8FouwtqcokqIVsW9dpPS4hny3iaA5dc8/IcjmU
         pB/a8dqOfC22KapYiq1RO9pOyxFWfNZXpymlbTsdmyxYNqExIiTAe17MRurJSJR1FD+o
         yajCanKdZWNlxsCJRShOuSrf75ALl2NMzlZjU2nUpTagpz+KSZtNAma6IRH5U46YH9Yx
         Z5QA==
X-Gm-Message-State: ANhLgQ2AVaxVLn07VL+yC48XNNgx9teR06+IJXuCc0TSIDucXijspaxS
        PFtxCdxMaidv1am/atp3l3Z/cQ==
X-Google-Smtp-Source: ADFU+vsYp5M/XTtN+TcZk2Nh+XRbqEFhcmQJdL17aNi4dFQGvV40j4QHfLEelW8iB1jV1eqXRaU4+Q==
X-Received: by 2002:a17:90a:7105:: with SMTP id h5mr5632351pjk.54.1585167034299;
        Wed, 25 Mar 2020 13:10:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q9sm17708439pgs.89.2020.03.25.13.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 13:10:33 -0700 (PDT)
Date:   Wed, 25 Mar 2020 13:10:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org,
        Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org,
        x86@kernel.org, gregkh@linuxfoundation.org,
        Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Message-ID: <202003251309.349484C8E@keescook>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325195849.407900-1-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 25, 2020 at 12:58:41PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Hi all,
> 
> I attempted to send this patch on March 19, but it got rejected by the
> mailing lists for some reason, so I'm resending it.
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
> algo	size
> xz  	 6,509,792
> lzma	 6,856,576
> zstd	 7,399,157
> gzip	 8,522,527
> bzip	 8,629,603
> lzo 	 9,808,035
> lz4 	10,705,570
> none	32,565,672
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
> Best,
> Nick Terrell
> 

Hi! Just resending Reviewed-by, since it looks like the earlier v3
didn't make it to the mailing list, as Nick just pointed out to me:

https://lore.kernel.org/lkml/202003201109.00FDE311A7@keescook/

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

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
>  lib/decompress_unzstd.c           | 338 ++++++++++++++++++++++++++++++
>  lib/xxhash.c                      |  21 +-
>  lib/zstd/decompress.c             |   2 +
>  lib/zstd/fse_decompress.c         |   9 +-
>  lib/zstd/zstd_internal.h          |  14 +-
>  scripts/Makefile.lib              |  15 ++
>  usr/Kconfig                       |  20 ++
>  usr/Makefile                      |   1 +
>  20 files changed, 460 insertions(+), 27 deletions(-)
>  create mode 100644 include/linux/decompress/unzstd.h
>  create mode 100644 lib/decompress_unzstd.c
> 
> -- 
> 2.25.1
> 

-- 
Kees Cook
