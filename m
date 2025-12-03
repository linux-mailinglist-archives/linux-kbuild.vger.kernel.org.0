Return-Path: <linux-kbuild+bounces-9954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D913CC9D72C
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 01:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B3253A2C5D
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 00:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083021EFFB4;
	Wed,  3 Dec 2025 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="35Mi+Y8q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0542213A258
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Dec 2025 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764722457; cv=none; b=c3PsX+cKSl/2ZkA4G7Jk3ILtu3ISSe13n4iTzwcOr/HETPocQ9eIqxwBG76zhiQUst+iVah/6jxhzf4aKdX5YJeMKslOzdjfPykZR22PYX50kmYd/R94D0mqEYqFi0waEpHrELHXS3EKrPDFKNORfK3dHWpNc8U2zDcFPPcT0gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764722457; c=relaxed/simple;
	bh=4xuGbXmfnTCUVhOk6EdhyGfR4JrGxiM26jMTw4JpWf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGTqqCuY4ZL/tqDfak6EK/1hRqSEcgSTcunnBIvB6PpjUCM+NJ/40UE3zuS2ltRutbpCv8eS4vnnYHhbTpNG7Buo/QqdgU+ovIxk3EASqA0AoDsRgQhuIcfnpetWvo2GxL+JUUob+NcBHXy3vn6vFH40wb/myINBFU8GCQN8enw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=35Mi+Y8q; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64175f78a6fso4748a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Dec 2025 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764722454; x=1765327254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3Oc4D01w5dnpG7EGuBSSV6W8GNHvTw+m8MC7UWCybk=;
        b=35Mi+Y8qdYsGWyYY7pQYVV/XkXd0EP7JuwYLV8xjSwru+mAX18pu/Rxfxq5C20wQXi
         w22laxdfW36m08Rczjs0bj2pJfmPMkZzKALM3FFJsObeujfC8TV44Ujba9urGkzZHdMm
         EwFZ5gfoUNdU5sIXFE7P3Yg25rywXdLd22L7XSSh88f+KdWKbla0EH+9+1MWNzsN34rY
         QAafFbiga2PJn/KzHPWLMimyGS+yE/E2kGV2u0A5ORTgo95TbKOg+T0s0UedkwKjA2qW
         q+W7rTXgq4PGmNpBEcs3otDxrZVLT1IFstQdENoOZjb2lr5HtkP/R/9w/3S4TlsMMvky
         WsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764722454; x=1765327254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3Oc4D01w5dnpG7EGuBSSV6W8GNHvTw+m8MC7UWCybk=;
        b=xSUiqU1jhvuf0NYxR0XoqinG1fT/RYxFU1TOlJtjVUvxY+1N0T2PBJfons8Qde0tKu
         u+fx6i9lNJiFDuy+Any2ghectJ0Zz/LCVAgoL0P8qWcm9zRHRfZUXKDIYPc61Z+jilkA
         UKjz2SScmjOYKtpnzslX61qDXFc6BwfzvJZ64dvU7R1XBhVVO2H2hLyNEH7phd5mMfGE
         RoBNMJo00i1EFBuNn8H8gREalNmzZbeOoAC9bVaWoSYMeuqLv8I+Q8ksp2CDX7IbxC9c
         /LS51aSJTLJ60tqU9anBTbJiZ07QB2uQZOVUHIhPvxhi9hZdlxVAE3fT/Ra/sujDVCR7
         +qUg==
X-Forwarded-Encrypted: i=1; AJvYcCX+sVpN5Elt1Q4R17hUAl8XBlnLL211d4D/XBu/HJ4qWIjW9iWCqYRsGwkxsQC3fe9Foud/12moFf7iM84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdO859Rj7h1024saXlcVp4kud+LPwlPLT01zcElSUvNtip29K
	gWmiNqGG0y99Tf9TAOi76J1oaDQoT4UVVtxsYGJ+KmoqMjH59YUWKsP7gpPguvypPjOR+phGdsY
	jKR/EgyrVWF5b5ALJ7/IHVNErhT+A4GRamWkRKVkO
