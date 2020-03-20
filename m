Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F3118D693
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2020 19:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgCTSKK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Mar 2020 14:10:10 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:56279 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgCTSKK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Mar 2020 14:10:10 -0400
Received: by mail-pj1-f66.google.com with SMTP id mj6so2850028pjb.5
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2020 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LcE4cAngcd5ELoDW8NeODN2cP6u42Rv3KzADjfbaXt4=;
        b=Rp4aza2U95trEtQEmfUJ1WzknZe8Z1LcppMXw6fYWET+OeV2oxEOvbZUZAZw6k3YLl
         MfygvJ5fwnI3W8ee+IQftE3Dx4cbZPfLkDCAYNvn+dIGfff8eJi+H4rMIOoPwEKdq02v
         DnZf4jLKaO/pWaqnVzsQGpCVxKjVTmS43dN+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LcE4cAngcd5ELoDW8NeODN2cP6u42Rv3KzADjfbaXt4=;
        b=IqPfSbVkuXvjOSJ+Dg0+P+x137d9E9jtKWTwAfX145Zolnz73bS2NcPLFPsqne2KC0
         YHxmYKhsiLKripV9SBPlyIpqsnOAU5sP9dc2jterFAmqJ30WhgJl446H67kwhH7Np/Dr
         g9rGwvUyq8YHWbf76hPrhWF6yObrSC2Tv75d2r/W3UDI1RS+Lef8NvISGa6Kx+IjREo7
         lx5R5iHr6ZDTMK0CYeMH0ERLFp0SKawNUSs/H6gvIIr6FxgCy1euDW1YSp9odjB49uGz
         kN/4EmS01o0g97psDoccrBxlIObOLrn2GaS3vFqy9MZfUqWFSpccV7OQ4VsbbRDW/4zO
         8s9A==
X-Gm-Message-State: ANhLgQ2Q/wO25NUU6PasjDPyhisyjGl6lEdh8AYL/yxUm8lKNNtXP2//
        k6cdE1qFME+XuRZh+c05Ac/PXg==
X-Google-Smtp-Source: ADFU+vtLrdCGR+2iQ5oVuh4bDt/iTMFn0n45e3t38x5UJasOc/ghdspqCTa1EGHK3SBfCkCyRxLJ0Q==
X-Received: by 2002:a17:902:d705:: with SMTP id w5mr9923126ply.68.1584727806759;
        Fri, 20 Mar 2020 11:10:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k3sm6152946pfp.142.2020.03.20.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 11:10:05 -0700 (PDT)
Date:   Fri, 20 Mar 2020 11:10:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Message-ID: <202003201109.00FDE311A7@keescook>
References: <20200319195934.1101679-1-terrelln@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319195934.1101679-1-terrelln@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 19, 2020 at 12:59:26PM -0700, Nick Terrell wrote:
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

This looks good to me! Please consider the series:

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

-- 
Kees Cook
