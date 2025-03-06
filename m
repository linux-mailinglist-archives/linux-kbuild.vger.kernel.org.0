Return-Path: <linux-kbuild+bounces-5986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB46A55A68
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 00:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7333AC474
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 23:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554241FBEA6;
	Thu,  6 Mar 2025 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyjXDWmB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A68D20298E;
	Thu,  6 Mar 2025 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741302055; cv=none; b=M/ebmi+XBsrtPhdUB/8FGLiF+N2i4Xfmvn/Uthb0rxywa1veHgYbcFAm8y9MTcgu8unFHvANsBF2QKup7Mo9aNxwSVUihEMPyFPcFoqSU9sEDc6fpGMLY+M6tyLBnBLJdgrAnnWlVLJPL1qrbtkzL5XIJhMoewT4ADo3fmWeG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741302055; c=relaxed/simple;
	bh=nyOmzIIWq9tciS+3PG3WnmbHuymD9kgV1LwDrQNPNbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/kz4qDFiZgTDQcIKdNMP49dQnxmgi70k75d49FseMrHlK0MAuDWcksuKjSVrjm4canOj0+51tBTwjhq6vAjxkBacI80xdmNA8KdnIAZxdNKadI6WnE8Wq4mPEjMOb574mEGfxlUF7qX+zZejRTkEClAcDq4WKDuoh/9YhRTLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyjXDWmB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54963160818so1714096e87.2;
        Thu, 06 Mar 2025 15:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741302049; x=1741906849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S13U4EwXS1b6tNXhcAYYKW165JLKLWLd6qSOQFlZFE=;
        b=YyjXDWmB2MXmEWPIXxQDU6yhDqvEnW2dhVZjIK+7lT3PYmq0uacVwl9V409I9EgO5h
         /KztRaFgPPfP0IYWBT84lHKY462zoV09MY6+/dr0VFHufG/G3cPshtL7usNZp2UxaIXE
         n4ZhiUQ+Rz0MKO/v8Q/0EQiWKi4FUIUQ7pf46vUCJWknqvUFKUxlhJA36xJTaYIj2FGI
         OBYf/VIuE6Worm9ubRT4SBUdHlxhuWfonvDRK+iEjnFArdA6Muf2kEy8yo1WBvEPpVhM
         x/L0Gio41LTYS6ztBD3j/2dq/wMpWA9PUX8f7yFsVsutAwKHDovdmhuDRXtm6ztw2aE/
         loPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741302049; x=1741906849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S13U4EwXS1b6tNXhcAYYKW165JLKLWLd6qSOQFlZFE=;
        b=Dnp6xB3ee3/jmtNayQX4EF94qHoA3FlPLgiglNYaAy9wBZuFjdKIHuiJv9QtP9pUVf
         rne1lm/HckM8T7aZw8kJ0/426T/hquhCt8n+HjmROj53JyvgZ70F/8Ufz8HW68oEkDQQ
         j9jG+9MJSFJ3XVj85f4JtoUOvcD+WblGyVHSdEvJzrmIlqGv2z0HcxXaeb7UmISifkTR
         WRyhvgDMO/W9/eWjcOgVBiXrwtPMtepS/BVbsY4tx7cNonX99FF2BjY30R5sMAOIqcEf
         vr04n5MJUek0MUcdRrrC5mMj17Etrj2NPxTNPPIXNij0t7EnDVkC9EhYqty1ZFFLAneE
         f7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWd7MEUCvDywmEa+CdiD4ZFxkRc6ePaOvTzV1FKOzpIyZij6/hQir5V/URc/0Rj1/nMq5T5WG2LU1H3upD5@vger.kernel.org, AJvYcCX71elW2Z3kuRCGrtJKzxktfMuPt+Ngt0TpDRwSPUVAex6sbdzypTm9rF9zxGtaWSN5UTemYiL8yyh6n4xiVVk=@vger.kernel.org, AJvYcCX9Gn10MnNWJiqVq1vdAMeisC/AHypiZgzTfk0HxnyQ8G295AYRIvczXtGhh0rFHNsE/d6EZ7gwfbd4AF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDlBxoHpg+6jH9Yh2PYBtOkE6hFPFZ2seT0bD65mILgld0zNSO
	VOq/h/7HdY+hlrFzbG9prJqhwZroFo/QpHBHdBiPqyeIp+r3YstuX6fWztRNYzHtA2/yHOR7qSq
	zZzLKYREow37+JuV/hmmjcHGh9Wc=
