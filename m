Return-Path: <linux-kbuild+bounces-2027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC656900748
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 16:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A551F248BE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 14:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577E71A0DE8;
	Fri,  7 Jun 2024 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ylopEWRW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6F1A0AF8
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Jun 2024 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717771265; cv=none; b=A6pGG19/ug9IjVceYucWdfCJmlhPYIajhVMGLfrevmy02G/uUPBv/Zukc/p7Oqym/S+W5EAKGExuqup26BXxR/Ik/3K4zXWJ+uhSMLerF3UY3cqoFGNsG8/GI9tOdddACe3/wd6+VqYeFhyhIJn6D1kpjR6qf+dt3VNq6ALeNPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717771265; c=relaxed/simple;
	bh=+8evMGg2n1u/8yOm9qRPDDeti+4TBuqjZRybbC+w58U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5DuI1B7HgLH5AyBrPrtJVLQlwqOVfB7T14O1u+sy6nF6XtA/rwDJlE/WjWUCsFwkVCrogfPSj8zfkwIK1tnMZXrWmf6tZUW3i517nJPMOLtV46dnpps32JWCett0H6JkpHQz74r2gg2OiWfu/fTAej9obvrZlikoh2nrimwp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ylopEWRW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57c5ec83886so8268a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jun 2024 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717771260; x=1718376060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt9qUYYFSO6k5VmbzbT82tlK3CSHJaSCL9vF7bZshII=;
        b=ylopEWRWiYiIov7hPCSgQbzCFrqmJbVrFTgzRBQ2oRVhLGprUTYiLKKbIYu2LONx3p
         dOgNZwLwVrCg6V24skMVWOJwTVJlyIHxfdsSs3z9eHawzM2QG5lGRBC6ttidNTuEAAb7
         wLvyVl3+PqdXqM7h/RJEuB29mNZghNXjrDr97Q8sYfnETt31yiepPcsfJ3jpOeyQ1L7e
         vlEXDb7/LMUalrF6LVQ13IB5xs+P+AD/WJfmPk6rYF1EKuKj18Blfg5TyItpG1tzBsyY
         8QzcudJM6cQPk1jQZBR9DRsLl1/juAUf2abpCjattXfhJ+ziab0kR/ztYB+wBIzTQQ0K
         rNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717771260; x=1718376060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kt9qUYYFSO6k5VmbzbT82tlK3CSHJaSCL9vF7bZshII=;
        b=DMmAv/tDBVGmTW3cjkD2yrcUPrAymtao17EX5y4CQ2S7YImb8vk0SmEULhcmpcFJTl
         I4Lb9FEVWW1yuFDdQ6hlUG27pQELG3pWD+WXIJ0oowRPnmbto2rCdf5KhthtSguUKqwg
         0ThWFUdUSyMG8R+v3ESqlmwSPLBSfqo/FdvxSaGsDRGUk+s59au0Z0G2glA1KW8kM0/m
         +8UlRBhnnH6OeMVhMywLS1+2iOt0C+6/+THcsCGstr2dSyTBCfuuTA+DNFJWPHwXrkwN
         0Ypxr5a/p4cPG78SfHUR3KVtS+49aJaNNoq/nfRhGg17iuWvQ/+zJCGZHMwMPR7s+Dqy
         VxlA==
X-Forwarded-Encrypted: i=1; AJvYcCWEUwXxs3dlI3Wdj2M0qZPOLDKquZciHHVQRntwTJKtW02+eNWm0gIA6wj6FDRZHt9qyVdXuPNtgJ2gvWAMWtzCZ4qrDTDLWGTjcCTr
X-Gm-Message-State: AOJu0Yy3iOpjaTocSkPi1PSlzbJmmtVtN4Eb5U5xnmQzgWPe/lqKwyRO
	uON726PIX3+m061WH4qludj0thh8VrSxVTF8csILy47C4Tenv8LVanVuAwuNWOTaDqCamgWRfu8
	35d8L30VHtZXFVRAdZT5eHqqDyg8u4m+hr/Iv
X-Google-Smtp-Source: AGHT+IF+7OYsf/plphBn251y9C5NvZgYDGnF0KHYss+k6I+DerkG8/c8obCD4hxD/phsyZpCPyJATvuDvQDsX4YBKoA=
X-Received: by 2002:aa7:c0c5:0:b0:57c:5ffb:9917 with SMTP id
 4fb4d7f45d1cf-57c5ffb99b5mr114826a12.4.1717771257885; Fri, 07 Jun 2024
 07:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529202817.3641974-1-gary@garyguo.net> <20240529202817.3641974-3-gary@garyguo.net>
