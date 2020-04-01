Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B306719A4C2
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731680AbgDAFiY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:38:24 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37411 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFiY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:24 -0400
Received: by mail-pl1-f194.google.com with SMTP id x1so9163845plm.4;
        Tue, 31 Mar 2020 22:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6I8wM9tu7YMp/CkfUvle+W5MuBU50+/cYhNxMO0BjO0=;
        b=udpZj7uQVcu5ayU4gQH6yLbQlB+A4m3Tm8DB6emdqXGGmiRS5hdVk/r6ONl2kySkZf
         5WBmeH+s+yHtZvc2Jjl5L1eMkBcmZ1cp1iYT33lFOaGSDwk+z3abeaXZVfrr2zv/bISl
         aK1qpfVHwgaaKpAD8w7kpwAw6F7i9z9R03vS+tWXUkagJPk7VE8Olh59e+i3YDYqkDKF
         crQOYh2g0wlriqgSavV3GDi1E8lXlBM02b5iwinr+VgSaq+Lhd8RLFGRBH34HLkNugqq
         WqvNrozdms9o6B5I1vnpQ1dbxrnU2DeJHm6VQ87RNa1VYXM/myOsWlF17zZ8iTJCk6v8
         RQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6I8wM9tu7YMp/CkfUvle+W5MuBU50+/cYhNxMO0BjO0=;
        b=nio914EERLt+FSXbyodbdDIL2S7S1u5EJrBkFmxeoxAHw3F2qhrc5f/7uSwGsxv/5s
         E8Bu01yw0CQSNEkEFyfaC+TdvFbTbrKl0PB5IF0P62IBYzvS85HjIgPmEevfs/P5mVEu
         t+yGOkymQb5CXS96swcvLFJPivHwnidhqXgcnlTl2oZEN1u1jeGvvC4IMH8KVNCcXQRD
         TVkDt7YhtVGtU/Tu7tgk0tS8etAiTbD+Ta+/MqoiiUv/8rP9MmRU9L2e/osQIOTFjBTX
         0+17hcTf7JBGwcD4RAxlN/LPfFDAr2zHsVJA3mCmmJ+OpEFxcR6LJQUOK1PwNYfy69Rq
         f8dw==
X-Gm-Message-State: ANhLgQ0BISfNUL1OK97FUJh2AuKtzdLWFp4rhphVoDumTJ8ddNVt2okK
        xDVaE8NuoypGr/uBPf5U4lw9wzt8VUoc7g==
X-Google-Smtp-Source: ADFU+vuX5DuuAlcirzkkd+0eNIZ0rRmLL3H+pH/q4qG7T0YWkAJKz93Q8i3JSImZTKciZCpX+LcQLg==
X-Received: by 2002:a17:902:b198:: with SMTP id s24mr20419425plr.89.1585719502973;
        Tue, 31 Mar 2020 22:38:22 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:38:22 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v4 0/8] Add support for ZSTD-compressed kernel and initramfs
Date:   Tue, 31 Mar 2020 22:39:05 -0700
Message-Id: <20200401053913.216783-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

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

Best,
Nick Terrell

Adam Borowski (1):
  .gitignore: add ZSTD-compressed files

Nick Terrell (7):
  lib: prepare zstd for preboot environment
  lib: prepare xxhash for preboot environment
  lib: add zstd support to decompress
  init: add support for zstd compressed kernel
  usr: add support for zstd compressed initramfs
  x86: bump ZO_z_extra_bytes margin for zstd
  x86: Add support for ZSTD compressed kernel

 .gitignore                        |   1 +
 Documentation/x86/boot.rst        |   6 +-
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
 lib/decompress_unzstd.c           | 342 ++++++++++++++++++++++++++++++
 lib/xxhash.c                      |  21 +-
 lib/zstd/decompress.c             |   2 +
 lib/zstd/fse_decompress.c         |   9 +-
 lib/zstd/zstd_internal.h          |  14 +-
 scripts/Makefile.lib              |  15 ++
 usr/Kconfig                       |  20 ++
 usr/Makefile                      |   1 +
 20 files changed, 464 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

-- 
2.26.0

