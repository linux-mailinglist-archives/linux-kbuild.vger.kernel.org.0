Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47982F27E3
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 06:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbhALFcC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 00:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbhALFcB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 00:32:01 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C09C061575
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 21:31:21 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id e137so1340266ybf.16
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 21:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc:content-transfer-encoding;
        bh=kpF5NgJCo58zS4DPp0R3P0tqgpyr1BKQ01ChymMw5XI=;
        b=JUh/o0CDsCfe/A/ppRxEaQx1Q74+UQnLrdJOwraiIpmTv00z8wODhi56aHLFMtAboC
         cPFXjfKvPvjnQygj0CXJTUXNuSVhhErJRr+fwzzHhAeBNCB/xEerpwj7N3R4RvAVs+n6
         OjtWxnQSlzH0tAnfsFDlvV9WyV5xdUFjUwNxFQ/7WyCEBIZjy0B3FKwLgz+EqRsdctmH
         g9UJZ0qM9ulV92ycW+jvJsgKhyK5Hc5b9HZLM0XrzVO7AABMgkjXtcbCFU6Dhk+wcssQ
         iU1DJM9dYCRPRjNltEKQQZ73KrxeRsCFfWSOc5O0tAluhcT0Ty/h4TnFuNWkVOtT01O8
         8H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=kpF5NgJCo58zS4DPp0R3P0tqgpyr1BKQ01ChymMw5XI=;
        b=ZEBhT97+dICgsX4dM9lH8sTgCdMOL/tTNX9DxT69nLF/59oG+2VYMAJKoUB1LoAW/8
         rJwKPRufc3+7X+Q2tRPIfZCqmWTtSowaElsq1ruLiLAztHWdSSqV7JOKAmE9jhEoMlvC
         Lso6mAHglJ7O7mOW9foG62qb4DZ6nkLGUk9e5TDvjY9wvxWPIz4dc/yZVV0tBQZ7RlDz
         jt3pZaGP5E7WhBxKZErH2Mauc4qWjMOgiGJTvam8BxGsMzykphTTc6DuWXvMPoElpK0t
         1J0Iqun+ne7P6x2V/mrnMcjvmbW5H27yVv0YMPvj7EiMc9mpNLyqCR7gT8Kj+ZoZuYd+
         6nbg==
X-Gm-Message-State: AOAM533grkKcIU3/gi1g7hXQ4J62L0IFJCrlGcpIg+Wou8KgRnUi3BWF
        H5xRweIEH2sLhxOUbckEL3yuzxMd
X-Google-Smtp-Source: ABdhPJw8I+wii71XugeAChtqx1mk0TRIm49uX0XH0JouQ8uC42BemQXywJmPEnlYn3+0rhaac8rCJAba4Q==
Sender: "morbo via sendgmr" <morbo@fawn.svl.corp.google.com>
X-Received: from fawn.svl.corp.google.com ([100.116.77.50]) (user=morbo
 job=sendgmr) by 2002:a25:d257:: with SMTP id j84mr3866201ybg.479.1610429480456;
 Mon, 11 Jan 2021 21:31:20 -0800 (PST)
Date:   Mon, 11 Jan 2021 21:31:13 -0800
In-Reply-To: <20210112051428.4175583-1-morbo@google.com>
Message-Id: <20210112053113.4180271-1-morbo@google.com>
Mime-Version: 1.0
References: <20210112051428.4175583-1-morbo@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v3] pgo: add clang's Profile Guided Optimization infrastructure
From:   Bill Wendling <morbo@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Sami Tolvanen <samitolvanen@google.com>

Enable the use of clang's Profile-Guided Optimization[1]. To generate a
profile, the kernel is instrumented with PGO counters, a representative
workload is run, and the raw profile data is collected from
/sys/kernel/debug/pgo/profraw.

The raw profile data must be processed by clang's "llvm-profdata" tool
before it can be used during recompilation:

  $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
  $ llvm-profdata merge --output=3Dvmlinux.profdata vmlinux.profraw

Multiple raw profiles may be merged during this step.

The data can now be used by the compiler:

  $ make LLVM=3D1 KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata ...

This initial submission is restricted to x86, as that's the platform we
know works. This restriction can be lifted once other platforms have
been verified to work with PGO.

Note that this method of profiling the kernel is clang-native and isn't
compatible with clang's gcov support in kernel/gcov.

