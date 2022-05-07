Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B40451E46D
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 May 2022 07:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445710AbiEGFe5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 May 2022 01:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445667AbiEGFcM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 May 2022 01:32:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACA7703F6;
        Fri,  6 May 2022 22:27:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6ADBE6009B;
        Sat,  7 May 2022 05:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9DCC385A5;
        Sat,  7 May 2022 05:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651901249;
        bh=g0WhwYJB3aufvZahbNBDRo7C7TOUdPmYf4yXALl/nwU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r+XkIUnu2qTCvdFTubvwh73HHmk/xz1p5quF6YGrvlaPXy6XP14j0+oufq6kEDrxk
         RhGLY9/DzhTkkYi1Z/yE2S9aEvyuxtQi/Z/lgwTwWu93SM+ld3VFFn8Uk7nDZci5yl
         SkFs3ykM2AyV87d/jcwemexatJ8Xvf61SDtLIVVKZ75UAkioD6+prwYy2g8VClE674
         ByHhoyNzzwR2uLq/k5+RgRq8UY2NLK+GP9OyKx+rN4H+P2rN29Bh1QvsPU27ywLPkD
         ytClfV5fTF7hdzsrEptSYucMkHkeNZNRucEYxDB91zLIcfIPgyB7UUgJVSi2aXRF7L
         1woBSOGIJIITA==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: [PATCH v6 19/23] Kbuild: add Rust support
Date:   Sat,  7 May 2022 07:24:17 +0200
Message-Id: <20220507052451.12890-20-ojeda@kernel.org>
In-Reply-To: <20220507052451.12890-1-ojeda@kernel.org>
References: <20220507052451.12890-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Having all the new files in place, we now enable Rust support
in the build system, including `Kconfig` entries related to Rust,
the Rust configuration printer, the target specification
generation script, the version detection script and a few
other bits.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Douglas Su <d0u9.su@outlook.com>
Signed-off-by: Douglas Su <d0u9.su@outlook.com>
Co-developed-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
Signed-off-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
Co-developed-by: Antonio Terceiro <antonio.terceiro@linaro.org>
Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
Co-developed-by: Daniel Xu <dxu@dxuuu.xyz>
Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
Co-developed-by: Miguel Cano <macanroj@gmail.com>
Signed-off-by: Miguel Cano <macanroj@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .gitignore                                   |   5 +
 .rustfmt.toml                                |  12 +
 Makefile                                     | 175 +++++++-
 arch/Kconfig                                 |   6 +
 arch/arm/Kconfig                             |   1 +
 arch/arm64/Kconfig                           |   1 +
 arch/powerpc/Kconfig                         |   1 +
 arch/riscv/Kconfig                           |   1 +
 arch/riscv/Makefile                          |   5 +
 arch/x86/Kconfig                             |   1 +
 arch/x86/Makefile                            |  14 +
 init/Kconfig                                 |  45 ++-
 lib/Kconfig.debug                            | 155 ++++++++
 rust/.gitignore                              |  10 +
 rust/Makefile                                | 397 +++++++++++++++++++
 rust/bindgen_parameters                      |  17 +
 scripts/.gitignore                           |   1 +
 scripts/Kconfig.include                      |   6 +-
 scripts/Makefile                             |   3 +
 scripts/Makefile.build                       |  60 +++
 scripts/Makefile.debug                       |  10 +
 scripts/Makefile.host                        |  34 +-
 scripts/Makefile.lib                         |  12 +
 scripts/Makefile.modfinal                    |   8 +-
 scripts/cc-version.sh                        |  12 +-
 scripts/generate_rust_target.rs              | 227 +++++++++++
 scripts/is_rust_module.sh                    |  13 +
 scripts/kconfig/confdata.c                   |  75 ++++
 scripts/min-tool-version.sh                  |   6 +
 scripts/rust-is-available-bindgen-libclang.h |   2 +
 scripts/rust-is-available.sh                 | 158 ++++++++
 31 files changed, 1450 insertions(+), 23 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 rust/.gitignore
 create mode 100644 rust/Makefile
 create mode 100644 rust/bindgen_parameters
 create mode 100644 scripts/generate_rust_target.rs
 create mode 100755 scripts/is_rust_module.sh
 create mode 100644 scripts/rust-is-available-bindgen-libclang.h
 create mode 100755 scripts/rust-is-available.sh

diff --git a/.gitignore b/.gitignore
index 7afd412dadd2..48c68948f476 100644
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
index 000000000000..3de5cc497465
--- /dev/null
+++ b/.rustfmt.toml
@@ -0,0 +1,12 @@
+edition = "2021"
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
diff --git a/Makefile b/Makefile
index 9a820c525b86..d0837a13e9d3 100644
--- a/Makefile
+++ b/Makefile
@@ -120,6 +120,15 @@ endif
 
 export KBUILD_CHECKSRC
 
+# Enable "clippy" (a linter) as part of the Rust compilation.
+#
+# Use 'make CLIPPY=1' to enable it.
+ifeq ("$(origin CLIPPY)", "command line")
+  KBUILD_CLIPPY := $(CLIPPY)
+endif
+
+export KBUILD_CLIPPY
+
 # Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
 # directory of external module to build. Setting M= takes precedence.
 ifeq ("$(origin M)", "command line")
@@ -267,7 +276,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile
+			 outputmakefile rustavailable rustfmt rustfmtcheck
 # Installation targets should not require compiler. Unfortunately, vdso_install
 # is an exception where build artifacts may be updated. This must be fixed.
 no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
@@ -436,6 +445,7 @@ else
 HOSTCC	= gcc
 HOSTCXX	= g++
 endif
+HOSTRUSTC = rustc
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
 			 -O2 -fomit-frame-pointer -std=gnu11 \
@@ -443,8 +453,26 @@ KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
 KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 
+# These flags apply to all Rust code in the tree, including the kernel and
+# host programs.
+export rust_common_flags := --edition=2021 \
+			    -Zbinary_dep_depinfo=y \
+			    -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
+			    -Dunreachable_pub -Dnon_ascii_idents \
+			    -Wmissing_docs \
+			    -Drustdoc::missing_crate_level_docs \
+			    -Dclippy::correctness -Dclippy::style \
+			    -Dclippy::suspicious -Dclippy::complexity \
+			    -Dclippy::perf \
+			    -Dclippy::let_unit_value -Dclippy::mut_mut \
+			    -Dclippy::needless_bitwise_bool \
+			    -Dclippy::needless_continue \
+			    -Wclippy::dbg_macro
+
 KBUILD_HOSTCFLAGS   := $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
 KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
+KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
+			-Zallow-features= $(HOSTRUSTFLAGS)
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
@@ -469,6 +497,12 @@ OBJDUMP		= $(CROSS_COMPILE)objdump
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
@@ -494,9 +528,11 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
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
 
@@ -525,15 +561,42 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -Werror=return-type -Wno-format-security \
 		   -std=gnu11
 KBUILD_CPPFLAGS := -D__KERNEL__
+KBUILD_RUSTFLAGS := $(rust_common_flags) \
+		    --target=$(objtree)/rust/target.json \
+		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
+		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
+		    -Csymbol-mangling-version=v0 \
+		    -Crelocation-model=static \
+		    -Zfunction-sections=n \
+		    -Dclippy::float_arithmetic
+
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
+	RUSTC_OR_CLIPPY = $(CLIPPY_DRIVER)
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
+export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
@@ -542,9 +605,10 @@ export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
+export KBUILD_RUSTFLAGS RUSTFLAGS_KERNEL RUSTFLAGS_MODULE
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
-export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
-export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
+export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_RUSTFLAGS_MODULE KBUILD_LDFLAGS_MODULE
+export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTFLAGS_KERNEL
 export PAHOLE_FLAGS
 
 # Files to ignore in find ... statements
@@ -725,7 +789,7 @@ $(KCONFIG_CONFIG):
 #
 # Do not use $(call cmd,...) here. That would suppress prompts from syncconfig,
 # so you cannot notice that Kconfig is waiting for the user input.
-%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
+%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
 	$(Q)$(kecho) "  SYNC    $@"
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else # !may-sync-config
@@ -754,12 +818,28 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning, address-of-packed-member)
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
 KBUILD_CFLAGS += -O2
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 2
 else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
 KBUILD_CFLAGS += -O3
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 3
 else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS += -Os
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := s
 endif
 
