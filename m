Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC511218FFC
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgGHSzA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgGHSzA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:00 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA6EC061A0B;
        Wed,  8 Jul 2020 11:55:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u185so18320470pfu.1;
        Wed, 08 Jul 2020 11:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XYyhFadv6jcxuvO1GDSe2+Q+rr3i8d41ZQJ8Z5mT2yE=;
        b=D6yF1QCvaGUv9XXQaKTSdELkYvA2sai8HnnWsCQeTep2zELOCFXHOubl9Rm9WfPUrn
         NbVD20Zqdnups1GfAVIE53ErV3yOROk5827Kmt4B5gXjy7H6bMEJq8sgEatN3hCYJFo2
         7/zpu3hdAme34HTUQoX7FaXjjYaOF93+1FofRN3C7WUmb6bd5QzS1XXaTfq0MZC201x2
         1tYSnAv6GauqmVKfg6Kbw/H0T1BYl9WpKxroreCWVwx+sURcIlFAq8VEzu1hoVUOtveI
         eoTWvEqnyFqbqIgY3xe4RfJouPTdN3eUxdSK7P0YXuq/A3t0K6LeYui/rN7Dc9qwl4vR
         FNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XYyhFadv6jcxuvO1GDSe2+Q+rr3i8d41ZQJ8Z5mT2yE=;
        b=THv37SgpLFAXUHjxMuRfsSGT04DH29Ee3mDV8XGBUKCvR450LPV4eWmgb1bWOsa9Lx
         CacGJejgZ9X8OCP8Ba9Y0gtiSG5rONfn15Yyhf2EjmyxH+4GbW/OHt0Y7BO6axnjrlf6
         oP6hM5EW7N9jXgYWDUqpWwRhxGT+0hrVDLsCb/ysISkaog+V8CmMzULSkIkc5I7BXoF0
         NE9jX8mj4f9I9LDQV0kcCh/I1LXo7yd68n7S1pMpZDwFWn+7W7oa3tN0wwobuyjZKPbZ
         18eKAseLb0LF+MvdSeFad2kdFUKsnZ5HGG9CieCUtizymbbrk+O9SFwGg0G+DRaVrh90
         Cgqg==
X-Gm-Message-State: AOAM530YMNwn8abPhbRdXtqSEHKHiUSS8ND3c7ag8Zhqz92ugbzpmpO9
        86vfSg8vbTmHga9cXMCN0g0=
X-Google-Smtp-Source: ABdhPJwDSevOtq9vWg/3Lx9i23j6UPeG/NlZDV7nBYOjxOfM0C/v9KQhCSE7zlwupjQNp5eCi54mLg==
X-Received: by 2002:a63:ec05:: with SMTP id j5mr51832333pgh.109.1594234499797;
        Wed, 08 Jul 2020 11:54:59 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:54:59 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Subject: [GIT PULL][PATCH v7 0/7] Add support for ZSTD-compressed kernel and initramfs
Date:   Wed,  8 Jul 2020 11:50:17 -0700
Message-Id: <20200708185024.2767937-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Please pull from

  git@github.com:terrelln/linux.git tags/v7-zstd

to get these changes. Alternatively the patchset is included.

Hi all,

This patch set adds support for a ZSTD-compressed kernel, ramdisk, and
initramfs in the kernel boot process. ZSTD-compressed ramdisk and initramfs
are supported on all architectures. The ZSTD-compressed kernel is only
hooked up to x86 in this patch set.

Zstandard requires slightly more memory during the kernel decompression
on x86 (192 KB vs 64 KB), and the memory usage is independent of the
window size.