X-Gm-Gg: ASbGnctPSkdYcOuGiyHJ4vb27NJNOGbz1WDASgsloCswuM/Yb9DrVT5Gj2g5W+mAudu
	7CtPeRHHemcmOojoF3fQjVKkmF6QzwBArc8TQuqG4y/28r1PANKg2QHSOqKwhELYoKalCnFL+lF
	+2wvX3czyuW5tispDgsy1EuUGVx7dVM3wDxidpqMVVfg==
X-Google-Smtp-Source: AGHT+IHtkB/ipRRUzuIaXzs+tqZWZnYhnHjcF3J/v5BC51FPdJXODHOyjWD2lQRYl9h/dwxvHbmqVVB96N9acj7OWys=
X-Received: by 2002:a05:6512:3c90:b0:549:54f7:e54 with SMTP id
 2adb3069b0e04-54990ec68f0mr303485e87.50.1741302047114; Thu, 06 Mar 2025
 15:00:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net> <20250105194054.545201-3-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-3-gary@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Mar 2025 18:00:10 -0500
X-Gm-Features: AQ5f1JoRePG5cqQOkduAQI6_Awnsxav8aBKWKCE-QzA8bn5VD4x_NBiXGX9e4Hc
Message-ID: <CAJ-ks9m=qYHr7Vm+9o3GBm6V=sZUY5o-aKnx5oDF9kK2F-b55A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Christian Brauner <brauner@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Matt Gilbride <mattgilbride@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Eder Zulian <ezulian@redhat.com>, 
	Filipe Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <kees@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 3:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which was created to allow Rust to call into inline/macro C functions

s/was/were/

> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing a global LTO.

superfluous article (drop the "a")

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
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into object file.

There's a mix of active ("we compile") and passive ("is patched")
voices here, and some missing articles or unclear use of singular
where plural is more appropriate (e.g. object file should be object
files).

>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Manual inspection
>   shows that they should be compatible, but since they are not exactly
>   the same LLVM seems to prefer not inlining them. This is bypassed with
>   `--ignore-tti-inline-compatible`.

Do we know why the target strings aren't the same? Are there citations
that could be included here?

> * LLVM doesn't want to inline functions combined with

s/combined/compiled/

>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this command when compiling helpers. I think this should be

s/command/flag/

>   okay since this is one of the hardening features and we shouldn't have
>   null pointer dereferences in these helpers.

Is the implication that kernel C is compiled with this flag, but Rust
code isn't? Do we know why?

> The checks can also be bypassed with force inlining (`__always_inline`)
> but the behaviour is the same with extra options.

If the behavior is the same, wouldn't it be better to use
`__always_inline`? Otherwise LLVM's behavior might change such that
inlining is lost and we won't notice.