+# Always set `debug-assertions` and `overflow-checks` because their default
+# depends on `opt-level` and `debug-assertions`, respectively.
+KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
+KBUILD_RUSTFLAGS += -Coverflow-checks=$(if $(CONFIG_RUST_OVERFLOW_CHECKS),y,n)
+KBUILD_RUSTFLAGS += -Copt-level=$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C),$(KBUILD_RUSTFLAGS_OPT_LEVEL_MAP))$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_0),0)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_1),1)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_2),2)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_3),3)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_S),s)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_Z),z)
+
 # Tell gcc to never replace conditional load with a non-conditional one
 ifdef CONFIG_CC_IS_GCC
 # gcc-10 renamed --param=allow-store-data-races=0 to
@@ -789,6 +869,9 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
 KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
+KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
+KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
+
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
 # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
@@ -806,12 +889,15 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
+KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
 else
 # Some targets (ARM with Thumb2, for example), can't be built with frame
 # pointers.  For those, we don't have FUNCTION_TRACER automatically
 # select FRAME_POINTER.  However, FUNCTION_TRACER adds -pg, and this is
 # incompatible with -fomit-frame-pointer with current GCC, so we don't use
 # -fomit-frame-pointer with FUNCTION_TRACER.
+# In the Rust target specification, "frame-pointer" is set explicitly
+# to "may-omit".
 ifndef CONFIG_FUNCTION_TRACER
 KBUILD_CFLAGS	+= -fomit-frame-pointer
 endif
@@ -876,8 +962,10 @@ ifdef CONFIG_DEBUG_SECTION_MISMATCH
 KBUILD_CFLAGS += -fno-inline-functions-called-once
 endif
 
+# `rustc`'s `-Zfunction-sections` applies to data too (as of 1.59.0).
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
 KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
+KBUILD_RUSTFLAGS_KERNEL += -Zfunction-sections=y
 LDFLAGS_vmlinux += --gc-sections
 endif
 
@@ -1019,10 +1107,11 @@ include $(addprefix $(srctree)/, $(include-y))
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
@@ -1091,6 +1180,7 @@ export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 ifeq ($(KBUILD_EXTMOD),)
 core-y			+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/
 core-$(CONFIG_BLOCK)	+= block/
+core-$(CONFIG_RUST)	+= rust/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
@@ -1195,6 +1285,10 @@ prepare0: archprepare
 
 # All the preparing..
 prepare: prepare0
+ifdef CONFIG_RUST
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust-is-available.sh -v
+	$(Q)$(MAKE) $(build)=rust
+endif
 
 PHONY += remove-stale-files
 remove-stale-files:
@@ -1483,7 +1577,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       compile_commands.json .thinlto-cache
+	       compile_commands.json .thinlto-cache rust/test rust/doc
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -1494,7 +1588,8 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/signing_key.pem \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
-		  *.spec
+		  *.spec \
+		  rust/target.json rust/libmacros.so
 
 # clean - Delete most, but leave enough to build external modules
 #
@@ -1519,6 +1614,9 @@ $(mrproper-dirs):
 
 mrproper: clean $(mrproper-dirs)
 	$(call cmd,rmfiles)
+	@find . $(RCS_FIND_IGNORE) \
+		\( -name '*.rmeta' \) \
+		-type f -print | xargs rm -f
 
 # distclean
 #
@@ -1606,6 +1704,23 @@ help:
 	@echo  '  kselftest-merge   - Merge all the config dependencies of'
 	@echo  '		      kselftest to existing .config.'
 	@echo  ''
+	@echo  'Rust targets:'
+	@echo  '  rustavailable   - Checks whether the Rust toolchain is'
+	@echo  '		    available and, if not, explains why.'
+	@echo  '  rustfmt	  - Reformat all the Rust code in the kernel'
+	@echo  '  rustfmtcheck	  - Checks if all the Rust code in the kernel'
+	@echo  '		    is formatted, printing a diff otherwise.'
+	@echo  '  rustdoc	  - Generate Rust documentation'
+	@echo  '		    (requires kernel .config)'
+	@echo  '  rusttest        - Runs the Rust tests'
+	@echo  '                    (requires kernel .config; downloads external repos)'
+	@echo  '  rust-analyzer	  - Generate rust-project.json rust-analyzer support file'
+	@echo  '		    (requires kernel .config)'
+	@echo  '  dir/file.[os]   - Build specified target only'
+	@echo  '  dir/file.i      - Build macro expanded source, similar to C preprocessing'
+	@echo  '                    (run with RUSTFMT=n to skip reformatting if needed)'
+	@echo  '  dir/file.ll     - Build the LLVM assembly file'
+	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
 		echo '* dtbs             - Build device tree blobs for enabled boards'; \
@@ -1677,6 +1792,52 @@ PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
 
+
+# Rust targets
+# ---------------------------------------------------------------------------
+
+# "Is Rust available?" target
+PHONY += rustavailable
+rustavailable:
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust-is-available.sh -v && echo >&2 "Rust is available!"
+
+# Documentation target
+#
+# Using the singular to avoid running afoul of `no-dot-config-targets`.
+PHONY += rustdoc
+rustdoc: prepare
+	$(Q)$(MAKE) $(build)=rust $@
+
+# Testing target
+PHONY += rusttest
+rusttest: prepare
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
+		| grep -Fv generated \
+		| xargs $(RUSTFMT) $(rustfmt_flags)
+
+rustfmtcheck: rustfmt_flags = --check
+rustfmtcheck: rustfmt
+
+# IDE support targets
+PHONY += rust-analyzer
+rust-analyzer:
+	$(Q)$(MAKE) $(build)=rust $@
+
 # Misc
 # ---------------------------------------------------------------------------
 
diff --git a/arch/Kconfig b/arch/Kconfig
index 31c4fdc4a4ba..89d27b2a86dd 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -344,6 +344,12 @@ config HAVE_RSEQ
 	  This symbol should be selected by an architecture if it
 	  supports an implementation of restartable sequences.
 
+config HAVE_RUST
+	bool
+	help
+	  This symbol should be selected by an architecture if it
+	  supports Rust.
+
 config HAVE_FUNCTION_ARG_ACCESS_API
 	bool
 	help
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e8091e2d8a8..1d0005080aeb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -116,6 +116,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_RUST if CPU_32v6 || CPU_32v6K
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 20ea89d9ac2f..308cff85f5cb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -198,6 +198,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
+	select HAVE_RUST
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..ffbad38204b9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -239,6 +239,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..63f7258984f3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,7 @@ config RISCV
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_RUST if 64BIT
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..663ae53b5597 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -26,6 +26,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
 
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64
+
 	KBUILD_LDFLAGS += -melf64lriscv
 else
 	BITS := 32
@@ -33,6 +35,9 @@ else
 
 	KBUILD_CFLAGS += -mabi=ilp32
 	KBUILD_AFLAGS += -mabi=ilp32
+
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv32
+
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4bed3abf444d..8d4e30f07a7d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -252,6 +252,7 @@ config X86
 	select HAVE_STATIC_CALL_INLINE		if HAVE_STACK_VALIDATION
 	select HAVE_PREEMPT_DYNAMIC_CALL
 	select HAVE_RSEQ
+	select HAVE_RUST			if X86_64
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UNSTABLE_SCHED_CLOCK
 	select HAVE_USER_RETURN_NOTIFIER
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 63d50f65b828..5ac9b324751d 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -21,6 +21,8 @@ ifdef CONFIG_CC_IS_CLANG
 RETPOLINE_CFLAGS	:= -mretpoline-external-thunk
 RETPOLINE_VDSO_CFLAGS	:= -mretpoline
 endif
+RETPOLINE_RUSTFLAGS	:= -Ctarget-feature=+retpoline-external-thunk
+
 export RETPOLINE_CFLAGS
 export RETPOLINE_VDSO_CFLAGS
 
@@ -61,6 +63,8 @@ export BITS
 #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
 #
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
+KBUILD_RUSTFLAGS += -Ctarget-feature=-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2
+KBUILD_RUSTFLAGS += -Ctarget-feature=-3dnow,-3dnowa,-avx,-avx2,+soft-float
 
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #
@@ -148,8 +152,17 @@ else
         cflags-$(CONFIG_GENERIC_CPU)	+= -mtune=generic
         KBUILD_CFLAGS += $(cflags-y)
 