[1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimizatio=
n

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Co-developed-by: Bill Wendling <morbo@google.com>
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2: - Added "__llvm_profile_instrument_memop" based on Nathan Chancellor's
      testing.
    - Corrected documentation, re PGO flags when using LTO, based on F=C4=
=81ng-ru=C3=AC
      S=C3=B2ng's comments.
v3: - Added change log section based on Sedat Dilek's comments.
---
 Documentation/dev-tools/index.rst     |   1 +
 Documentation/dev-tools/pgo.rst       | 127 +++++++++
 MAINTAINERS                           |   9 +
 Makefile                              |   3 +
 arch/Kconfig                          |   1 +
 arch/arm/boot/bootp/Makefile          |   1 +
 arch/arm/boot/compressed/Makefile     |   1 +
 arch/arm/vdso/Makefile                |   3 +-
 arch/arm64/kernel/vdso/Makefile       |   3 +-
 arch/arm64/kvm/hyp/nvhe/Makefile      |   1 +
 arch/mips/boot/compressed/Makefile    |   1 +
 arch/mips/vdso/Makefile               |   1 +
 arch/nds32/kernel/vdso/Makefile       |   4 +-
 arch/parisc/boot/compressed/Makefile  |   1 +
 arch/powerpc/kernel/Makefile          |   6 +-
 arch/powerpc/kernel/trace/Makefile    |   3 +-
 arch/powerpc/kernel/vdso32/Makefile   |   1 +
 arch/powerpc/kernel/vdso64/Makefile   |   1 +
 arch/powerpc/kexec/Makefile           |   3 +-
 arch/powerpc/xmon/Makefile            |   1 +
 arch/riscv/kernel/vdso/Makefile       |   3 +-
 arch/s390/boot/Makefile               |   1 +
 arch/s390/boot/compressed/Makefile    |   1 +
 arch/s390/kernel/Makefile             |   1 +
 arch/s390/kernel/vdso64/Makefile      |   3 +-
 arch/s390/purgatory/Makefile          |   1 +
 arch/sh/boot/compressed/Makefile      |   1 +
 arch/sh/mm/Makefile                   |   1 +
 arch/sparc/vdso/Makefile              |   1 +
 arch/x86/Kconfig                      |   1 +
 arch/x86/boot/Makefile                |   1 +
 arch/x86/boot/compressed/Makefile     |   1 +
 arch/x86/entry/vdso/Makefile          |   1 +
 arch/x86/kernel/vmlinux.lds.S         |   2 +
 arch/x86/platform/efi/Makefile        |   1 +
 arch/x86/purgatory/Makefile           |   1 +
 arch/x86/realmode/rm/Makefile         |   1 +
 arch/x86/um/vdso/Makefile             |   1 +
 drivers/firmware/efi/libstub/Makefile |   1 +
 drivers/s390/char/Makefile            |   1 +
 include/asm-generic/vmlinux.lds.h     |  44 +++
 kernel/Makefile                       |   1 +
 kernel/pgo/Kconfig                    |  34 +++
 kernel/pgo/Makefile                   |   5 +
 kernel/pgo/fs.c                       | 382 ++++++++++++++++++++++++++
 kernel/pgo/instrument.c               | 188 +++++++++++++
 kernel/pgo/pgo.h                      | 206 ++++++++++++++
 scripts/Makefile.lib                  |  10 +
 48 files changed, 1058 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/dev-tools/pgo.rst
 create mode 100644 kernel/pgo/Kconfig
 create mode 100644 kernel/pgo/Makefile
 create mode 100644 kernel/pgo/fs.c
 create mode 100644 kernel/pgo/instrument.c
 create mode 100644 kernel/pgo/pgo.h

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/in=
dex.rst
index f7809c7b1ba9e..8d6418e858062 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -26,6 +26,7 @@ whole; patches welcome!
    kgdb
    kselftest
    kunit/index
+   pgo
=20
=20
 .. only::  subproject and html
diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.=
rst
new file mode 100644
index 0000000000000..da0e654ae7078
--- /dev/null
+++ b/Documentation/dev-tools/pgo.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+Using PGO with the Linux kernel
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+Clang's profiling kernel support (PGO_) enables profiling of the Linux ker=
nel
+when building with Clang. The profiling data is exported via the ``pgo``
+debugfs directory.
+
+.. _PGO: https://clang.llvm.org/docs/UsersManual.html#profile-guided-optim=
ization
+
+
+Preparation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Configure the kernel with:
+
+.. code-block:: make
+
+   CONFIG_DEBUG_FS=3Dy
+   CONFIG_PGO_CLANG=3Dy
+
+Note that kernels compiled with profiling flags will be significantly larg=
er
+and run slower.
+
+Profiling data will only become accessible once debugfs has been mounted:
+
+.. code-block:: sh
+
+   mount -t debugfs none /sys/kernel/debug
+
+
+Customization
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+You can enable or disable profiling for individual file and directories by
+adding a line similar to the following to the respective kernel Makefile:
+
+- For a single file (e.g. main.o)
+
+  .. code-block:: make
+
+     PGO_PROFILE_main.o :=3D y
+
+- For all files in one directory
+
+  .. code-block:: make
+
+     PGO_PROFILE :=3D y
+
+To exclude files from being profiled use
+
+  .. code-block:: make
+
+     PGO_PROFILE_main.o :=3D n
+
+and
+
+  .. code-block:: make
+
+     PGO_PROFILE :=3D n
+
+Only files which are linked to the main kernel image or are compiled as ke=
rnel
+modules are supported by this mechanism.
+
+
+Files
+=3D=3D=3D=3D=3D
+
+The PGO kernel support creates the following files in debugfs:
+
+``/sys/kernel/debug/pgo``
+	Parent directory for all PGO-related files.
+
+``/sys/kernel/debug/pgo/reset``
+	Global reset file: resets all coverage data to zero when written to.
+
+``/sys/kernel/debug/profraw``
+	The raw PGO data that must be processed with ``llvm_profdata``.
+
+
+Workflow
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+The PGO kernel can be run on the host or test machines. The data though sh=
ould
+be analyzed with Clang's tools from the same Clang version as the kernel w=
as
+compiled. Clang's tolerant of version skew, but it's easier to use the sam=
e
+Clang version.
+
+The profiling data is useful for optimizing the kernel, analyzing coverage=
,
+etc. Clang offers tools to perform these tasks.
+
+Here is an example workflow for profiling an instrumented kernel with PGO =
and
+using the result to optimize the kernel:
+
+1) Install the kernel on the TEST machine.
+
+2) Reset the data counters right before running the load tests
+
+   .. code-block:: sh
+
+      echo 1 > /sys/kernel/debug/pgo/reset
+
+3) Run the load tests.
+
+4) Collect the raw profile data
+
+   .. code-block:: sh
+
+      cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
+
+5) (Optional) Download the raw profile data to the HOST machine.
+
+6) Process the raw profile data
+
+   .. code-block:: sh
+
+      llvm-profdata merge --output=3Dvmlinux.profdata vmlinux.profraw
+
+   Note that multiple raw profile data files can be merged during this ste=
p.
+
+7) Rebuild the kernel using the profile data (PGO disabled)
+
+   .. code-block:: sh
+
+      make LLVM=3D1 KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata ...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc1e6a5ee6e67..1b979da316fa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13954,6 +13954,15 @@ S:	Maintained
 F:	include/linux/personality.h
 F:	include/uapi/linux/personality.h
=20
+PGO BASED KERNEL PROFILING
+M:	Sami Tolvanen <samitolvanen@google.com>
+M:	Bill Wendling <wcw@google.com>
+R:	Nathan Chancellor <natechancellor@gmail.com>
+R:	Nick Desaulniers <ndesaulniers@google.com>
+S:	Supported
+F:	Documentation/dev-tools/pgo.rst
+F:	kernel/pgo
+
 PHOENIX RC FLIGHT CONTROLLER ADAPTER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-input@vger.kernel.org
diff --git a/Makefile b/Makefile
index 9e73f82e0d863..9128bfe1ccc97 100644
--- a/Makefile
+++ b/Makefile
@@ -659,6 +659,9 @@ endif # KBUILD_EXTMOD
 # Defaults to vmlinux, but the arch makefile usually adds further targets
 all: vmlinux
=20
+CFLAGS_PGO_CLANG :=3D -fprofile-generate
+export CFLAGS_PGO_CLANG
+
 CFLAGS_GCOV	:=3D -fprofile-arcs -ftest-coverage \
 	$(call cc-option,-fno-tree-loop-im) \
 	$(call cc-disable-warning,maybe-uninitialized,)
diff --git a/arch/Kconfig b/arch/Kconfig
index 24862d15f3a36..f39d3991f6bfe 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1112,6 +1112,7 @@ config ARCH_SPLIT_ARG64
 	   pairs of 32-bit arguments, select this option.
=20
 source "kernel/gcov/Kconfig"
+source "kernel/pgo/Kconfig"
=20
 source "scripts/gcc-plugins/Kconfig"
=20
diff --git a/arch/arm/boot/bootp/Makefile b/arch/arm/boot/bootp/Makefile
index 981a8d03f064c..523bd58df0a4b 100644
--- a/arch/arm/boot/bootp/Makefile
+++ b/arch/arm/boot/bootp/Makefile
@@ -7,6 +7,7 @@
 #
=20
 GCOV_PROFILE	:=3D n
+PGO_PROFILE	:=3D n
=20
 LDFLAGS_bootp	:=3D --no-undefined -X \
 		 --defsym initrd_phys=3D$(INITRD_PHYS) \
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/M=
akefile
index fb521efcc6c20..5fd0fd85fc0e5 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -24,6 +24,7 @@ OBJS		+=3D hyp-stub.o
 endif
=20
 GCOV_PROFILE		:=3D n
+PGO_PROFILE		:=3D n
 KASAN_SANITIZE		:=3D n
=20
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index b558bee0e1f6b..11f6ce4b48b56 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -36,8 +36,9 @@ else
 CFLAGS_vgettimeofday.o =3D -O2 -include $(c-gettimeofday-y)
 endif
=20
-# Disable gcov profiling for VDSO code
+# Disable gcov and PGO profiling for VDSO code
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
 KCOV_INSTRUMENT :=3D n
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makef=
ile
index cd9c3fa25902f..d48fc0df07020 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -41,8 +41,9 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
 endif
