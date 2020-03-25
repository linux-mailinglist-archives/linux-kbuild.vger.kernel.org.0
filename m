Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3B2193178
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCYT6R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:58:17 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35464 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT6R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:58:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id u68so1588492pfb.2;
        Wed, 25 Mar 2020 12:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ismgBCt2kpHX8pPzeoAWGu8mbsMC1DWgn2mXloiL0TQ=;
        b=lIGFzrVXAqN5GirFzI+32M9KhN1JYF/YB/zBRqTeeGqFd5fe1dnsSJPyvnNPb2Ijei
         i1hv2rAyEqdl7JkVFzP0TS8iMNU+ulmvqYshpkbhKcWnKx6+L98hXTppquqh0T8qa4hO
         RRFUUqrLPcmafn9unm7beBE6FcpdssI5bIMu1P0Cd0JIxJvk+D36XGF0ZsqCVw+cV8MC
         EUa5Lbv1OLxdRZu12faHPJZgTPCeOiavs48clpylIFIFAkRwTrkXA52I0jJE9VIYNnqE
         c18fU5D/4ecB6oDlAEnf757JjAT6VH0JqjNxnDrU0ensVdABVh/d5NXLLU2n5UxjyWAd
         zvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ismgBCt2kpHX8pPzeoAWGu8mbsMC1DWgn2mXloiL0TQ=;
        b=bpm6x4wNroBxKtWlx8xCT3Z13X1YoNfKn9ouxcSiXI/lBcYh7QlK++OxG9pL9ixJMP
         kwChAE5ptRzgknuo3X+mwkwC87cRLDnHgNvsENEwgP72o8oSxu9mZz5jk9BXx83WQ/RI
         YBGLQg1QKVew3lB7CLdEIlpzit0vrrBAuBl/eRh+sK7OREgVYKaeNSpsv9+aGBRKdgt5
         oybzBoZcWV4myl1Uhj7FSusm63Zh8Jh4nipxisYw9u79AO5cuv28RqsR6UC/Xrio0V6+
         sIVUkaZpzrlt6ptjR0mAwLuEJElafviqIYteA5e3rQ9WaewmN3KxVqFN++g9VENST7z8
         GITg==
X-Gm-Message-State: ANhLgQ1I3Yr/v8DdfM8ooYWGSueyx5bfJJIbuhSOlqmyCeiyr38WWLca
        0p1zlQTRouJMyKYWDjo3NIQ=
X-Google-Smtp-Source: ADFU+vverIEbJfN8a2mqnFIPMBjLgQtCX6/KdVQkE6vjXOUcKC/KEgA8Kmv+e14PLGy0zwuo9rQXhg==
X-Received: by 2002:a62:2b05:: with SMTP id r5mr4888359pfr.120.1585166295135;
        Wed, 25 Mar 2020 12:58:15 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:58:14 -0700 (PDT)
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
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and initramfs
Date:   Wed, 25 Mar 2020 12:58:41 -0700
Message-Id: <20200325195849.407900-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Hi all,

I attempted to send this patch on March 19, but it got rejected by the
mailing lists for some reason, so I'm resending it.

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
 lib/decompress_unzstd.c           | 338 ++++++++++++++++++++++++++++++
 lib/xxhash.c                      |  21 +-
 lib/zstd/decompress.c             |   2 +
 lib/zstd/fse_decompress.c         |   9 +-
 lib/zstd/zstd_internal.h          |  14 +-
 scripts/Makefile.lib              |  15 ++
 usr/Kconfig                       |  20 ++
 usr/Makefile                      |   1 +
 20 files changed, 460 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

-- 
2.25.1

