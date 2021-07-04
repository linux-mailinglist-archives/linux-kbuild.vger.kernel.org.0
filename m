Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400F03BAEF2
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhGDUcL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:32:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230050AbhGDUcF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:32:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71D43611BF;
        Sun,  4 Jul 2021 20:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430570;
        bh=1dbLzsLW3T/kKEmOQc4nwiu+vVkoWSagVY0TgXbPQlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bs6T7FMTkT/b4NKJGIf3N8xdIYSA1bibZc/4QZ9T5Drs9gSpUQUG59CCqniYijQCI
         DtZ6cfuHqJTXx1C/8vcNPY8a6pp0tPm/KIEzFYTp+ypSGtXA6n6/TcF7fGXcWzicPj
         TE0Tt7ObYyJz6ZSBr7O+vmfyBGudzbnQH3IUU3cvXsl7GXHtUjNtcJCd5I4ka51jgT
         mhXWWKG/OSvqJb0nRZZNPHxwquHfL41NFoUtVyH7dC9mZo+AxUc3G3HIPJUZdqtii/
         wJOuqXsPztYg+7XkcS7QDaHnIg6ICt6WpVJ1h15HfZHtRMxQ0fF3Ufjm6M1P9johMU
         TeKqXpnModyNA==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Subject: [PATCH 12/17] Kbuild: add Rust support
Date:   Sun,  4 Jul 2021 22:27:51 +0200
Message-Id: <20210704202756.29107-13-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Having all the new files in place, we now enable Rust support
in the build system, including `Kconfig` entries related to Rust,
the Rust configuration printer, the target definition files,
the version detection script and a few other bits.

In the future, we will likely want to generate the target files
on the fly via a script.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Co-developed-by: Fox Chen <foxhlchen@gmail.com>
Signed-off-by: Fox Chen <foxhlchen@gmail.com>
Co-developed-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Signed-off-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Co-developed-by: Douglas Su <d0u9.su@outlook.com>
Signed-off-by: Douglas Su <d0u9.su@outlook.com>
Co-developed-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .gitignore                        |   5 +
 .rustfmt.toml                     |  12 ++
 Documentation/process/changes.rst |  13 ++
 Makefile                          | 159 ++++++++++++++-
 arch/arm/rust/target.json         |  28 +++
 arch/arm64/rust/target.json       |  35 ++++
 arch/powerpc/rust/target.json     |  30 +++
 arch/riscv/Makefile               |   1 +
 arch/riscv/rust/rv32ima.json      |  37 ++++
 arch/riscv/rust/rv32imac.json     |  37 ++++
 arch/riscv/rust/rv64ima.json      |  37 ++++
 arch/riscv/rust/rv64imac.json     |  37 ++++
 arch/x86/rust/target.json         |  37 ++++
 init/Kconfig                      |  28 +++
 lib/Kconfig.debug                 | 144 ++++++++++++++
 rust/.gitignore                   |   6 +
 rust/Makefile                     | 316 ++++++++++++++++++++++++++++++
 rust/bindgen_parameters           |  13 ++
 scripts/Makefile.build            |  22 +++
 scripts/Makefile.lib              |  12 ++
 scripts/kconfig/confdata.c        |  67 ++++++-
 scripts/rust-version.sh           |  31 +++
 22 files changed, 1099 insertions(+), 8 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 arch/arm/rust/target.json
 create mode 100644 arch/arm64/rust/target.json
 create mode 100644 arch/powerpc/rust/target.json
 create mode 100644 arch/riscv/rust/rv32ima.json
 create mode 100644 arch/riscv/rust/rv32imac.json
 create mode 100644 arch/riscv/rust/rv64ima.json
 create mode 100644 arch/riscv/rust/rv64imac.json
 create mode 100644 arch/x86/rust/target.json
 create mode 100644 rust/.gitignore
 create mode 100644 rust/Makefile
 create mode 100644 rust/bindgen_parameters
 create mode 100755 scripts/rust-version.sh

diff --git a/.gitignore b/.gitignore
index 7afd412dadd..48c68948f47 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,6 +37,7 @@
 *.o
 *.o.*
 *.patch
+*.rmeta
 *.s
 *.so
 *.so.dbg
@@ -96,6 +97,7 @@ modules.order
 !.gitattributes
 !.gitignore
 !.mailmap
+!.rustfmt.toml
 
 #
 # Generated include files
@@ -161,3 +163,6 @@ x509.genkey
 
 # Documentation toolchain
 sphinx_*/
+
+# Rust analyzer configuration
+/rust-project.json
diff --git a/.rustfmt.toml b/.rustfmt.toml
new file mode 100644
index 00000000000..4fea7c464f0
--- /dev/null
+++ b/.rustfmt.toml
@@ -0,0 +1,12 @@
+edition = "2018"
+newline_style = "Unix"
+
+# Unstable options that help catching some mistakes in formatting and that we may want to enable
+# when they become stable.
+#
+# They are kept here since they are useful to run from time to time.
+#format_code_in_doc_comments = true
+#reorder_impl_items = true
+#comment_width = 100
+#wrap_comments = true
+#normalize_comments = true
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index d3a8557b66a..7654a7105dc 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -26,11 +26,18 @@ running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
 you probably needn't concern yourself with pcmciautils.
 
+Furthermore, note that newer versions of the Rust toolchain may or may not work
+because, for the moment, we depend on some unstable features. Thus, unless you
+know what you are doing, use the exact version listed here. Please see
+:ref:`Documentation/rust/quick-start.rst <rust_quick_start>` for details.
+
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
 GNU C                  4.9              gcc --version
 Clang/LLVM (optional)  10.0.1           clang --version
+rustc (optional)       1.54.0-beta.1    rustc --version
+bindgen (optional)     0.56.0           bindgen --version
 GNU make               3.81             make --version
 binutils               2.23             ld -v
 flex                   2.5.35           flex --version
@@ -329,6 +336,12 @@ Sphinx
 Please see :ref:`sphinx_install` in :ref:`Documentation/doc-guide/sphinx.rst <sphinxdoc>`
 for details about Sphinx requirements.
 
+rustdoc
+-------
+
+``rustdoc`` is used to generate Rust documentation. Please see
+:ref:`Documentation/rust/docs.rst <rust_docs>` for more information.
+
 Getting updated software
 ========================
 
diff --git a/Makefile b/Makefile
index 6e823d8bd64..c814b209b6c 100644
--- a/Makefile
+++ b/Makefile
@@ -120,6 +120,13 @@ endif
 
 export KBUILD_CHECKSRC
 
+# Enable "clippy" (a linter) as part of the Rust compilation.
+#
+# Use 'make CLIPPY=1' to enable it.
+ifeq ("$(origin CLIPPY)", "command line")
+  KBUILD_CLIPPY := $(CLIPPY)
+endif
+
 # Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
 # directory of external module to build. Setting M= takes precedence.
 ifeq ("$(origin M)", "command line")