=20
-# Disable gcov profiling for VDSO code
+# Disable gcov and PGO profiling for VDSO code
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 obj-y +=3D vdso.o
 targets +=3D vdso.lds
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Mak=
efile
index 1f1e351c5fe2b..ad128ecdbfbdf 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -60,6 +60,7 @@ KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_FTRACE) $(CC_F=
LAGS_SCS), $(KBUILD_CFLAG
 # compiler instrumentation that inserts callbacks or checks into the code =
may
 # cause crashes. Just disable it.
 GCOV_PROFILE	:=3D n
+PGO_PROFILE	:=3D n
 KASAN_SANITIZE	:=3D n
 UBSAN_SANITIZE	:=3D n
 KCOV_INSTRUMENT	:=3D n
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed=
/Makefile
index 47cd9dc7454af..0855ea12f2c7f 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -37,6 +37,7 @@ KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
 KCOV_INSTRUMENT		:=3D n
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 # decompressor objects (linked with vmlinuz)
 vmlinuzobjs-y :=3D $(obj)/head.o $(obj)/decompress.o $(obj)/string.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 5810cc12bc1d9..d7eb64de35eae 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -66,6 +66,7 @@ ldflags-y :=3D -Bsymbolic --no-undefined -soname=3Dlinux-=
vdso.so.1 \
 CFLAGS_REMOVE_vdso.o =3D -pg
=20
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
 KCOV_INSTRUMENT :=3D n
=20
diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makef=
ile
index 55df25ef00578..f2b53ee2124b7 100644
--- a/arch/nds32/kernel/vdso/Makefile
+++ b/arch/nds32/kernel/vdso/Makefile
@@ -15,9 +15,9 @@ obj-vdso :=3D $(addprefix $(obj)/, $(obj-vdso))
 ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib -fPIC -Wl,-share=
d -g \
 	-Wl,-soname=3Dlinux-vdso.so.1 -Wl,--hash-style=3Dsysv
=20
-# Disable gcov profiling for VDSO code
+# Disable gcov and PGO profiling for VDSO code
 GCOV_PROFILE :=3D n
-
+PGO_PROFILE :=3D n
=20
 obj-y +=3D vdso.o
 targets +=3D vdso.lds
diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compre=
ssed/Makefile
index dff4536875305..5cf93a67f7da7 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -7,6 +7,7 @@
=20
 KCOV_INSTRUMENT :=3D n
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
=20
 targets :=3D vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz=
2
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index fe2ef598e2ead..c642c046660d7 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -153,17 +153,21 @@ endif
 obj-$(CONFIG_PPC_SECURE_BOOT)	+=3D secure_boot.o ima_arch.o secvar-ops.o
 obj-$(CONFIG_PPC_SECVAR_SYSFS)	+=3D secvar-sysfs.o
=20
-# Disable GCOV, KCOV & sanitizers in odd or sensitive code
+# Disable GCOV, PGO, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o :=3D n
+PGO_PROFILE_prom_init.o :=3D n
 KCOV_INSTRUMENT_prom_init.o :=3D n
 UBSAN_SANITIZE_prom_init.o :=3D n
 GCOV_PROFILE_kprobes.o :=3D n
+PGO_PROFILE_kprobes.o :=3D n
 KCOV_INSTRUMENT_kprobes.o :=3D n
 UBSAN_SANITIZE_kprobes.o :=3D n
 GCOV_PROFILE_kprobes-ftrace.o :=3D n
+PGO_PROFILE_kprobes-ftrace.o :=3D n
 KCOV_INSTRUMENT_kprobes-ftrace.o :=3D n
 UBSAN_SANITIZE_kprobes-ftrace.o :=3D n
 GCOV_PROFILE_syscall_64.o :=3D n
+PGO_PROFILE_syscall_64.o :=3D n
 KCOV_INSTRUMENT_syscall_64.o :=3D n
 UBSAN_SANITIZE_syscall_64.o :=3D n
 UBSAN_SANITIZE_vdso.o :=3D n
diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace=
/Makefile
index 858503775c583..7d72ae7d4f8c6 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -23,7 +23,8 @@ obj-$(CONFIG_TRACING)			+=3D trace_clock.o
 obj-$(CONFIG_PPC64)			+=3D $(obj64-y)
 obj-$(CONFIG_PPC32)			+=3D $(obj32-y)
=20
-# Disable GCOV, KCOV & sanitizers in odd or sensitive code
+# Disable GCOV, PGO, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_ftrace.o :=3D n
+PGO_PROFILE_ftrace.o :=3D n
 KCOV_INSTRUMENT_ftrace.o :=3D n
 UBSAN_SANITIZE_ftrace.o :=3D n
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso=
32/Makefile
index 9cb6f524854b9..655e159975a04 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -34,6 +34,7 @@ targets :=3D $(obj-vdso32) vdso32.so.dbg
 obj-vdso32 :=3D $(addprefix $(obj)/, $(obj-vdso32))
=20
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 KCOV_INSTRUMENT :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso=
64/Makefile
index bf363ff371521..12c286f5afc16 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -21,6 +21,7 @@ targets :=3D $(obj-vdso64) vdso64.so.dbg
 obj-vdso64 :=3D $(addprefix $(obj)/, $(obj-vdso64))
=20
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 KCOV_INSTRUMENT :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 4aff6846c7726..1c7f65e3cb969 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -16,7 +16,8 @@ endif
 endif
=20
=20
-# Disable GCOV, KCOV & sanitizers in odd or sensitive code
+# Disable GCOV, PGO, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_core_$(BITS).o :=3D n
+PGO_PROFILE_core_$(BITS).o :=3D n
 KCOV_INSTRUMENT_core_$(BITS).o :=3D n
 UBSAN_SANITIZE_core_$(BITS).o :=3D n
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index eb25d7554ffd1..7aff80d18b44b 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -2,6 +2,7 @@
 # Makefile for xmon
=20
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 KCOV_INSTRUMENT :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makef=
ile
index 0cfd6da784f84..882340dc3c647 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -32,8 +32,9 @@ CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
 # Disable -pg to prevent insert call site
 CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_FTRACE) -Os
=20
-# Disable gcov profiling for VDSO code
+# Disable gcov and PGO profiling for VDSO code
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 KCOV_INSTRUMENT :=3D n
=20
 # Force dependency
diff --git a/arch/s390/boot/Makefile b/arch/s390/boot/Makefile
index 41a64b8dce252..bee4a32040e79 100644
--- a/arch/s390/boot/Makefile
+++ b/arch/s390/boot/Makefile
@@ -5,6 +5,7 @@
=20
 KCOV_INSTRUMENT :=3D n
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
=20
diff --git a/arch/s390/boot/compressed/Makefile b/arch/s390/boot/compressed=
/Makefile
index de18dab518bb6..c3ab883e8425a 100644
--- a/arch/s390/boot/compressed/Makefile
+++ b/arch/s390/boot/compressed/Makefile
@@ -7,6 +7,7 @@
=20
 KCOV_INSTRUMENT :=3D n
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
=20
diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
index dd73b7f074237..bd857aacad794 100644
--- a/arch/s390/kernel/Makefile
+++ b/arch/s390/kernel/Makefile
@@ -14,6 +14,7 @@ CFLAGS_REMOVE_early.o		=3D $(CC_FLAGS_FTRACE)
 endif
=20
 GCOV_PROFILE_early.o		:=3D n