In-Reply-To: <20240529202817.3641974-3-gary@garyguo.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 7 Jun 2024 07:40:45 -0700
Message-ID: <CAGSQo02_siEiS07H+7MCi_T2REGoyF6FFuGHVmiUFi4EocLizQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The LLVM `.ll` textual bitcode representation may change from version
to version, which makes using `sed` to edit it potentially fragile.
Would it be possible to attach similar attributes without this? (Or
other attributes that can accomplish something similar, see the second
part.)

Would it be possible to use a Rust-only-LTO (actual LTO) flag rather
than a `llvm-link`? It seems likely that someone that wants to use a
synced `clang` and `rustc` to allow helpers to be inlined would be
unlikely to object to thin LTO of Rust. This would avoid introducing a
new tool.

As one possible route around editing the `.ll` file, we could consider
*not* hiding these symbols, just marking them as "good idea to inline
if possible", and then masking any symbol that ends up in the final
`.o` via `objcopy --localize-symbol=3Dblah`. If we're doing full-kernel
LTO rather than rust-only LTO, we'd need to use `llvm-objcopy`
instead, but the same process would follow - a postprocessing step on
the final crate object that localizes the symbol, with LTO giving the
compiler the option (but not requirement) to inline these functions if
it seems like a good idea.


On Wed, May 29, 2024 at 1:30=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_LTO_HELPERS` is added to allow C helpers
> (which was created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing a global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to object file to be linked
>   into vmlinux, we compile them to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that the function is inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file
>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or
>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to what's done in a full LTO, hence the
>   option name, but this is much faster since it only needs to inline the
>   helpers.
> * clang is invoked to turn the combined bitcode into object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Manual inspection
>   shows that they should be compatible, but since they are not exactly
>   the same LLVM seems to prefer not inlining them. This is bypassed with
>   `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions combined with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this command when compiling helpers. I think this should be
>   okay since this is one of the hardening features and we shouldn't have
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`)
> but the behaviour is the same with extra options.
>
> This option requires clang to be used for CC and the LLVM version of
> clang and rustc to be matching (at least to the same major version), and
> therefore is gated as EXPERT option.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  Makefile               |  4 +++-
>  lib/Kconfig.debug      | 10 ++++++++++
>  rust/Makefile          | 34 ++++++++++++++++++++++++++++++----
>  rust/exports.c         |  3 +++
>  rust/helpers.c         | 41 +++++++++++++++++++++--------------------
>  scripts/Makefile.build |  5 ++++-
>  6 files changed, 71 insertions(+), 26 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f975b6396328..c6f12093fb1c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -492,6 +492,8 @@ OBJCOPY             =3D $(LLVM_PREFIX)llvm-objcopy$(L=
LVM_SUFFIX)
>  OBJDUMP                =3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                =3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          =3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK      =3D $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS        =3D $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
> @@ -601,7 +603,7 @@ endif
>  export RUSTC_BOOTSTRAP :=3D 1
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COM=
PILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN CARGO
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN CARGO LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX=
 YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 59b6765d86b8..8b9a1bd8ce71 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3049,6 +3049,16 @@ config RUST_KERNEL_DOCTESTS
>
>           If unsure, say N.
>
> +config RUST_LTO_HELPERS
> +    bool "LTO C helpers with Rust crates"
> +    depends on RUST && CC_IS_CLANG && EXPERT
> +    help
> +      Links C helpers together with Rust crates using LTO.
> +
> +      This is achieved by compiling both helpers and Rust crates into
> +      LLVM bitcode and use llvm-link to combine them.
> +
> +      This requires a matching LLVM version for Clang and rustc.
> +
> +      If unsure, say N.
> +
>  endmenu # "Rust"
>
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index b4d63ea9209f..ad0797467102 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -6,9 +6,14 @@ rustdoc_output :=3D $(objtree)/Documentation/output/rust=
/rustdoc
>  obj-$(CONFIG_RUST) +=3D core.o compiler_builtins.o
>  always-$(CONFIG_RUST) +=3D exports_core_generated.h
>
> +ifdef CONFIG_RUST_LTO_HELPERS
> +always-$(CONFIG_RUST) +=3D helpers.bc
> +else
> +obj-$(CONFIG_RUST) +=3D helpers.o
> +always-$(CONFIG_RUST) +=3D exports_helpers_generated.h
> +endif
>  # Missing prototypes are expected in the helpers since these are exporte=
d
>  # for Rust only, thus there is no header nor prototypes.
> -obj-$(CONFIG_RUST) +=3D helpers.o
>  CFLAGS_REMOVE_helpers.o =3D -Wmissing-prototypes -Wmissing-declarations
>
>  always-$(CONFIG_RUST) +=3D libmacros.so
> @@ -17,7 +22,7 @@ no-clean-files +=3D libmacros.so
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D alloc.o bindings.o kernel.o
>  always-$(CONFIG_RUST) +=3D exports_alloc_generated.h exports_bindings_ge=
nerated.h \
> -    exports_kernel_generated.h exports_helpers_generated.h
> +    exports_kernel_generated.h
>
>  always-$(CONFIG_RUST) +=3D uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) +=3D uapi.o
> @@ -350,12 +355,24 @@ $(obj)/bindings/bindings_helpers_generated.rs: priv=
ate bindgen_target_flags =3D \
>      --blocklist-type '.*' --allowlist-var '' \
>      --allowlist-function 'rust_helper_.*'
>  $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_cf=
lags =3D \
> -    -I$(objtree)/$(obj) -Wno-missing-prototypes -Wno-missing-declaration=
s
> +    -I$(objtree)/$(obj) $(CFLAGS_helpers.o) -Wno-missing-prototypes -Wno=
-missing-declarations
>  $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_ex=
tra =3D ; \
>      sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name=3D"rust_he=
lper_\1"]\n    pub fn \1/g' $@
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
>         $(call if_changed_dep,bindgen)
>
> +# When compiling helpers, filter `-fno-delete-null-pointer-checks` since=
 LLVM
> +# prevents inlining such functions to be inlined into functions compiled
> +# without the option (e.g. Rust functions).
> +quiet_cmd_rust_helper =3D HELPER  $@
> +      cmd_rust_helper =3D \
> +       $(CC) $(filter-out -fno-delete-null-pointer-checks $(CFLAGS_REMOV=
E_helpers.o), $(c_flags) $(CFLAGS_helpers.o)) -S $< -emit-llvm -o $(patsubs=
t %.bc,%.ll,$@); \
> +       sed -i 's/^define dso_local/define linkonce_odr dso_local/g' $(pa=
tsubst %.bc,%.ll,$@); \
> +       $(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
> +
> +$(obj)/helpers.bc: $(obj)/helpers.c FORCE
> +       +$(call if_changed_dep,rust_helper)
> +
>  quiet_cmd_exports =3D EXPORTS $@
>        cmd_exports =3D \
>         $(NM) -p --defined-only $< \
> @@ -396,11 +413,13 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
TC,$(RUSTC_OR_CLIPPY_QUIET)) L
>         OBJTREE=3D$(abspath $(objtree)) \
>         $(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>                 $(filter-out $(skip_flags),$(rust_flags) $(rustc_target_f=
lags)) \
> -               --emit=3Ddep-info=3D$(depfile) --emit=3Dobj=3D$@ \
> +               --emit=3Ddep-info=3D$(depfile) --emit=3D$(if $(link_helpe=
r),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) \
>                 --emit=3Dmetadata=3D$(dir $@)$(patsubst %.o,lib%.rmeta,$(=
notdir $@)) \
>                 --crate-type rlib -L$(objtree)/$(obj) \
>                 --crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>                 --sysroot=3D/dev/null \
> +       $(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/=
helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(KBUILD_CFLAGS) -mllvm=3D--ignore-tti-inline-compa=
tible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
>         $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
>
>  rust-analyzer:
> @@ -463,4 +482,11 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o=
 $(obj)/build_error.o \
>      $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
>         +$(call if_changed_dep,rustc_library)
>
> +ifdef CONFIG_RUST_LTO_HELPERS
> +
> +$(obj)/kernel.o: private link_helper =3D 1
> +$(obj)/kernel.o: $(obj)/helpers.bc
> +
> +endif
> +
>  endif # CONFIG_RUST
> diff --git a/rust/exports.c b/rust/exports.c
> index aa1218b325e5..212c1ec1d38b 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -19,7 +19,10 @@
>  #include "exports_alloc_generated.h"
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
> +
> +#ifndef CONFIG_RUST_LTO_HELPERS
>  #include "exports_helpers_generated.h"
> +#endif
>
>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 895f4b696962..3abf96f14148 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -32,18 +32,19 @@
>  #include <linux/spinlock.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
> +#include "helpers.h"
>
> -__noreturn void rust_helper_BUG(void)
> +__rust_helper __noreturn void rust_helper_BUG(void)
>  {
>         BUG();
>  }
>
> -void rust_helper_mutex_lock(struct mutex *lock)
> +__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
>  {
>         mutex_lock(lock);
>  }
>
> -void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
> +__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock, const =
char *name,
>                                   struct lock_class_key *key)
>  {
>  #ifdef CONFIG_DEBUG_SPINLOCK
> @@ -53,82 +54,82 @@ void rust_helper___spin_lock_init(spinlock_t *lock, c=
onst char *name,
>  #endif
>  }
>
> -void rust_helper_spin_lock(spinlock_t *lock)
> +__rust_helper void rust_helper_spin_lock(spinlock_t *lock)
>  {
>         spin_lock(lock);
>  }
>
> -void rust_helper_spin_unlock(spinlock_t *lock)
> +__rust_helper void rust_helper_spin_unlock(spinlock_t *lock)
>  {
>         spin_unlock(lock);
>  }
>
> -void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
> +__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_ent=
ry)
>  {
>         init_wait(wq_entry);
>  }
>
> -int rust_helper_signal_pending(struct task_struct *t)
> +__rust_helper int rust_helper_signal_pending(struct task_struct *t)
>  {
>         return signal_pending(t);
>  }
>
> -refcount_t rust_helper_REFCOUNT_INIT(int n)
> +__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
>  {
>         return (refcount_t)REFCOUNT_INIT(n);
>  }
>
> -void rust_helper_refcount_inc(refcount_t *r)
> +__rust_helper void rust_helper_refcount_inc(refcount_t *r)
>  {
>         refcount_inc(r);
>  }
>
> -bool rust_helper_refcount_dec_and_test(refcount_t *r)
> +__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
>  {
>         return refcount_dec_and_test(r);
>  }
>
> -__force void *rust_helper_ERR_PTR(long err)
> +__rust_helper __force void *rust_helper_ERR_PTR(long err)
>  {
>         return ERR_PTR(err);
>  }
>
> -bool rust_helper_IS_ERR(__force const void *ptr)
> +__rust_helper bool rust_helper_IS_ERR(__force const void *ptr)
>  {
>         return IS_ERR(ptr);
>  }
>
> -long rust_helper_PTR_ERR(__force const void *ptr)
> +__rust_helper long rust_helper_PTR_ERR(__force const void *ptr)
>  {
>         return PTR_ERR(ptr);
>  }
>
> -const char *rust_helper_errname(int err)
> +__rust_helper const char *rust_helper_errname(int err)
>  {
>         return errname(err);
>  }
>
> -struct task_struct *rust_helper_get_current(void)
> +__rust_helper struct task_struct *rust_helper_get_current(void)
>  {
>         return current;
>  }
>
> -void rust_helper_get_task_struct(struct task_struct *t)
> +__rust_helper void rust_helper_get_task_struct(struct task_struct *t)
>  {
>         get_task_struct(t);
>  }
>
> -void rust_helper_put_task_struct(struct task_struct *t)
> +__rust_helper void rust_helper_put_task_struct(struct task_struct *t)
>  {
>         put_task_struct(t);
>  }
>
> -struct kunit *rust_helper_kunit_get_current_test(void)
> +__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
>  {
>         return kunit_get_current_test();
>  }
>
> -void rust_helper_init_work_with_key(struct work_struct *work, work_func_=
t func,
> +__rust_helper void rust_helper_init_work_with_key(struct work_struct *wo=
rk, work_func_t func,
>                                     bool onstack, const char *name,
>                                     struct lock_class_key *key)
>  {
> @@ -139,7 +140,7 @@ void rust_helper_init_work_with_key(struct work_struc=
t *work, work_func_t func,
>         work->func =3D func;
>  }
>
> -void * __must_check __realloc_size(2)
> +__rust_helper void * __must_check __realloc_size(2)
>  rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
>  {
>         return krealloc(objp, new_size, flags);
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index efacca63c897..201e7dc5ae5d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -288,7 +288,10 @@ rust_common_cmd =3D \
>  # would not match each other.
>
>  quiet_cmd_rustc_o_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3Dobj=3D$@ $<
> +      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3D$(if $(CONFIG_RUST_=
LTO_HELPERS),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) $< \
> +       $(if $(CONFIG_RUST_LTO_HELPERS),;$(LLVM_LINK) $(patsubst %.o,%.bc=
,$@) $(objtree)/rust/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(KBUILD_CFLAGS) -mllvm=3D--ignore-tti-inline-compa=
tible -c $(patsubst %.o,%.m.bc,$@) -o $@)
> +
>
>  $(obj)/%.o: $(obj)/%.rs FORCE
>         +$(call if_changed_dep,rustc_o_rs)
> --
> 2.42.0
>
>