@@ -263,7 +270,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile
+			 outputmakefile rustfmt rustfmtcheck
 # Installation targets should not require compiler. Unfortunately, vdso_install
 # is an exception where build artifacts may be updated. This must be fixed.
 no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
@@ -452,6 +459,12 @@ OBJDUMP		= $(CROSS_COMPILE)objdump
 READELF		= $(CROSS_COMPILE)readelf
 STRIP		= $(CROSS_COMPILE)strip
 endif
+RUSTC		= rustc
+RUSTDOC		= rustdoc
+RUSTFMT		= rustfmt
+CLIPPY_DRIVER	= clippy-driver
+BINDGEN		= bindgen
+CARGO		= cargo
 PAHOLE		= pahole
 RESOLVE_BTFIDS	= $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
 LEX		= flex
@@ -475,9 +488,11 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
 NOSTDINC_FLAGS :=
 CFLAGS_MODULE   =
+RUSTFLAGS_MODULE =
 AFLAGS_MODULE   =
 LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
+RUSTFLAGS_KERNEL =
 AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
 
@@ -506,15 +521,41 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -Werror=return-type -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
+KBUILD_RUST_TARGET := $(srctree)/arch/$(SRCARCH)/rust/target.json
+KBUILD_RUSTFLAGS := --emit=dep-info,obj,metadata --edition=2018 \
+		     -Cpanic=abort -Cembed-bitcode=n -Clto=n -Crpath=n \
+		     -Cforce-unwind-tables=n -Ccodegen-units=1 \
+		     -Zbinary_dep_depinfo=y -Zsymbol-mangling-version=v0 \
+		     -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
+		     -Wmissing_docs
+KBUILD_CLIPPYFLAGS := -Dclippy::correctness -Dclippy::style \
+		      -Dclippy::complexity -Dclippy::perf -Dclippy::float_arithmetic
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
+KBUILD_RUSTFLAGS_KERNEL :=
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
+KBUILD_RUSTFLAGS_MODULE := --cfg MODULE
 KBUILD_LDFLAGS_MODULE :=
 KBUILD_LDFLAGS :=
 CLANG_FLAGS :=
 
+ifeq ($(KBUILD_CLIPPY),1)
+	RUSTC_OR_CLIPPY_QUIET := CLIPPY
+	RUSTC_OR_CLIPPY = $(CLIPPY_DRIVER) $(KBUILD_CLIPPYFLAGS)
+else
+	RUSTC_OR_CLIPPY_QUIET := RUSTC
+	RUSTC_OR_CLIPPY = $(RUSTC)
+endif
+
+ifdef RUST_LIB_SRC
+	export RUST_LIB_SRC
+endif
+
+export RUSTC_BOOTSTRAP := 1
+
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
@@ -522,9 +563,10 @@ export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
+export KBUILD_RUST_TARGET KBUILD_RUSTFLAGS RUSTFLAGS_KERNEL RUSTFLAGS_MODULE
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
-export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
-export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
+export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_RUSTFLAGS_MODULE KBUILD_LDFLAGS_MODULE
+export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTFLAGS_KERNEL
 
 # Files to ignore in find ... statements
 
@@ -724,7 +766,7 @@ $(KCONFIG_CONFIG):
 quiet_cmd_syncconfig = SYNC    $@
       cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
 
-%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
+%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
 	+$(call cmd,syncconfig)
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
@@ -750,12 +792,43 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, address-of-packed-member)
 
+ifdef CONFIG_RUST_DEBUG_ASSERTIONS
+KBUILD_RUSTFLAGS += -Cdebug-assertions=y
+else
+KBUILD_RUSTFLAGS += -Cdebug-assertions=n
+endif
+
+ifdef CONFIG_RUST_OVERFLOW_CHECKS
+KBUILD_RUSTFLAGS += -Coverflow-checks=y
+else
+KBUILD_RUSTFLAGS += -Coverflow-checks=n
+endif
+
 ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
 KBUILD_CFLAGS += -O2
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 2
 else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
 KBUILD_CFLAGS += -O3
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 3
 else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS += -Os
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := z
+endif
+
+ifdef CONFIG_RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
+KBUILD_RUSTFLAGS += -Copt-level=$(KBUILD_RUSTFLAGS_OPT_LEVEL_MAP)
+else ifdef CONFIG_RUST_OPT_LEVEL_0
+KBUILD_RUSTFLAGS += -Copt-level=0
+else ifdef CONFIG_RUST_OPT_LEVEL_1
+KBUILD_RUSTFLAGS += -Copt-level=1
+else ifdef CONFIG_RUST_OPT_LEVEL_2
+KBUILD_RUSTFLAGS += -Copt-level=2
+else ifdef CONFIG_RUST_OPT_LEVEL_3
+KBUILD_RUSTFLAGS += -Copt-level=3
+else ifdef CONFIG_RUST_OPT_LEVEL_S
+KBUILD_RUSTFLAGS += -Copt-level=s
+else ifdef CONFIG_RUST_OPT_LEVEL_Z
+KBUILD_RUSTFLAGS += -Copt-level=z
 endif
 
 # Tell gcc to never replace conditional load with a non-conditional one
@@ -805,6 +878,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
+KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
 else
 # Some targets (ARM with Thumb2, for example), can't be built with frame
 # pointers.  For those, we don't have FUNCTION_TRACER automatically
@@ -842,6 +916,8 @@ ifdef CONFIG_CC_IS_GCC
 DEBUG_CFLAGS	+= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
 endif
 
+DEBUG_RUSTFLAGS :=
+
 ifdef CONFIG_DEBUG_INFO
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
@@ -852,6 +928,11 @@ endif
 
 ifneq ($(LLVM_IAS),1)
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
+ifdef CONFIG_DEBUG_INFO_REDUCED
+DEBUG_RUSTFLAGS += -Cdebuginfo=1
+else
+DEBUG_RUSTFLAGS += -Cdebuginfo=2
+endif
 endif
 
 ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
@@ -876,6 +957,9 @@ endif # CONFIG_DEBUG_INFO
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
 
+KBUILD_RUSTFLAGS += $(DEBUG_RUSTFLAGS)
+export DEBUG_RUSTFLAGS
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_FTRACE_MCOUNT_USE_CC
   CC_FLAGS_FTRACE	+= -mrecord-mcount
@@ -1031,10 +1115,11 @@ include $(addprefix $(srctree)/, $(include-y))
 # Do not add $(call cc-option,...) below this line. When you build the kernel
 # from the clean source tree, the GCC plugins do not exist at this point.
 
-# Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
+# Add user supplied CPPFLAGS, AFLAGS, CFLAGS and RUSTFLAGS as the last assignments
 KBUILD_CPPFLAGS += $(KCPPFLAGS)
 KBUILD_AFLAGS   += $(KAFLAGS)
 KBUILD_CFLAGS   += $(KCFLAGS)
+KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 
 KBUILD_LDFLAGS_MODULE += --build-id=sha1
 LDFLAGS_vmlinux += --build-id=sha1
@@ -1138,6 +1223,10 @@ export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
+ifdef CONFIG_RUST
+core-y		+= rust/
+endif
+
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
 		     $(libs-y) $(libs-m)))
@@ -1238,6 +1327,9 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
 	$(Q)$(MAKE) $(build)=.
+ifdef CONFIG_RUST
+	$(Q)$(MAKE) $(build)=rust
+endif
 
 # All the preparing..
 prepare: prepare0 prepare-objtool prepare-resolve_btfids
@@ -1511,7 +1603,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       compile_commands.json .thinlto-cache
+	       compile_commands.json .thinlto-cache rust/test rust/doc
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -1522,7 +1614,8 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/signing_key.pem certs/signing_key.x509 \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
-		  *.spec
+		  *.spec \
+		  rust/*_generated.h rust/*_generated.rs rust/libmacros.so
 
 # clean - Delete most, but leave enough to build external modules
 #
@@ -1634,6 +1727,17 @@ help:
 	@echo  '  kselftest-merge   - Merge all the config dependencies of'
 	@echo  '		      kselftest to existing .config.'
 	@echo  ''
+	@echo  'Rust targets:'
+	@echo  '  rustfmt	  - Reformat all the Rust code in the kernel'
+	@echo  '  rustfmtcheck	  - Checks if all the Rust code in the kernel'
+	@echo  '		    is formatted, printing a diff otherwise.'
+	@echo  '  rustdoc	  - Generate Rust documentation'
+	@echo  '		    (requires kernel .config)'
+	@echo  '  rusttest        - Runs the Rust tests'
+	@echo  '                    (requires kernel .config; downloads external repos)'
+	@echo  '  rust-analyzer	  - Generate rust-project.json rust-analyzer support file'
+	@echo  '		    (requires kernel .config)'
+	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
 		echo '* dtbs             - Build device tree blobs for enabled boards'; \
@@ -1705,6 +1809,46 @@ PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
 
+
+# Rust targets
+# ---------------------------------------------------------------------------
+
+# Documentation target
+#
+# Using the singular to avoid running afoul of `no-dot-config-targets`.
+PHONY += rustdoc
+rustdoc: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
+# Testing target
+PHONY += rusttest
+rusttest: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
+# Formatting targets
+PHONY += rustfmt rustfmtcheck
+
+# We skip `rust/alloc` since we want to minimize the diff w.r.t. upstream.
+#
+# We match using absolute paths since `find` does not resolve them
+# when matching, which is a problem when e.g. `srctree` is `..`.
+# We `grep` afterwards in order to remove the directory entry itself.
+rustfmt:
+	$(Q)find $(abs_srctree) -type f -name '*.rs' \
+		-o -path $(abs_srctree)/rust/alloc -prune \
+		-o -path $(abs_objtree)/rust/test -prune \
+		| grep -Fv $(abs_srctree)/rust/alloc \
+		| grep -Fv $(abs_objtree)/rust/test \
+		| xargs $(RUSTFMT) $(rustfmt_flags)
+
+rustfmtcheck: rustfmt_flags = --check
+rustfmtcheck: rustfmt
+
+# IDE support targets
+PHONY += rust-analyzer
+rust-analyzer: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
 # Misc
 # ---------------------------------------------------------------------------
 
@@ -1862,6 +2006,7 @@ clean: $(clean-dirs)
 	$(call cmd,rmfiles)
 	@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
+		-o -name '*.rmeta' \
 		-o -name '*.ko.*' \
 		-o -name '*.dtb' -o -name '*.dtbo' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
 		-o -name '*.dwo' -o -name '*.lst' \
diff --git a/arch/arm/rust/target.json b/arch/arm/rust/target.json
new file mode 100644
index 00000000000..37710eb727b
--- /dev/null
+++ b/arch/arm/rust/target.json
@@ -0,0 +1,28 @@
+{
+  "arch": "arm",
+  "crt-static-respected": true,
+  "data-layout": "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64",
+  "dynamic-linking": true,
+  "env": "gnu",
+  "executables": true,
+  "features": "+strict-align,+v6",
+  "function-sections": false,
+  "has-elf-tls": true,
+  "has-rpath": true,
+  "is-builtin": true,
+  "linker-is-gnu": true,
+  "llvm-target": "arm-unknown-linux-gnueabi",
+  "max-atomic-width": 64,
+  "os": "linux",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack"
+    ]
+  },
+  "relocation-model": "static",
+  "target-family": "unix",
+  "target-mcount": "\u0001__gnu_mcount_nc",
+  "target-pointer-width": "32"
+}
diff --git a/arch/arm64/rust/target.json b/arch/arm64/rust/target.json
new file mode 100644
index 00000000000..9ea86ed6c73
--- /dev/null
+++ b/arch/arm64/rust/target.json
@@ -0,0 +1,35 @@
+{
+  "arch": "aarch64",
+  "data-layout": "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128",
+  "disable-redzone": true,
+  "eliminate-frame-pointer": false,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+strict-align,+neon,+fp-armv8",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "aarch64-unknown-none",
+  "max-atomic-width": 128,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": ""
+}
diff --git a/arch/powerpc/rust/target.json b/arch/powerpc/rust/target.json
new file mode 100644
index 00000000000..1e53f830809
--- /dev/null
+++ b/arch/powerpc/rust/target.json
@@ -0,0 +1,30 @@
+{
+  "arch": "powerpc64",
+  "code-mode": "kernel",
+  "cpu": "ppc64le",
+  "data-layout": "e-m:e-i64:64-n32:64",
+  "env": "gnu",
+  "features": "-altivec,-vsx,-hard-float",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "powerpc64le-elf",
+  "max-atomic-width": 64,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "target-family": "unix",
+  "target-mcount": "_mcount",
+  "target-endian": "little",
+  "target-pointer-width": "64"
+}
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 99ecd8bcfd7..2a476eb5da5 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -54,6 +54,7 @@ riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
+KBUILD_RUST_TARGET := $(srctree)/arch/riscv/rust/$(subst fd,,$(riscv-march-y)).json
 
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
diff --git a/arch/riscv/rust/rv32ima.json b/arch/riscv/rust/rv32ima.json
new file mode 100644
index 00000000000..8e9b46011e7
--- /dev/null
+++ b/arch/riscv/rust/rv32ima.json
@@ -0,0 +1,37 @@
+{
+  "arch": "riscv32",
+  "code-model": "medium",
+  "cpu": "generic-rv32",
+  "data-layout": "e-m:e-p:32:32-i64:64-n32-S128",
+  "disable-redzone": true,
+  "eliminate-frame-pointer": false,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv32",
+  "max-atomic-width": 32,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m32"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "32",
+  "vendor": ""
+}
diff --git a/arch/riscv/rust/rv32imac.json b/arch/riscv/rust/rv32imac.json
new file mode 100644
index 00000000000..2b3a139da99
--- /dev/null
+++ b/arch/riscv/rust/rv32imac.json
@@ -0,0 +1,37 @@
+{
+  "arch": "riscv32",
+  "code-model": "medium",
+  "cpu": "generic-rv32",
+  "data-layout": "e-m:e-p:32:32-i64:64-n32-S128",
+  "disable-redzone": true,
+  "eliminate-frame-pointer": false,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a,+c",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv32",
+  "max-atomic-width": 32,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m32"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "32",
+  "vendor": ""
+}
diff --git a/arch/riscv/rust/rv64ima.json b/arch/riscv/rust/rv64ima.json
new file mode 100644
index 00000000000..091da50069a
--- /dev/null
+++ b/arch/riscv/rust/rv64ima.json
@@ -0,0 +1,37 @@
+{
+  "arch": "riscv64",
+  "code-model": "medium",
+  "cpu": "generic-rv64",
+  "data-layout": "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
+  "disable-redzone": true,
+  "eliminate-frame-pointer": false,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv64",
+  "max-atomic-width": 64,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": ""
+}
diff --git a/arch/riscv/rust/rv64imac.json b/arch/riscv/rust/rv64imac.json
new file mode 100644
index 00000000000..aa5a8f4549f
--- /dev/null
+++ b/arch/riscv/rust/rv64imac.json
@@ -0,0 +1,37 @@
+{
+  "arch": "riscv64",
+  "code-model": "medium",
+  "cpu": "generic-rv64",
+  "data-layout": "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
+  "disable-redzone": true,
+  "eliminate-frame-pointer": false,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a,+c",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv64",
+  "max-atomic-width": 64,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": ""
+}
diff --git a/arch/x86/rust/target.json b/arch/x86/rust/target.json
new file mode 100644
index 00000000000..76ac800d38e
--- /dev/null
+++ b/arch/x86/rust/target.json
@@ -0,0 +1,37 @@
+{
+  "arch": "x86_64",
+  "code-model": "kernel",
+  "cpu": "x86-64",
+  "data-layout": "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128",
+  "disable-redzone": true,
+  "eliminate-frame-pointer": false,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-3dnow,-3dnowa,-avx,-avx2,+soft-float",
+  "function-sections": false,
+  "is-builtin": true,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "x86_64-elf",
+  "max-atomic-width": 64,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": "unknown"
+}
diff --git a/init/Kconfig b/init/Kconfig
index a61c92066c2..5318f209a3b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -60,6 +60,15 @@ config LLD_VERSION
 	default $(ld-version) if LD_IS_LLD
 	default 0
 
+config HAS_RUST
+	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV
+	def_bool $(success,$(RUSTC) --version)
+
+config RUSTC_VERSION
+	depends on HAS_RUST
+	int
+	default $(shell,$(srctree)/scripts/rust-version.sh $(RUSTC))
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
@@ -2011,6 +2020,25 @@ config PROFILING
 	  Say Y here to enable the extended profiling support mechanisms used
 	  by profilers.
 
+config RUST
+	bool "Rust support"
+	depends on HAS_RUST
+	depends on !COMPILE_TEST
+	depends on !MODVERSIONS
+	default n
+	help
+	  Enables Rust support in the kernel.
+
+	  This allows other Rust-related options, like drivers written in Rust,
+	  to be selected.
+
+	  It is also required to be able to load external kernel modules
+	  written in Rust.
+
+	  See Documentation/rust/ for more information.
+
+	  If unsure, say N.
+
 #
 # Place an empty function call at each tracepoint site. Can be
 # dynamically changed for a probe function.
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 678c1396758..30b705709c2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2602,6 +2602,150 @@ config HYPERV_TESTING
 
 endmenu # "Kernel Testing and Coverage"
 
+menu "Rust hacking"
+
+config RUST_DEBUG_ASSERTIONS
+	bool "Debug assertions"
+	default n
+	depends on RUST
+	help
+	  Enables rustc's `-Cdebug-assertions` codegen option.
+
+	  This flag lets you turn `cfg(debug_assertions)` conditional
+	  compilation on or off. This can be used to enable extra debugging
+	  code in development but not in production. For example, it controls
+	  the behavior of the standard library's `debug_assert!` macro.
+
+	  Note that this will apply to all Rust code, including `core`.
+
+	  If unsure, say N.
+
+config RUST_OVERFLOW_CHECKS
+	bool "Overflow checks"
+	default y
+	depends on RUST
+	help
+	  Enables rustc's `-Coverflow-checks` codegen option.
+
+	  This flag allows you to control the behavior of runtime integer
+	  overflow. When overflow-checks are enabled, a panic will occur
+	  on overflow.
+
+	  Note that this will apply to all Rust code, including `core`.
+
+	  If unsure, say Y.
+
+choice
+	prompt "Optimization level"
+	default RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
+	depends on RUST
+	help
+	  Controls rustc's `-Copt-level` codegen option.
+
+	  This flag controls the optimization level.
+
+	  If unsure, say "Similar as chosen for C".
+
+config RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
+	bool "Similar as chosen for C"
+	help
+	  This choice will pick a similar optimization level as chosen in
+	  the "Compiler optimization level" for C:
+
+	      -O2 is currently mapped to -Copt-level=2
+	      -O3 is currently mapped to -Copt-level=3
+	      -Os is currently mapped to -Copt-level=z
+
+	  The mapping may change over time to follow the intended semantics
+	  of the choice for C as sensibly as possible.
+
+	  This is the default.
+
+config RUST_OPT_LEVEL_0
+	bool "No optimizations (-Copt-level=0)"
+	help
+	  Not recommended for most purposes. It may come in handy for debugging
+	  suspected optimizer bugs, unexpected undefined behavior, etc.
+
+	  Note that this level will *not* enable debug assertions nor overflow
+	  checks on its own (like it happens when interacting with rustc
+	  directly). Use the corresponding configuration options to control
+	  that instead, orthogonally.
+
+	  Note this level may cause excessive stack usage, which can lead to stack
+	  overflow and subsequent crashes.
+
+config RUST_OPT_LEVEL_1
+	bool "Basic optimizations (-Copt-level=1)"
+	help
+	  Useful for debugging without getting too lost, but without
+	  the overhead and boilerplate of no optimizations at all.
+
+	  Note this level may cause excessive stack usage, which can lead to stack
+	  overflow and subsequent crashes.
+
+config RUST_OPT_LEVEL_2
+	bool "Some optimizations (-Copt-level=2)"
+	help
+	  The sensible choice in most cases.
+
+config RUST_OPT_LEVEL_3
+	bool "All optimizations (-Copt-level=3)"
+	help
+	  Yet more performance (hopefully).
+
+config RUST_OPT_LEVEL_S
+	bool "Optimize for size (-Copt-level=s)"
+	help
+	  Smaller kernel, ideally without too much performance loss.
+
+config RUST_OPT_LEVEL_Z
+	bool "Optimize for size, no loop vectorization (-Copt-level=z)"
+	help
+	  Like the previous level, but also turn off loop vectorization.
+
+endchoice
+
+choice
+	prompt "Build-time assertions"
+	default RUST_BUILD_ASSERT_ALLOW if RUST_OPT_LEVEL_0
+	default RUST_BUILD_ASSERT_DENY if !RUST_OPT_LEVEL_0
+	depends on RUST
+	help
+	  Controls how are `build_error!` and `build_assert!` handled during build.
+
+	  If calls to them exist in the binary, it may indicate a violated invariant
+	  or that the optimizer failed to verify the invariant during compilation.
+	  You can choose to abort compilation or ignore them during build and let the
+	  check be carried to runtime.
+
+	  If optimizations are turned off, you cannot select "Deny".
+
+	  If unsure, say "Deny".
+
+config RUST_BUILD_ASSERT_ALLOW
+	bool "Allow"
+	help
+	  Unoptimized calls to `build_error!` will be converted to `panic!`
+	  and checked at runtime.
+
+config RUST_BUILD_ASSERT_WARN
+	bool "Warn"
+	help
+	  Unoptimized calls to `build_error!` will be converted to `panic!`
+	  and checked at runtime, but warnings will be generated when building.
+
+config RUST_BUILD_ASSERT_DENY
+	bool "Deny"
+	depends on !RUST_OPT_LEVEL_0
+	help
+	  Unoptimized calls to `build_error!` will abort compilation.
+
+endchoice
+
+
+endmenu # "Rust"
+
 source "Documentation/Kconfig"
 
 endmenu # Kernel hacking
diff --git a/rust/.gitignore b/rust/.gitignore
new file mode 100644
index 00000000000..c6186b71e1c
--- /dev/null
+++ b/rust/.gitignore
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+bindings_generated.rs
+exports_*_generated.h
+doc/
+test/
diff --git a/rust/Makefile b/rust/Makefile
new file mode 100644
index 00000000000..233b8f36548
--- /dev/null
+++ b/rust/Makefile
@@ -0,0 +1,316 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RUST) += core.o compiler_builtins.o helpers.o
+extra-$(CONFIG_RUST) += exports_core_generated.h
+
+extra-$(CONFIG_RUST) += libmacros.so
+
+extra-$(CONFIG_RUST) += bindings_generated.rs
+obj-$(CONFIG_RUST) += alloc.o kernel.o
+extra-$(CONFIG_RUST) += exports_alloc_generated.h exports_kernel_generated.h
+
+ifdef CONFIG_RUST_BUILD_ASSERT_DENY
+extra-$(CONFIG_RUST) += build_error.o
+else
+obj-$(CONFIG_RUST) += build_error.o
+endif
+
+obj-$(CONFIG_RUST) += exports.o
+
+ifeq ($(quiet),silent_)
+cargo_quiet=-q
+rust_test_quiet=-q
+rustdoc_test_quiet=--test-args -q
+else ifeq ($(quiet),quiet_)
+rust_test_quiet=-q
+rustdoc_test_quiet=--test-args -q
+else
+cargo_quiet=--verbose
+endif
+
+quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
+      cmd_rustdoc = \
+	RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
+	$(RUSTDOC) $(if $(rustdoc_host),,$(rust_cross_flags)) \
+		$(filter-out -Cpanic=abort, $(filter-out --emit=%, $(rust_flags))) \
+		$(rustc_target_flags) -L $(objtree)/rust \
+		--output $(objtree)/rust/doc --crate-name $(subst rustdoc-,,$@) \
+		@$(objtree)/include/generated/rustc_cfg $<
+
+# This is a temporary fix for the CSS, visible on `type`s (`Result`).
+# It is already fixed in nightly.
+RUSTDOC_FIX_BEFORE := .impl,.method,.type:not(.container-rustdoc),.associatedconstant,.associatedtype
+RUSTDOC_FIX_AFTER := .impl,.impl-items .method,.methods .method,.impl-items \
+	.type,.methods .type,.impl-items .associatedconstant,.methods \
+	.associatedconstant,.impl-items .associatedtype,.methods .associatedtype
+
+rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins rustdoc-alloc rustdoc-kernel
+	$(Q)cp $(srctree)/Documentation/rust/assets/* $(objtree)/rust/doc
+	$(Q)sed -i "s/$(RUSTDOC_FIX_BEFORE)/$(RUSTDOC_FIX_AFTER)/" \
+		$(objtree)/rust/doc/rustdoc.css
+
+rustdoc-macros: private rustdoc_host = yes
+rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
+    --extern proc_macro
+rustdoc-macros: $(srctree)/rust/macros/lib.rs FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-compiler_builtins: $(srctree)/rust/compiler_builtins.rs rustdoc-core FORCE
+	$(call if_changed,rustdoc)
+
+# We need to allow `broken_intra_doc_links` because some
+# `no_global_oom_handling` functions refer to non-`no_global_oom_handling`
+# functions. Ideally `rustdoc` would have a way to distinguish broken links
+# due to things that are "configured out" vs. entirely non-existing ones.
+rustdoc-alloc: private rustc_target_flags = --cfg no_global_oom_handling \
+    -Abroken_intra_doc_links
+rustdoc-alloc: $(srctree)/rust/alloc/lib.rs rustdoc-core \
+    rustdoc-compiler_builtins FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-kernel: private rustc_target_flags = --extern alloc \
+    --extern build_error \
+    --extern macros=$(objtree)/rust/libmacros.so
+rustdoc-kernel: $(srctree)/rust/kernel/lib.rs rustdoc-core \
+    rustdoc-macros rustdoc-compiler_builtins rustdoc-alloc \
+    $(objtree)/rust/libmacros.so $(objtree)/rust/bindings_generated.rs FORCE
+	$(call if_changed,rustdoc)
+
+quiet_cmd_rustc_test_library = RUSTC TL $<
+      cmd_rustc_test_library = \
+	RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
+	$(RUSTC) $(filter-out --sysroot=%, $(filter-out -Cpanic=abort, $(filter-out --emit=%, $(rust_flags)))) \
+		$(rustc_target_flags) --crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
+		--out-dir $(objtree)/rust/test/ --cfg testlib \
+		--sysroot $(objtree)/rust/test/sysroot \
+		-L $(objtree)/rust/test/ --crate-name $(subst rusttest-,,$(subst rusttestlib-,,$@)) $<
+
+rusttestlib-build_error: $(srctree)/rust/build_error.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-macros: private rustc_target_flags = --extern proc_macro
+rusttestlib-macros: private rustc_test_library_proc = yes
+rusttestlib-macros: $(srctree)/rust/macros/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+quiet_cmd_rustdoc_test = RUSTDOC T $<
+      cmd_rustdoc_test = \
+	RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
+	$(RUSTDOC) --test $(filter-out --sysroot=%, $(filter-out -Cpanic=abort, $(filter-out --emit=%, $(rust_flags)))) \
+		$(rustc_target_flags) $(rustdoc_test_target_flags) \
+		--sysroot $(objtree)/rust/test/sysroot $(rustdoc_test_quiet) \
+		-L $(objtree)/rust/test \
+		--output $(objtree)/rust/doc --crate-name $(subst rusttest-,,$@) \
+		@$(objtree)/include/generated/rustc_cfg $<
+
+# We cannot use `-Zpanic-abort-tests` because some tests are dynamic,
+# so for the moment we skip `-Cpanic=abort`.
+quiet_cmd_rustc_test = RUSTC T  $<
+      cmd_rustc_test = \
+	RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
+	$(RUSTC) --test $(filter-out --sysroot=%, $(filter-out -Cpanic=abort, $(filter-out --emit=%, $(rust_flags)))) \
+		$(rustc_target_flags) --out-dir $(objtree)/rust/test \
+		--sysroot $(objtree)/rust/test/sysroot \
+		-L $(objtree)/rust/test/ --crate-name $(subst rusttest-,,$@) $<; \
+	$(objtree)/rust/test/$(subst rusttest-,,$@) $(rust_test_quiet) \
+		$(rustc_test_run_flags)
+
+rusttest: rusttest-macros rusttest-kernel
+
+# This prepares a custom sysroot with our custom `alloc` instead of
+# the standard one.
+#
+# This requires several hacks:
+#   - Unlike `core` and `alloc`, `std` depends on more than a dozen crates,
+#     including third-party crates that need to be downloaded, plus custom
+#     `build.rs` steps. Thus hardcoding things here is not maintainable.
+#   - `cargo` knows how to build the standard library, but it is an unstable
+#     feature so far (`-Zbuild-std`).
+#   - `cargo` only considers the use case of building the standard library
+#     to use it in a given package. Thus we need to create a dummy package
+#     and pick the generated libraries from there.
+#   - Since we only keep a subset of upstream `alloc` in-tree, we need
+#     to recreate it on the fly by putting our sources on top.
+#   - The usual ways of modifying the dependency graph in `cargo` do not seem
+#     to apply for the `-Zbuild-std` steps, thus we have to mislead it
+#     by modifying the sources in the sysroot.
+#   - To avoid messing with the user's Rust installation, we create a clone
+#     of the sysroot. However, `cargo` ignores `RUSTFLAGS` in the `-Zbuild-std`
+#     steps, thus we use a wrapper binary passed via `RUSTC` to pass the flag.
+#
+# In the future, we hope to avoid the whole ordeal by either:
+#   - Making the `test` crate not depend on `std` (either improving upstream
+#     or having our own custom crate).
+#   - Making the tests run in kernel space (requires the previous point).
+#   - Making `std` and friends be more like a "normal" crate, so that
+#     `-Zbuild-std` and related hacks are not needed.
+quiet_cmd_rustsysroot = RUSTSYSROOT
+      cmd_rustsysroot = \
+	rm -rf $(objtree)/rust/test; \
+	mkdir -p $(objtree)/rust/test; \
+	cp -a $(rustc_sysroot) $(objtree)/rust/test/sysroot; \
+	cp -r $(srctree)/rust/alloc/* \
+		$(objtree)/rust/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
+	echo '\#!/bin/sh' > $(objtree)/rust/test/rustc_sysroot; \
+	echo "$(RUSTC) --sysroot=$(abspath $(objtree)/rust/test/sysroot) \"\$$@\"" \
+		>> $(objtree)/rust/test/rustc_sysroot; \
+	chmod u+x $(objtree)/rust/test/rustc_sysroot; \
+	$(CARGO) -q new $(objtree)/rust/test/dummy; \
+	RUSTC=$(objtree)/rust/test/rustc_sysroot $(CARGO) $(cargo_quiet) \
+		test -Zbuild-std --target $(rustc_host_target) \
+		--manifest-path $(objtree)/rust/test/dummy/Cargo.toml; \
+	rm $(objtree)/rust/test/sysroot/lib/rustlib/$(rustc_host_target)/lib/*; \
+	cp $(objtree)/rust/test/dummy/target/$(rustc_host_target)/debug/deps/* \
+		$(objtree)/rust/test/sysroot/lib/rustlib/$(rustc_host_target)/lib
+
+rusttest-prepare: FORCE
+	$(call if_changed,rustsysroot)
+
+rusttest-macros: private rustc_target_flags = --extern proc_macro
+rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
+rusttest-macros: $(srctree)/rust/macros/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test)
+	$(call if_changed,rustdoc_test)
+
+rusttest-kernel: private rustc_target_flags = --extern alloc \
+    --extern build_error --extern macros
+rusttest-kernel: private rustc_test_run_flags = \
+    --skip bindgen_test_layout_
+rusttest-kernel: $(srctree)/rust/kernel/lib.rs rusttest-prepare \
+    rusttestlib-build_error rusttestlib-macros FORCE
+	$(call if_changed,rustc_test)
+	$(call if_changed,rustc_test_library)
+	$(call if_changed,rustdoc_test)
+
+ifdef CONFIG_CC_IS_CLANG
+bindgen_c_flags = $(c_flags)
+else
+# bindgen relies on libclang to parse C. Ideally, bindgen would support a GCC
+# plugin backend and/or the Clang driver would be perfectly compatible with GCC.
+#
+# For the moment, here we are tweaking the flags on the fly. Some config
+# options may not work (e.g. `GCC_PLUGIN_RANDSTRUCT` if we end up using one
+# of those structs). We might want to redo how Clang flags are kept track of
+# in the general `Makefile` even for GCC builds, similar to what we did with
+# `TENTATIVE_CLANG_FLAGS`.
+bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
+	-mskip-rax-setup -mgeneral-regs-only -msign-return-address=% \
+	-mindirect-branch=thunk-extern -mindirect-branch-register -mrecord-mcount \
+	-mabi=lp64 -mstack-protector-guard% -fconserve-stack -falign-jumps=% \
+	-falign-loops=% -fno-ipa-cp-clone -fno-partial-inlining \
+	-fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
+	-Wno-packed-not-aligned -Wno-format-truncation -Wno-format-overflow \
+	-Wno-stringop-truncation -Wno-unused-but-set-variable \
+	-Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized \
+	-Werror=designated-init -Wno-zero-length-bounds \
+	--param=% --param asan-%
+
+# PowerPC
+bindgen_skip_c_flags += -mtraceback=no -mno-pointers-to-nested-functions \
+	-mno-string -mno-strict-align
+
+bindgen_extra_c_flags = $(TENTATIVE_CLANG_FLAGS) -Wno-address-of-packed-member
+bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
+	$(bindgen_extra_c_flags)
+endif
+
+# To avoid several recompilations in PowerPC, which inserts `-D_TASK_CPU`
+bindgen_c_flags_final = $(filter-out -D_TASK_CPU=%, $(bindgen_c_flags))
+
+quiet_cmd_bindgen = BINDGEN $@
+      cmd_bindgen = \
+	$(BINDGEN) $< $(shell grep -v '^\#\|^$$' $(srctree)/rust/bindgen_parameters) \
+		--use-core --with-derive-default --ctypes-prefix c_types \
+		--no-debug '.*' \
+		--size_t-is-usize -o $@ -- $(bindgen_c_flags_final) -DMODULE
+
+$(objtree)/rust/bindings_generated.rs: $(srctree)/rust/kernel/bindings_helper.h \
+	$(srctree)/rust/bindgen_parameters FORCE
+	$(call if_changed_dep,bindgen)
+
+quiet_cmd_exports = EXPORTS $@
+      cmd_exports = \
+	$(NM) -p --defined-only $< \
+		| grep -E ' (T|R|D) ' | cut -d ' ' -f 3 \
+		| xargs -Isymbol \
+		echo 'EXPORT_SYMBOL_RUST_GPL(symbol);' > $@
+
+$(objtree)/rust/exports_core_generated.h: $(objtree)/rust/core.o FORCE
+	$(call if_changed,exports)
+
+$(objtree)/rust/exports_alloc_generated.h: $(objtree)/rust/alloc.o FORCE
+	$(call if_changed,exports)
+
+$(objtree)/rust/exports_kernel_generated.h: $(objtree)/rust/kernel.o FORCE
+	$(call if_changed,exports)
+
+# `-Cpanic=unwind -Cforce-unwind-tables=y` overrides `rust_flags` in order to
+# avoid the https://github.com/rust-lang/rust/issues/82320 rustc crash.
+quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
+      cmd_rustc_procmacro = \
+	$(RUSTC_OR_CLIPPY) $(rust_flags) \
+		--emit=dep-info,link --extern proc_macro \
+		-Cpanic=unwind -Cforce-unwind-tables=y \
+		--crate-type proc-macro --out-dir $(objtree)/rust/ \
+		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<; \
+	mv $(objtree)/rust/$(patsubst lib%.so,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+# Procedural macros can only be used with the `rustc` that compiled it.
+# Therefore, to get `libmacros.so` automatically recompiled when the compiler
+# version changes, we add `core.o` as a dependency (even if it is not needed).
+$(objtree)/rust/libmacros.so: $(srctree)/rust/macros/lib.rs \
+	$(objtree)/rust/core.o FORCE
+	$(call if_changed_dep,rustc_procmacro)
+
+quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
+      cmd_rustc_library = \
+	RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
+		$(rust_flags) $(rust_cross_flags) $(rustc_target_flags) \
+		--crate-type rlib --out-dir $(objtree)/rust/ -L $(objtree)/rust/ \
+		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
+	mv $(objtree)/rust/$(patsubst %.o,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile) \
+	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
+
+# `$(rust_flags)` is passed in case the user added `--sysroot`.
+rustc_sysroot = $(shell $(RUSTC) $(rust_flags) --print sysroot)
+rustc_host_target = $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
+RUST_LIB_SRC ?= $(rustc_sysroot)/lib/rustlib/src/rust/library
+
+rust-analyzer:
+	$(Q)$(srctree)/scripts/generate_rust_analyzer.py $(srctree) $(objtree) $(RUST_LIB_SRC) $(objtree)/rust/bindings_generated.rs > $(objtree)/rust-project.json
+
+$(objtree)/rust/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
+$(objtree)/rust/compiler_builtins.o: $(srctree)/rust/compiler_builtins.rs \
+    $(objtree)/rust/core.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(objtree)/rust/alloc.o: private skip_clippy = 1
+$(objtree)/rust/alloc.o: private rustc_target_flags = --cfg no_global_oom_handling
+$(objtree)/rust/alloc.o: $(srctree)/rust/alloc/lib.rs \
+    $(objtree)/rust/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(objtree)/rust/build_error.o: $(srctree)/rust/build_error.rs \
+    $(objtree)/rust/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+# ICE on `--extern macros`: https://github.com/rust-lang/rust/issues/56935
+$(objtree)/rust/kernel.o: private rustc_target_flags = --extern alloc \
+    --extern build_error \
+    --extern macros=$(objtree)/rust/libmacros.so
+$(objtree)/rust/kernel.o: $(srctree)/rust/kernel/lib.rs $(objtree)/rust/alloc.o \
+    $(objtree)/rust/build_error.o \
+    $(objtree)/rust/libmacros.so $(objtree)/rust/bindings_generated.rs FORCE
+	$(call if_changed_dep,rustc_library)
+
+# Targets that need to expand twice
+.SECONDEXPANSION:
+$(objtree)/rust/core.o: private skip_clippy = 1
+$(objtree)/rust/core.o: $$(RUST_LIB_SRC)/core/src/lib.rs FORCE
+	$(call if_changed_dep,rustc_library)
+
+rustdoc-core: $$(RUST_LIB_SRC)/core/src/lib.rs FORCE
+	$(call if_changed,rustdoc)
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
new file mode 100644
index 00000000000..c2cc4a88234
--- /dev/null
+++ b/rust/bindgen_parameters
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+--opaque-type xregs_state
+--opaque-type desc_struct
+--opaque-type arch_lbr_state
+--opaque-type local_apic
+
+# If SMP is disabled, `arch_spinlock_t` is defined as a ZST which triggers a Rust
+# warning. We don't need to peek into it anyway.
+--opaque-type spinlock
+
+# `seccomp`'s comment gets understood as a doctest
+--no-doc-comments
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 949f723efe5..bb22acf8415 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -26,6 +26,7 @@ EXTRA_CPPFLAGS :=
 EXTRA_LDFLAGS  :=
 asflags-y  :=
 ccflags-y  :=
+rustflags-y :=
 cppflags-y :=
 ldflags-y  :=
 
@@ -288,6 +289,27 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Compile Rust sources (.rs)
+# ---------------------------------------------------------------------------
+
+# Need to use absolute path here and have symbolic links resolved;
+# otherwise rustdoc and rustc compute different hashes for the target.
+rust_cross_flags := --target=$(realpath $(KBUILD_RUST_TARGET))
+
+quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_o_rs = \
+	RUST_MODFILE=$(modfile) \
+	$(RUSTC_OR_CLIPPY) $(rust_flags) $(rust_cross_flags) \
+		-Zallow-features=allocator_api,bench_black_box,concat_idents,global_asm,try_reserve \
+		--extern alloc --extern kernel \
+		--crate-type rlib --out-dir $(obj) -L $(objtree)/rust/ \
+		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
+	mv $(obj)/$(subst .o,,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+$(obj)/%.o: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_o_rs)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 10950559b22..cee5af32c65 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -8,6 +8,7 @@ ldflags-y  += $(EXTRA_LDFLAGS)
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
 KBUILD_CFLAGS += $(subdir-ccflags-y)
+KBUILD_RUSTFLAGS += $(subdir-rustflags-y)
 
 # Figure out what we need to build from the various variables
 # ===========================================================================
@@ -133,6 +134,10 @@ _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), \
                      $(filter-out $(ccflags-remove-y), \
                          $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(ccflags-y)) \
                      $(CFLAGS_$(target-stem).o))
+_rust_flags    = $(filter-out $(RUSTFLAGS_REMOVE_$(target-stem).o), \
+                     $(filter-out $(rustflags-remove-y), \
+                         $(KBUILD_RUSTFLAGS) $(rustflags-y)) \
+                     $(RUSTFLAGS_$(target-stem).o))
 _a_flags       = $(filter-out $(AFLAGS_REMOVE_$(target-stem).o), \
                      $(filter-out $(asflags-remove-y), \
                          $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(asflags-y)) \
@@ -202,6 +207,11 @@ modkern_cflags =                                          \
 		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
 		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL) $(modfile_flags))
 
+modkern_rustflags =                                              \
+	$(if $(part-of-module),                                   \
+		$(KBUILD_RUSTFLAGS_MODULE) $(RUSTFLAGS_MODULE), \
+		$(KBUILD_RUSTFLAGS_KERNEL) $(RUSTFLAGS_KERNEL))
+
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
 			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
@@ -211,6 +221,8 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
+rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
+
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_a_flags) $(modkern_aflags)
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index cf72680cd76..d9fc638dfa8 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -651,6 +651,56 @@ static struct conf_printer kconfig_printer_cb =
 	.print_comment = kconfig_print_comment,
 };
 
+/*
+ * rustc cfg printer
+ *
+ * This printer is used when generating the resulting rustc configuration
+ * after kconfig invocation and `defconfig` files.
+ */
+static void rustc_cfg_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
+{
+	const char *str;
+
+	switch (sym->type) {
+	case S_INT:
+	case S_HEX:
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		str = sym_escape_string_value(value);
+
+		/*
+		 * We don't care about disabled ones, i.e. no need for
+		 * what otherwise are "comments" in other printers.
+		 */
+		if (*value == 'n')
+			return;
+
+		/*
+		 * To have similar functionality to the C macro `IS_ENABLED()`
+		 * we provide an empty `--cfg CONFIG_X` here in both `y`
+		 * and `m` cases.
+		 *
+		 * Then, the common `fprintf()` below will also give us
+		 * a `--cfg CONFIG_X="y"` or `--cfg CONFIG_X="m"`, which can
+		 * be used as the equivalent of `IS_BUILTIN()`/`IS_MODULE()`.
+		 */
+		if (*value == 'y' || *value == 'm')
+			fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
+
+		break;
+	default:
+		str = value;
+		break;
+	}
+
+	fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, str);
+}
+
+static struct conf_printer rustc_cfg_printer_cb =
+{
+	.print_symbol = rustc_cfg_print_symbol,
+};
+
 /*
  * Header printer
  *
@@ -1058,7 +1108,7 @@ int conf_write_autoconf(int overwrite)
 	struct symbol *sym;
 	const char *name;
 	const char *autoconf_name = conf_get_autoconfig_name();
-	FILE *out, *out_h;
+	FILE *out, *out_h, *out_rustc_cfg;
 	int i;
 
 	if (!overwrite && is_present(autoconf_name))
@@ -1079,6 +1129,13 @@ int conf_write_autoconf(int overwrite)
 		return 1;
 	}
 
+	out_rustc_cfg = fopen(".tmp_rustc_cfg", "w");
+	if (!out_rustc_cfg) {
+		fclose(out);
+		fclose(out_h);
+		return 1;
+	}
+
 	conf_write_heading(out, &kconfig_printer_cb, NULL);
 	conf_write_heading(out_h, &header_printer_cb, NULL);
 
@@ -1090,9 +1147,11 @@ int conf_write_autoconf(int overwrite)
 		/* write symbols to auto.conf and autoconf.h */
 		conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
 		conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