+PGO_PROFILE_early.o		:=3D n
 KCOV_INSTRUMENT_early.o		:=3D n
 UBSAN_SANITIZE_early.o		:=3D n
 KASAN_SANITIZE_ipl.o		:=3D n
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Mak=
efile
index a6e0fb6b91d6c..d7c43b7c1db96 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -35,8 +35,9 @@ obj-y +=3D vdso64_wrapper.o
 targets +=3D vdso64.lds
 CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
=20
-# Disable gcov profiling, ubsan and kasan for VDSO code
+# Disable gcov and PGO profiling, ubsan and kasan for VDSO code
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
=20
diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index c57f8c40e9926..9aef584e98466 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -17,6 +17,7 @@ $(obj)/mem.o: $(srctree)/arch/s390/lib/mem.S FORCE
=20
 KCOV_INSTRUMENT :=3D n
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
 KASAN_SANITIZE :=3D n
=20
diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Mak=
efile
index 589d2d8a573db..ae19aeeb3964c 100644
--- a/arch/sh/boot/compressed/Makefile
+++ b/arch/sh/boot/compressed/Makefile
@@ -13,6 +13,7 @@ targets		:=3D vmlinux vmlinux.bin vmlinux.bin.gz \
 OBJECTS =3D $(obj)/head_32.o $(obj)/misc.o $(obj)/cache.o
=20
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 #
 # IMAGE_OFFSET is the load offset of the compression loader
diff --git a/arch/sh/mm/Makefile b/arch/sh/mm/Makefile
index f69ddc70b1465..ea2782c631f43 100644
--- a/arch/sh/mm/Makefile
+++ b/arch/sh/mm/Makefile
@@ -43,3 +43,4 @@ obj-$(CONFIG_UNCACHED_MAPPING)	+=3D uncached.o
 obj-$(CONFIG_HAVE_SRAM_POOL)	+=3D sram.o
=20
 GCOV_PROFILE_pmb.o :=3D n
+PGO_PROFILE_pmb.o :=3D n
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index c5e1545bc5cf9..ab5f3783fe199 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -115,6 +115,7 @@ quiet_cmd_vdso =3D VDSO    $@
=20
 VDSO_LDFLAGS =3D -shared --hash-style=3Dboth --build-id=3Dsha1 -Bsymbolic
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 #
 # Install the unstripped copies of vdso*.so.  If our toolchain supports
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 21f851179ff08..36305ea61dc09 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -96,6 +96,7 @@ config X86
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <=3D 4096
+	select ARCH_SUPPORTS_PGO_CLANG		if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index fe605205b4ce2..383853e32f673 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -71,6 +71,7 @@ KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=3D)
 KBUILD_CFLAGS	+=3D -fno-asynchronous-unwind-tables
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
=20
 $(obj)/bzImage: asflags-y  :=3D $(SVGA_MODE)
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/M=
akefile
index e0bc3988c3faa..ed12ab65f6065 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -54,6 +54,7 @@ CFLAGS_sev-es.o +=3D -I$(objtree)/arch/x86/lib/
=20
 KBUILD_AFLAGS  :=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3Dn
=20
 KBUILD_LDFLAGS :=3D -m elf_$(UTS_MACHINE)
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 02e3e42f380bd..26e2b3af0145c 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -179,6 +179,7 @@ quiet_cmd_vdso =3D VDSO    $@
 VDSO_LDFLAGS =3D -shared --hash-style=3Dboth --build-id=3Dsha1 \
 	$(call ld-option, --eh-frame-hdr) -Bsymbolic
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 quiet_cmd_vdso_and_check =3D VDSO    $@
       cmd_vdso_and_check =3D $(cmd_vdso); $(cmd_vdso_check)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index efd9e9ea17f25..f6cab2316c46a 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -184,6 +184,8 @@ SECTIONS
=20
 	BUG_TABLE
=20
+	PGO_CLANG_DATA
+
 	ORC_UNWIND_TABLE
=20
 	. =3D ALIGN(PAGE_SIZE);
diff --git a/arch/x86/platform/efi/Makefile b/arch/x86/platform/efi/Makefil=
e
index 84b09c230cbd5..5f22b31446ad4 100644
--- a/arch/x86/platform/efi/Makefile
+++ b/arch/x86/platform/efi/Makefile
@@ -2,6 +2,7 @@
 OBJECT_FILES_NON_STANDARD_efi_thunk_$(BITS).o :=3D y
 KASAN_SANITIZE :=3D n
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 obj-$(CONFIG_EFI) 		+=3D quirks.o efi.o efi_$(BITS).o efi_stub_$(BITS).o
 obj-$(CONFIG_EFI_MIXED)		+=3D efi_thunk_$(BITS).o
diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 95ea17a9d20cb..36f20e99da0bc 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -23,6 +23,7 @@ targets +=3D purgatory.ro purgatory.chk
=20
 # Sanitizer, etc. runtimes are unavailable and cannot be linked here.
 GCOV_PROFILE	:=3D n
+PGO_PROFILE	:=3D n
 KASAN_SANITIZE	:=3D n
 UBSAN_SANITIZE	:=3D n
 KCSAN_SANITIZE	:=3D n
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index 83f1b6a56449f..21797192f958f 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -76,4 +76,5 @@ KBUILD_CFLAGS	:=3D $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP =
\
 KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+=3D -fno-asynchronous-unwind-tables
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
 UBSAN_SANITIZE :=3D n
diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index 5943387e3f357..54f5768f58530 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -64,6 +64,7 @@ quiet_cmd_vdso =3D VDSO    $@
=20
 VDSO_LDFLAGS =3D -fPIC -shared -Wl,--hash-style=3Dsysv
 GCOV_PROFILE :=3D n
+PGO_PROFILE :=3D n
=20
 #
 # Install the unstripped copy of vdso*.so listed in $(vdso-install-y).
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/l=
ibstub/Makefile
index 8a94388e38b33..2d81623b33f29 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -40,6 +40,7 @@ KBUILD_CFLAGS			:=3D $(cflags-y) -Os -DDISABLE_BRANCH_PRO=
FILING \
 KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
=20
 GCOV_PROFILE			:=3D n
+PGO_PROFILE			:=3D n
 # Sanitizer runtimes are unavailable and cannot be linked here.
 KASAN_SANITIZE			:=3D n
 KCSAN_SANITIZE			:=3D n
diff --git a/drivers/s390/char/Makefile b/drivers/s390/char/Makefile
index c6fdb81a068a6..bf6c5db5da1fc 100644
--- a/drivers/s390/char/Makefile
+++ b/drivers/s390/char/Makefile
@@ -9,6 +9,7 @@ CFLAGS_REMOVE_sclp_early_core.o	=3D $(CC_FLAGS_FTRACE)
 endif
=20
 GCOV_PROFILE_sclp_early_core.o		:=3D n
+PGO_PROFILE_sclp_early_core.o		:=3D n
 KCOV_INSTRUMENT_sclp_early_core.o	:=3D n
 UBSAN_SANITIZE_sclp_early_core.o	:=3D n
 KASAN_SANITIZE_sclp_early_core.o	:=3D n
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index b2b3d81b1535a..3a591bb18c5fb 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -316,6 +316,49 @@
 #define THERMAL_TABLE(name)
 #endif