Zstandard requires memory proprortional to the window size used during
compression for decompressing the ramdisk image, since streaming mode is
used. Newer versions of zstd (1.3.2+) list the window size of a file
with `zstd -lv <file>'. The absolute maximum amount of memory required
is just over 8 MB, but it can be controlled at compression time.

This patch set has been boot tested with buildroot and QEMU based off
of linux-5.6-rc6.

On i386 and x86_64 I have tested the following configurations:
* zstd compressed kernel and a separate zstd compressed initramfs
* zstd compressed kernel and a built-in zstd compressed initramfs
* gzip compressed kernel and a separate gzip compressed initramfs
* gzip compressed kernel and a built-in gzip compressed initramfs

On arm and aarch64 I tested the same configurations, except that the kernel is
always gzip compressed.

Facebook has been using v1 of these patches on x86_64 devices for more than 6
months. When we switched from a xz compressed initramfs to a zstd compressed
initramfs decompression time shrunk from 12 seconds to 3 seconds. When we
switched from a xz compressed kernel to a zstd compressed kernel we saved 2
seconds of boot time.

Facebook has been using v2 of these patches on aarch64 devices for a few weeks.
When we switched from an lzma compressed initramfs to a zstd compressed initramfs
decompression time shrunk from 27 seconds to 8 seconds.

The zstd compressed kernel is smaller than the gzip compressed kernel but larger
than the xz or lzma compressed kernels, and it decompresses faster than
everything except lz4. See the table below for the measurement of an x86_64
kernel ordered by compressed size:

algo	size
xz  	 6,509,792
lzma	 6,856,576
zstd	 7,399,157
gzip	 8,522,527
bzip	 8,629,603
lzo 	 9,808,035
lz4 	10,705,570
none	32,565,672

Alex Xu ran benchmarks in https://lkml.org/lkml/2020/7/1/722.

v1 -> v2:
- Rebase
  - usr/Makefile and init/Kconfig were changed so the patches were updated
- No functional changes except to rebase
- Split the patches up into smaller chunks

v2 -> v3:
- Add *.zst to the .gitignore in patch 8
- Style nits in patch 3
- Rename the PREBOOT macro to ZSTD_PREBOOT and XXH_PREBOOT in patches
  1 through 3

v3 -> v4:
- Increase the ZSTD_IOBUF_SIZE from 4KB to 128KB to improve performance.
  With this change I switch from malloc() to large_malloc() for the
  buffers.
- Increase the maximum allowed window size from 8 MB to 128 MB, which is
  the max that zstd in the kernel supports.

v4 -> v5:
- Update commit message for patch 6 in response to comments
- Rebase onto next-20200408

v5 -> v6:
- Rebase onto v5.8-rc4

v6 -> v7:
- (1/7) Don't define or use 'ZSTD_PREBOOT' to hide exports
- (2/8) Drop 'lib: prepare xxhash for preboot environment'
- (2/7) Use '__DISABLE_EXPORTS' in unzstd to hide exports
- (3/7) Update zstd compression cmd to follow other compressors
- (3/7) Add zstd22 cmd
- (6/7) Use zstd -22 --ultra (zstd22) for x86 kernel compression

Best,
Nick Terrell

Adam Borowski (1):
  .gitignore: add ZSTD-compressed files

Nick Terrell (6):
  lib: prepare zstd for preboot environment
  lib: add zstd support to decompress
  init: add support for zstd compressed kernel
  usr: add support for zstd compressed initramfs
  x86: bump ZO_z_extra_bytes margin for zstd
  x86: Add support for ZSTD compressed kernel

 .gitignore                        |   1 +
 Documentation/x86/boot.rst        |   6 +-
 Makefile                          |   3 +-
 arch/x86/Kconfig                  |   1 +
 arch/x86/boot/compressed/Makefile |   5 +-
 arch/x86/boot/compressed/misc.c   |   4 +
 arch/x86/boot/header.S            |   8 +-
 arch/x86/include/asm/boot.h       |   6 +-
 include/linux/decompress/unzstd.h |  11 +
 init/Kconfig                      |  15 +-
 lib/Kconfig                       |   4 +
 lib/Makefile                      |   1 +
 lib/decompress.c                  |   5 +
 lib/decompress_unzstd.c           | 345 ++++++++++++++++++++++++++++++
 lib/zstd/fse_decompress.c         |   9 +-
 lib/zstd/zstd_internal.h          |  14 +-
 scripts/Makefile.lib              |  22 ++
 usr/Kconfig                       |  20 ++
 usr/Makefile                      |   1 +
 19 files changed, 462 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

-- 
2.27.0

