Return-Path: <linux-kbuild+bounces-6251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4EA69AB2
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 22:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F993A2C52
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 21:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CD320FA98;
	Wed, 19 Mar 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OflW2n7Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8019259E;
	Wed, 19 Mar 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419001; cv=none; b=qYL7AGDo64Sw3CxMtdRdwe8Y7oNI/Jyc0mRb14KpqyHD510MrksDbgBSB5deXjj4fXPBjqfqiW9NjpANeB8HgQD8365X5dBZvJQwEYIVNyFMPTPUZYLsg4TksuGQpU1DZ7CBD61q/lzC1me4FP2M5cE6R/EdOlJ/8J4bKJTiKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419001; c=relaxed/simple;
	bh=/wYQoh2+RlTKQ+nE71rnt2iImBML87PywcEH1PXLGgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l60dkEVrQ022iB9DvZKOlpIuLgb9acfm3qXk6j0wc00Ve7Jq8p0XmObbYk8LugSP/uY1Gn0ZTBhamUkagdHJFxJ30b8Dx1SdNKXV04XEHnzXk79CKz/DNGHGeKN5wtq93RoSPhHlHBuX8Fq4guMlXsxvmdAP9wVfKm6xdlymdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OflW2n7Y; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf8632052so1610661fa.0;
        Wed, 19 Mar 2025 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418996; x=1743023796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdSdoX2FSgwC0BdaVZ20RyC/ANH2LWuta0c+41uug0w=;
        b=OflW2n7YCbBjnGQp6xV+9q8lAavF7jQaSsj8VQzL37yuWThreX+8G02WVBNN2lxqHf
         nupexIvRi92zet77p/Tt1fgMOoLZFAsE5ijSrVKipKj0e950ovzui2QSqoKsrzNNlg8r
         vJb+gUPPaGGUN9DYM57QNw4F+niuC3Ai4BQl27uvzvi9JmX70ZoD5Uo5uU4iMqhC08et
         1DCzIdi6NvJ29PsHM0wBfFHcfRSmHf02b/QKkxUIbTE3fg9rOhmD5ZwjmC+deUDx+tPf
         g/swkNfxyPSHPK92YMx7HuBiqphLZcZamJ9RsOOXdDxgW3XSVH8sndny2qmAuvWv7FrH
         TT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418996; x=1743023796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdSdoX2FSgwC0BdaVZ20RyC/ANH2LWuta0c+41uug0w=;
        b=YHxFH+KiHIHZ1B7q7GTxjYDWVPs3Zsv0v1kIUSpQ8AoFVw1n+Cb9R8c9SUAdVy/NVe
         fr+ILDNEWgHONSoZ0bKugupULPrwBzyWaAh7hsO+ibxbg50C7unPglW47XAY2m6YjTym
         7DPXqBrlHSeka7elzKZN7EYAhwAsUw37UkaUXJd/VpXIc53XzvV5/PsstN9XKz9I5txt
         H3CBBWvyBYUMYSQTqBvI3LWV3ZaMs/yPt7SExgYUlKudY2rcibDHTmgPE86vzFbiu89j
         fcuhDMCx+F5sQDL4M7ihxpYVaA03AdwcfoKmBi+h5Gn3tC+YjhpvJxQhGHL8ncd1Qg/3
         kykw==
X-Forwarded-Encrypted: i=1; AJvYcCWMaaykNcvNCHVOjb6GNQBUdTz06YjOqOiBlZzh3+4Wg6FCRkPJwAomd+uQ2OcCbVTq8BIFaY2qtT707lxe@vger.kernel.org, AJvYcCWOkMm6Eul7qPFgBDDCB4W81Xk2iJYzXbZ/yM2n1GtY1C/Fd6c6FT7TarJhFITPMF/Myc1wqhD6SFihq1rW4gk=@vger.kernel.org, AJvYcCX8aJlJDbmIVadZUkbvCMFfInICdfTU5+3FlhqvUEuhaq33d/VOI2KJNn1/Nm7ztgtAiwow9AtzZI7vlBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlziAOBPKoCegVYEWTBr8Jo3Xm7P5C+TQCClRR1yfTEG5dYIzC
	iJu6GdcGkbjRgf0woJXxm+LHcjv1N92yNFqZbvm4S5e9I+2O8Z62vGhBDOleRJfFholjxmVCHZ7
	KKDi9vi6MGy+rG63UAIidxv6ZRwo=
