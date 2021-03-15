Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A3233C16B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCOQQD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:16:03 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:21463 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhCOQP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:15:58 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 12FGD7XG030890;
        Tue, 16 Mar 2021 01:13:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 12FGD7XG030890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615824790;
        bh=TyFCgcIcIKNhE+dFj/ceiSuYWZEfSdmJ7Vt6w5+H+lE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iuma465xVhLz0c054g6Z/QzPnbSNgfXaRkl+44YiOv7oRNXAiUSZQs+eujb56dNl9
         cfpoWss2qe2Vr4bUpII3yGU+TWrKkLS04lLhsXunkAhXclZF/eOjnvIv+YC8M8ueqi
         1HEb8bN2N2NG1+hbeTHmzbU/MrB5DNbWiCUnPl2w+4pPg53gTRd00QVs6yDq1nmUMm
         pq/jdxeqeXsFQepuyV3IsGmivqrL3R8DnqHaIRo+LRcglgGgSW2h5sPfVJLBEzekIM
         a+tfKTIC083sV/KvfhcpTHP+xFv5H/lsViIkOLGuUGiyCskGZb3VKll4KQvX6qPrCl
         vI0vJE6UzRYKQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Colin Ian King <colin.king@canonical.com>,
        David Howells <dhowells@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] kbuild: check the minimum assembler version in Kconfig
Date:   Tue, 16 Mar 2021 01:12:56 +0900
Message-Id: <20210315161257.788477-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315161257.788477-1-masahiroy@kernel.org>
References: <20210315161257.788477-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Documentation/process/changes.rst defines the minimum assembler version
(binutils version), but we have never checked it in the build time.

Kbuild never invokes 'as' directly because all assembly files in the
kernel tree are *.S, hence must be preprocessed. I do not expect
raw assembly source files (*.s) would be added to the kernel tree.

Therefore, we always use $(CC) as the assembler driver, and commit
aa824e0c962b ("kbuild: remove AS variable") removed 'AS'. However,
we are still interested in the version of the assembler acting behind.

As usual, the --version option prints the version string.

  $ as --version | head -n 1
  GNU assembler (GNU Binutils for Ubuntu) 2.35.1

But, we do not have $(AS). So, we can add the -Wa prefix so that
$(CC) passes --version down to the backing assembler.

  $ gcc -Wa,--version | head -n 1
  gcc: fatal error: no input files
  compilation terminated.

OK, we need to input something to satisfy gcc.

  $ gcc -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
  GNU assembler (GNU Binutils for Ubuntu) 2.35.1

The combination of Clang and GNU assembler works in the same way:

  $ clang -no-integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
  GNU assembler (GNU Binutils for Ubuntu) 2.35.1

Clang with the integrated assembler fails like this:

  $ clang -integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
  clang: error: unsupported argument '--version' to option 'Wa,'

For the last case, checking the error message is fragile. If the
proposal for -Wa,--version support [1] is accepted, this may not be
even an error in the future.

One easy way is to check if -integrated-as is present in the passed
arguments. We did not pass -integrated-as to CLANG_FLAGS before, but
we can make it explicit.

Nathan pointed out -integrated-as is the default for all of the
architectures/targets that the kernel cares about, but it goes
along with "explicit is better than implicit" policy. [2]

With all this in my mind, I implemented scripts/as-version.sh to
check the assembler version in Kconfig time.

  $ scripts/as-version.sh gcc
  GNU 23501
  $ scripts/as-version.sh clang -no-integrated-as
  GNU 23501
  $ scripts/as-version.sh clang -integrated-as
  LLVM 0

[1]: https://github.com/ClangBuiltLinux/linux/issues/1320
[2]: https://lore.kernel.org/linux-kbuild/20210307044253.v3h47ucq6ng25iay@archlinux-ax161/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Check -integrated-as option instead of error message.
  - Add LC_ALL=C just in case.

  The Italian locale did not tweak the message from 'as --version'
  but we never know what would happen on locale.

  $ LC_MESSAGES=it_IT.UTF-8 ld --version | head -n 1
  ld di GNU (GNU Binutils for Debian) 2.35.2
  $ LC_MESSAGES=it_IT.UTF-8 as --version | head -n 1
  GNU assembler (GNU Binutils for Debian) 2.35.2

 Makefile                |  4 +-
 arch/Kconfig            |  3 +-
 init/Kconfig            | 12 ++++++
 scripts/Kconfig.include |  6 +++
 scripts/as-version.sh   | 82 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 104 insertions(+), 3 deletions(-)
 create mode 100755 scripts/as-version.sh