=20
+#ifdef CONFIG_PGO_CLANG
+#define PGO_CLANG_DATA							\
+	__llvm_prf_data : AT(ADDR(__llvm_prf_data) - LOAD_OFFSET) {	\
+		. =3D ALIGN(8);						\
+		__llvm_prf_start =3D .;					\
+		__llvm_prf_data_start =3D .;				\
+		KEEP(*(__llvm_prf_data))				\
+		. =3D ALIGN(8);						\
+		__llvm_prf_data_end =3D .;				\
+	}								\
+	__llvm_prf_cnts : AT(ADDR(__llvm_prf_cnts) - LOAD_OFFSET) {	\
+		. =3D ALIGN(8);						\
+		__llvm_prf_cnts_start =3D .;				\
+		KEEP(*(__llvm_prf_cnts))				\
+		. =3D ALIGN(8);						\
+		__llvm_prf_cnts_end =3D .;				\
+	}								\
+	__llvm_prf_names : AT(ADDR(__llvm_prf_names) - LOAD_OFFSET) {	\
+		. =3D ALIGN(8);						\
+		__llvm_prf_names_start =3D .;				\
+		KEEP(*(__llvm_prf_names))				\
+		. =3D ALIGN(8);						\
+		__llvm_prf_names_end =3D .;				\
+		. =3D ALIGN(8);						\
+	}								\
+	__llvm_prf_vals : AT(ADDR(__llvm_prf_vals) - LOAD_OFFSET) {	\
+		__llvm_prf_vals_start =3D .;				\
+		KEEP(*(__llvm_prf_vals))				\
+		. =3D ALIGN(8);						\
+		__llvm_prf_vals_end =3D .;				\
+		. =3D ALIGN(8);						\
+	}								\
+	__llvm_prf_vnds : AT(ADDR(__llvm_prf_vnds) - LOAD_OFFSET) {	\
+		__llvm_prf_vnds_start =3D .;				\
+		KEEP(*(__llvm_prf_vnds))				\
+		. =3D ALIGN(8);						\
+		__llvm_prf_vnds_end =3D .;				\
+		__llvm_prf_end =3D .;					\
+	}
+#else
+#define PGO_CLANG_DATA
+#endif
+
 #define KERNEL_DTB()							\
 	STRUCT_ALIGN();							\
 	__dtb_start =3D .;						\
@@ -1125,6 +1168,7 @@
 		CONSTRUCTORS						\
 	}								\
 	BUG_TABLE							\
+	PGO_CLANG_DATA
=20
 #define INIT_TEXT_SECTION(inittext_align)				\
 	. =3D ALIGN(inittext_align);					\
diff --git a/kernel/Makefile b/kernel/Makefile
index aa7368c7eabf3..0b34ca228ba46 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_BPF) +=3D bpf/
 obj-$(CONFIG_KCSAN) +=3D kcsan/
 obj-$(CONFIG_SHADOW_CALL_STACK) +=3D scs.o
 obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) +=3D static_call.o
+obj-$(CONFIG_PGO_CLANG) +=3D pgo/
=20
 obj-$(CONFIG_PERF_EVENTS) +=3D events/