X-Gm-Gg: ASbGncvvsPeItMD4ChkV56Q9ZVMZBAcIdLpQ46z733AU/sU9Yse9QQROU2CMzeZLmTT
	5yj/8Ii/QEnX5GNuzoKkQPl94KeoUOvd4hOPpotH50hogiqg1yVoESwdUDZXweqAtBjywpnP0iz
	0Vr1vjXsfjD0wEf2VjFyYYGChUJknyBOYhEVy1307Glw==
X-Google-Smtp-Source: AGHT+IHmOJCmqLWz4nlDJvCD94HIf803k+9JufoXFmZ11jBWHL1Wc4Jiq0ZzcTsM6jJp4eKLlsL5seRD1vqxHWniiMA=
X-Received: by 2002:a2e:bc0e:0:b0:30b:b184:a904 with SMTP id
 38308e7fff4ca-30d72a5da8dmr3885721fa.4.1742418995061; Wed, 19 Mar 2025
 14:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
In-Reply-To: <20250319205141.3528424-3-gary@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 19 Mar 2025 17:15:58 -0400
X-Gm-Features: AQ5f1JqW2wqYsnjXYr4WjcrGyRKEztIYdwA6AkLvRhgU6bSmNAdCSASH35hDKiw
Message-ID: <CAJ-ks9mF5YtfNEULY2Y_D0AzMW1Wi6WMFrrWd+sMnY2-0js1pg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 4:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which were created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that functions are inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file

either "object files" or "an object file"

>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or

the subject of this clause is "the symbols generated", which is
plural, but here you use "it", which is singular.

"it will may" is also not correct; the word "will" looks misplaced.

>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).

s/have/having/

> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.

nit: s/but this is much/but is much/

> * clang is invoked to turn the combined bitcode into a final object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Clang generates

s/doesn't/don't/ (because "clang and Rust" is plural)

>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=3D+cmov,+cx8,+fxsr` is used). x86-64 alwa=
ys

is the fact that rustc complains a bug?

>   enable these features, so they are in fact the same target string, but

s/enable/enables/

>   LLVM doesn't understand this and so inlining is inhibited. This is bypa=
ssed
>   with `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this flag when compiling helpers. This is okay since this is one=
 of
