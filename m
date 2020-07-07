Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256782164D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgGGDuR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGDuR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:50:17 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AC1C061755;
        Mon,  6 Jul 2020 20:50:17 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so4214065pfm.4;
        Mon, 06 Jul 2020 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RWlIbZhqr3tqZ0EWl7bBNFKW7x8em2WQjbOTA4M2MaM=;
        b=tzfZ609h+eLRTjnhBfeeljBZtTHaNHNbZLuc5Ir8S53uZ21Z5itQwowkpNq6yoPCIM
         4EkakHSFkScRk0QbZsYV93O6m+ksn2UONej8dxY43l7LEoXhP0/lUsef5eBWeQUxTW9r
         zHbUcLQLwrmW6U8BRay8MiQLjWT0dsB/47Ahksv4GfWx6Yb0gxN5nyNa0/s3Z1ksswdH
         7JNHeMk5yXnJrZketsGoLleJskXoSPM/0K+43MkWvJvYmLNSuNRhoKju8qYvTRCuuYMW
         7vX/Ub541Z2b1W6/hbhsAc3b4v4W42EHqHnzrqSmo/SW4sN0H7Q9O1PgZncY7858IbSD
         t5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RWlIbZhqr3tqZ0EWl7bBNFKW7x8em2WQjbOTA4M2MaM=;
        b=A823Ks87zE6jwqtJz4C8WHaXssPcH5yjkUjtrFCyDKoS45D58uIObdl3VifK157Ozy
         Z4LZX57i/FShiCJgz2nyuuE0kn28bUS4RbaSTGMEpHYuuGZSm2HfCeHwOe0Nd/0ZrXP6
         0sPqUnEeCglqGiMJmx0jaAUVg9+HW9PgcafyOKa9VAYa+YfE8sg4Sq6+FXJ9BjcCHAev
         2Y1X3+Wp0ujgo70CFvIZVPp4WxebMupcMX+vrF/b0+F8B10ESEYJZlHKQzpaBcWmt4Qc
         72vFyc3f8yHD4/LVh90j0tKoh5FftftLTAIVQ7uRt1ngrvTJWAeUxn30wKgT9/nzHdCd
         3slA==
X-Gm-Message-State: AOAM5323luFM3gh5Qi2yXSOLUi9RckY4V1AX58N9ZVGsereDodAqzr27
        JJU7pgvLVq45SGAN7nfIZlk=
X-Google-Smtp-Source: ABdhPJwetY10nU+6qWXFMDSjUMXtky25Bl3dVHnebvGtuGZkvRNGZ/bvlY8K0GkhErrFWnHF+n9OpA==
X-Received: by 2002:a62:5c03:: with SMTP id q3mr47213650pfb.58.1594093816499;
        Mon, 06 Jul 2020 20:50:16 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:50:15 -0700 (PDT)
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
        Nick Terrell <terrelln@fb.com>
Subject: [GIT PULL][PATCH v6 0/8] Add support for ZSTD-compressed kernel and initramfs
Date:   Mon,  6 Jul 2020 20:45:56 -0700
Message-Id: <20200707034604.1539157-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Please pull from

  git@github.com:terrelln/linux.git tags/v6-zstd

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
of linux-5.8-rc4.

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
2.27.0