>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  Makefile                     |  4 +++-
>  lib/Kconfig.debug            | 14 ++++++++++++++
>  rust/Makefile                | 31 +++++++++++++++++++++++++++----
>  rust/exports.c               |  5 ++++-
>  rust/helpers/blk.c           |  5 +++--
>  rust/helpers/bug.c           |  3 ++-
>  rust/helpers/build_bug.c     |  3 ++-
>  rust/helpers/cred.c          |  5 +++--
>  rust/helpers/err.c           |  7 ++++---
>  rust/helpers/fs.c            |  3 ++-
>  rust/helpers/helpers.h       | 12 ++++++++++++
>  rust/helpers/jump_label.c    |  3 ++-
>  rust/helpers/kunit.c         |  3 ++-
>  rust/helpers/mutex.c         |  7 ++++---
>  rust/helpers/page.c          |  8 +++++---
>  rust/helpers/pid_namespace.c |  7 ++++---
>  rust/helpers/rbtree.c        |  6 ++++--
>  rust/helpers/refcount.c      |  7 ++++---
>  rust/helpers/security.c      |  7 ++++---
>  rust/helpers/signal.c        |  3 ++-
>  rust/helpers/slab.c          |  5 +++--
>  rust/helpers/spinlock.c      | 11 ++++++-----
>  rust/helpers/task.c          | 23 ++++++++++++-----------
>  rust/helpers/uaccess.c       |  9 +++++----
>  rust/helpers/vmalloc.c       |  3 ++-
>  rust/helpers/wait.c          |  3 ++-
>  rust/helpers/workqueue.c     |  9 ++++++---
>  scripts/Makefile.build       |  5 ++++-
>  28 files changed, 147 insertions(+), 64 deletions(-)
>  create mode 100644 rust/helpers/helpers.h
>
> diff --git a/Makefile b/Makefile
> index e5b8a8832c0c..5fbb5e829f81 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -509,6 +509,8 @@ OBJCOPY             =3D $(LLVM_PREFIX)llvm-objcopy$(L=
LVM_SUFFIX)
>  OBJDUMP                =3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                =3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          =3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK      =3D $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS        =3D $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
> @@ -616,7 +618,7 @@ export RUSTC_BOOTSTRAP :=3D 1
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
> index f3d723705879..8a8834128f13 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3253,6 +3253,20 @@ config RUST_KERNEL_DOCTESTS
>
>           If unsure, say N.
>
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    help
> +        Links C helpers into with Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files di=
rectly,
> +        rustc is asked to produce LLVM IR, which is then linked together=
 with
> +        the LLVM IR of C helpers, before object file is generated.

s/IR/bitcode/g

Right?

> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +
>  endmenu # "Rust"
>
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index a40a3936126d..8a3d61e5a799 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -6,9 +6,14 @@ rustdoc_output :=3D $(objtree)/Documentation/output/rust=
/rustdoc
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

Should this also move up into the else branch above?

>  always-$(CONFIG_RUST) +=3D libmacros.so
> @@ -16,8 +21,7 @@ no-clean-files +=3D libmacros.so
>
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D bindings.o kernel.o
> -always-$(CONFIG_RUST) +=3D exports_helpers_generated.h \
> -    exports_bindings_generated.h exports_kernel_generated.h
> +always-$(CONFIG_RUST) +=3D exports_bindings_generated.h exports_kernel_g=
enerated.h
>
>  always-$(CONFIG_RUST) +=3D uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) +=3D uapi.o
> @@ -329,6 +333,18 @@ $(obj)/bindings/bindings_helpers_generated.rs: priva=
te bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +# When compiling helpers, filter `-fno-delete-null-pointer-checks` since=
 LLVM
> +# prevents inlining such functions to be inlined into functions compiled
> +# without the option (e.g. Rust functions).

Duplicate mention of inlining.

> +quiet_cmd_rust_helper =3D HELPER  $@
> +      cmd_rust_helper =3D \
> +       $(CC) $(filter-out -fno-delete-null-pointer-checks $(CFLAGS_REMOV=
E_helpers/helpers.o), $(c_flags)) -S $< -emit-llvm -o $(patsubst %.bc,%.ll,=
$@); \
> +       sed -i 's/^define dso_local/define linkonce_odr dso_local/g' $(pa=
tsubst %.bc,%.ll,$@); \

This isn't mentioned in the comment.