X-Gm-Gg: ASbGncv3UCR9yKaCxC5gKSqQj1PZG04H2hS1FiqQ/5cA1Z6eIIlgskNC0JD2BtwV7WV
	u4VkWMIc221GgCb1lDkaSl+KS26+eZ9sJNAa6GpEDnS/0SRV2F6pW+B/AJ58wDSPy9YjgjBpZ7K
	dH+AFxELuFpsznBkxXIY7ZI3Xn5yps/xIrcj3aCwnjXNxUUwr7iGgQC5LqoS/xwDO8OBwe/m+P4
	CSHJZumNBcXF5gxBezuABBpcsAsGQ4NT1NoVteH3b6OV6qXTGtgEwZWQhSc5sgxxyYlPGHIhae5
	7VHOW+rqk0apfd33QsmxwFMdcnzdtFIyT0WezHI=
X-Google-Smtp-Source: AGHT+IGUpO0L+WhI58F9++W1H/peDm2X2DnX35lpzSJlaDsXJA8kDOMd11eAqj6cUIz2+cVg+h2Z9la6R9E/O0WsxH0=
X-Received: by 2002:a05:6402:2183:10b0:640:914c:ab91 with SMTP id
 4fb4d7f45d1cf-6479b43672fmr9260a12.3.1764722454227; Tue, 02 Dec 2025 16:40:54
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com> <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
In-Reply-To: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 2 Dec 2025 16:40:41 -0800
X-Gm-Features: AWmQ_blBVdIJYux_tf6OFeNJfOnc6oPyFKVIBlfORGWG1BYJoNUf8x7Y_xiutHA
Message-ID: <CAGSQo01=7YDfYzbjipNtsK8AzXciSpY+v53kAhh+oZ_QisAh4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 12:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Gary Guo <gary@garyguo.net>
>
> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> allow C helpers (which were created to allow Rust to call into
> inline/macro C functions without having to re-implement the logic in
> Rust) to be inlined into Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked with --internalize to combine the helper bitcode
>   with the crate bitcode. This step is similar to LTO, but this is much
>   faster since it only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> The --internalize flag tells llvm-link to treat all symbols in
> helpers.bc using `internal` linkage. This matches the behavior of
> `clang` on `static inline` functions, and avoids exporting the symbol
> from the object file.

I've filed a PR with LLVM [1] to clarify that this is the intended
operation of the tool.

[1]: https://github.com/llvm/llvm-project/pull/170397

>
> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> Disallow BTF generation with Rust + LTO") for details.
>
> We have an intended triple mismatch of `aarch64-unknown-none` vs
> `aarch64-unknown-linux-gnu`, so we suppress the warning.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile               |  4 +++-
>  lib/Kconfig.debug      | 15 +++++++++++++++
>  rust/Makefile          | 26 ++++++++++++++++++++++----
>  rust/exports.c         |  5 ++++-
>  scripts/Makefile.build |  5 ++++-
>  5 files changed, 48 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328d=
ccce5d60f85526f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ OBJCOPY             =3D $(LLVM_PREFIX)llvm-objcopy$(L=
LVM_SUFFIX)
>  OBJDUMP                =3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                =3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          =3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK      =3D $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS                =3D $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
> @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP :=3D 1
>  export CLIPPY_CONF_DIR :=3D $(srctree)
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COM=
PILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX=
 YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd=
12dfd99d59f5080 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
>
>           If unsure, say N.
>
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    depends on EXPERT
> +    help
> +        Links C helpers into Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files di=
rectly,
> +        rustc is asked to produce LLVM IR, which is then linked together=
 with
