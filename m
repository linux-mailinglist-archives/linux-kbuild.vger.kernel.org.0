Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B892338B0
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 21:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730432AbgG3TLQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 15:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730411AbgG3TLP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 15:11:15 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DA3C061574;
        Thu, 30 Jul 2020 12:11:15 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bh1so1936834plb.12;
        Thu, 30 Jul 2020 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T5yHmQpdvD1NrEW9tkXW0vliNxZ+ocZTFoeNrXX0q9o=;
        b=TlKZLOJHOjjtZQuN7WgX0sc47deyCwLk/KMdIll+PkugDWLDwvOGb1dotw4osKyMr9
         Sd0WXfksAbszBR4Xasn1cpK8lw1Q3SwVeTspHPmPnVg2NM/gXxStcT480QGrbem1n279
         diuRKPxQNNFz0vkIXvRPldDWPTKmWiyU3DBdxV1Xf7BbCn8LhvDswdYijyPDiZaEDLfc
         VRsF7gKTO+AGIF25pjEG3GzqYbs0/XBEkp+q4LHaYg+4nImL8HVaLwMuvzoJrmRQvI96
         6hKyXARwnv28MNMndbIJ94E4PHBEo7JnA6+8NH86usqrSdh3AiSIDFBgNFj+kX88CUVW
         3iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T5yHmQpdvD1NrEW9tkXW0vliNxZ+ocZTFoeNrXX0q9o=;
        b=sDwiJyBFtqUi2zYeuG9bGep7BN2x5aRJjtaMUjW0EFmmkvKXVyD20qr+gLgqymTegL
         k2cDcwCrJHDuMmL8hhJNxAv7RLhwSkpDxHUrZ2FyR7legcwe8ywbkM43Pk7GVBpmJnOQ
         oYycTNshtdIEErbap5eqi+04A7WGYv/T7Z2g0irOi/wGnuN/3ED9mYVAnJEwotFJc4Ag
         lgc8o0BMMFuzOJK58LRpD7E4ZskSkb6e8v1JcVvF3vKkJOWTEUOUem/Miv7VBqsG0cMJ
         zb/2h8oGtgrsqiwG8hBU72BF3jJDxD2WExCz+KFNWC17t/Qkhr6gqr5fuZjjL+AJO8hD
         TIuQ==
X-Gm-Message-State: AOAM531qOO2aQ2t0lVmRgfzy9Si4Oi4Z8m7YjGht7k0f29ay/ZdiBexn
        wvypGpjj5YYECxSayXWu0lw=
X-Google-Smtp-Source: ABdhPJzJRK7jqZGOLJljPSUz6rSA76EU9Kb5IXwJgc1Xm+0VHxnaH5+eLnc3fIp5pl40FvrSH2l+Dg==
X-Received: by 2002:a63:3716:: with SMTP id e22mr355968pga.282.1596136274714;
        Thu, 30 Jul 2020 12:11:14 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id o22sm8644976pfu.206.2020.07.30.12.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:11:13 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [GIT PULL][PATCH v10 0/8] Add support for ZSTD-compressed kernel and initramfs
Date:   Thu, 30 Jul 2020 12:08:33 -0700
Message-Id: <20200730190841.2071656-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Please pull from

  git@github.com:terrelln/linux.git tags/v10-zstd

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

v7 -> v8:
- (2/7) Don't define '__DISABLE_EXPORTS'
- (6/7) Define '__DISABLE_EXPORTS' in misc.c

v8 -> v9:
- Rebase onto v5.8-rc7
- (2/7) Fix nits about comment style & typos
- (3/7) Fix typo in init/Kconfig description
- (6/7) Explain BOOT_HEAP_SIZE increase and define __DISABLE_EXPORTS in
        Makefile KBUILD_CFLAGS and remove definitions from kaslr.c and misc.c

v9 -> v10:
- (6/8) Fix commit message regarding __DISABLE_EXPORTS
- (8/8) Add .zst files to Documentation/dontdiff

Best,
Nick Terrell

Adam Borowski (1):
  .gitignore: add ZSTD-compressed files

Nick Terrell (7):
  lib: prepare zstd for preboot environment
  lib: add zstd support to decompress
  init: add support for zstd compressed kernel
  usr: add support for zstd compressed initramfs
  x86: bump ZO_z_extra_bytes margin for zstd
  x86: Add support for ZSTD compressed kernel
  Documentation: dontdiff: Add zstd compressed files

 .gitignore                        |   1 +
 Documentation/dontdiff            |   1 +
 Documentation/x86/boot.rst        |   6 +-
 Makefile                          |   3 +-
 arch/x86/Kconfig                  |   1 +
 arch/x86/boot/compressed/Makefile |   6 +-
 arch/x86/boot/compressed/kaslr.c  |   7 -
 arch/x86/boot/compressed/misc.c   |   4 +
 arch/x86/boot/header.S            |   8 +-
 arch/x86/include/asm/boot.h       |  11 +-
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
 21 files changed, 469 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

-- 
2.27.0

