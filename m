Return-Path: <linux-kbuild+bounces-11927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Hz/EHDettGl/rwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11927-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:35:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7106C28AF72
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 01:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72267300B469
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 00:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40404282F2E;
	Sat, 14 Mar 2026 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzkUnS/d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB111A0BD6;
	Sat, 14 Mar 2026 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448498; cv=none; b=lIAfSTXsPLFYeMmPXuuAqcvJDWHvwRnv/ya/bR9m75pVgbapO4wu7uQjpz0MUuSNZPla8tiT9Fkgm/EYf49jIRaBOCm8lyeXEWpiqN4nZQZUr6N8hLiwsSLs4TnemLWpWyLrp9azU6dkxD5HeNrY2ZWM2t2r74fP2cYOoSJLd9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448498; c=relaxed/simple;
	bh=mIPSf8Grq5IDw0hPSxPtdgB9zfIwO+Jn660csit1eGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMvT2zwlzZSL2hDL+dCrLlokb1CfiT7JIPIvMJdR7UtoZ5pxW++/idq8cQ4OIL3DZPCogfNTY1U+9jwaNXsge90jPB55Tb30iVkPVsDnqGiNsxM8Ibs0vr7lsNzr7u18XbowyjZUweHDOAVVmbUQKrVgSeHyswIoN9Cviw9H7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzkUnS/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F82C19421;
	Sat, 14 Mar 2026 00:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773448497;
	bh=mIPSf8Grq5IDw0hPSxPtdgB9zfIwO+Jn660csit1eGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzkUnS/dqUV16ATpVr9Yww29xTw7wapx0hHEuAqy2ItR5pdRh9IxocTv8XEGFD36E
	 fG2YI+AAzQbyFLeZ5RzD7FPA5ENmwCqD59eLFNAeYBTiydQR2EpPPg7aMSR2m8eWoM
	 ZjpbpHKVnCwwNdQnaNkY0Pqx4g62oDf/VjgaUiRavmgfvXCee5nl62LW7rynXbsivE
	 1Xs/w1bl1pkhaR4Go8QCR40pLECADtwn29LAKO/Qk1lZ1jAI3ASOgqQa0J3EkORc6i
	 JMwoHzbLXVdEm+trtHJb2Znh0pNSm4YKqnNdcajgd5O81wq3oqFTfeMxvbi+OQC8CT
	 qHG2M0iSz/Tfg==
Date: Fri, 13 Mar 2026 17:34:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C
 helpers into Rust
Message-ID: <20260314003450.GC534169@ax162>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11927-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7106C28AF72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> allow C helpers (which were created to allow Rust to call into
> inline/macro C functions without having to re-implement the logic in
> Rust) to be inlined into Rust crates without performing global LTO.
> 
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR bitcode. Two versions are
>   generated: one for built-in code (`helpers.bc`) and one for modules
>   (`helpers_module.bc`, with -DMODULE defined). This ensures that C
>   macros/inlines that behave differently for modules (e.g. static calls)
>   function correctly when inlined.
> * When a Rust crate or object is compiled, instead of generating an
>   object file, LLVM bitcode is generated.
> * llvm-link is invoked with --internalize to combine the helper bitcode
>   with the crate bitcode. This step is similar to LTO, but this is much
>   faster since it only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
> * Since clang may produce LLVM bitcode when LTO is enabled, and objtool
>   requires ELF input, $(cmd_ld_single) is invoked to ensure the object
>   is converted to ELF before objtool runs.
> 
> The --internalize flag tells llvm-link to treat all symbols in
> helpers.bc using `internal` linkage [1]. This matches the behavior of
> `clang` on `static inline` functions, and avoids exporting the symbol
> from the object file.
> 
> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> Disallow BTF generation with Rust + LTO") for details.
> 
> We have an intended triple mismatch of `aarch64-unknown-none` vs
> `aarch64-unknown-linux-gnu`, so we pass --suppress-warnings to llvm-link
> to suppress it.
> 
> We add $(cmd_ld_single) before $(cmd_objtool). Otherwise objtool fails
> to parse the resulting files as Elf when CONFIG_LTO is enabled.

You mention this as the last bullet point above, so this paragraph can
probably be dropped.

> I considered adding some sort of check that KBUILD_MODNAME is not
> present in helpers_module.bc, but this is actually not so easy to carry
> out because .bc files store strings in a weird binary format, so you
> cannot just grep it for a string to check whether it ended up using
> KBUILD_MODNAME anywhere.
> 
> Link: https://github.com/llvm/llvm-project/pull/170397 [1]
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile               |  3 ++-
>  lib/Kconfig.debug      | 15 +++++++++++++++
>  rust/Makefile          | 29 +++++++++++++++++++++++++----
>  rust/exports.c         |  5 ++++-
>  scripts/Makefile.build |  7 ++++++-
>  5 files changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c97f06ee0dda1c922aa23bd5249052591d528eb6..155db03cf489d931eefdb4bd7e3b93e5aa3ea2d6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -519,6 +519,7 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)