> +       $(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
> +
> +$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
> +       +$(call if_changed_dep,rust_helper)

Should all these rules be defined iff CONFIG_RUST_INLINE_HELPERS?
Always defining them seems like it could lead to subtle bugs, but
perhaps there's Makefile precedent I'm not aware of.

> +
>  quiet_cmd_exports =3D EXPORTS $@
>        cmd_exports =3D \
>         $(NM) -p --defined-only $< \
> @@ -373,11 +389,13 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
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
helpers/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -mllvm=3D--ignore-t=
ti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
>         $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
>         $(cmd_objtool)
>
> @@ -450,4 +468,9 @@ ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +$(obj)/kernel.o: private link_helper =3D 1
> +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> +endif

Can this be combined with the other `ifdef CONFIG_RUST_INLINE_HELPERS`?

> +
>  endif # CONFIG_RUST
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba..1b52460b0f4e 100644
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
> diff --git a/rust/helpers/blk.c b/rust/helpers/blk.c
> index cc9f4e6a2d23..a96e5ddf384d 100644
> --- a/rust/helpers/blk.c
> +++ b/rust/helpers/blk.c
> @@ -2,13 +2,14 @@
>
>  #include <linux/blk-mq.h>
>  #include <linux/blkdev.h>
> +#include "helpers.h"
>
> -void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
> +__rust_helper void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
>  {
>         return blk_mq_rq_to_pdu(rq);
>  }
>
> -struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
> +__rust_helper struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
>  {
>         return blk_mq_rq_from_pdu(pdu);
>  }
> diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
> index e2d13babc737..3bff5b730ca8 100644
> --- a/rust/helpers/bug.c
> +++ b/rust/helpers/bug.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/bug.h>
> +#include "helpers.h"
>
> -__noreturn void rust_helper_BUG(void)
> +__rust_helper __noreturn void rust_helper_BUG(void)
>  {
>         BUG();
>  }
> diff --git a/rust/helpers/build_bug.c b/rust/helpers/build_bug.c
> index 44e579488037..9dc273fd8db1 100644
> --- a/rust/helpers/build_bug.c
> +++ b/rust/helpers/build_bug.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/errname.h>
> +#include "helpers.h"
>
> -const char *rust_helper_errname(int err)
> +__rust_helper const char *rust_helper_errname(int err)
>  {
>         return errname(err);
>  }
> diff --git a/rust/helpers/cred.c b/rust/helpers/cred.c
> index fde7ae20cdd1..9dceeb7f8c87 100644
> --- a/rust/helpers/cred.c
> +++ b/rust/helpers/cred.c
> @@ -1,13 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/cred.h>
> +#include "helpers.h"
>
> -const struct cred *rust_helper_get_cred(const struct cred *cred)
> +__rust_helper const struct cred *rust_helper_get_cred(const struct cred =
*cred)
>  {
>         return get_cred(cred);
>  }
>
> -void rust_helper_put_cred(const struct cred *cred)
> +__rust_helper void rust_helper_put_cred(const struct cred *cred)
>  {
>         put_cred(cred);
>  }
> diff --git a/rust/helpers/err.c b/rust/helpers/err.c
> index 544c7cb86632..b05516fce504 100644
> --- a/rust/helpers/err.c
> +++ b/rust/helpers/err.c
> @@ -1,18 +1,19 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/err.h>
> +#include "helpers.h"
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
> diff --git a/rust/helpers/fs.c b/rust/helpers/fs.c
> index a75c96763372..7d44bda94203 100644
> --- a/rust/helpers/fs.c
> +++ b/rust/helpers/fs.c
> @@ -5,8 +5,9 @@
>   */
>
>  #include <linux/fs.h>
> +#include "helpers.h"
>
> -struct file *rust_helper_get_file(struct file *f)
> +__rust_helper struct file *rust_helper_get_file(struct file *f)
>  {
>         return get_file(f);
>  }
> diff --git a/rust/helpers/helpers.h b/rust/helpers/helpers.h
> new file mode 100644
> index 000000000000..9248692146f3
> --- /dev/null
> +++ b/rust/helpers/helpers.h
> @@ -0,0 +1,12 @@
> +#ifndef RUST_HELPERS_H
> +#define RUST_HELPERS_H
> +
> +#include <linux/compiler_types.h>
> +
> +#ifdef __BINDGEN__
> +#define __rust_helper
> +#else
> +#define __rust_helper inline
> +#endif

Could you mention this in the commit message? It's not obvious to me
what this does and why it depends on __BINDGEN__ rather than
CONFIG_RUST_INLINE_HELPERS.


> +#endif
> diff --git a/rust/helpers/jump_label.c b/rust/helpers/jump_label.c
> index fc1f1e0df08e..c97a66c51cce 100644
> --- a/rust/helpers/jump_label.c
> +++ b/rust/helpers/jump_label.c
> @@ -5,9 +5,10 @@
>   */
>
>  #include <linux/jump_label.h>
> +#include "helpers.h"
>
>  #ifndef CONFIG_JUMP_LABEL
> -int rust_helper_static_key_count(struct static_key *key)
> +__rust_helper int rust_helper_static_key_count(struct static_key *key)
>  {
>         return static_key_count(key);
>  }
> diff --git a/rust/helpers/kunit.c b/rust/helpers/kunit.c
> index b85a4d394c11..f3621a564626 100644
> --- a/rust/helpers/kunit.c
> +++ b/rust/helpers/kunit.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <kunit/test-bug.h>
> +#include "helpers.h"
>
> -struct kunit *rust_helper_kunit_get_current_test(void)
> +__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
>  {
>         return kunit_get_current_test();
>  }
> diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
> index 7e00680958ef..6259b5c959f6 100644
> --- a/rust/helpers/mutex.c
> +++ b/rust/helpers/mutex.c
> @@ -1,14 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/mutex.h>
> +#include "helpers.h"
>
> -void rust_helper_mutex_lock(struct mutex *lock)
> +__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
>  {
>         mutex_lock(lock);
>  }
>
> -void rust_helper___mutex_init(struct mutex *mutex, const char *name,
> -                             struct lock_class_key *key)
> +__rust_helper void rust_helper___mutex_init(struct mutex *mutex, const c=
har *name,
> +                                           struct lock_class_key *key)
>  {
>         __mutex_init(mutex, name, key);
>  }
> diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> index b3f2b8fbf87f..cf7deea25cfa 100644
> --- a/rust/helpers/page.c
> +++ b/rust/helpers/page.c
> @@ -2,18 +2,20 @@
>
>  #include <linux/gfp.h>
>  #include <linux/highmem.h>
> +#include "helpers.h"
>
> -struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
> +__rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
> +                                                  unsigned int order)
>  {
>         return alloc_pages(gfp_mask, order);
>  }
>
> -void *rust_helper_kmap_local_page(struct page *page)
> +__rust_helper void *rust_helper_kmap_local_page(struct page *page)
>  {
>         return kmap_local_page(page);
>  }
>
> -void rust_helper_kunmap_local(const void *addr)
> +__rust_helper void rust_helper_kunmap_local(const void *addr)
>  {
>         kunmap_local(addr);
>  }
> diff --git a/rust/helpers/pid_namespace.c b/rust/helpers/pid_namespace.c
> index f41482bdec9a..f066fa4e7872 100644
> --- a/rust/helpers/pid_namespace.c
> +++ b/rust/helpers/pid_namespace.c
> @@ -2,19 +2,20 @@
>
>  #include <linux/pid_namespace.h>
>  #include <linux/cleanup.h>
> +#include "helpers.h"
>
> -struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
> +__rust_helper struct pid_namespace *rust_helper_get_pid_ns(struct pid_na=
mespace *ns)
>  {
>         return get_pid_ns(ns);
>  }
>
> -void rust_helper_put_pid_ns(struct pid_namespace *ns)
> +__rust_helper void rust_helper_put_pid_ns(struct pid_namespace *ns)
>  {
>         put_pid_ns(ns);
>  }
>
>  /* Get a reference on a task's pid namespace. */
> -struct pid_namespace *rust_helper_task_get_pid_ns(struct task_struct *ta=
sk)
> +__rust_helper struct pid_namespace *rust_helper_task_get_pid_ns(struct t=
ask_struct *task)
>  {
>         struct pid_namespace *pid_ns;
>
> diff --git a/rust/helpers/rbtree.c b/rust/helpers/rbtree.c
> index 6d404b84a9b5..784d8796aa1c 100644
> --- a/rust/helpers/rbtree.c
> +++ b/rust/helpers/rbtree.c
> @@ -1,9 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/rbtree.h>
> +#include "helpers.h"
>
> -void rust_helper_rb_link_node(struct rb_node *node, struct rb_node *pare=
nt,
> -                             struct rb_node **rb_link)
> +__rust_helper void rust_helper_rb_link_node(struct rb_node *node,
> +                                           struct rb_node *parent,
> +                                           struct rb_node **rb_link)
>  {
>         rb_link_node(node, parent, rb_link);
>  }
> diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
> index d6adbd2e45a1..ad80e153bf37 100644
> --- a/rust/helpers/refcount.c
> +++ b/rust/helpers/refcount.c
> @@ -1,18 +1,19 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/refcount.h>
> +#include "helpers.h"
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
> diff --git a/rust/helpers/security.c b/rust/helpers/security.c
> index 239e5b4745fe..b0c14e1b3aff 100644
> --- a/rust/helpers/security.c
> +++ b/rust/helpers/security.c
> @@ -1,19 +1,20 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/security.h>
> +#include "helpers.h"
>
>  #ifndef CONFIG_SECURITY
> -void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid=
)
> +__rust_helper void rust_helper_security_cred_getsecid(const struct cred =
*c, u32 *secid)
>  {
>         security_cred_getsecid(c, secid);
>  }
>
> -int rust_helper_security_secid_to_secctx(u32 secid, char **secdata, u32 =
*seclen)
> +__rust_helper int rust_helper_security_secid_to_secctx(u32 secid, char *=
*secdata, u32 *seclen)
>  {
>         return security_secid_to_secctx(secid, secdata, seclen);
>  }
>
> -void rust_helper_security_release_secctx(char *secdata, u32 seclen)
> +__rust_helper void rust_helper_security_release_secctx(char *secdata, u3=
2 seclen)
>  {
>         security_release_secctx(secdata, seclen);
>  }
> diff --git a/rust/helpers/signal.c b/rust/helpers/signal.c
> index 1a6bbe9438e2..67d3fe8d5132 100644
> --- a/rust/helpers/signal.c
> +++ b/rust/helpers/signal.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/sched/signal.h>
> +#include "helpers.h"
>
> -int rust_helper_signal_pending(struct task_struct *t)
> +__rust_helper int rust_helper_signal_pending(struct task_struct *t)
>  {
>         return signal_pending(t);
>  }
> diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> index a842bfbddcba..f8776884b729 100644
> --- a/rust/helpers/slab.c
> +++ b/rust/helpers/slab.c
> @@ -1,14 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/slab.h>
> +#include "helpers.h"
>
> -void * __must_check __realloc_size(2)
> +__rust_helper void *__must_check __realloc_size(2)
>  rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
>  {
>         return krealloc(objp, new_size, flags);
>  }
>
> -void * __must_check __realloc_size(2)
> +__rust_helper void * __must_check __realloc_size(2)
>  rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
>  {
>         return kvrealloc(p, size, flags);
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index 5971fdf6f755..567161c19a16 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -1,9 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/spinlock.h>
> +#include "helpers.h"
>
> -void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
> -                                 struct lock_class_key *key)
> +__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock, const =
char *name,
> +                                               struct lock_class_key *ke=
y)
>  {
>  #ifdef CONFIG_DEBUG_SPINLOCK
>  # if defined(CONFIG_PREEMPT_RT)
> @@ -16,17 +17,17 @@ void rust_helper___spin_lock_init(spinlock_t *lock, c=
onst char *name,
>  #endif /* CONFIG_DEBUG_SPINLOCK */
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
> -int rust_helper_spin_trylock(spinlock_t *lock)
> +__rust_helper int rust_helper_spin_trylock(spinlock_t *lock)
>  {
>         return spin_trylock(lock);
>  }
> diff --git a/rust/helpers/task.c b/rust/helpers/task.c
> index 31c33ea2dce6..741e1a4b15ee 100644
> --- a/rust/helpers/task.c
> +++ b/rust/helpers/task.c
> @@ -1,56 +1,57 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/sched/task.h>
> +#include "helpers.h"
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
> -kuid_t rust_helper_task_uid(struct task_struct *task)
> +__rust_helper kuid_t rust_helper_task_uid(struct task_struct *task)
>  {
>         return task_uid(task);
>  }
>
> -kuid_t rust_helper_task_euid(struct task_struct *task)
> +__rust_helper kuid_t rust_helper_task_euid(struct task_struct *task)
>  {
>         return task_euid(task);
>  }
>
>  #ifndef CONFIG_USER_NS
> -uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
> +__rust_helper uid_t rust_helper_from_kuid(struct user_namespace *to, kui=
d_t uid)
>  {
>         return from_kuid(to, uid);
>  }
>  #endif /* CONFIG_USER_NS */
>
> -bool rust_helper_uid_eq(kuid_t left, kuid_t right)
> +__rust_helper bool rust_helper_uid_eq(kuid_t left, kuid_t right)
>  {
>         return uid_eq(left, right);
>  }
>
> -kuid_t rust_helper_current_euid(void)
> +__rust_helper kuid_t rust_helper_current_euid(void)
>  {
>         return current_euid();
>  }
>
> -struct user_namespace *rust_helper_current_user_ns(void)
> +__rust_helper struct user_namespace *rust_helper_current_user_ns(void)
>  {
>         return current_user_ns();
>  }
>
> -pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
> -                                 struct pid_namespace *ns)
> +__rust_helper pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
> +                                               struct pid_namespace *ns)
>  {
>         return task_tgid_nr_ns(tsk, ns);
>  }
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index f49076f813cd..08bf1851c06a 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -1,15 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/uaccess.h>
> +#include "helpers.h"
>
> -unsigned long rust_helper_copy_from_user(void *to, const void __user *fr=
om,
> -                                        unsigned long n)
> +__rust_helper unsigned long
> +rust_helper_copy_from_user(void *to, const void __user *from, unsigned l=
ong n)
>  {
>         return copy_from_user(to, from, n);
>  }
>
> -unsigned long rust_helper_copy_to_user(void __user *to, const void *from=
,
> -                                      unsigned long n)
> +__rust_helper unsigned long
> +rust_helper_copy_to_user(void __user *to, const void *from, unsigned lon=
g n)
>  {
>         return copy_to_user(to, from, n);
>  }
> diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
> index 80d34501bbc0..6d258baa4c9a 100644
> --- a/rust/helpers/vmalloc.c
> +++ b/rust/helpers/vmalloc.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/vmalloc.h>
> +#include "helpers.h"
>
> -void * __must_check __realloc_size(2)
> +__rust_helper void * __must_check __realloc_size(2)
>  rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
>  {
>         return vrealloc(p, size, flags);
> diff --git a/rust/helpers/wait.c b/rust/helpers/wait.c
> index ae48e33d9da3..7beaa85494bc 100644
> --- a/rust/helpers/wait.c
> +++ b/rust/helpers/wait.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/wait.h>
> +#include "helpers.h"
>
> -void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
> +__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_ent=
ry)
>  {
>         init_wait(wq_entry);
>  }
> diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> index b2b82753509b..4256f8c91ce6 100644
> --- a/rust/helpers/workqueue.c
> +++ b/rust/helpers/workqueue.c
> @@ -1,10 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/workqueue.h>
> +#include "helpers.h"
>
> -void rust_helper_init_work_with_key(struct work_struct *work, work_func_=
t func,
> -                                   bool onstack, const char *name,
> -                                   struct lock_class_key *key)
> +__rust_helper void rust_helper_init_work_with_key(struct work_struct *wo=
rk,
> +                                                 work_func_t func,
> +                                                 bool onstack,
> +                                                 const char *name,
> +                                                 struct lock_class_key *=
key)
>  {
>         __init_work(work, onstack);
>         work->data =3D (atomic_long_t)WORK_DATA_INIT();
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index c16e4cf54d77..77c204449d1b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -239,7 +239,10 @@ rust_common_cmd =3D \
>  # would not match each other.
>
>  quiet_cmd_rustc_o_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3Dobj=3D$@ $< $(cmd_o=
bjtool)
> +      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3D$(if $(CONFIG_RUST_=
INLINE_HELPERS),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) $< \
> +       $(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) $(patsubst %.o,%=
.bc,$@) $(objtree)/rust/helpers/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -mllvm=3D--ignore-t=
ti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
> +       $(cmd_objtool)
>
>  define rule_rustc_o_rs
>         $(call cmd_and_fixdep,rustc_o_rs)
> --
> 2.47.0
>

Very cool!
Tamir