>   the hardening features that does not change the ABI, and we shouldn't h=
ave
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`),
> but doing so would also bypass inlining cost analysis.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  Makefile                     |  4 +++-
>  lib/Kconfig.debug            | 14 ++++++++++++
>  rust/Makefile                | 34 ++++++++++++++++++++++++++----
>  rust/exports.c               |  5 ++++-
>  rust/helpers/blk.c           |  5 +++--
>  rust/helpers/bug.c           |  3 ++-
>  rust/helpers/build_bug.c     |  3 ++-
>  rust/helpers/cred.c          |  5 +++--
>  rust/helpers/device.c        |  6 +++---
>  rust/helpers/err.c           |  7 +++---
>  rust/helpers/fs.c            |  3 ++-
>  rust/helpers/helpers.h       | 13 ++++++++++++
>  rust/helpers/io.c            | 41 ++++++++++++++++++++----------------
>  rust/helpers/jump_label.c    |  3 ++-
>  rust/helpers/kunit.c         |  3 ++-
>  rust/helpers/mutex.c         | 10 +++++----
>  rust/helpers/page.c          |  8 ++++---
>  rust/helpers/pci.c           |  8 ++++---
>  rust/helpers/pid_namespace.c |  9 +++++---
>  rust/helpers/platform.c      |  7 ++++--
>  rust/helpers/rbtree.c        |  6 ++++--
>  rust/helpers/rcu.c           |  5 +++--
>  rust/helpers/refcount.c      |  7 +++---
>  rust/helpers/security.c      |  9 +++++---
>  rust/helpers/signal.c        |  3 ++-
>  rust/helpers/slab.c          |  9 ++++----
>  rust/helpers/spinlock.c      | 14 ++++++------
>  rust/helpers/task.c          | 23 ++++++++++----------
>  rust/helpers/uaccess.c       |  9 ++++----
>  rust/helpers/vmalloc.c       |  5 +++--
>  rust/helpers/wait.c          |  3 ++-
>  rust/helpers/workqueue.c     |  9 +++++---
>  scripts/Makefile.build       |  5 ++++-
>  33 files changed, 201 insertions(+), 97 deletions(-)
>  create mode 100644 rust/helpers/helpers.h
>
> diff --git a/Makefile b/Makefile
> index 70bdbf2218fc..97756ecd5a56 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -510,6 +510,8 @@ OBJCOPY             =3D $(LLVM_PREFIX)llvm-objcopy$(L=
LVM_SUFFIX)
>  OBJDUMP                =3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                =3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          =3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK      =3D $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS        =3D $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
> @@ -617,7 +619,7 @@ export RUSTC_BOOTSTRAP :=3D 1
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
> index 1af972a92d06..42e26f3377d1 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3289,6 +3289,20 @@ config RUST_KERNEL_DOCTESTS
>
>           If unsure, say N.
>
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    help
> +        Links C helpers into Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files di=
rectly,
> +        rustc is asked to produce LLVM IR, which is then linked together=
 with
> +        the LLVM IR of C helpers, before object file is generated.

from previous review: should this say bitcode instead of IR?

"before object file is" should be "before object files are" since you
used plural in the prior clause.

> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +
>  endmenu # "Rust"
>
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index e761a8cc3bd5..07fc4f5d0e36 100644
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
> @@ -360,6 +364,21 @@ $(obj)/bindings/bindings_helpers_generated.rs: priva=
te bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +# When compiling helpers, filter `-fno-delete-null-pointer-checks` since=
 LLVM
> +# prevents inlining such functions into functions compiled without the o=
ption
> +# (e.g. Rust functions).
> +#
> +# `linkonce_odr` is added to make functions inlineable and allow LLVM to
> +# omit unreferenced functions.
> +quiet_cmd_rust_helper =3D HELPER  $@
> +      cmd_rust_helper =3D \
> +       $(CC) $(filter-out -fno-delete-null-pointer-checks $(CFLAGS_REMOV=
E_helpers/helpers.o), $(c_flags)) -S $< -emit-llvm -o $(patsubst %.bc,%.ll,=
$@); \
> +       sed -i 's/^define dso_local/define linkonce_odr dso_local/g' $(pa=
tsubst %.bc,%.ll,$@); \
> +       $(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
> +
> +$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
> +       +$(call if_changed_dep,rust_helper)

from prior review: should all these rules be defined iff
CONFIG_RUST_INLINE_HELPERS? Always defining them seems like it could
lead to subtle bugs, but perhaps there's Makefile precedent I'm not
aware of.

> +
>  rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__cfi/ && $$3!~/__odr_asan/ { printf $(2),$$3 }'
>
>  quiet_cmd_exports =3D EXPORTS $@
> @@ -409,11 +428,13 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
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
> @@ -522,4 +543,9 @@ ifdef CONFIG_JUMP_LABEL
>  $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
>  endif
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +$(obj)/kernel.o: private link_helper =3D 1
> +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> +endif

From prior review: can this be combined with the other `ifdef
CONFIG_RUST_INLINE_HELPERS`?


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
> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
> index b2135c6686b0..b9432cb2f085 100644
> --- a/rust/helpers/device.c
> +++ b/rust/helpers/device.c
> @@ -2,9 +2,9 @@
>
>  #include <linux/device.h>
>
> -int rust_helper_devm_add_action(struct device *dev,
> -                               void (*action)(void *),
> -                               void *data)
> +__rust_helper int rust_helper_devm_add_action(struct device *dev,
> +                                             void (*action)(void *),
> +                                             void *data)
>  {
>         return devm_add_action(dev, action, data);
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
> index 000000000000..d6ee9bf6f5ae
> --- /dev/null
> +++ b/rust/helpers/helpers.h
> @@ -0,0 +1,13 @@
> +#ifndef RUST_HELPERS_H
> +#define RUST_HELPERS_H
> +
> +#include <linux/compiler_types.h>
> +
> +#ifdef __BINDGEN__
> +// Omit `inline` for bindgen as it ignores inline functions.
> +#define __rust_helper
> +#else
> +#define __rust_helper inline
> +#endif
> +
> +#endif
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 4c2401ccd720..f61cf77cf9cd 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -1,100 +1,105 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/io.h>
> +#include "helpers.h"
>
> -void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
> +__rust_helper void __iomem *rust_helper_ioremap(phys_addr_t offset, size=
_t size)
>  {
>         return ioremap(offset, size);
>  }
>
> -void rust_helper_iounmap(volatile void __iomem *addr)
> +__rust_helper void rust_helper_iounmap(volatile void __iomem *addr)
>  {
>         iounmap(addr);
>  }
>
> -u8 rust_helper_readb(const volatile void __iomem *addr)
> +__rust_helper u8 rust_helper_readb(const volatile void __iomem *addr)
>  {
>         return readb(addr);
>  }
>
> -u16 rust_helper_readw(const volatile void __iomem *addr)
> +__rust_helper u16 rust_helper_readw(const volatile void __iomem *addr)
>  {
>         return readw(addr);
>  }
>
> -u32 rust_helper_readl(const volatile void __iomem *addr)
> +__rust_helper u32 rust_helper_readl(const volatile void __iomem *addr)
>  {
>         return readl(addr);
>  }
>
>  #ifdef CONFIG_64BIT
> -u64 rust_helper_readq(const volatile void __iomem *addr)
> +__rust_helper u64 rust_helper_readq(const volatile void __iomem *addr)
>  {
>         return readq(addr);
>  }
>  #endif
>
> -void rust_helper_writeb(u8 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writeb(u8 value, volatile void __iomem *a=
ddr)
>  {
>         writeb(value, addr);
>  }
>
> -void rust_helper_writew(u16 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writew(u16 value, volatile void __iomem *=
addr)
>  {
>         writew(value, addr);
>  }
>
> -void rust_helper_writel(u32 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writel(u32 value, volatile void __iomem *=
addr)
>  {
>         writel(value, addr);
>  }
>
>  #ifdef CONFIG_64BIT
> -void rust_helper_writeq(u64 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writeq(u64 value, volatile void __iomem *=
addr)
>  {
>         writeq(value, addr);
>  }
>  #endif
>
> -u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
> +__rust_helper u8 rust_helper_readb_relaxed(const volatile void __iomem *=
addr)
>  {
>         return readb_relaxed(addr);
>  }
>
> -u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
> +__rust_helper u16 rust_helper_readw_relaxed(const volatile void __iomem =
*addr)
>  {
>         return readw_relaxed(addr);
>  }
>
> -u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
> +__rust_helper u32 rust_helper_readl_relaxed(const volatile void __iomem =
*addr)
>  {
>         return readl_relaxed(addr);
>  }
>
>  #ifdef CONFIG_64BIT
> -u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
> +__rust_helper u64 rust_helper_readq_relaxed(const volatile void __iomem =
*addr)
>  {
>         return readq_relaxed(addr);
>  }
>  #endif
>
> -void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writeb_relaxed(u8 value,
> +                                             volatile void __iomem *addr=
)
>  {
>         writeb_relaxed(value, addr);
>  }
>
> -void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writew_relaxed(u16 value,
> +                                             volatile void __iomem *addr=
)
>  {
>         writew_relaxed(value, addr);
>  }
>
> -void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writel_relaxed(u32 value,
> +                                             volatile void __iomem *addr=
)
>  {
>         writel_relaxed(value, addr);
>  }
>
>  #ifdef CONFIG_64BIT
> -void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
> +__rust_helper void rust_helper_writeq_relaxed(u64 value,
> +                                             volatile void __iomem *addr=
)
>  {
>         writeq_relaxed(value, addr);
>  }
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
> index 06575553eda5..8900cd504cb2 100644
> --- a/rust/helpers/mutex.c
> +++ b/rust/helpers/mutex.c
> @@ -1,19 +1,21 @@
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
> +__rust_helper void rust_helper___mutex_init(struct mutex *mutex,
> +                                           const char *name,
> +                                           struct lock_class_key *key)
>  {
>         __mutex_init(mutex, name, key);
>  }
>
> -void rust_helper_mutex_assert_is_held(struct mutex *mutex)
> +__rust_helper void rust_helper_mutex_assert_is_held(struct mutex *mutex)
>  {
>         lockdep_assert_held(mutex);
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
> diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
> index 8ba22f911459..5b1066028d7d 100644
> --- a/rust/helpers/pci.c
> +++ b/rust/helpers/pci.c
> @@ -1,18 +1,20 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/pci.h>
> +#include "helpers.h"
>
> -void rust_helper_pci_set_drvdata(struct pci_dev *pdev, void *data)
> +__rust_helper void rust_helper_pci_set_drvdata(struct pci_dev *pdev, voi=
d *data)
>  {
>         pci_set_drvdata(pdev, data);
>  }
>
> -void *rust_helper_pci_get_drvdata(struct pci_dev *pdev)
> +__rust_helper void *rust_helper_pci_get_drvdata(struct pci_dev *pdev)
>  {
>         return pci_get_drvdata(pdev);
>  }
>
> -resource_size_t rust_helper_pci_resource_len(struct pci_dev *pdev, int b=
ar)
> +__rust_helper resource_size_t rust_helper_pci_resource_len(struct pci_de=
v *pdev,
> +                                                          int bar)
>  {
>         return pci_resource_len(pdev, bar);
>  }
> diff --git a/rust/helpers/pid_namespace.c b/rust/helpers/pid_namespace.c
> index f41482bdec9a..f4419c3ff5bb 100644
> --- a/rust/helpers/pid_namespace.c
> +++ b/rust/helpers/pid_namespace.c
> @@ -2,19 +2,22 @@
>
>  #include <linux/pid_namespace.h>
>  #include <linux/cleanup.h>
> +#include "helpers.h"
>
> -struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
> +__rust_helper struct pid_namespace *
> +rust_helper_get_pid_ns(struct pid_namespace *ns)
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
> +__rust_helper struct pid_namespace *
> +rust_helper_task_get_pid_ns(struct task_struct *task)
>  {
>         struct pid_namespace *pid_ns;
>
> diff --git a/rust/helpers/platform.c b/rust/helpers/platform.c
> index ab9b9f317301..052b2a09f1a9 100644
> --- a/rust/helpers/platform.c
> +++ b/rust/helpers/platform.c
> @@ -1,13 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/platform_device.h>
> +#include "helpers.h"
>
> -void *rust_helper_platform_get_drvdata(const struct platform_device *pde=
v)
> +__rust_helper void *
> +rust_helper_platform_get_drvdata(const struct platform_device *pdev)
>  {
>         return platform_get_drvdata(pdev);
>  }
>
> -void rust_helper_platform_set_drvdata(struct platform_device *pdev, void=
 *data)
> +__rust_helper void
> +rust_helper_platform_set_drvdata(struct platform_device *pdev, void *dat=
a)
>  {
>         platform_set_drvdata(pdev, data);
>  }
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
> diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
> index f1cec6583513..0bd98ab32300 100644
> --- a/rust/helpers/rcu.c
> +++ b/rust/helpers/rcu.c
> @@ -1,13 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/rcupdate.h>
> +#include "helpers.h"
>
> -void rust_helper_rcu_read_lock(void)
> +__rust_helper void rust_helper_rcu_read_lock(void)
>  {
>         rcu_read_lock();
>  }
>
> -void rust_helper_rcu_read_unlock(void)
> +__rust_helper void rust_helper_rcu_read_unlock(void)
>  {
>         rcu_read_unlock();
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
> index 0c4c2065df28..676c82a4a6eb 100644
> --- a/rust/helpers/security.c
> +++ b/rust/helpers/security.c
> @@ -1,19 +1,22 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/security.h>
> +#include "helpers.h"
>
>  #ifndef CONFIG_SECURITY
> -void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid=
)
> +__rust_helper void rust_helper_security_cred_getsecid(const struct cred =
*c,
> +                                                     u32 *secid)
>  {
>         security_cred_getsecid(c, secid);
>  }
>
> -int rust_helper_security_secid_to_secctx(u32 secid, struct lsm_context *=
cp)
> +__rust_helper int rust_helper_security_secid_to_secctx(u32 secid,
> +                                                      struct lsm_context=
 *cp)
>  {
>         return security_secid_to_secctx(secid, cp);
>  }
>
> -void rust_helper_security_release_secctx(struct lsm_context *cp)
> +__rust_helper void rust_helper_security_release_secctx(struct lsm_contex=
t *cp)
>  {
>         security_release_secctx(cp);
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
> index a842bfbddcba..71dd3fc88d53 100644
> --- a/rust/helpers/slab.c
> +++ b/rust/helpers/slab.c
> @@ -1,15 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/slab.h>
> +#include "helpers.h"
>
> -void * __must_check __realloc_size(2)
> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> +__rust_helper void *__must_check __realloc_size(2)
> +       rust_helper_krealloc(const void *objp, size_t new_size, gfp_t fla=
gs)
>  {
>         return krealloc(objp, new_size, flags);
>  }
>
> -void * __must_check __realloc_size(2)
> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
> +__rust_helper void *__must_check __realloc_size(2)
> +       rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
>  {
>         return kvrealloc(p, size, flags);
>  }
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index 42c4bf01a23e..023ef3a24913 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -1,9 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/spinlock.h>
> +#include "helpers.h"
>
> -void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
> -                                 struct lock_class_key *key)
> +__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock,
> +                                               const char *name,
> +                                               struct lock_class_key *ke=
y)
>  {
>  #ifdef CONFIG_DEBUG_SPINLOCK
>  # if defined(CONFIG_PREEMPT_RT)
> @@ -16,22 +18,22 @@ void rust_helper___spin_lock_init(spinlock_t *lock, c=
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
>
> -void rust_helper_spin_assert_is_held(spinlock_t *lock)
> +__rust_helper void rust_helper_spin_assert_is_held(spinlock_t *lock)
>  {
>         lockdep_assert_held(lock);
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
> index 80d34501bbc0..6ef908bd45f9 100644
> --- a/rust/helpers/vmalloc.c
> +++ b/rust/helpers/vmalloc.c
> @@ -1,9 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/vmalloc.h>
> +#include "helpers.h"
>
> -void * __must_check __realloc_size(2)
> -rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
> +__rust_helper void *__must_check __realloc_size(2)
> +       rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
>  {
>         return vrealloc(p, size, flags);
>  }
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
> index 08b6380933f5..f7bccb22328b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -252,7 +252,10 @@ rust_common_cmd =3D \
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

Similar question here: should this be defined iff
CONFIG_RUST_INLINE_HELPERS? Always defining them seems like it could
lead to subtle bugs, but perhaps there's Makefile precedent I'm not
aware of.

>
>  define rule_rustc_o_rs
>         $(call cmd_and_fixdep,rustc_o_rs)
> --
> 2.47.2
>