+        rustflags-$(CONFIG_MK8)		+= -Ctarget-cpu=k8
+        rustflags-$(CONFIG_MPSC)	+= -Ctarget-cpu=nocona
+        rustflags-$(CONFIG_MCORE2)	+= -Ctarget-cpu=core2
+        rustflags-$(CONFIG_MATOM)	+= -Ctarget-cpu=atom
+        rustflags-$(CONFIG_GENERIC_CPU)	+= -Ztune-cpu=generic
+        KBUILD_RUSTFLAGS += $(rustflags-y)
+
         KBUILD_CFLAGS += -mno-red-zone
         KBUILD_CFLAGS += -mcmodel=kernel
+        KBUILD_RUSTFLAGS += -Cno-redzone=y
+        KBUILD_RUSTFLAGS += -Ccode-model=kernel
 endif
 
 #
@@ -185,6 +198,7 @@ ifdef CONFIG_RETPOLINE
   ifndef CONFIG_CC_IS_CLANG
     KBUILD_CFLAGS += -fno-jump-tables
   endif
+  KBUILD_RUSTFLAGS += $(RETPOLINE_RUSTFLAGS)
 endif
 
 ifdef CONFIG_SLS
diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..3457cf596588 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -60,6 +60,17 @@ config LLD_VERSION
 	default $(ld-version) if LD_IS_LLD
 	default 0
 
+config RUST_IS_AVAILABLE
+	def_bool $(success,$(srctree)/scripts/rust-is-available.sh)
+	help
+	  This shows whether a suitable Rust toolchain is available (found).
+
+	  Please see Documentation/rust/quick-start.rst for instructions on how
+	  to satify the build requirements of Rust support.
+
+	  In particular, the Makefile target 'rustavailable' is useful to check
+	  why the Rust toolchain is not being detected.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
@@ -146,7 +157,8 @@ config WERROR
 	default COMPILE_TEST
 	help
 	  A kernel build should not cause any compiler warnings, and this
-	  enables the '-Werror' flag to enforce that rule by default.
+	  enables the '-Werror' (for C) and '-Dwarnings' (for Rust) flags
+	  to enforce that rule by default.
 
 	  However, if you have a new (or very old) compiler with odd and
 	  unusual warnings, or you have some architecture with problems,
@@ -2045,6 +2057,37 @@ config PROFILING
 	  Say Y here to enable the extended profiling support mechanisms used
 	  by profilers.
 
+config RUST
+	bool "Rust support"
+	depends on HAVE_RUST
+	depends on RUST_IS_AVAILABLE
+	depends on !MODVERSIONS
+	depends on !GCC_PLUGINS
+	depends on !DEBUG_INFO_BTF
+	select CONSTRUCTORS
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
+config RUSTC_VERSION_TEXT
+	string
+	depends on RUST
+	default $(shell,command -v $(RUSTC) >/dev/null 2>&1 && $(RUSTC) --version || echo n)
+
+config BINDGEN_VERSION_TEXT
+	string
+	depends on RUST
+	default $(shell,command -v $(BINDGEN) >/dev/null 2>&1 && $(BINDGEN) --version || echo n)
+
 #
 # Place an empty function call at each tracepoint site. Can be
 # dynamically changed for a probe function.
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 075cd25363ac..bfc28f52b603 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2760,6 +2760,161 @@ config HYPERV_TESTING
 
 endmenu # "Kernel Testing and Coverage"
 
+menu "Rust hacking"
+
+config RUST_DEBUG_ASSERTIONS
+	bool "Debug assertions"
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
+	  overflow. When overflow-checks are enabled, a Rust panic will occur
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
+	      -Os is currently mapped to -Copt-level=s
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
+config RUST_KERNEL_KUNIT_TEST
+	bool "KUnit test for the `kernel` crate" if !KUNIT_ALL_TESTS
+	depends on RUST && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the documentation tests of the `kernel` crate
+	  as KUnit tests.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
+endmenu # "Rust"
+
 source "Documentation/Kconfig"
 
 endmenu # Kernel hacking