diff --git a/Makefile b/Makefile
index cc5b7e39fde4..2b161f5a5a66 100644
--- a/Makefile
+++ b/Makefile
@@ -580,7 +580,9 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif
-ifneq ($(LLVM_IAS),1)
+ifeq ($(LLVM_IAS),1)
+CLANG_FLAGS	+= -integrated-as
+else
 CLANG_FLAGS	+= -no-integrated-as
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
diff --git a/arch/Kconfig b/arch/Kconfig
index ecfd3520b676..555b4f09a9b2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -631,8 +631,7 @@ config ARCH_SUPPORTS_LTO_CLANG_THIN
 config HAS_LTO_CLANG
 	def_bool y
 	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
-	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
-	depends on $(success,test $(LLVM_IAS) -eq 1)
+	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
 	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
diff --git a/init/Kconfig b/init/Kconfig
index 5f5c776ef192..019c1874e609 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -41,6 +41,18 @@ config CLANG_VERSION
 	default $(cc-version) if CC_IS_CLANG
 	default 0
 
+config AS_IS_GNU
+	def_bool $(success,test "$(as-name)" = GNU)
+
+config AS_IS_LLVM
+	def_bool $(success,test "$(as-name)" = LLVM)
+
+config AS_VERSION
+	int
+	# Use clang version if this is the integrated assembler
+	default CLANG_VERSION if AS_IS_LLVM
+	default $(as-version)
+
 config LD_IS_BFD
 	def_bool $(success,test "$(ld-name)" = BFD)
 
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 58fdb5308725..0496efd6e117 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -45,6 +45,12 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not su
 cc-name := $(shell,set -- $(cc-info) && echo $1)
 cc-version := $(shell,set -- $(cc-info) && echo $2)
 
+# Get the assembler name, version, and error out if it is not supported.
+as-info := $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FLAGS))
+$(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assembler is not supported.)
+as-name := $(shell,set -- $(as-info) && echo $1)
+as-version := $(shell,set -- $(as-info) && echo $2)
+
 # Get the linker name, version, and error out if it is not supported.
 ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
 $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
diff --git a/scripts/as-version.sh b/scripts/as-version.sh
new file mode 100755
index 000000000000..953ff000bcbc
--- /dev/null
+++ b/scripts/as-version.sh
@@ -0,0 +1,82 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Print the assembler name and its version in a 5 or 6-digit form.
+# Also, perform the minimum version check.
+# (If it is the integrated assembler, return 0 as the version, and
+# skip the version check.)
+
+set -e
+
+# Convert the version string x.y.z to a canonical 5 or 6-digit form.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+
+	# If the 2nd or 3rd field is missing, fill it with a zero.
+	#
+	# The 4th field, if present, is ignored.
+	# This occurs in development snapshots as in 2.35.1.20201116
+	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
+}
+
+# Clang failes to handle -Wa,--version fails unless -no-integrated-as is given.
+# We check -(f)integrated-as, expecting it is explicitly passed in for the
+# integrated assembler case.
+check_integrated_as()
+{
+	while [ $# -gt 0 ]; do
+		if [ "$1" = -integrated-as -o "$1" = -fintegrated-as ]; then
+			# For the intergrated assembler, we do not check the
+			# version here. It is the same as the clang version, and
+			# it has been already checked by scripts/cc-version.sh.
+			echo LLVM 0
+			exit 0
+		fi
+		shift
+	done
+}
+
+check_integrated_as "$@"
+
+orig_args="$@"
+
+# Get the first line of the --version output.
+IFS='
+'
+set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o /dev/null 2>&1)
+
+# Split the line on spaces.
+IFS=' '
+set -- $1
+
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
+if [ "$1" = GNU -a "$2" = assembler ]; then
+	shift $(($# - 1))
+	version=$1
+	min_version=$($min_tool_version binutils)
+	name=GNU
+else
+	echo "$orig_args: unknown assembler invoked" >&2
+	exit 1
+fi
+
+# Some distributions append a package release number, as in 2.34-4.fc32
+# Trim the hyphen and any characters that follow.
+version=${version%-*}
+
+cversion=$(get_canonical_version $version)
+min_cversion=$(get_canonical_version $min_version)
+
+if [ "$cversion" -lt "$min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Assembler is too old."
+	echo >&2 "***   Your $name assembler version:    $version"
+	echo >&2 "***   Minimum $name assembler version: $min_version"
+	echo >&2 "***"
+	exit 1
+fi
+
+echo $name $cversion
-- 
2.27.0