+		conf_write_symbol(out_rustc_cfg, sym, &rustc_cfg_printer_cb, NULL);
 	}
 	fclose(out);
 	fclose(out_h);
+	fclose(out_rustc_cfg);
 
 	name = getenv("KCONFIG_AUTOHEADER");
 	if (!name)
@@ -1111,6 +1170,12 @@ int conf_write_autoconf(int overwrite)
 	if (rename(".tmpconfig", autoconf_name))
 		return 1;
 
+	name = "include/generated/rustc_cfg";
+	if (make_parent_dir(name))
+		return 1;
+	if (rename(".tmp_rustc_cfg", name))
+		return 1;
+
 	return 0;
 }
 
diff --git a/scripts/rust-version.sh b/scripts/rust-version.sh
new file mode 100755
index 00000000000..67b6d31688e
--- /dev/null
+++ b/scripts/rust-version.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# rust-version rust-command
+#
+# Print the compiler version of `rust-command' in a 5 or 6-digit form
+# such as `14502' for rustc-1.45.2 etc.
+#
+# Returns 0 if not found (so that Kconfig does not complain)
+compiler="$*"
+
+if [ ${#compiler} -eq 0 ]; then
+	echo "Error: No compiler specified." >&2
+	printf "Usage:\n\t$0 <rust-command>\n" >&2
+	exit 1
+fi
+
+if ! command -v $compiler >/dev/null 2>&1; then
+	echo 0
+	exit 0
+fi
+
+VERSION=$($compiler --version | cut -f2 -d' ')
+
+# Cut suffix if any (e.g. `-dev`)
+VERSION=$(echo $VERSION | cut -f1 -d'-')
+
+MAJOR=$(echo $VERSION | cut -f1 -d'.')
+MINOR=$(echo $VERSION | cut -f2 -d'.')
+PATCHLEVEL=$(echo $VERSION | cut -f3 -d'.')
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.32.0

