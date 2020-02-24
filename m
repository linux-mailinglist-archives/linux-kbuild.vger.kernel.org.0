Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E0116ADD6
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2020 18:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgBXRlo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 12:41:44 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:51710 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgBXRln (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 12:41:43 -0500
Received: by mail-pg1-f201.google.com with SMTP id m18so7083777pgn.18
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 09:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5nz7K/9gLs7EaewmF2wRn410ngVKaW83QWECedJma1o=;
        b=RVEFVPgU+ScpyMwz7WfaB+ItQ1JnmyRVQdauoq5Hla6qBbUseznXc4uAFG7Bn9wDIQ
         xN27LFJFYWTi2nwnRc4n2jIIiBUA8AKjhSKIsI2w6L+MLGraE8CBzpoNAY+jQj142T2c
         GbsQkJys39l//NmYke/Dl3qt8pWth1ivhTFGoSuRmWOi7ZTEiuEwu6uqmf2+EAbN4Xwj
         yGcx48yYsSLTF7Fs/bk88t2dE9K/MNFltYl2jSGsjdtuAIUIy3NePMj0qin8WcxIsvMK
         KuM4AmzgvD5/9sbPJ652/5IesJ6rdo9giLLcRyRm2CxhsY9OnV2nuczIFHaSA+kRg/W7
         /IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5nz7K/9gLs7EaewmF2wRn410ngVKaW83QWECedJma1o=;
        b=gtgwgThlEdBPSMt1S8nvNL0v1zuTZhKSktmI7ErVmG5jKEGImBoC2TOlAoC/kpMwSX
         dx6yxIsABsfCa8DMxqGLHYyaI8GuZJ7MambX3loboNKBImBZZfdP7GTrbyTx4AvBoxaK
         swXjPbnSWkKy5XiMaoh4B3d/SE724s3BPwxlMlkXy47W1yMq/ohewUdV3xTPWaJ26Ki3
         FPmjghGYdVbx+dlk+Npi2CFOLmYCt9pCurmQG1dpS2i0cKVIxOLLkis+Uyk4mqGFgolv
         ShRuu5QmHG56g10/thfKl1NQA4JJ9UtmzQquVd2wiqhyMjTMX9pCsqreZq4UIDvJIY2H
         B84Q==
X-Gm-Message-State: APjAAAXL5TqzaiBc/E4I0Yh4YkyjZoaQq6sdSOQVDkZVZjSk+OT1JSHR
        TrkPNftjq+xy7iHSWk16LDVDbblxfo2P3lrSAtQ=
X-Google-Smtp-Source: APXvYqyH8QxNwAutG1ZN9iCwc4/0fjrPF2jacaW4sjYkH4gbhT4P+UST1Yofs3uM/wUc87c1owiFJwJcD3WtXXPUqY0=
X-Received: by 2002:a63:ae0a:: with SMTP id q10mr53967461pgf.178.1582566100948;
 Mon, 24 Feb 2020 09:41:40 -0800 (PST)
Date:   Mon, 24 Feb 2020 09:41:28 -0800
Message-Id: <20200224174129.2664-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     corbet@lwn.net, masahiroy@kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Added to kbuild documentation. Provides more official info on building
kernels with Clang and LLVM than our wiki.

Suggested-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/kbuild/index.rst |  1 +
 Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/kbuild/llvm.rst

diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 0f144fad99a6..3882bd5f7728 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -19,6 +19,7 @@ Kernel Build System
 
     issues
     reproducible-builds
+    llvm
 
 .. only::  subproject and html
 
diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
new file mode 100644
index 000000000000..68ae022aebc0
--- /dev/null
+++ b/Documentation/kbuild/llvm.rst
@@ -0,0 +1,80 @@
+==============================
+Building Linux with Clang/LLVM
+==============================
+
+This document covers how to build the Linux kernel with Clang and LLVM
+utilities.
+
+About
+-----
+
+The Linux kernel has always traditionally been compiled with GNU toolchains
+such as GCC and binutils. On going work has allowed for `Clang
+<https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
+used as viable substitutes. Distributions such as `Android
+<https://www.android.com/>`_, `ChromeOS
+<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
+<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
+collection of toolchain components implemented in terms of C++ objects
+<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
+supports C and the GNU C extensions required by the kernel, and is pronounced
+"klang," not "see-lang."
+
+Clang
+-----
+
+The compiler used can be swapped out via `CC=` command line argument to `make`.
+`CC=` should be set when selecting a config and during a build.
+
+	make CC=clang defconfig
+
+	make CC=clang
+
+Cross Compiling
+---------------
+
+A single Clang compiler binary will typically contain all supported backends,
+which can help simplify cross compiling.
+
+	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
+
+`CROSS_COMPILE` is not used to suffix the Clang compiler binary, instead
+`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
+example:
+
+	clang --target aarch64-linux-gnu foo.c
+
+LLVM Utilities
+--------------
+
+LLVM has substitutes for GNU binutils utilities. These can be invoked as
+additional parameters to `make`.
+
+	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
+	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
+	  HOSTLD=ld.lld
+
+Getting Help
+------------
+
+- `Website <https://clangbuiltlinux.github.io/>`_
+- `Mailing List <https://groups.google.com/forum/#!forum/clang-built-linux>`_: <clang-built-linux@googlegroups.com>
+- `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
+- IRC: #clangbuiltlinux on chat.freenode.net
+- `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
+- `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
+- `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
+
+Getting LLVM
+-------------
+
+- http://releases.llvm.org/download.html
+- https://github.com/llvm/llvm-project
+- https://llvm.org/docs/GettingStarted.html
+- https://llvm.org/docs/CMake.html
+- https://apt.llvm.org/
+- https://www.archlinux.org/packages/extra/x86_64/llvm/
+- https://github.com/ClangBuiltLinux/tc-build
+- https://github.com/ClangBuiltLinux/linux/wiki/Building-Clang-from-source
+- https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
-- 
2.25.0.265.gbab2e86ba0-goog

