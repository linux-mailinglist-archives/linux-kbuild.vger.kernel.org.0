Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 340DE19A9DA
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 12:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732191AbgDAK7i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 06:59:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51801 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgDAK7i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 06:59:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id z7so3399805wmk.1;
        Wed, 01 Apr 2020 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wpJNSQ+qvNZfAQszetAscK3jOPsIUHw1iOLZd+eUd/k=;
        b=Oc0gbaNyOsleUS8y2lWADA6BST3xmLEomL8ExTiEGa3HVmSgP6EUlFLNSkICb8Py+n
         xopTiJNocRdmIJFZ59QukYh4eOfhh27LOwWI1JrHi1NhqUMTD4SmcDAtSPir1FBeTE9I
         rqAIKJIzEUEHpT6ydFdOo0eL7jeZWEe6m708Dspp5Yui3aBX/f5NUjFb69gdnMUD8SEB
         2U9OGSBRJBLVkQsdLoywt2dyfqN948JWaeOFnvp/UggSyrY2Urh4JB8lEUUQpzmsO+a4
         PEnMiT55etdZ1rOj4iQM/wV7/JDBXh7JDpZTIIc6PbJLvQlCZQKtIeD0zgAetfRv9w+n
         O4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wpJNSQ+qvNZfAQszetAscK3jOPsIUHw1iOLZd+eUd/k=;
        b=jxhnD936rzw6FAfZd/XBFbBI5263AjlEI1NQHhqDfsaj355SW6rYbBwkUMRLDeacml
         o2MsGWD3PA774HHYKzHMSrzcNtwfHaOayyy6WtW7e0FfyQU9NtcmtiFoCjSGq5C7JFUO
         BN+DtNeYv0Li9X90k6PKO/rlWn2/sDzPA0iLMbagpURECjx30GLv0tn3ZV+FhY2QlCCL
         Zt8wQBxOsQtAm4enKHQvK31ZzVGA1nzrAciRiFrSQzEWWko9YAsEmMrU2XInwt72Zen7
         ZIFRWcgvsob46vrlKbLgCAfMbp+vQKylOTKmIAeQ8vBWFocEZ9LXoSgPJteINyDMVdpt
         1pxg==
X-Gm-Message-State: AGi0PubTGmXxbmyWgoY3e1/obNWr/N2ct7R6YslaP/JGkWfXSGU4nNr+
        dVenT63jTAyM/A==
X-Google-Smtp-Source: APiQypKstB87gbLHuIAAojL50xJ2SpFMLZENza2uTuqOLKTAX01zB76v6RGV1UskaWsn258oALVJHw==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr3735211wmf.4.1585738775119;
        Wed, 01 Apr 2020 03:59:35 -0700 (PDT)
Received: from [192.168.178.40] (business-24-134-37-65.pool2.vodafone-ip.de. [24.134.37.65])
        by smtp.gmail.com with ESMTPSA id f3sm2268196wmj.24.2020.04.01.03.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 03:59:34 -0700 (PDT)
From:   Gabriel C <nix.or.die@googlemail.com>
X-Google-Original-From: Gabriel C <nix.or.die@gmail.com>
Subject: Re: [PATCH v4 0/8] Add support for ZSTD-compressed kernel and
 initramfs
To:     Nick Terrell <nickrterrell@gmail.com>,
        Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
Message-ID: <e16e279f-d220-3fab-5a11-05829f34f1f7@gmail.com>
Date:   Wed, 1 Apr 2020 12:59:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 01.04.20 07:39, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
>
> Hi all,


Hi Nick,


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


I tested this and already v2 and v3 on some boxes without a problem.


Also I've tested :

XZ compressed kernel ZSTD compressed initramfs ( XZ compressed modules )

XZ compressed kernel ZSTD compressed initramfs ( ZSTD compressed modules 
, that need an kmod patch )

ZSTD compressed kernel ZSTD compressed initramfs ( ZSTD compressed 
modules, that need an kmod patch )

ZSTD compressed kernel XZ compressed initramfs ( ZSTD/XZ compressed 
modules )


> On arm and aarch64 I tested the same configurations, except that the kernel is
> always gzip compressed.
>
> Facebook has been using v1 of these patches on x86_64 devices for more than 6
> months. When we switched from a xz compressed initramfs to a zstd compressed
> initramfs decompression time shrunk from 12 seconds to 3 seconds. When we
> switched from a xz compressed kernel to a zstd compressed kernel we saved 2
> seconds of boot time.


I can confirm that on my server I tested the patches decompression went 
down

6 secs and 3.1 seconds faster boot time with zstd compressed kernel.


Also I see around 2++seconds faster boot across all testing boxes.


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
>    - usr/Makefile and init/Kconfig were changed so the patches were updated
> - No functional changes except to rebase
> - Split the patches up into smaller chunks
>
> v2 -> v3:
> - Add *.zst to the .gitignore in patch 8
> - Style nits in patch 3
> - Rename the PREBOOT macro to ZSTD_PREBOOT and XXH_PREBOOT in patches
>    1 through 3
>
> v3 -> v4:
> - Increase the ZSTD_IOBUF_SIZE from 4KB to 128KB to improve performance.
>    With this change I switch from malloc() to large_malloc() for the
>    buffers.
> - Increase the maximum allowed window size from 8 MB to 128 MB, which is
>    the max that zstd in the kernel supports.

Tested-by: Gabriel Craciunescu <nix.or.die@gmail.com>

> Best,
> Nick Terrell
>
> Adam Borowski (1):
>    .gitignore: add ZSTD-compressed files//
>
> Nick Terrell (7):
>    lib: prepare zstd for preboot environment
>    lib: prepare xxhash for preboot environment
>    lib: add zstd support to decompress
>    init: add support for zstd compressed kernel
>    usr: add support for zstd compressed initramfs
>    x86: bump ZO_z_extra_bytes margin for zstd
>    x86: Add support for ZSTD compressed kernel
>
>   .gitignore                        |   1 +
>   Documentation/x86/boot.rst        |   6 +-
>   arch/x86/Kconfig                  |   1 +
>   arch/x86/boot/compressed/Makefile |   5 +-
>   arch/x86/boot/compressed/misc.c   |   4 +
>   arch/x86/boot/header.S            |   8 +-
>   arch/x86/include/asm/boot.h       |   6 +-
>   include/linux/decompress/unzstd.h |  11 +
>   init/Kconfig                      |  15 +-
>   lib/Kconfig                       |   4 +
>   lib/Makefile                      |   1 +
>   lib/decompress.c                  |   5 +
>   lib/decompress_unzstd.c           | 342 ++++++++++++++++++++++++++++++
>   lib/xxhash.c                      |  21 +-
>   lib/zstd/decompress.c             |   2 +
>   lib/zstd/fse_decompress.c         |   9 +-
>   lib/zstd/zstd_internal.h          |  14 +-
>   scripts/Makefile.lib              |  15 ++
>   usr/Kconfig                       |  20 ++
>   usr/Makefile                      |   1 +
>   20 files changed, 464 insertions(+), 27 deletions(-)
>   create mode 100644 include/linux/decompress/unzstd.h
>   create mode 100644 lib/decompress_unzstd.c
>