=20
diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
new file mode 100644
index 0000000000000..318d36bb3d106
--- /dev/null
+++ b/kernel/pgo/Kconfig
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Profile Guided Optimization (PGO) (EXPERIMENTAL)"
+
+config ARCH_SUPPORTS_PGO_CLANG
+	bool
+
+config PGO_CLANG
+	bool "Enable clang's PGO-based kernel profiling"
+	depends on DEBUG_FS
+	depends on ARCH_SUPPORTS_PGO_CLANG
+	help
+	  This option enables clang's PGO (Profile Guided Optimization) based
+	  code profiling to better optimize the kernel.
+
+	  If unsure, say N.
+
+	  Run a representative workload for your application on a kernel
+	  compiled with this option and download the raw profile file from
+	  /sys/kernel/debug/pgo/profraw. This file needs to be processed with
+	  llvm-profdata. It may be merged with other collected raw profiles.
+
+	  Copy the resulting profile file into vmlinux.profdata, and enable
+	  KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata to produce an optimized
+	  kernel.
+
+	  Note that a kernel compiled with profiling flags will be
+	  significatnly larger and run slower. Also be sure to exclude files
+	  from profiling which are not linked to the kernel image to prevent
+	  linker errors.
+
+	  Note that the debugfs filesystem has to be mounted to access
+	  profiling data.
+
+endmenu
diff --git a/kernel/pgo/Makefile b/kernel/pgo/Makefile
new file mode 100644
index 0000000000000..41e27cefd9a47
--- /dev/null
+++ b/kernel/pgo/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+GCOV_PROFILE	:=3D n
+PGO_PROFILE	:=3D n
+
+obj-y	+=3D fs.o instrument.o
diff --git a/kernel/pgo/fs.c b/kernel/pgo/fs.c
new file mode 100644
index 0000000000000..790a8df037bfc
--- /dev/null
+++ b/kernel/pgo/fs.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Google, Inc.
+ *
+ * Author:
+ *	Sami Tolvanen <samitolvanen@google.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#define pr_fmt(fmt)	"pgo: " fmt
+
+#include <linux/kernel.h>
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include "pgo.h"
+
+static struct dentry *directory;
+
+struct prf_private_data {
+	void *buffer;
+	unsigned long size;
+};
+
+/*
+ * Raw profile data format:
+ *
+ *	- llvm_prf_header
+ *	- __llvm_prf_data
+ *	- __llvm_prf_cnts
+ *	- __llvm_prf_names
+ *	- zero padding to 8 bytes
+ *	- for each llvm_prf_data in __llvm_prf_data:
+ *		- llvm_prf_value_data
+ *			- llvm_prf_value_record + site count array
+ *				- llvm_prf_value_node_data
+ *				...
+ *			...
+ *		...
+ */
+
+static void prf_fill_header(void **buffer)
+{
+	struct llvm_prf_header *header =3D *(struct llvm_prf_header **)buffer;
+
+	header->magic =3D LLVM_PRF_MAGIC;
+	header->version =3D LLVM_PRF_VARIANT_MASK_IR | LLVM_PRF_VERSION;
+	header->data_size =3D prf_data_count();
+	header->padding_bytes_before_counters =3D 0;
+	header->counters_size =3D prf_cnts_count();
+	header->padding_bytes_after_counters =3D 0;
+	header->names_size =3D prf_names_count();
+	header->counters_delta =3D (u64)__llvm_prf_cnts_start;
+	header->names_delta =3D (u64)__llvm_prf_names_start;
+	header->value_kind_last =3D LLVM_PRF_IPVK_LAST;
+
+	*buffer +=3D sizeof(*header);
+}
+
+/*
+ * Copy the source into the buffer, incrementing the pointer into buffer i=
n the
+ * process.
+ */
+static void prf_copy_to_buffer(void **buffer, void *src, unsigned long siz=
e)
+{
+	memcpy(*buffer, src, size);
+	*buffer +=3D size;
+}
+
+static u32 __prf_get_value_size(struct llvm_prf_data *p, u32 *value_kinds)
+{
+	struct llvm_prf_value_node **nodes =3D
+		(struct llvm_prf_value_node **)p->values;
+	u32 kinds =3D 0;
+	u32 size =3D 0;
+	unsigned int kind;
+	unsigned int n;
+	unsigned int s =3D 0;
+
+	for (kind =3D 0; kind < ARRAY_SIZE(p->num_value_sites); kind++) {
+		unsigned int sites =3D p->num_value_sites[kind];
+
+		if (!sites)
+			continue;
+
+		/* Record + site count array */
+		size +=3D prf_get_value_record_size(sites);
+		kinds++;
+
+		if (!nodes)
+			continue;
+
+		for (n =3D 0; n < sites; n++) {
+			u32 count =3D 0;
+			struct llvm_prf_value_node *site =3D nodes[s + n];
+
+			while (site && ++count <=3D U8_MAX)
+				site =3D site->next;
+
+			size +=3D count *
+				sizeof(struct llvm_prf_value_node_data);
+		}
+
+		s +=3D sites;
+	}
+
+	if (size)
+		size +=3D sizeof(struct llvm_prf_value_data);
+
+	if (value_kinds)
+		*value_kinds =3D kinds;
+
+	return size;
+}
+
+static u32 prf_get_value_size(void)
+{
+	u32 size =3D 0;
+	struct llvm_prf_data *p;
+
+	for (p =3D __llvm_prf_data_start; p < __llvm_prf_data_end; p++)
+		size +=3D __prf_get_value_size(p, NULL);
+
+	return size;
+}
+
+/* Serialize the profiling's value. */
+static void prf_serialize_value(struct llvm_prf_data *p, void **buffer)
+{
+	struct llvm_prf_value_data header;
+	struct llvm_prf_value_node **nodes =3D
+		(struct llvm_prf_value_node **)p->values;
+	unsigned int kind;
+	unsigned int n;
+	unsigned int s =3D 0;
+
+	header.total_size =3D __prf_get_value_size(p, &header.num_value_kinds);
+
+	if (!header.num_value_kinds)
+		/* Nothing to write. */
+		return;
+
+	prf_copy_to_buffer(buffer, &header, sizeof(header));
+
+	for (kind =3D 0; kind < ARRAY_SIZE(p->num_value_sites); kind++) {
+		struct llvm_prf_value_record *record;
+		u8 *counts;
+		unsigned int sites =3D p->num_value_sites[kind];
+
+		if (!sites)
+			continue;
+
+		/* Profiling value record. */
+		record =3D *(struct llvm_prf_value_record **)buffer;
+		*buffer +=3D prf_get_value_record_header_size();
+
+		record->kind =3D kind;
+		record->num_value_sites =3D sites;
+
+		/* Site count array. */
+		counts =3D *(u8 **)buffer;
+		*buffer +=3D prf_get_value_record_site_count_size(sites);
+
+		/*
+		 * If we don't have nodes, we can skip updating the site count
+		 * array, because the buffer is zero filled.
+		 */
+		if (!nodes)
+			continue;
+
+		for (n =3D 0; n < sites; n++) {
+			u32 count =3D 0;
+			struct llvm_prf_value_node *site =3D nodes[s + n];
+
+			while (site && ++count <=3D U8_MAX) {
+				prf_copy_to_buffer(buffer, site,
+						   sizeof(struct llvm_prf_value_node_data));
+				site =3D site->next;
+			}
+
+			counts[n] =3D (u8)count;
+		}
+
+		s +=3D sites;
+	}
+}
+
+static void prf_serialize_values(void **buffer)
+{
+	struct llvm_prf_data *p;
+
+	for (p =3D __llvm_prf_data_start; p < __llvm_prf_data_end; p++)
+		prf_serialize_value(p, buffer);
+}
+
+static inline unsigned long prf_get_padding(unsigned long size)
+{
+	return 8 - (size % 8);
+}
+
+static unsigned long prf_buffer_size(void)
+{
+	return sizeof(struct llvm_prf_header) +
+			prf_data_size()	+
+			prf_cnts_size() +
+			prf_names_size() +
+			prf_get_padding(prf_names_size()) +
+			prf_get_value_size();
+}
+
+/* Serialize the profling data into a format LLVM's tools can understand. =
*/
+static int prf_serialize(struct prf_private_data *p)
+{
+	int err =3D 0;
+	void *buffer;
+
+	p->size =3D prf_buffer_size();
+	p->buffer =3D vzalloc(p->size);
+
+	if (!p->buffer) {
+		err =3D -ENOMEM;
+		goto out;
+	}
+
+	buffer =3D p->buffer;
+
+	prf_fill_header(&buffer);
+	prf_copy_to_buffer(&buffer, __llvm_prf_data_start,  prf_data_size());
+	prf_copy_to_buffer(&buffer, __llvm_prf_cnts_start,  prf_cnts_size());
+	prf_copy_to_buffer(&buffer, __llvm_prf_names_start, prf_names_size());
+	buffer +=3D prf_get_padding(prf_names_size());
+
+	prf_serialize_values(&buffer);
+
+out:
+	return err;
+}
+
+/* open() implementation for PGO. Creates a copy of the profiling data set=
. */
+static int prf_open(struct inode *inode, struct file *file)
+{
+	struct prf_private_data *data;
+	unsigned long flags;
+	int err;
+
+	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		err =3D -ENOMEM;
+		goto out;
+	}
+
+	flags =3D prf_lock();
+
+	err =3D prf_serialize(data);
+	if (err) {
+		kfree(data);
+		goto out_unlock;
+	}
+
+	file->private_data =3D data;
+
+out_unlock:
+	prf_unlock(flags);
+out:
+	return err;
+}
+
+/* read() implementation for PGO. */
+static ssize_t prf_read(struct file *file, char __user *buf, size_t count,
+			loff_t *ppos)
+{
+	struct prf_private_data *data =3D file->private_data;
+
+	BUG_ON(!data);
+
+	return simple_read_from_buffer(buf, count, ppos, data->buffer,
+				       data->size);
+}
+
+/* release() implementation for PGO. Release resources allocated by open()=
. */
+static int prf_release(struct inode *inode, struct file *file)
+{
+	struct prf_private_data *data =3D file->private_data;
+
+	if (data) {
+		vfree(data->buffer);
+		kfree(data);
+	}
+
+	return 0;
+}
+
+static const struct file_operations prf_fops =3D {
+	.owner		=3D THIS_MODULE,
+	.open		=3D prf_open,
+	.read		=3D prf_read,
+	.llseek		=3D default_llseek,
+	.release	=3D prf_release
+};
+
+/* write() implementation for resetting PGO's profile data. */
+static ssize_t reset_write(struct file *file, const char __user *addr,
+			   size_t len, loff_t *pos)
+{
+	struct llvm_prf_data *data;
+
+	memset(__llvm_prf_cnts_start, 0, prf_cnts_size());
+
+	for (data =3D __llvm_prf_data_start; data < __llvm_prf_data_end; ++data) =
{
+		struct llvm_prf_value_node **vnodes;
+		u64 current_vsite_count;
+		u32 i;
+
+		if (!data->values)
+			continue;
+
+		current_vsite_count =3D 0;
+		vnodes =3D (struct llvm_prf_value_node **)data->values;
+
+		for (i =3D LLVM_PRF_IPVK_FIRST; i <=3D LLVM_PRF_IPVK_LAST; ++i)
+			current_vsite_count +=3D data->num_value_sites[i];
+
+		for (i =3D 0; i < current_vsite_count; ++i) {
+			struct llvm_prf_value_node *current_vnode =3D vnodes[i];
+
+			while (current_vnode) {
+				current_vnode->count =3D 0;
+				current_vnode =3D current_vnode->next;
+			}
+		}
+	}
+
+	return len;
+}
+
+static const struct file_operations prf_reset_fops =3D {
+	.owner		=3D THIS_MODULE,
+	.write		=3D reset_write,
+	.llseek		=3D noop_llseek,
+};
+
+/* Create debugfs entries. */
+static int __init pgo_init(void)
+{
+	directory =3D debugfs_create_dir("pgo", NULL);
+	if (!directory)
+		goto err_remove;
+
+	if (!debugfs_create_file("profraw", 0600, directory, NULL,
+				 &prf_fops))
+		goto err_remove;
+
+	if (!debugfs_create_file("reset", 0200, directory, NULL,
+				 &prf_reset_fops))
+		goto err_remove;
+
+	return 0;
+
+err_remove:
+	pr_err("initialization failed\n");
+	return -EIO;
+}
+
+/* Remove debufs entries. */
+static void __exit pgo_exit(void)
+{
+	debugfs_remove_recursive(directory);
+}
+
+module_init(pgo_init);
+module_exit(pgo_exit);
diff --git a/kernel/pgo/instrument.c b/kernel/pgo/instrument.c
new file mode 100644
index 0000000000000..465615b7f8735
--- /dev/null
+++ b/kernel/pgo/instrument.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Google, Inc.
+ *
+ * Author:
+ *	Sami Tolvanen <samitolvanen@google.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#define pr_fmt(fmt)	"pgo: " fmt
+
+#include <linux/kernel.h>
+#include <linux/export.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include "pgo.h"
+
+/* Lock guarding value node access and serialization. */
+static DEFINE_SPINLOCK(pgo_lock);
+static int current_node;
+
+unsigned long prf_lock(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pgo_lock, flags);
+
+	return flags;
+}
+
+void prf_unlock(unsigned long flags)
+{
+	spin_unlock_irqrestore(&pgo_lock, flags);
+}
+
+/*
+ * Return a newly allocated profiling value node which contains the tracke=
d
+ * value by the value profiler.
+ * Note: caller *must* hold pgo_lock.
+ */
+static struct llvm_prf_value_node *allocate_node(struct llvm_prf_data *p,
+						 u32 index, u64 value)
+{
+	if (&__llvm_prf_vnds_start[current_node + 1] >=3D __llvm_prf_vnds_end)
+		return NULL; /* Out of nodes */
+
+	current_node++;
+
+	/* Make sure the node is entirely within the section */
+	if (&__llvm_prf_vnds_start[current_node] >=3D __llvm_prf_vnds_end ||
+	    &__llvm_prf_vnds_start[current_node + 1] > __llvm_prf_vnds_end)
+		return NULL;
+
+	return &__llvm_prf_vnds_start[current_node];
+}
+
+/*
+ * Counts the number of times a target value is seen.
+ *
+ * Records the target value for the CounterIndex if not seen before. Other=
wise,
+ * increments the counter associated w/ the target value.
+ */
+void __llvm_profile_instrument_target(u64 target_value, void *data, u32 in=
dex)
+{
+	struct llvm_prf_data *p =3D (struct llvm_prf_data *)data;
+	struct llvm_prf_value_node **counters;
+	struct llvm_prf_value_node *curr;
+	struct llvm_prf_value_node *min =3D NULL;
+	struct llvm_prf_value_node *prev =3D NULL;
+	u64 min_count =3D U64_MAX;
+	u8 values =3D 0;
+	unsigned long flags;
+
+	if (!p || !p->values)
+		return;
+
+	counters =3D (struct llvm_prf_value_node **)p->values;
+	curr =3D counters[index];
+
+	while (curr) {
+		if (target_value =3D=3D curr->value) {
+			curr->count++;
+			return;
+		}
+
+		if (curr->count < min_count) {
+			min_count =3D curr->count;
+			min =3D curr;
+		}
+
+		prev =3D curr;
+		curr =3D curr->next;
+		values++;
+	}
+
+	if (values >=3D LLVM_PRF_MAX_NUM_VALS_PER_SITE) {
+		if (!min->count || !(--min->count)) {
+			curr =3D min;
+			curr->value =3D target_value;
+			curr->count++;
+		}
+		return;
+	}
+
+	/* Lock when updating the value node structure. */
+	flags =3D prf_lock();
+
+	curr =3D allocate_node(p, index, target_value);
+	if (!curr)
+		goto out;
+
+	curr->value =3D target_value;
+	curr->count++;
+
+	if (!counters[index])
+		counters[index] =3D curr;
+	else if (prev && !prev->next)
+		prev->next =3D curr;
+
+out:
+	prf_unlock(flags);
+}
+EXPORT_SYMBOL(__llvm_profile_instrument_target);
+
+/* Counts the number of times a range of targets values are seen. */
+void __llvm_profile_instrument_range(u64 target_value, void *data,
+				     u32 index, s64 precise_start,
+				     s64 precise_last, s64 large_value)
+{
+	if (large_value !=3D S64_MIN && (s64)target_value >=3D large_value)
+		target_value =3D large_value;
+	else if ((s64)target_value < precise_start ||
+		 (s64)target_value > precise_last)
+		target_value =3D precise_last + 1;
+
+	__llvm_profile_instrument_target(target_value, data, index);
+}
+EXPORT_SYMBOL(__llvm_profile_instrument_range);
+
+static inline int inst_prof_popcount(unsigned long long value)
+{
+	value =3D value - ((value >> 1) & 0x5555555555555555ULL);
+	value =3D (value & 0x3333333333333333ULL) +
+		((value >> 2) & 0x3333333333333333ULL);
+	value =3D (value + (value >> 4)) & 0x0F0F0F0F0F0F0F0FULL;
+
+	return (int)((unsigned long long)(value * 0x0101010101010101ULL) >> 56);
+}
+
+static u64 inst_prof_get_range_rep_value(u64 value)
+{
+	if (value <=3D 8)
+		/* The first ranges are individually tracked, us it as is. */
+		return value;
+	else if (value >=3D 513)
+		/* The last range is mapped to its lowest value. */
+		return 513;
+	else if (inst_prof_popcount(value) =3D=3D 1)
+		/* If it's a power of two, use it as is. */
+		return value;
+
+	/* Otherwise, take to the previous power of two + 1. */
+	return (1 << (64 - __builtin_clzll(value) - 1)) + 1;
+}
+
+/*
+ * The target values are partitioned into multiple ranges. The range spec =
is
+ * defined in compiler-rt/include/profile/InstrProfData.inc.
+ */
+void __llvm_profile_instrument_memop(u64 target_value, void *data,
+				     u32 counter_index)
+{
+	u64 rep_value;
+
+	/* Map the target value to the representative value of its range. */
+	rep_value =3D inst_prof_get_range_rep_value(target_value);
+	__llvm_profile_instrument_target(rep_value, data, counter_index);
+}
+EXPORT_SYMBOL(__llvm_profile_instrument_memop);
diff --git a/kernel/pgo/pgo.h b/kernel/pgo/pgo.h
new file mode 100644
index 0000000000000..df0aa278f28bd
--- /dev/null
+++ b/kernel/pgo/pgo.h
@@ -0,0 +1,206 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Google, Inc.
+ *
+ * Author:
+ *	Sami Tolvanen <samitolvanen@google.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef _PGO_H
+#define _PGO_H
+
+/*
+ * Note: These internal LLVM definitions must match the compiler version.
+ * See llvm/include/llvm/ProfileData/InstrProfData.inc in LLVM's source co=
de.
+ */
+
+#ifdef CONFIG_64BIT
+	#define LLVM_PRF_MAGIC		\
+		((u64)255 << 56 |	\
+		 (u64)'l' << 48 |	\
+		 (u64)'p' << 40 |	\
+		 (u64)'r' << 32 |	\
+		 (u64)'o' << 24 |	\
+		 (u64)'f' << 16 |	\
+		 (u64)'r' << 8  |	\
+		 (u64)129)
+#else
+	#define LLVM_PRF_MAGIC		\
+		((u64)255 << 56 |	\
+		 (u64)'l' << 48 |	\
+		 (u64)'p' << 40 |	\
+		 (u64)'r' << 32 |	\
+		 (u64)'o' << 24 |	\
+		 (u64)'f' << 16 |	\
+		 (u64)'R' << 8  |	\
+		 (u64)129)
+#endif
+
+#define LLVM_PRF_VERSION		5
+#define LLVM_PRF_DATA_ALIGN		8
+#define LLVM_PRF_IPVK_FIRST		0
+#define LLVM_PRF_IPVK_LAST		1
+#define LLVM_PRF_MAX_NUM_VALS_PER_SITE	16
+
+#define LLVM_PRF_VARIANT_MASK_IR	(0x1ull << 56)
+#define LLVM_PRF_VARIANT_MASK_CSIR	(0x1ull << 57)
+
+/**
+ * struct llvm_prf_header - represents the raw profile header data structu=
re.
+ * @magic: the magic token for the file format.
+ * @version: the version of the file format.
+ * @data_size: the number of entries in the profile data section.
+ * @padding_bytes_before_counters: the number of padding bytes before the
+ *   counters.
+ * @counters_size: the size in bytes of the LLVM profile section containin=
g the
+ *   counters.
+ * @padding_bytes_after_counters: the number of padding bytes after the
+ *   counters.
+ * @names_size: the size in bytes of the LLVM profile section containing t=
he
+ *   counters' names.
+ * @counters_delta: the beginning of the LLMV profile counters section.
+ * @names_delta: the beginning of the LLMV profile names section.
+ * @value_kind_last: the last profile value kind.
+ */
+struct llvm_prf_header {
+	u64 magic;
+	u64 version;
+	u64 data_size;
+	u64 padding_bytes_before_counters;
+	u64 counters_size;
+	u64 padding_bytes_after_counters;
+	u64 names_size;
+	u64 counters_delta;
+	u64 names_delta;
+	u64 value_kind_last;
+};
+
+/**
+ * struct llvm_prf_data - represents the per-function control structure.
+ * @name_ref: the reference to the function's name.
+ * @func_hash: the hash value of the function.
+ * @counter_ptr: a pointer to the profile counter.
+ * @function_ptr: a pointer to the function.
+ * @values: the profiling values associated with this function.
+ * @num_counters: the number of counters in the function.
+ * @num_value_sites: the number of value profile sites.
+ */
+struct llvm_prf_data {
+	const u64 name_ref;
+	const u64 func_hash;
+	const void *counter_ptr;
+	const void *function_ptr;
+	void *values;
+	const u32 num_counters;
+	const u16 num_value_sites[LLVM_PRF_IPVK_LAST + 1];
+} __aligned(LLVM_PRF_DATA_ALIGN);
+
+/**
+ * structure llvm_prf_value_node_data - represents the data part of the st=
ruct
+ *   llvm_prf_value_node data structure.
+ * @value: the value counters.
+ * @count: the counters' count.
+ */
+struct llvm_prf_value_node_data {
+	u64 value;
+	u64 count;
+};
+
+/**
+ * struct llvm_prf_value_node - represents an internal data structure used=
 by
+ *   the value profiler.
+ * @value: the value counters.
+ * @count: the counters' count.
+ * @next: the next value node.
+ */
+struct llvm_prf_value_node {
+	u64 value;
+	u64 count;
+	struct llvm_prf_value_node *next;
+};
+
+/**
+ * struct llvm_prf_value_data - represents the value profiling data in ind=
exed
+ *   format.
+ * @total_size: the total size in bytes including this field.
+ * @num_value_kinds: the number of value profile kinds that has value prof=
ile
+ *   data.
+ */
+struct llvm_prf_value_data {
+	u32 total_size;
+	u32 num_value_kinds;
+};
+
+/**
+ * struct llvm_prf_value_record - represents the on-disk layout of the val=
ue
+ *   profile data of a particular kind for one function.
+ * @kind: the kind of the value profile record.
+ * @num_value_sites: the number of value profile sites.
+ * @site_count_array: the first element of the array that stores the numbe=
r
+ *   of profiled values for each value site.
+ */
+struct llvm_prf_value_record {
+	u32 kind;
+	u32 num_value_sites;
+	u8 site_count_array[];
+};
+
+#define prf_get_value_record_header_size()		\
+	offsetof(struct llvm_prf_value_record, site_count_array)
+#define prf_get_value_record_site_count_size(sites)	\
+	roundup((sites), 8)
+#define prf_get_value_record_size(sites)		\
+	(prf_get_value_record_header_size() +		\
+	 prf_get_value_record_site_count_size((sites)))
+
+/* Data sections */
+extern struct llvm_prf_data __llvm_prf_data_start[];
+extern struct llvm_prf_data __llvm_prf_data_end[];
+
+extern u64 __llvm_prf_cnts_start[];
+extern u64 __llvm_prf_cnts_end[];
+
+extern char __llvm_prf_names_start[];
+extern char __llvm_prf_names_end[];
+
+extern struct llvm_prf_value_node __llvm_prf_vnds_start[];
+extern struct llvm_prf_value_node __llvm_prf_vnds_end[];
+
+/* Locking for vnodes */
+extern unsigned long prf_lock(void);
+extern void prf_unlock(unsigned long flags);
+
+#define __DEFINE_PRF_SIZE(s) \
+	static inline unsigned long prf_ ## s ## _size(void)		\
+	{								\
+		unsigned long start =3D					\
+			(unsigned long)__llvm_prf_ ## s ## _start;	\
+		unsigned long end =3D					\
+			(unsigned long)__llvm_prf_ ## s ## _end;	\
+		return roundup(end - start,				\
+				sizeof(__llvm_prf_ ## s ## _start[0]));	\
+	}								\
+	static inline unsigned long prf_ ## s ## _count(void)		\
+	{								\
+		return prf_ ## s ## _size() /				\
+			sizeof(__llvm_prf_ ## s ## _start[0]);		\
+	}
+
+__DEFINE_PRF_SIZE(data);
+__DEFINE_PRF_SIZE(cnts);
+__DEFINE_PRF_SIZE(names);
+__DEFINE_PRF_SIZE(vnds);
+
+#undef __DEFINE_PRF_SIZE
+
+#endif /* _PGO_H */
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5ed33e..9b218afb5cb87 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -143,6 +143,16 @@ _c_flags +=3D $(if $(patsubst n%,, \
 		$(CFLAGS_GCOV))
 endif
=20
+#
+# Enable clang's PGO profiling flags for a file or directory depending on
+# variables PGO_PROFILE_obj.o and PGO_PROFILE.
+#
+ifeq ($(CONFIG_PGO_CLANG),y)
+_c_flags +=3D $(if $(patsubst n%,, \
+		$(PGO_PROFILE_$(basetarget).o)$(PGO_PROFILE)y), \
+		$(CFLAGS_PGO_CLANG))
+endif
+
 #
 # Enable address sanitizer flags for kernel except some files or directori=
es
 # we don't want to check (depends on variables KASAN_SANITIZE_obj.o, KASAN=
_SANITIZE)
--=20
2.30.0.284.gd98b1dd5eaa7-goog