> +        the LLVM IR of C helpers, before object file is generated.
> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +
>  endmenu # "Rust"
>
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index d7d19c21b671dea10242b1772a8bcf0bf5dcc1cd..2344e2662ce29280582215954=
132c09f63cd8c9d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -6,15 +6,19 @@ rustdoc_output :=3D $(objtree)/Documentation/output/rus=
t/rustdoc
>  obj-$(CONFIG_RUST) +=3D core.o compiler_builtins.o ffi.o
>  always-$(CONFIG_RUST) +=3D exports_core_generated.h
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +always-$(CONFIG_RUST) +=3D helpers/helpers.bc
> +else
> +obj-$(CONFIG_RUST) +=3D helpers/helpers.o
> +always-$(CONFIG_RUST) +=3D exports_helpers_generated.h
> +endif
>  # Missing prototypes are expected in the helpers since these are exporte=
d
>  # for Rust only, thus there is no header nor prototypes.
> -obj-$(CONFIG_RUST) +=3D helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-decla=
rations
>
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D bindings.o pin_init.o kernel.o
> -always-$(CONFIG_RUST) +=3D exports_helpers_generated.h \
> -    exports_bindings_generated.h exports_kernel_generated.h
> +always-$(CONFIG_RUST) +=3D exports_bindings_generated.h exports_kernel_g=
enerated.h
>
>  always-$(CONFIG_RUST) +=3D uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) +=3D uapi.o
> @@ -468,6 +472,13 @@ $(obj)/bindings/bindings_helpers_generated.rs: priva=
te bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +quiet_cmd_rust_helper =3D HELPER  $@
> +      cmd_rust_helper =3D \
> +       $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -c -g0 $< -emit-llvm -o $@
> +
> +$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
> +       +$(call if_changed_dep,rust_helper)
> +
>  rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
>
>  quiet_cmd_exports =3D EXPORTS $@
> @@ -547,11 +558,13 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
TC,$(RUSTC_OR_CLIPPY_QUIET)) L
>         OBJTREE=3D$(abspath $(objtree)) \
>         $(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>                 $(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_=
flags) \
> -               --emit=3Ddep-info=3D$(depfile) --emit=3Dobj=3D$@ \
> +               --emit=3Ddep-info=3D$(depfile) --emit=3D$(if $(link_helpe=
r),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) \
>                 --emit=3Dmetadata=3D$(dir $@)$(patsubst %.o,lib%.rmeta,$(=
notdir $@)) \
>                 --crate-type rlib -L$(objtree)/$(obj) \
>                 --crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>                 --sysroot=3D/dev/null \
> +       $(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnin=
gs $(patsubst %.o,%.bc,$@) $(obj)/helpers/helpers.bc -o $(patsubst %.o,%.m.=
bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-modul=
e -c $(patsubst %.o,%.m.bc,$@) -o $@) \
>         $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
>         $(cmd_objtool)
>
> @@ -678,4 +691,9 @@ $(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_as=
m.rs $(obj)/kernel/generate
>  endif
>  endif
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +$(obj)/kernel.o: private link_helper =3D 1
> +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> +endif
> +
>  endif # CONFIG_RUST
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba52854080f15aa91094b55996c072..1b52460b0f4eeef6df9081abb=
9b7e054a28c3c21 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -16,10 +16,13 @@
>  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sy=
m)
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
> index d0ee33a487be95f8ba9a5c964ebecfbebc6c4bf8..04eaf2b4fbca2245f904a6dc7=
875cb3275aa7df6 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -343,7 +343,10 @@ rust_common_cmd =3D \
>  # would not match each other.
>
>  quiet_cmd_rustc_o_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3Dobj=3D$@ $< $(cmd_o=
bjtool)
> +      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3D$(if $(CONFIG_RUST_=
INLINE_HELPERS),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) $< \
> +       $(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --=
suppress-warnings $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers/helpers.b=
c -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-modul=
e -c $(patsubst %.o,%.m.bc,$@) -o $@) \
> +       $(cmd_objtool)
>
>  define rule_rustc_o_rs
>         $(call cmd_and_fixdep,rustc_o_rs)
>
> --
> 2.52.0.158.g65b55ccf14-goog
>

