Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9438E22FCB1
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 01:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgG0XKs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 19:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0XKr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 19:10:47 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A11C0619D2;
        Mon, 27 Jul 2020 16:10:47 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n5so10820254pgf.7;
        Mon, 27 Jul 2020 16:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZhK6sDzaXzfx00n0NB7+kf1juLyKV+5+twkk+Nfo0P4=;
        b=X62GHQMleA4+ccF+RpnP921wKNALiU6xjyVNGlpSbs/go+h9JXuicmVU9EdHGpPdRE
         WLcNSppFI+LRIy/8JpfGl/o4eVs+St86UHEiCnNyn+iiqAvkMZu7lL8+yGY4evu8hVdX
         8CvopZ0ZjfkBdR90w0hnOp7I7veHDry12jJdDsHMR+6kdJlTu4wHlEYHNEuO05OAxPg+
         MixveTf+/UEJ5c76X1JuFbXlzd5DCob57JMPjPW+34vK7i7uhvBKrtbqyXdnlI23gUCe
         IiNTPXUyVv4ot2dQJs38SNMptLLiai4HofVBAhtaa5HVmng3a8/7tEQYgi0lchAClNFC
         P1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZhK6sDzaXzfx00n0NB7+kf1juLyKV+5+twkk+Nfo0P4=;
        b=I2HzdtDMRIUVyz9XHOxJQXt3pdftUVXvBZDImf67/Prx8aCfrHBtMfQaWsO1MfJ8tk
         McbctpFZvIEAmOCNLlyI20urs6LFoVUD1u/Cyazu1IJ2NkeJDu9a2p/6Y7q/QV5r1I2y
         ools5smxXwSTwUAFeJ/ao/tvbRN/o5ySd9O9ksZQ9pvJBKougIn3r816qngs+IyJGqYa
         PfrwoNs8LS7K7YI4uKJA/uhVbiW9mHiLqKh9WP0rQvbMPq0R4hIE03W7sf15iJ3T/4H4
         s8f90JgkKz0EVzPN6aZGSrip09anawpyFNvKk0Xot5SGIYkCLrhXndl+d6jW+HWKULn/
         9ITA==
X-Gm-Message-State: AOAM532dU4o9G/OG4DXUQKRgV360782mC9gN8F5DQbdSBIuoOJ4/PALd
        F2s5rhfUZANrpAsLkJew+bw=
X-Google-Smtp-Source: ABdhPJynCf5MJAnc7MQ0raoVWbjTRtECBm4f0XYWFMLKkON6W8Bai5IeQGOEFu/6M3e2sfjrohFqMw==
X-Received: by 2002:a63:c60c:: with SMTP id w12mr20839018pgg.297.1595891447096;
        Mon, 27 Jul 2020 16:10:47 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y68sm3515931pfy.185.2020.07.27.16.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 16:10:46 -0700 (PDT)
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
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: [GIT PULL][PATCH v9 0/7] Add support for ZSTD-compressed kernel and initramfs
Date:   Mon, 27 Jul 2020 16:05:59 -0700
Message-Id: <20200727230606.906598-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Please pull from

  git@github.com:terrelln/linux.git tags/v9-zstd

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
 20 files changed, 468 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

-- 
2.27.0