diff --git a/rust/.gitignore b/rust/.gitignore
new file mode 100644
index 000000000000..89b602d91109
--- /dev/null
+++ b/rust/.gitignore
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+target.json
+bindings_generated.rs
+bindings_helpers_generated.rs
+exports_*_generated.h
+doctests_kernel_generated.rs
+doctests_kernel_generated_kunit.c
+doc/
+test/
diff --git a/rust/Makefile b/rust/Makefile
new file mode 100644
index 000000000000..6dad9a4ebcbc
--- /dev/null
+++ b/rust/Makefile
@@ -0,0 +1,397 @@
+# SPDX-License-Identifier: GPL-2.0
+
+always-$(CONFIG_RUST) += target.json
+no-clean-files += target.json
+
+obj-$(CONFIG_RUST) += core.o compiler_builtins.o
+always-$(CONFIG_RUST) += exports_core_generated.h
+
+# Missing prototypes are expected in the helpers since these are exported
+# for Rust only, thus there is no header nor prototypes.
+obj-$(CONFIG_RUST) += helpers.o
+CFLAGS_REMOVE_helpers.o = -Wmissing-prototypes -Wmissing-declarations
+
+always-$(CONFIG_RUST) += libmacros.so
+no-clean-files += libmacros.so
+
+always-$(CONFIG_RUST) += bindings_generated.rs bindings_helpers_generated.rs
+obj-$(CONFIG_RUST) += alloc.o kernel.o
+always-$(CONFIG_RUST) += exports_alloc_generated.h exports_kernel_generated.h
+
+ifdef CONFIG_RUST_BUILD_ASSERT_DENY
+always-$(CONFIG_RUST) += build_error.o
+else
+obj-$(CONFIG_RUST) += build_error.o
+endif
+
+obj-$(CONFIG_RUST) += exports.o
+
+obj-$(CONFIG_RUST_KERNEL_KUNIT_TEST) += doctests_kernel_generated.o
+obj-$(CONFIG_RUST_KERNEL_KUNIT_TEST) += doctests_kernel_generated_kunit.o
+
+# Avoids running `$(RUSTC)` for the sysroot when it may not be available.
+ifdef CONFIG_RUST
+
+# `$(rust_flags)` is passed in case the user added `--sysroot`.
+rustc_sysroot := $(shell $(RUSTC) $(rust_flags) --print sysroot)
+rustc_host_target := $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
+RUST_LIB_SRC ?= $(rustc_sysroot)/lib/rustlib/src/rust/library
+
+ifeq ($(quiet),silent_)
+cargo_quiet=-q
+rust_test_quiet=-q
+rustdoc_test_quiet=--test-args -q
+rustdoc_test_kernel_quiet=>/dev/null
+else ifeq ($(quiet),quiet_)
+rust_test_quiet=-q
+rustdoc_test_quiet=--test-args -q
+rustdoc_test_kernel_quiet=>/dev/null
+else
+cargo_quiet=--verbose
+endif
+
+core-cfgs = \
+    --cfg no_fp_fmt_parse
+
+alloc-cfgs = \
+    --cfg no_global_oom_handling \
+    --cfg no_rc \
+    --cfg no_sync
+
+quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
+      cmd_rustdoc = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTDOC) $(if $(rustdoc_host),$(rust_common_flags),$(rust_flags)) \
+		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		--output $(objtree)/$(obj)/doc \
+		--crate-name $(subst rustdoc-,,$@) \
+		@$(objtree)/include/generated/rustc_cfg $<
+
+# The `html_logo_url` and `html_favicon_url` forms of the `doc` attribute
+# can be used to specify a custom logo. However:
+#   - The given value is used as-is, thus it cannot be relative or a local file
+#     (unlike the non-custom case) since the generated docs have subfolders.
+#   - It requires adding it to every crate.
+#   - It requires changing `core` which comes from the sysroot.
+#
+# Using `-Zcrate-attr` would solve the last two points, but not the first.
+# The https://github.com/rust-lang/rfcs/pull/3226 RFC suggests two new
+# command-like flags to solve the issue. Meanwhile, we use the non-custom case
+# and then retouch the generated files.
+rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
+    rustdoc-alloc rustdoc-kernel
+	$(Q)cp $(srctree)/Documentation/rust/logo.svg $(objtree)/$(obj)/doc
+	$(Q)find $(objtree)/$(obj)/doc -name '*.html' -type f -print0 | xargs -0 sed -Ei \
+		-e 's:rust-logo\.png:logo.svg:g' \
+		-e 's:favicon\.svg:logo.svg:g' \
+		-e 's:<link rel="alternate icon" type="image/png" href="[./]*favicon-(16x16|32x32)\.png">::g'
+
+rustdoc-macros: private rustdoc_host = yes
+rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
+    --extern proc_macro
+rustdoc-macros: $(src)/macros/lib.rs FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-core: private rustc_target_flags = $(core-cfgs)
+rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
+	$(call if_changed,rustdoc)
+
+# We need to allow `rustdoc::broken_intra_doc_links` because some
+# `no_global_oom_handling` functions refer to non-`no_global_oom_handling`
+# functions. Ideally `rustdoc` would have a way to distinguish broken links
+# due to things that are "configured out" vs. entirely non-existing ones.
+rustdoc-alloc: private rustc_target_flags = $(alloc-cfgs) \
+    -Arustdoc::broken_intra_doc_links
+rustdoc-alloc: $(src)/alloc/lib.rs rustdoc-core rustdoc-compiler_builtins FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-kernel: private rustc_target_flags = --extern alloc \
+    --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so
+rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
+    rustdoc-compiler_builtins rustdoc-alloc $(obj)/libmacros.so \
+    $(obj)/bindings_generated.rs $(obj)/bindings_helpers_generated.rs FORCE
+	$(call if_changed,rustdoc)
+
+quiet_cmd_rustc_test_library = RUSTC TL $<
+      cmd_rustc_test_library = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTC) $(rust_common_flags) \
+		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
+		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
+		--out-dir $(objtree)/$(obj)/test --cfg testlib \
+		--sysroot $(objtree)/$(obj)/test/sysroot \
+		-L$(objtree)/$(obj)/test \
+		--crate-name $(subst rusttest-,,$(subst rusttestlib-,,$@)) $<
+
+rusttestlib-build_error: $(src)/build_error.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-macros: private rustc_target_flags = --extern proc_macro
+rusttestlib-macros: private rustc_test_library_proc = yes
+rusttestlib-macros: $(src)/macros/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+quiet_cmd_rustdoc_test = RUSTDOC T $<
+      cmd_rustdoc_test = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTDOC) --test $(rust_common_flags) \
+		@$(objtree)/include/generated/rustc_cfg \
+		$(rustc_target_flags) $(rustdoc_test_target_flags) \
+		--sysroot $(objtree)/$(obj)/test/sysroot $(rustdoc_test_quiet) \
+		-L$(objtree)/$(obj)/test --output $(objtree)/$(obj)/doc \
+		--crate-name $(subst rusttest-,,$@) $<
+
+quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
+      cmd_rustdoc_test_kernel = \
+	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
+	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTDOC) --test $(rust_flags) \
+		@$(objtree)/include/generated/rustc_cfg \
+		-L$(objtree)/$(obj) --extern alloc --extern kernel \
+		--extern build_error --extern macros \
+		--no-run --crate-name kernel -Zunstable-options \
+		--test-builder $(srctree)/scripts/rustdoc_test_builder.py \
+		$< $(rustdoc_test_kernel_quiet); \
+	$(srctree)/scripts/rustdoc_test_gen.py
+
+%/doctests_kernel_generated.rs %/doctests_kernel_generated_kunit.c: $(src)/kernel/lib.rs $(obj)/kernel.o FORCE
+	$(call if_changed,rustdoc_test_kernel)
+
+# We cannot use `-Zpanic-abort-tests` because some tests are dynamic,
+# so for the moment we skip `-Cpanic=abort`.
+quiet_cmd_rustc_test = RUSTC T  $<
+      cmd_rustc_test = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTC) --test $(rust_common_flags) \
+		@$(objtree)/include/generated/rustc_cfg \
+		$(rustc_target_flags) --out-dir $(objtree)/$(obj)/test \
+		--sysroot $(objtree)/$(obj)/test/sysroot \
+		-L$(objtree)/$(obj)/test \
+		--crate-name $(subst rusttest-,,$@) $<; \
+	$(objtree)/$(obj)/test/$(subst rusttest-,,$@) $(rust_test_quiet) \
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
+	rm -rf $(objtree)/$(obj)/test; \
+	mkdir -p $(objtree)/$(obj)/test; \
+	cp -a $(rustc_sysroot) $(objtree)/$(obj)/test/sysroot; \
+	cp -r $(srctree)/$(src)/alloc/* \
+		$(objtree)/$(obj)/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
+	echo '\#!/bin/sh' > $(objtree)/$(obj)/test/rustc_sysroot; \
+	echo "$(RUSTC) --sysroot=$(abspath $(objtree)/$(obj)/test/sysroot) \"\$$@\"" \
+		>> $(objtree)/$(obj)/test/rustc_sysroot; \
+	chmod u+x $(objtree)/$(obj)/test/rustc_sysroot; \
+	$(CARGO) -q new $(objtree)/$(obj)/test/dummy; \
+	RUSTC=$(objtree)/$(obj)/test/rustc_sysroot $(CARGO) $(cargo_quiet) \
+		test -Zbuild-std --target $(rustc_host_target) \
+		--manifest-path $(objtree)/$(obj)/test/dummy/Cargo.toml; \
+	rm $(objtree)/$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib/*; \
+	cp $(objtree)/$(obj)/test/dummy/target/$(rustc_host_target)/debug/deps/* \
+		$(objtree)/$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib
+
+rusttest-prepare: FORCE
+	$(call if_changed,rustsysroot)
+
+rusttest-macros: private rustc_target_flags = --extern proc_macro
+rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
+rusttest-macros: $(src)/macros/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test)
+	$(call if_changed,rustdoc_test)
+
+rusttest-kernel: private rustc_target_flags = --extern alloc \
+    --extern build_error --extern macros
+rusttest-kernel: private rustc_test_run_flags = --skip bindgen_test_layout_
+rusttest-kernel: $(src)/kernel/lib.rs rusttest-prepare \
+    rusttestlib-build_error rusttestlib-macros FORCE
+	$(call if_changed,rustc_test)
+	$(call if_changed,rustc_test_library)
+
+filechk_rust_target = $(objtree)/scripts/generate_rust_target < $<
+
+$(obj)/target.json: $(objtree)/include/config/auto.conf FORCE
+	$(call filechk,rust_target)
+
+ifdef CONFIG_CC_IS_CLANG
+bindgen_c_flags = $(c_flags)
+else
+# bindgen relies on libclang to parse C. Ideally, bindgen would support a GCC
+# plugin backend and/or the Clang driver would be perfectly compatible with GCC.
+#
+# For the moment, here we are tweaking the flags on the fly. This is a hack,
+# and some kernel configurations may not work (e.g. `GCC_PLUGIN_RANDSTRUCT`
+# if we end up using one of those structs).
+bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
+	-mskip-rax-setup -mgeneral-regs-only -msign-return-address=% \
+	-mindirect-branch=thunk-extern -mindirect-branch-register \
+	-mrecord-mcount -mabi=lp64 -mstack-protector-guard% -mtraceback=no \
+	-mno-pointers-to-nested-functions -mno-string -mno-strict-align \
+	-mstrict-align \
+	-fconserve-stack -falign-jumps=% -falign-loops=% \
+	-femit-struct-debug-baseonly -fno-ipa-cp-clone -fno-ipa-sra \
+	-fno-partial-inlining -fplugin-arg-arm_ssp_per_task_plugin-% \
+	-fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
+	-fzero-call-used-regs=% -fno-stack-clash-protection \
+	-fno-inline-functions-called-once \
+	--param=% --param asan-%
+
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+# All warnings are inhibited since GCC builds are very experimental,
+# many GCC warnings are not supported by Clang, they may only appear in
+# some configurations, with new GCC versions, etc.
+bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
+
+bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
+	$(bindgen_extra_c_flags)
+endif
+
+ifdef CONFIG_LTO
+bindgen_c_flags_lto = $(filter-out $(CC_FLAGS_LTO), $(bindgen_c_flags))
+else
+bindgen_c_flags_lto = $(bindgen_c_flags)
+endif
+
+bindgen_c_flags_final = $(bindgen_c_flags_lto)
+
+quiet_cmd_bindgen = BINDGEN $@
+      cmd_bindgen = \
+	$(BINDGEN) $< $(bindgen_target_flags) \
+		--use-core --with-derive-default --ctypes-prefix c_types \
+		--no-debug '.*' \
+		--size_t-is-usize -o $@ -- $(bindgen_c_flags_final) -DMODULE \
+		$(bindgen_target_cflags) $(bindgen_target_extra)
+
+$(obj)/bindings_generated.rs: private bindgen_target_flags = \
+    $(shell grep -v '^\#\|^$$' $(srctree)/$(src)/bindgen_parameters)
+$(obj)/bindings_generated.rs: $(src)/kernel/bindings_helper.h \
+    $(src)/bindgen_parameters FORCE
+	$(call if_changed_dep,bindgen)
+
+# See `CFLAGS_REMOVE_helpers.o` above. In addition, Clang on C does not warn
+# with `-Wmissing-declarations` (unlike GCC), so it is not strictly needed here
+# given it is `libclang`; but for consistency, future Clang changes and/or
+# a potential future GCC backend for `bindgen`, we disable it too.
+$(obj)/bindings_helpers_generated.rs: private bindgen_target_flags = \
+    --blacklist-type '.*' --whitelist-var '' \
+    --whitelist-function 'rust_helper_.*'
+$(obj)/bindings_helpers_generated.rs: private bindgen_target_cflags = \
+    -I$(objtree)/$(obj) -Wno-missing-prototypes -Wno-missing-declarations
+$(obj)/bindings_helpers_generated.rs: private bindgen_target_extra = ; \
+    sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name="rust_helper_\1"]\n    pub fn \1/g' $@
+$(obj)/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
+	$(call if_changed_dep,bindgen)
+
+quiet_cmd_exports = EXPORTS $@
+      cmd_exports = \
+	$(NM) -p --defined-only $< \
+		| grep -E ' (T|R|D) ' | cut -d ' ' -f 3 \
+		| xargs -Isymbol \
+		echo 'EXPORT_SYMBOL_RUST_GPL(symbol);' > $@
+
+$(obj)/exports_core_generated.h: $(obj)/core.o FORCE
+	$(call if_changed,exports)
+
+$(obj)/exports_alloc_generated.h: $(obj)/alloc.o FORCE
+	$(call if_changed,exports)
+
+$(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
+	$(call if_changed,exports)
+
+quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
+      cmd_rustc_procmacro = \
+	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		--emit=dep-info,link --extern proc_macro \
+		--crate-type proc-macro --out-dir $(objtree)/$(obj) \
+		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<; \
+	mv $(objtree)/$(obj)/$(patsubst lib%.so,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+# Procedural macros can only be used with the `rustc` that compiled it.
+# Therefore, to get `libmacros.so` automatically recompiled when the compiler
+# version changes, we add `core.o` as a dependency (even if it is not needed).
+$(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/core.o FORCE
+	$(call if_changed_dep,rustc_procmacro)
+
+quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
+      cmd_rustc_library = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
+		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
+		--emit=dep-info,obj,metadata --crate-type rlib \
+		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
+	mv $(objtree)/$(obj)/$(patsubst %.o,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile) \
+	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
+
+rust-analyzer:
+	$(Q)$(srctree)/scripts/generate_rust_analyzer.py $(srctree) $(objtree) \
+		$(RUST_LIB_SRC) > $(objtree)/rust-project.json
+
+$(obj)/core.o: private skip_clippy = 1
+$(obj)/core.o: private skip_flags = -Dunreachable_pub
+$(obj)/core.o: private rustc_target_flags = $(core-cfgs)
+$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs $(obj)/target.json FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
+$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(obj)/alloc.o: private skip_clippy = 1
+$(obj)/alloc.o: private skip_flags = -Dunreachable_pub
+$(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
+$(obj)/alloc.o: $(src)/alloc/lib.rs $(obj)/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(obj)/kernel.o: private rustc_target_flags = --extern alloc \
+    --extern build_error --extern macros
+$(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
+    $(obj)/libmacros.so $(obj)/bindings_generated.rs \
+    $(obj)/bindings_helpers_generated.rs FORCE
+	$(call if_changed_dep,rustc_library)
+
+endif # CONFIG_RUST
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
new file mode 100644
index 000000000000..6c77865e8345
--- /dev/null
+++ b/rust/bindgen_parameters
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+--opaque-type xregs_state
+--opaque-type desc_struct
+--opaque-type arch_lbr_state
+--opaque-type local_apic
+
+# `try` is a reserved keyword since Rust 2018; solved in `bindgen` v0.59.2,
+# commit 2aed6b021680 ("context: Escape the try keyword properly").
+--opaque-type kunit_try_catch
+
+# If SMP is disabled, `arch_spinlock_t` is defined as a ZST which triggers a Rust
+# warning. We don't need to peek into it anyway.
+--opaque-type spinlock
+
+# `seccomp`'s comment gets understood as a doctest
+--no-doc-comments
diff --git a/scripts/.gitignore b/scripts/.gitignore
index eed308bef604..b7aec8eb1bd4 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /asn1_compiler
 /bin2c
+/generate_rust_target
 /insert-sys-cert
 /kallsyms
 /module.lds
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 0496efd6e117..83e850321eb6 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -36,12 +36,12 @@ ld-option = $(success,$(LD) -v $(1))
 as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
-$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
+$(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
-# Get the compiler name, version, and error out if it is not supported.
+# Get the C compiler name, version, and error out if it is not supported.
 cc-info := $(shell,$(srctree)/scripts/cc-version.sh $(CC))
-$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not supported.)
+$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this C compiler is not supported.)
 cc-name := $(shell,set -- $(cc-info) && echo $1)
 cc-version := $(shell,set -- $(cc-info) && echo $2)
 
diff --git a/scripts/Makefile b/scripts/Makefile
index ce5aa9030b74..a278345e7820 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -10,6 +10,9 @@ hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
+hostprogs-always-$(CONFIG_RUST)				+= generate_rust_target
+
+generate_rust_target-rust := y
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTLDLIBS_sorttable = -lpthread
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 33c1ed581522..533631753b16 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -26,6 +26,7 @@ EXTRA_CPPFLAGS :=
 EXTRA_LDFLAGS  :=
 asflags-y  :=
 ccflags-y  :=
+rustflags-y :=
 cppflags-y :=
 ldflags-y  :=
 
@@ -324,6 +325,65 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Compile Rust sources (.rs)
+# ---------------------------------------------------------------------------
+
+rust_allowed_features := allocator_api,bench_black_box,concat_idents,generic_associated_types
+
+rust_common_cmd = \
+	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
+	-Zallow-features=$(rust_allowed_features) \
+	-Zcrate-attr=no_std \
+	-Zcrate-attr='feature($(rust_allowed_features))' \
+	--extern alloc --extern kernel \
+	--crate-type rlib --out-dir $(obj) -L $(objtree)/rust/ \
+	--crate-name $(basename $(notdir $@))
+
+rust_handle_depfile = \
+	mv $(obj)/$(basename $(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+# `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit
+# will be used. We explicitly request `-Ccodegen-units=1` in any case, and
+# the compiler shows a warning if it is not 1. However, if we ever stop
+# requesting it explicitly and we start using some other `--emit` that does not
+# imply it (and for which codegen is performed), then we would be out of sync,
+# i.e. the outputs we would get for the different single targets (e.g. `.ll`)
+# would not match each other.
+
+quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_o_rs = \
+	$(rust_common_cmd) --emit=dep-info,obj $<; \
+	$(rust_handle_depfile)
+
+$(obj)/%.o: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_o_rs)
+
+quiet_cmd_rustc_i_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_i_rs = \
+	$(rust_common_cmd) --emit=dep-info -Zunpretty=expanded $< >$@; \
+	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@; \
+	$(rust_handle_depfile)
+
+$(obj)/%.i: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_i_rs)
+
+quiet_cmd_rustc_s_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_s_rs = \
+	$(rust_common_cmd) --emit=dep-info,asm $<; \
+	$(rust_handle_depfile)
+
+$(obj)/%.s: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_s_rs)
+
+quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_ll_rs = \
+	$(rust_common_cmd) --emit=dep-info,llvm-ir $<; \
+	$(rust_handle_depfile)
+
+$(obj)/%.ll: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_ll_rs)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..fe87389d52c0 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,4 +1,5 @@
 DEBUG_CFLAGS	:=
+DEBUG_RUSTFLAGS	:=
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
@@ -10,6 +11,12 @@ ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 
+ifdef CONFIG_DEBUG_INFO_REDUCED
+DEBUG_RUSTFLAGS += -Cdebuginfo=1
+else
+DEBUG_RUSTFLAGS += -Cdebuginfo=2
+endif
+
 ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
@@ -31,3 +38,6 @@ endif
 
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
+
+KBUILD_RUSTFLAGS += $(DEBUG_RUSTFLAGS)
+export DEBUG_RUSTFLAGS
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 278b4d6ac945..da133780b751 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -22,6 +22,8 @@ $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 # to preprocess a data file.
 #
 # Both C and C++ are supported, but preferred language is C for such utilities.
+# Rust is also supported, but it may only be used in scenarios where a Rust
+# toolchain is required to be available (e.g. when  `CONFIG_RUST` is enabled).
 #
 # Sample syntax (see Documentation/kbuild/makefiles.rst for reference)
 # hostprogs := bin2hex
@@ -37,15 +39,20 @@ $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 # qconf-objs      := menu.o
 # Will compile qconf as a C++ program, and menu as a C program.
 # They are linked as C++ code to the executable qconf
+#
+# hostprogs   := target
+# target-rust := y
+# Will compile `target` as a Rust program, using `target.rs` as the crate root.
+# The crate may consist of several source files.
 
 # C code
 # Executables compiled from a single .c file
 host-csingle	:= $(foreach m,$(hostprogs), \
-			$(if $($(m)-objs)$($(m)-cxxobjs),,$(m)))
+			$(if $($(m)-objs)$($(m)-cxxobjs)$($(m)-rust),,$(m)))
 
 # C executables linked based on several .o files
 host-cmulti	:= $(foreach m,$(hostprogs),\
-		   $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
+		   $(if $($(m)-cxxobjs)$($(m)-rust),,$(if $($(m)-objs),$(m))))
 
 # Object (.o) files compiled from .c files
 host-cobjs	:= $(sort $(foreach m,$(hostprogs),$($(m)-objs)))
@@ -58,11 +65,17 @@ host-cxxmulti	:= $(foreach m,$(hostprogs),$(if $($(m)-cxxobjs),$(m)))
 # C++ Object (.o) files compiled from .cc files
 host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
 
+# Rust code
+# Executables compiled from a single Rust crate (which may consist of
+# one or more .rs files)
+host-rust	:= $(foreach m,$(hostprogs),$(if $($(m)-rust),$(m)))
+
 host-csingle	:= $(addprefix $(obj)/,$(host-csingle))
 host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
 host-cobjs	:= $(addprefix $(obj)/,$(host-cobjs))
 host-cxxmulti	:= $(addprefix $(obj)/,$(host-cxxmulti))
 host-cxxobjs	:= $(addprefix $(obj)/,$(host-cxxobjs))
+host-rust	:= $(addprefix $(obj)/,$(host-rust))
 
 #####
 # Handle options to gcc. Support building with separate output directory
@@ -71,6 +84,8 @@ _hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
                  $(HOSTCFLAGS_$(target-stem).o)
 _hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
+_hostrust_flags = $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
+                  $(HOSTRUSTFLAGS_$(target-stem))
 
 # $(objtree)/$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
@@ -82,6 +97,7 @@ endif
 
 hostc_flags    = -Wp,-MMD,$(depfile) $(_hostc_flags)
 hostcxx_flags  = -Wp,-MMD,$(depfile) $(_hostcxx_flags)
+hostrust_flags = $(_hostrust_flags)
 
 #####
 # Compile programs on the host
@@ -128,5 +144,17 @@ quiet_cmd_host-cxxobjs	= HOSTCXX $@
 $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
 	$(call if_changed_dep,host-cxxobjs)
 
+# Create executable from a single Rust crate (which may consist of
+# one or more `.rs` files)
+# host-rust -> Executable
+quiet_cmd_host-rust	= HOSTRUSTC $@
+      cmd_host-rust	= \
+	$(HOSTRUSTC) $(hostrust_flags) --emit=dep-info,link \
+		--out-dir=$(obj)/ $<; \
+	mv $(obj)/$(target-stem).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+	$(call if_changed_dep,host-rust)
+
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
-	   $(host-cxxmulti) $(host-cxxobjs)
+	   $(host-cxxmulti) $(host-cxxobjs) $(host-rust)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9f69ecdd7977..f3e623f242df 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -8,6 +8,7 @@ ldflags-y  += $(EXTRA_LDFLAGS)
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
 KBUILD_CFLAGS += $(subdir-ccflags-y)
+KBUILD_RUSTFLAGS += $(subdir-rustflags-y)
 
 # Figure out what we need to build from the various variables
 # ===========================================================================
@@ -128,6 +129,10 @@ _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), \
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
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 7f39599e9fae..670d7997a38b 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -39,11 +39,13 @@ quiet_cmd_ld_ko_o = LD [M]  $@
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
-	if [ -f vmlinux ]; then						\
+	if [ ! -f vmlinux ]; then					\
+		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
+	elif [ -n "$(CONFIG_RUST)" ] && $(srctree)/scripts/is_rust_module.sh $@; then 		\
+		printf "Skipping BTF generation for %s because it's a Rust module\n" $@ 1>&2; \
+	else								\
 		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
 		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
-	else								\
-		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
 	fi;
 
 # Same as newer-prereqs, but allows to exclude specified extra dependencies
diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
index f1952c522466..2401c86fcf53 100755
--- a/scripts/cc-version.sh
+++ b/scripts/cc-version.sh
@@ -1,13 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 #
-# Print the compiler name and its version in a 5 or 6-digit form.
+# Print the C compiler name and its version in a 5 or 6-digit form.
 # Also, perform the minimum version check.
 
 set -e
 
-# Print the compiler name and some version components.
-get_compiler_info()
+# Print the C compiler name and some version components.
+get_c_compiler_info()
 {
 	cat <<- EOF | "$@" -E -P -x c - 2>/dev/null
 	#if defined(__clang__)
@@ -32,7 +32,7 @@ get_canonical_version()
 
 # $@ instead of $1 because multiple words might be given, e.g. CC="ccache gcc".
 orig_args="$@"
-set -- $(get_compiler_info "$@")
+set -- $(get_c_compiler_info "$@")
 
 name=$1
 
@@ -52,7 +52,7 @@ ICC)
 	min_version=$($min_tool_version icc)
 	;;
 *)
-	echo "$orig_args: unknown compiler" >&2
+	echo "$orig_args: unknown C compiler" >&2
 	exit 1
 	;;
 esac
@@ -62,7 +62,7 @@ min_cversion=$(get_canonical_version $min_version)
 
 if [ "$cversion" -lt "$min_cversion" ]; then
 	echo >&2 "***"
-	echo >&2 "*** Compiler is too old."
+	echo >&2 "*** C compiler is too old."
 	echo >&2 "***   Your $name version:    $version"
 	echo >&2 "***   Minimum $name version: $min_version"
 	echo >&2 "***"
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
new file mode 100644
index 000000000000..e38842ad37a9
--- /dev/null
+++ b/scripts/generate_rust_target.rs
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! The custom target specification file generator for `rustc`.
+//!
+//! To configure a target from scratch, a JSON-encoded file has to be passed
+//! to `rustc` (introduced in [RFC 131]). These options and the file itself are
+//! unstable. Eventually, `rustc` should provide a way to do this in a stable
+//! manner. For instance, via command-line arguments. Therefore, this file
+//! should avoid using keys which can be set via `-C` or `-Z` options.
+//!
+//! [RFC 131]: https://rust-lang.github.io/rfcs/0131-target-specification.html
+
+use std::{
+    collections::HashMap,
+    fmt::{Display, Formatter, Result},
+    io::BufRead,
+};
+
+enum Value {
+    Boolean(bool),
+    Number(i32),
+    String(String),
+    Object(Object),
+}
+
+type Object = Vec<(String, Value)>;
+
+/// Minimal "almost JSON" generator (e.g. no `null`s, no arrays, no escaping),
+/// enough for this purpose.
+impl Display for Value {
+    fn fmt(&self, formatter: &mut Formatter<'_>) -> Result {
+        match self {
+            Value::Boolean(boolean) => write!(formatter, "{}", boolean),
+            Value::Number(number) => write!(formatter, "{}", number),
+            Value::String(string) => write!(formatter, "\"{}\"", string),
+            Value::Object(object) => {
+                formatter.write_str("{")?;
+                if let [ref rest @ .., ref last] = object[..] {
+                    for (key, value) in rest {
+                        write!(formatter, "\"{}\": {},", key, value)?;
+                    }
+                    write!(formatter, "\"{}\": {}", last.0, last.1)?;
+                }
+                formatter.write_str("}")
+            }
+        }
+    }
+}
+
+struct TargetSpec(Object);
+
+impl TargetSpec {
+    fn new() -> TargetSpec {
+        TargetSpec(Vec::new())
+    }
+}
+
+trait Push<T> {
+    fn push(&mut self, key: &str, value: T);
+}
+
+impl Push<bool> for TargetSpec {
+    fn push(&mut self, key: &str, value: bool) {
+        self.0.push((key.to_string(), Value::Boolean(value)));
+    }
+}
+
+impl Push<i32> for TargetSpec {
+    fn push(&mut self, key: &str, value: i32) {
+        self.0.push((key.to_string(), Value::Number(value)));
+    }
+}
+
+impl Push<String> for TargetSpec {
+    fn push(&mut self, key: &str, value: String) {
+        self.0.push((key.to_string(), Value::String(value)));
+    }
+}
+
+impl Push<&str> for TargetSpec {
+    fn push(&mut self, key: &str, value: &str) {
+        self.push(key, value.to_string());
+    }
+}
+
+impl Push<Object> for TargetSpec {
+    fn push(&mut self, key: &str, value: Object) {
+        self.0.push((key.to_string(), Value::Object(value)));
+    }
+}
+
+impl Display for TargetSpec {
+    fn fmt(&self, formatter: &mut Formatter<'_>) -> Result {
+        // We add some newlines for clarity.
+        formatter.write_str("{\n")?;
+        if let [ref rest @ .., ref last] = self.0[..] {
+            for (key, value) in rest {
+                write!(formatter, "    \"{}\": {},\n", key, value)?;
+            }
+            write!(formatter, "    \"{}\": {}\n", last.0, last.1)?;
+        }
+        formatter.write_str("}")
+    }
+}
+
+struct KernelConfig(HashMap<String, String>);
+
+impl KernelConfig {
+    /// Parses `include/config/auto.conf` from `stdin`.
+    fn from_stdin() -> KernelConfig {
+        let mut result = HashMap::new();
+
+        let stdin = std::io::stdin();
+        let mut handle = stdin.lock();
+        let mut line = String::new();
+
+        loop {
+            line.clear();
+
+            if handle.read_line(&mut line).unwrap() == 0 {
+                break;
+            }
+
+            if line.starts_with('#') {
+                continue;
+            }
+
+            let (key, value) = line.split_once('=').expect("Missing `=` in line.");
+            result.insert(key.to_string(), value.trim_end_matches('\n').to_string());
+        }
+
+        KernelConfig(result)
+    }
+
+    /// Does the option exist in the configuration (any value)?
+    ///
+    /// The argument must be passed without the `CONFIG_` prefix.
+    /// This avoids repetition and it also avoids `fixdep` making us
+    /// depend on it.
+    fn has(&self, option: &str) -> bool {
+        let option = "CONFIG_".to_owned() + option;
+        self.0.contains_key(&option)
+    }
+}
+
+fn main() {
+    let cfg = KernelConfig::from_stdin();
+    let mut ts = TargetSpec::new();
+
+    // `llvm-target`s are taken from `scripts/Makefile.clang`.
+    if cfg.has("ARM") {
+        ts.push("arch", "arm");
+        ts.push(
+            "data-layout",
+            "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64",
+        );
+        ts.push("features", "+strict-align,+v6");
+        ts.push("llvm-target", "arm-linux-gnueabi");
+        ts.push("max-atomic-width", 64);
+        ts.push("target-mcount", "\\u0001__gnu_mcount_nc");
+        ts.push("target-pointer-width", "32");
+    } else if cfg.has("ARM64") {
+        ts.push("arch", "aarch64");
+        ts.push(
+            "data-layout",
+            "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128",
+        );
+        ts.push("disable-redzone", true);
+        ts.push("features", "+strict-align,-neon,-fp-armv8");
+        ts.push("llvm-target", "aarch64-linux-gnu");
+        ts.push("max-atomic-width", 128);
+        ts.push("target-pointer-width", "64");
+    } else if cfg.has("PPC") {
+        ts.push("arch", "powerpc64");
+        ts.push("code-model", "large");
+        ts.push("data-layout", "e-m:e-i64:64-n32:64");
+        ts.push("features", "-altivec,-vsx,-hard-float");
+        ts.push("llvm-target", "powerpc64le-linux-gnu");
+        ts.push("max-atomic-width", 64);
+        ts.push("target-mcount", "_mcount");
+        ts.push("target-pointer-width", "64");
+    } else if cfg.has("RISCV") {
+        if cfg.has("64BIT") {
+            ts.push("arch", "riscv64");
+            ts.push("data-layout", "e-m:e-p:64:64-i64:64-i128:128-n64-S128");
+            ts.push("llvm-target", "riscv64-linux-gnu");
+            ts.push("target-pointer-width", "64");
+        } else {
+            ts.push("arch", "riscv32");
+            ts.push("data-layout", "e-m:e-p:32:32-i64:64-n32-S128");
+            ts.push("llvm-target", "riscv32-linux-gnu");
+            ts.push("target-pointer-width", "32");
+        }
+        ts.push("code-model", "medium");
+        ts.push("disable-redzone", true);
+        let mut features = "+m,+a".to_string();
+        if cfg.has("RISCV_ISA_C") {
+            features += ",+c";
+        }
+        ts.push("features", features);
+    } else if cfg.has("X86") {
+        ts.push("arch", "x86_64");
+        ts.push(
+            "data-layout",
+            "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128",
+        );
+        ts.push("llvm-target", "x86_64-linux-gnu");
+        ts.push("target-pointer-width", "64");
+    } else {
+        panic!("Unsupported architecture");
+    }
+
+    ts.push("emit-debug-gdb-scripts", false);
+    ts.push("frame-pointer", "may-omit");
+    ts.push(
+        "stack-probes",
+        vec![("kind".to_string(), Value::String("none".to_string()))],
+    );
+
+    // Everything else is LE, whether `CPU_LITTLE_ENDIAN` is declared or not
+    // (e.g. x86). It is also `rustc`'s default.
+    if cfg.has("CPU_BIG_ENDIAN") {
+        ts.push("target-endian", "big");
+    }
+
+    println!("{}", ts);
+}
diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
new file mode 100755
index 000000000000..277a64d07f22
--- /dev/null
+++ b/scripts/is_rust_module.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# is_rust_module.sh module.ko
+#
+# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
+
+set -e
+
+# Using the `16_` prefix ensures other symbols with the same substring
+# are not picked up (even if it would be unlikely). The last part is
+# used just in case LLVM decides to use the `.` suffix.
+${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c4340c90e172..b7c9f1dd5e42 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -216,6 +216,13 @@ static const char *conf_get_autoheader_name(void)
 	return name ? name : "include/generated/autoconf.h";
 }
 
+static const char *conf_get_rustccfg_name(void)
+{
+	char *name = getenv("KCONFIG_RUSTCCFG");
+
+	return name ? name : "include/generated/rustc_cfg";
+}
+
 static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 {
 	char *p2;
@@ -605,6 +612,9 @@ static const struct comment_style comment_style_c = {
 
 static void conf_write_heading(FILE *fp, const struct comment_style *cs)
 {
+	if (!cs)
+		return;
+
 	fprintf(fp, "%s\n", cs->prefix);
 
 	fprintf(fp, "%s Automatically generated file; DO NOT EDIT.\n",
@@ -745,6 +755,65 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
 	free(escaped);
 }
 
+static void print_symbol_for_rustccfg(FILE *fp, struct symbol *sym)
+{
+	const char *val;
+	const char *val_prefix = "";
+	char *val_prefixed = NULL;
+	size_t val_prefixed_len;
+	char *escaped = NULL;
+
+	if (sym->type == S_UNKNOWN)
+		return;
+
+	val = sym_get_string_value(sym);
+
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		/*
+		 * We do not care about disabled ones, i.e. no need for
+		 * what otherwise are "comments" in other printers.
+		 */
+		if (*val == 'n')
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
+		fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
+		break;
+	case S_HEX:
+		if (val[0] != '0' || (val[1] != 'x' && val[1] != 'X'))
+			val_prefix = "0x";
+		break;
+	default:
+		break;
+	}
+
+	if (strlen(val_prefix) > 0) {
+		val_prefixed_len = strlen(val) + strlen(val_prefix) + 1;
+		val_prefixed = xmalloc(val_prefixed_len);
+		snprintf(val_prefixed, val_prefixed_len, "%s%s", val_prefix, val);
+		val = val_prefixed;
+	}
+
+	/* All values get escaped: the `--cfg` option only takes strings */
+	escaped = escape_string_value(val);
+	val = escaped;
+
+	fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, val);
+
+	free(escaped);
+	free(val_prefixed);
+}
+
 /*
  * Write out a minimal config.
  * All values that has default values are skipped as this is redundant.
@@ -1132,6 +1201,12 @@ int conf_write_autoconf(int overwrite)
 	if (ret)
 		return ret;
 
+	ret = __conf_write_autoconf(conf_get_rustccfg_name(),
+				    print_symbol_for_rustccfg,
+				    NULL);
+	if (ret)
+		return ret;
+
 	/*
 	 * Create include/config/auto.conf. This must be the last step because
 	 * Kbuild has a dependency on auto.conf and this marks the successful
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 7c20252a90c6..53fe64856015 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,6 +31,12 @@ llvm)
 		echo 11.0.0
 	fi
 	;;
+rustc)
+	echo 1.60.0
+	;;
+bindgen)
+	echo 0.56.0
+	;;
 *)
 	echo "$1: unknown tool" >&2
 	exit 1
diff --git a/scripts/rust-is-available-bindgen-libclang.h b/scripts/rust-is-available-bindgen-libclang.h
new file mode 100644
index 000000000000..0ef6db10d674
--- /dev/null
+++ b/scripts/rust-is-available-bindgen-libclang.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#pragma message("clang version " __clang_version__)
diff --git a/scripts/rust-is-available.sh b/scripts/rust-is-available.sh
new file mode 100755
index 000000000000..6bd395167d0f
--- /dev/null
+++ b/scripts/rust-is-available.sh
@@ -0,0 +1,158 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Tests whether a suitable Rust toolchain is available.
+#
+# Pass `-v` for human output and more checks (as warnings).
+
+set -e
+
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
+# Convert the version string x.y.z to a canonical up-to-7-digits form.
+#
+# Note that this function uses one more digit (compared to other
+# instances in other version scripts) to give a bit more space to
+# `rustc` since it will reach 1.100.0 in late 2026.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((100000 * $1 + 100 * $2 + $3))
+}
+
+# Check that the Rust compiler exists.
+if ! command -v "$RUSTC" >/dev/null; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust compiler '$RUSTC' could not be found."
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+
+# Check that the Rust bindings generator exists.
+if ! command -v "$BINDGEN" >/dev/null; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust bindings generator '$BINDGEN' could not be found."
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+
+# Check that the Rust compiler version is suitable.
+#
+# Non-stable and distributions' versions may have a version suffix, e.g. `-dev`.
+rust_compiler_version=$( \
+	LC_ALL=C "$RUSTC" --version 2>/dev/null \
+		| head -n 1 \
+		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+)
+rust_compiler_min_version=$($min_tool_version rustc)
+rust_compiler_cversion=$(get_canonical_version $rust_compiler_version)
+rust_compiler_min_cversion=$(get_canonical_version $rust_compiler_min_version)
+if [ "$rust_compiler_cversion" -lt "$rust_compiler_min_cversion" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust compiler '$RUSTC' is too old."
+		echo >&2 "***   Your version:    $rust_compiler_version"
+		echo >&2 "***   Minimum version: $rust_compiler_min_version"
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+if [ "$1" = -v ] && [ "$rust_compiler_cversion" -gt "$rust_compiler_min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Rust compiler '$RUSTC' is too new. This may or may not work."
+	echo >&2 "***   Your version:     $rust_compiler_version"
+	echo >&2 "***   Expected version: $rust_compiler_min_version"
+	echo >&2 "***"
+fi
+
+# Check that the Rust bindings generator is suitable.
+#
+# Non-stable and distributions' versions may have a version suffix, e.g. `-dev`.
+rust_bindings_generator_version=$( \
+	LC_ALL=C "$BINDGEN" --version 2>/dev/null \
+		| head -n 1 \
+		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+)
+rust_bindings_generator_min_version=$($min_tool_version bindgen)
+rust_bindings_generator_cversion=$(get_canonical_version $rust_bindings_generator_version)
+rust_bindings_generator_min_cversion=$(get_canonical_version $rust_bindings_generator_min_version)
+if [ "$rust_bindings_generator_cversion" -lt "$rust_bindings_generator_min_cversion" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust bindings generator '$BINDGEN' is too old."
+		echo >&2 "***   Your version:    $rust_bindings_generator_version"
+		echo >&2 "***   Minimum version: $rust_bindings_generator_min_version"
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+if [ "$1" = -v ] && [ "$rust_bindings_generator_cversion" -gt "$rust_bindings_generator_min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Rust bindings generator '$BINDGEN' is too new. This may or may not work."
+	echo >&2 "***   Your version:     $rust_bindings_generator_version"
+	echo >&2 "***   Expected version: $rust_bindings_generator_min_version"
+	echo >&2 "***"
+fi
+
+# Check that the `libclang` used by the Rust bindings generator is suitable.
+bindgen_libclang_version=$( \
+	LC_ALL=C "$BINDGEN" $(dirname $0)/rust-is-available-bindgen-libclang.h 2>&1 >/dev/null \
+		| grep -F 'clang version ' \
+		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+)
+bindgen_libclang_min_version=$($min_tool_version llvm)
+bindgen_libclang_cversion=$(get_canonical_version $bindgen_libclang_version)
+bindgen_libclang_min_cversion=$(get_canonical_version $bindgen_libclang_min_version)
+if [ "$bindgen_libclang_cversion" -lt "$bindgen_libclang_min_cversion" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** libclang (used by the Rust bindings generator '$BINDGEN') is too old."
+		echo >&2 "***   Your version:    $bindgen_libclang_version"
+		echo >&2 "***   Minimum version: $bindgen_libclang_min_version"
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+
+# If the C compiler is Clang, then we can also check whether its version
+# matches the `libclang` version used by the Rust bindings generator.
+#
+# In the future, we might be able to perform a full version check, see
+# https://github.com/rust-lang/rust-bindgen/issues/2138.
+if [ "$1" = -v ]; then
+	cc_name=$($(dirname $0)/cc-version.sh "$CC" | cut -f1 -d' ')
+	if [ "$cc_name" = Clang ]; then
+		clang_version=$( \
+			LC_ALL=C "$CC" --version 2>/dev/null \
+				| sed -nE '1s:.*version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p'
+		)
+		if [ "$clang_version" != "$bindgen_libclang_version" ]; then
+			echo >&2 "***"
+			echo >&2 "*** libclang (used by the Rust bindings generator '$BINDGEN') version does not match Clang's. This may be a problem."
+			echo >&2 "***   libclang version: $bindgen_libclang_version"
+			echo >&2 "***   Clang version:    $clang_version"
+			echo >&2 "***"
+		fi
+	fi
+fi
+
+# Check that the source code for the `core` standard library exists.
+#
+# `$KRUSTFLAGS` is passed in case the user added `--sysroot`.
+rustc_sysroot=$("$RUSTC" $KRUSTFLAGS --print sysroot)
+rustc_src=${RUST_LIB_SRC:-"$rustc_sysroot/lib/rustlib/src/rust/library"}
+rustc_src_core="$rustc_src/core/src/lib.rs"
+if [ ! -e "$rustc_src_core" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Source code for the 'core' standard library could not be found"
+		echo >&2 "*** at '$rustc_src_core'."
+		echo >&2 "***"
+	fi
+	exit 1
+fi
-- 
2.35.3

