Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612771A2B80
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgDHVzv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:55:51 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44578 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgDHVzu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:55:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id b72so3063694pfb.11;
        Wed, 08 Apr 2020 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=No3EXzQafB2mZCZQxcUWOWHvvBrJjsw3bl24XleBbJM=;
        b=bhypR5SCt7shRP8pQqBPHQ+NkMI8L8m5qcWJsBneycxxLy+iOshIbm/Iy7cnqhM2ce
         rZbogKAT8X5Tya+/Re99vI8F6Te7ih3X+TcsS9spFfBONZaZjYW6Nnd/zsYw8MOH7H69
         O28Pz3Vy7MHMKMab3MbmluZmRe9+eL6SIcV19bqoDqB/nUDMxmDUDjvruaeNvwpi0YWG
         033glTaabk9t8kZfjP0IwbbhjtdMZiJ2DYjVSVo6yEZE8odH2RY4AYiwMPEZD2JfDFLO
         zuJpiLgxfuehnOKAGo+wHBPIeHty9pyDYQQ7Ua6rU4Ase5TzkI9bymBIhiCexB1qf2Ye
         MgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=No3EXzQafB2mZCZQxcUWOWHvvBrJjsw3bl24XleBbJM=;
        b=sjxfjpCYkSrbWFPllXVzD6vsHBp1sM4PrqMQCUuvzu9/7odZw0cizZg5cDjblSd393
         OBuWYvRQ88uHBwnbd8d+Pry+mO8OA1o7DCTg5+qgy73EYXhQ78mkgp6dacSYVWyWjIv8
         TPu6EmLf0MZ7ZG2Phd70Yhuqq5j0lPHlFCXRqDbDpvC6+/dpwOBfbDYXIKJbHc68yqO9
         qPeVaC3koe4YaX7N3eLY10ZIB59R3TCIKT+QTFXeeqaHOcEvM3pOJ7E+ZSMdgYwHGrvE
         OUwG/iWnzzqIVYE67TUW2f+8ZRSW3LUgxEzKwGSqbyfYKYDC8+rO08cD5TKUqGMdJMb1
         s+MA==
X-Gm-Message-State: AGi0PuZlZWA8Ug9fXQsPjfZDJEIJL5Wui2HNhJqyYez2L55+VbJeAzjN
        QOSiatX4XAFoueuf+SnPeSsaiJsjVa/V2w==
X-Google-Smtp-Source: APiQypI3pH5YEqKmxdmFmeqbdZgoRSidYZAvDZyqzz64ER90a9/3UyLhKs0ef9ZVzx49E/rwqKJ50g==
X-Received: by 2002:aa7:8082:: with SMTP id v2mr10254615pff.18.1586382948805;
        Wed, 08 Apr 2020 14:55:48 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:55:48 -0700 (PDT)
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
Subject: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel and initramfs
Date:   Wed,  8 Apr 2020 14:57:03 -0700
Message-Id: <20200408215711.137639-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Please pull from

  git@github.com:terrelln/linux.git tags/v5-zstd

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