I don't have a strong preference but this could be alphabetized among
the binutils variables.

>  else
>  CC		= $(CROSS_COMPILE)gcc
>  LD		= $(CROSS_COMPILE)ld
> @@ -627,7 +628,7 @@ export RUSTC_BOOTSTRAP := 1
>  export CLIPPY_CONF_DIR := $(srctree)
>  
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 7570a694d54e6170ae6738634218b37e38a4b76a..c44c08b49f3a3c2e06fca42adeb9e04304e7a869 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3551,6 +3551,21 @@ config RUST_KERNEL_DOCTESTS
>  
>  	  If unsure, say N.
>  
> +config RUST_INLINE_HELPERS
> +	bool "Inline C helpers into Rust code"
> +	depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +	depends on EXPERT
> +	help
> +	  Inlines C helpers into Rust code using Link Time Optimization.
> +
> +	  If this option is enabled, C helper functions declared in
> +	  rust/helpers/ are inlined into Rust code, which is helpful for
> +	  performance of Rust code. This requires a matching LLVM version for
> +	  Clang and rustc.
> +
> +	  If you are sure that you're using Clang and rustc with matching LLVM
> +	  versions, say Y. Otherwise say N.
> +
>  endmenu # "Rust"
>  
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index 63464bd2c1e9734cd6e659f7ee3db58bf995d6dd..a6839f2d39feefcfea497384ae202a7c6b475942 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -6,15 +6,19 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
>  obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
>  always-$(CONFIG_RUST) += exports_core_generated.h
>  
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +always-$(CONFIG_RUST) += helpers/helpers.bc helpers/helpers_module.bc
> +else
> +obj-$(CONFIG_RUST) += helpers/helpers.o
> +always-$(CONFIG_RUST) += exports_helpers_generated.h
> +endif
>  # Missing prototypes are expected in the helpers since these are exported
>  # for Rust only, thus there is no header nor prototypes.
> -obj-$(CONFIG_RUST) += helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
>  
>  always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
>  obj-$(CONFIG_RUST) += bindings.o pin_init.o kernel.o
> -always-$(CONFIG_RUST) += exports_helpers_generated.h \
> -    exports_bindings_generated.h exports_kernel_generated.h
> +always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
>  
>  always-$(CONFIG_RUST) += uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) += uapi.o
> @@ -480,6 +484,14 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
>  	$(call if_changed_dep,bindgen)
>  
> +quiet_cmd_rust_helper = HELPER  $@
> +      cmd_rust_helper = \
> +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> +
> +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> +	+$(call if_changed_dep,rust_helper)
> +
>  rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
>  
>  quiet_cmd_exports = EXPORTS $@
> @@ -561,12 +573,16 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
>  	OBJTREE=$(abspath $(objtree)) \
>  	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>  		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
> -		--emit=dep-info=$(depfile) --emit=obj=$@ \
> +		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
>  		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
>  		--crate-type rlib -L$(objtree)/$(obj) \
>  		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>  		--sysroot=/dev/null \
> +	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
> +		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
> +		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@) \
>  	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
> +	$(cmd_ld_single) \
>  	$(cmd_objtool)
>  
>  rust-analyzer:
> @@ -696,4 +712,9 @@ $(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generate
>  endif
>  endif
>  
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +$(obj)/kernel.o: private link_helper = 1
> +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> +endif
> +
>  endif # CONFIG_RUST
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba52854080f15aa91094b55996c072..1b52460b0f4eeef6df9081abb9b7e054a28c3c21 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -16,10 +16,13 @@
>  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
>  
>  #include "exports_core_generated.h"
> -#include "exports_helpers_generated.h"
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
>  
> +#ifndef CONFIG_RUST_INLINE_HELPERS
> +#include "exports_helpers_generated.h"
> +#endif
> +
>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
>  EXPORT_SYMBOL_RUST_GPL(rust_build_error);
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0c838c467c764e14a51ad132444544373e90a84c..7176d997ecab7c3ffd1e00400a8a79a8309485e1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -343,7 +343,12 @@ rust_common_cmd = \
>  # would not match each other.
>  
>  quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $< $(cmd_objtool)
> +      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_INLINE_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
> +	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
> +		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
> +		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@) \
> +	$(cmd_ld_single) \
> +	$(cmd_objtool)
>  
>  define rule_rustc_o_rs
>  	$(call cmd_and_fixdep,rustc_o_rs)
> 
> -- 
> 2.53.0.rc1.225.gd81095ad13-goog
> 

