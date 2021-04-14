Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1979235FE57
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 01:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbhDNXUD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 19:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbhDNXUD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 19:20:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22464C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 16:19:41 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x20so5699619lfu.6
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 16:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xeRp/tVmaLEy8CocM6xUvxYGhddannCfe9t1GLRLDSI=;
        b=Efu15895FylY95wn8rRJP9uJdAew5ApTrpyVvWbn/ub995PUQ6H7Cqn8ZTg5TCVb/y
         IkISY152PDDlKvz0nFwpdqPVfDyuzRhogxMYAJB301+vTQZO+fLIGTqwG4SGUpQ+1ZDq
         f5KnUujagBLy4wmJb1E6LEp6vBxs3Lf0EF0MJfzUOVq+/HkbQSc51BAaO8CwDcRVkJkt
         1+7Y89WEHFRouhh7sHfMEsduXMNz4au1csCXvy1tyYSe/jAN76Oc1XEDpUWZXwS+pXkl
         FGt6Bw85RYr47/R0q9E9FSIAPg1gkx2fRpySbewSRqORy4U0G+Tt+SaVh84nTMGIM84x
         4Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xeRp/tVmaLEy8CocM6xUvxYGhddannCfe9t1GLRLDSI=;
        b=HZ7pj43NbXUhu1sa9wJo01oG+Nz4/8Cvdt67DnOIz9d8rIRnrOVLMnevdqeRfdXjiH
         yNqv+WRFZSjXstFWQpnNnkJCcM5D2+baiQ9QUicf1gS9dLgKDGGrNIU8l50s6yk4OgtL
         SrOIuVxJbIcUr1wN1w72p2WZR9QnF+OBH4CJzYt4uC/Amt5HpEkrzrywwXLAJtLPhPW5
         RpnwQmR5+bpcTuXZiIvNe7pKPtwbvOZ9yrK4cjEsjjISLzkyujxN92EHtUxw+labIWgr
         rtOWentX694fhfe4r1dM4r8zPKYSDb/OS5liSHiWNZJmJAFnlfyCC5P+B3PxTzwwsaay
         3KDw==
X-Gm-Message-State: AOAM533lllIoOVBUIe7OT3LUtfgHVPt1j2B93+IB4G+9Pq33txuqb+EL
        6WS/EkM8jlbi7VYVPQjbm0sEFvAxAjlextyNImnp6w==
X-Google-Smtp-Source: ABdhPJyzgENai+0RegRDXCz/85XQ0cPnVMVvLlnpzrks/8yiKXiETsgmMzklD8Tv3S82VMJbjx3o4v51zNWZRrDkcsQ=
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr386479lfb.297.1618442378881;
 Wed, 14 Apr 2021 16:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-5-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 16:19:26 -0700
Message-ID: <CAKwvOdkjttdX83tL4pw+J5EnHM1MgEYDPp=YTpEagV4RrhdxwA@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:48 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> This commit includes also the `Kconfig` entries related to Rust,
> the Rust configuration printer, the target definition files,
> the version detection script and a few other bits.
>
> In the future, we will likely want to generate the target files
> on the fly via a script.
>
> With this in place, we will be adding the rest of the bits piece
> by piece and enabling their builds.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  .gitignore                        |   2 +
>  .rustfmt.toml                     |  12 +++
>  Documentation/kbuild/kbuild.rst   |   4 +
>  Documentation/process/changes.rst |   9 ++
>  Makefile                          | 120 +++++++++++++++++++++++--
>  arch/arm64/rust/target.json       |  40 +++++++++
>  arch/powerpc/rust/target.json     |  30 +++++++
>  arch/x86/rust/target.json         |  42 +++++++++
>  init/Kconfig                      |  27 ++++++
>  lib/Kconfig.debug                 | 100 +++++++++++++++++++++
>  rust/.gitignore                   |   5 ++
>  rust/Makefile                     | 141 ++++++++++++++++++++++++++++++
>  scripts/Makefile.build            |  19 ++++
>  scripts/Makefile.lib              |  12 +++
>  scripts/kconfig/confdata.c        |  67 +++++++++++++-
>  scripts/rust-version.sh           |  31 +++++++
>  16 files changed, 654 insertions(+), 7 deletions(-)
>  create mode 100644 .rustfmt.toml
>  create mode 100644 arch/arm64/rust/target.json
>  create mode 100644 arch/powerpc/rust/target.json
>  create mode 100644 arch/x86/rust/target.json
>  create mode 100644 rust/.gitignore
>  create mode 100644 rust/Makefile
>  create mode 100755 scripts/rust-version.sh
>
> diff --git a/.gitignore b/.gitignore
> index 3af66272d6f1..6ba4f516f46c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -37,6 +37,7 @@
>  *.o
>  *.o.*
>  *.patch
> +*.rmeta
>  *.s
>  *.so
>  *.so.dbg
> @@ -96,6 +97,7 @@ modules.order
>  !.gitattributes
>  !.gitignore
>  !.mailmap
> +!.rustfmt.toml
>
>  #
>  # Generated include files
> diff --git a/.rustfmt.toml b/.rustfmt.toml
> new file mode 100644
> index 000000000000..5893c0e3cbde
> --- /dev/null
> +++ b/.rustfmt.toml
> @@ -0,0 +1,12 @@
> +edition = "2018"
> +format_code_in_doc_comments = true
> +newline_style = "Unix"
> +
> +# Unstable options that help catching some mistakes in formatting and that we may want to enable
> +# when they become stable.
> +#
> +# They are kept here since they are useful to run from time to time.
> +#reorder_impl_items = true
> +#comment_width = 100
> +#wrap_comments = true
> +#normalize_comments = true
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 2d1fc03d346e..1109d18d9377 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -57,6 +57,10 @@ CFLAGS_MODULE
>  -------------
>  Additional module specific options to use for $(CC).
>
> +KRUSTCFLAGS
> +-----------
> +Additional options to the Rust compiler (for built-in and modules).
> +
>  LDFLAGS_MODULE
>  --------------
>  Additional options used for $(LD) when linking modules.
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index dac17711dc11..4b6ba5458706 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -31,6 +31,8 @@ you probably needn't concern yourself with pcmciautils.
>  ====================== ===============  ========================================
>  GNU C                  4.9              gcc --version
>  Clang/LLVM (optional)  10.0.1           clang --version
> +rustc (optional)       nightly          rustc --version
> +bindgen (optional)     0.56.0           bindgen --version
>  GNU make               3.81             make --version
>  binutils               2.23             ld -v
>  flex                   2.5.35           flex --version
> @@ -56,6 +58,7 @@ iptables               1.4.2            iptables -V
>  openssl & libcrypto    1.0.0            openssl version
>  bc                     1.06.95          bc --version
>  Sphinx\ [#f1]_        1.3              sphinx-build --version
> +rustdoc (optional)     nightly          rustdoc --version
>  ====================== ===============  ========================================
>
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
> @@ -330,6 +333,12 @@ Sphinx
>  Please see :ref:`sphinx_install` in :ref:`Documentation/doc-guide/sphinx.rst <sphinxdoc>`
>  for details about Sphinx requirements.
>
> +rustdoc
> +-------
> +
> +``rustdoc`` is used to generate Rust documentation. Please see
> +:ref:`Documentation/rust/docs.rst <rust_docs>` for more information.
> +
>  Getting updated software
>  ========================
>
> diff --git a/Makefile b/Makefile
> index 9c75354324ed..62b3bba38635 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -120,6 +120,13 @@ endif
>
>  export KBUILD_CHECKSRC
>
> +# Enable "clippy" (a linter) as part of the Rust compilation.
> +#
> +# Use 'make CLIPPY=1' to enable it.
> +ifeq ("$(origin CLIPPY)", "command line")
> +  KBUILD_CLIPPY := $(CLIPPY)
> +endif

Rather than check the origin (yikes, are we intentionally avoiding env
vars?), can this simply be
ifneq ($(CLIPPY),)
  KBUILD_CLIPPY := $(CLIPPY)
endif

Then you can specify whatever value you want, support command line or
env vars, etc.?

> +
>  # Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
>  # directory of external module to build. Setting M= takes precedence.
>  ifeq ("$(origin M)", "command line")
> @@ -263,7 +270,7 @@ no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
>                          %asm-generic kernelversion %src-pkg dt_binding_check \
> -                        outputmakefile
> +                        outputmakefile rustfmt rustfmtcheck
>  no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
>                           image_name
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> @@ -444,6 +451,10 @@ OBJDUMP            = $(CROSS_COMPILE)objdump
>  READELF                = $(CROSS_COMPILE)readelf
>  STRIP          = $(CROSS_COMPILE)strip
>  endif
> +RUSTC          = rustc
> +RUSTFMT                = rustfmt
> +CLIPPY_DRIVER  = clippy-driver
> +BINDGEN                = bindgen
>  PAHOLE         = pahole
>  RESOLVE_BTFIDS = $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
>  LEX            = flex
> @@ -467,9 +478,11 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
>  NOSTDINC_FLAGS :=
>  CFLAGS_MODULE   =
> +RUSTCFLAGS_MODULE =
>  AFLAGS_MODULE   =
>  LDFLAGS_MODULE  =
>  CFLAGS_KERNEL  =
> +RUSTCFLAGS_KERNEL =
>  AFLAGS_KERNEL  =
>  LDFLAGS_vmlinux =
>
> @@ -498,15 +511,30 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>                    -Werror=return-type -Wno-format-security \
>                    -std=gnu89
>  KBUILD_CPPFLAGS := -D__KERNEL__
> +KBUILD_RUSTCFLAGS := --emit=dep-info,obj,metadata --edition=2018 \
> +                    -Cpanic=abort -Cembed-bitcode=n -Clto=n -Crpath=n \
> +                    -Cforce-unwind-tables=n -Ccodegen-units=1 \
> +                    -Zbinary_dep_depinfo=y -Zsymbol-mangling-version=v0
>  KBUILD_AFLAGS_KERNEL :=
>  KBUILD_CFLAGS_KERNEL :=
> +KBUILD_RUSTCFLAGS_KERNEL :=
>  KBUILD_AFLAGS_MODULE  := -DMODULE
>  KBUILD_CFLAGS_MODULE  := -DMODULE
> +KBUILD_RUSTCFLAGS_MODULE := --cfg MODULE
>  KBUILD_LDFLAGS_MODULE :=
>  KBUILD_LDFLAGS :=
>  CLANG_FLAGS :=
>
> -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> +ifeq ($(KBUILD_CLIPPY),1)
> +       RUSTC_OR_CLIPPY_QUIET := CLIPPY
> +       RUSTC_OR_CLIPPY = $(CLIPPY_DRIVER)
> +else
> +       RUSTC_OR_CLIPPY_QUIET := RUSTC
> +       RUSTC_OR_CLIPPY = $(RUSTC)
> +endif
> +export RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY
> +
> +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC RUSTC BINDGEN
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> @@ -514,9 +542,10 @@ export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> +export KBUILD_RUSTCFLAGS RUSTCFLAGS_KERNEL RUSTCFLAGS_MODULE
>  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
> -export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
> -export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
> +export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_RUSTCFLAGS_MODULE KBUILD_LDFLAGS_MODULE
> +export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTCFLAGS_KERNEL
>
>  # Files to ignore in find ... statements
>
> @@ -712,7 +741,7 @@ $(KCONFIG_CONFIG):
>  quiet_cmd_syncconfig = SYNC    $@
>        cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
>
> -%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
> +%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
>         +$(call cmd,syncconfig)
>  else # !may-sync-config
>  # External modules and some install targets need include/generated/autoconf.h
> @@ -738,12 +767,43 @@ KBUILD_CFLAGS     += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, address-of-packed-member)
>
> +ifdef CONFIG_RUST_DEBUG_ASSERTIONS
> +KBUILD_RUSTCFLAGS += -Cdebug-assertions=y
> +else
> +KBUILD_RUSTCFLAGS += -Cdebug-assertions=n
> +endif
> +
> +ifdef CONFIG_RUST_OVERFLOW_CHECKS
> +KBUILD_RUSTCFLAGS += -Coverflow-checks=y
> +else
> +KBUILD_RUSTCFLAGS += -Coverflow-checks=n
> +endif
> +
>  ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
>  KBUILD_CFLAGS += -O2
> +KBUILD_RUSTCFLAGS_OPT_LEVEL_MAP := 2
>  else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
>  KBUILD_CFLAGS += -O3
> +KBUILD_RUSTCFLAGS_OPT_LEVEL_MAP := 3
>  else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
>  KBUILD_CFLAGS += -Os
> +KBUILD_RUSTCFLAGS_OPT_LEVEL_MAP := z

-Oz in clang typically generates larger kernel code than -Os; LLVM
seems to aggressively emit libcalls even when the setup for a call
would be larger than the inlined call itself.  Is z smaller than s for
the existing rust examples?

> +endif
> +
> +ifdef CONFIG_RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +KBUILD_RUSTCFLAGS += -Copt-level=$(KBUILD_RUSTCFLAGS_OPT_LEVEL_MAP)
> +else ifdef CONFIG_RUST_OPT_LEVEL_0
> +KBUILD_RUSTCFLAGS += -Copt-level=0
> +else ifdef CONFIG_RUST_OPT_LEVEL_1
> +KBUILD_RUSTCFLAGS += -Copt-level=1
> +else ifdef CONFIG_RUST_OPT_LEVEL_2
> +KBUILD_RUSTCFLAGS += -Copt-level=2
> +else ifdef CONFIG_RUST_OPT_LEVEL_3
> +KBUILD_RUSTCFLAGS += -Copt-level=3
> +else ifdef CONFIG_RUST_OPT_LEVEL_S
> +KBUILD_RUSTCFLAGS += -Copt-level=s
> +else ifdef CONFIG_RUST_OPT_LEVEL_Z
> +KBUILD_RUSTCFLAGS += -Copt-level=z

This is a mess; who thought it would be a good idea to support
compiling the rust code at a different optimization level than the
rest of the C code in the kernel?  Do we really need that flexibility
for Rust kernel code, or can we drop this feature?

>  endif
>
>  # Tell gcc to never replace conditional load with a non-conditional one
> @@ -793,6 +853,7 @@ endif
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  ifdef CONFIG_FRAME_POINTER
>  KBUILD_CFLAGS  += -fno-omit-frame-pointer -fno-optimize-sibling-calls
> +KBUILD_RUSTCFLAGS += -Cforce-frame-pointers=y

Don't the target.json files all set `"eliminate-frame-pointer":
false,`?  Is this necessary then?  Also, which targets retain frame
pointers at which optimization levels is quite messy (in C compilers),
as well as your choice of unwinder, which is configurable for certain
architectures.

>  else
>  # Some targets (ARM with Thumb2, for example), can't be built with frame
>  # pointers.  For those, we don't have FUNCTION_TRACER automatically
> @@ -826,6 +887,8 @@ ifdef CONFIG_CC_IS_GCC
>  DEBUG_CFLAGS   += $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
>  endif
>
> +DEBUG_RUSTCFLAGS :=
> +
>  ifdef CONFIG_DEBUG_INFO
>
>  ifdef CONFIG_DEBUG_INFO_SPLIT
> @@ -836,6 +899,11 @@ endif
>
>  ifneq ($(LLVM_IAS),1)
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +ifdef CONFIG_DEBUG_INFO_REDUCED
> +DEBUG_RUSTCFLAGS += -Cdebuginfo=1
> +else
> +DEBUG_RUSTCFLAGS += -Cdebuginfo=2
> +endif
>  endif

This should not be in the `ifneq ($(LLVM_IAS),1)` block, otherwise if
I set `LLVM_IAS=1` when invoking `make` then these wont get set.

>
>  ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> @@ -860,6 +928,9 @@ endif # CONFIG_DEBUG_INFO
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>  export DEBUG_CFLAGS
>
> +KBUILD_RUSTCFLAGS += $(DEBUG_RUSTCFLAGS)
> +export DEBUG_RUSTCFLAGS
> +
>  ifdef CONFIG_FUNCTION_TRACER
>  ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>    CC_FLAGS_FTRACE      += -mrecord-mcount
> @@ -990,10 +1061,11 @@ include $(addprefix $(srctree)/, $(include-y))
>  # Do not add $(call cc-option,...) below this line. When you build the kernel
>  # from the clean source tree, the GCC plugins do not exist at this point.
>
> -# Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
> +# Add user supplied CPPFLAGS, AFLAGS, CFLAGS and RUSTCFLAGS as the last assignments
>  KBUILD_CPPFLAGS += $(KCPPFLAGS)
>  KBUILD_AFLAGS   += $(KAFLAGS)
>  KBUILD_CFLAGS   += $(KCFLAGS)
> +KBUILD_RUSTCFLAGS += $(KRUSTCFLAGS)

I can't help but read that as Krusty-flags. :P Are ya' ready kids?

>
>  KBUILD_LDFLAGS_MODULE += --build-id=sha1
>  LDFLAGS_vmlinux += --build-id=sha1
> @@ -1138,6 +1210,10 @@ export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
>  ifeq ($(KBUILD_EXTMOD),)
>  core-y         += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
>
> +ifdef CONFIG_RUST
> +core-y         += rust/
> +endif
> +
>  vmlinux-dirs   := $(patsubst %/,%,$(filter %/, \
>                      $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
>                      $(libs-y) $(libs-m)))
> @@ -1238,6 +1314,9 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
>  prepare0: archprepare
>         $(Q)$(MAKE) $(build)=scripts/mod
>         $(Q)$(MAKE) $(build)=.
> +ifdef CONFIG_RUST
> +       $(Q)$(MAKE) $(build)=rust
> +endif
>
>  # All the preparing..
>  prepare: prepare0 prepare-objtool prepare-resolve_btfids
> @@ -1648,6 +1727,13 @@ help:
>         @echo  '  kselftest-merge   - Merge all the config dependencies of'
>         @echo  '                      kselftest to existing .config.'
>         @echo  ''
> +       @echo  'Rust targets:'
> +       @echo  '  rustfmt         - Reformat all the Rust code in the kernel'

Seems like a good way for drive by commits where someone reformatted
the whole kernel.

> +       @echo  '  rustfmtcheck    - Checks if all the Rust code in the kernel'
> +       @echo  '                    is formatted, printing a diff otherwise.'

Might be nice to invoke this somehow from checkpatch.pl somehow for
changes to rust source files. Not necessary in the RFC, but perhaps
one day.

> +       @echo  '  rustdoc         - Generate Rust documentation'
> +       @echo  '                    (requires kernel .config)'
> +       @echo  ''
>         @$(if $(dtstree), \
>                 echo 'Devicetree:'; \
>                 echo '* dtbs             - Build device tree blobs for enabled boards'; \
> @@ -1719,6 +1805,27 @@ PHONY += $(DOC_TARGETS)
>  $(DOC_TARGETS):
>         $(Q)$(MAKE) $(build)=Documentation $@
>
> +
> +# Rust targets
> +# ---------------------------------------------------------------------------
> +
> +# Documentation target
> +#
> +# Using the singular to avoid running afoul of `no-dot-config-targets`.
> +PHONY += rustdoc
> +rustdoc: prepare0
> +       $(Q)$(MAKE) $(build)=rust $@
> +
> +# Formatting targets
> +PHONY += rustfmt rustfmtcheck
> +
> +rustfmt:
> +       find -name '*.rs' | xargs $(RUSTFMT)
> +
> +rustfmtcheck:
> +       find -name '*.rs' | xargs $(RUSTFMT) --check
> +
> +
>  # Misc
>  # ---------------------------------------------------------------------------
>
> @@ -1866,6 +1973,7 @@ clean: $(clean-dirs)
>         $(call cmd,rmfiles)
>         @find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
>                 \( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
> +               -o -name '*.rmeta' \
>                 -o -name '*.ko.*' \
>                 -o -name '*.dtb' -o -name '*.dtbo' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
>                 -o -name '*.dwo' -o -name '*.lst' \
> diff --git a/arch/arm64/rust/target.json b/arch/arm64/rust/target.json
> new file mode 100644
> index 000000000000..44953e2725c4
> --- /dev/null
> +++ b/arch/arm64/rust/target.json
> @@ -0,0 +1,40 @@
> +{
> +  "arch": "aarch64",
> +  "data-layout": "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128",
> +  "disable-redzone": true,
> +  "eliminate-frame-pointer": false,
> +  "emit-debug-gdb-scripts": false,
> +  "env": "gnu",
> +  "features": "+strict-align,+neon,+fp-armv8",
> +  "function-sections": false,

^ Depends on your config. This is implied by LTO, and IIRC
CONFIG_LD_DEAD_CODE_ELIMINATION does set this.

> +  "is-builtin": true,
> +  "linker-flavor": "gcc",
> +  "linker-is-gnu": true,

Is there more documentation on these values? For example, is LLD a GNU
linker?  I would think not, but perhaps the flag could have been named
better and this is a non-issue.

> +  "llvm-target": "aarch64-unknown-none",

What happens if you use aarch64-linux-gnu, like Clang does?

> +  "max-atomic-width": 128,
> +  "needs-plt": true,

^ do we?

> +  "os": "none",
> +  "panic-strategy": "abort",

^ alternatives?

> +  "position-independent-executables": true,
> +  "pre-link-args": {
> +    "gcc": [

^ gcc?

> +      "-Wl,--as-needed",
> +      "-Wl,-z,noexecstack",
> +      "-m64"

Is -m64 necessary?

> +    ]
> +  },
> +  "relocation-model": "static",
> +  "relro-level": "full",
> +  "stack-probes": {
> +    "kind": "inline-or-call",
> +    "min-llvm-version-for-inline": [
> +      11,
> +      0,
> +      1
> +    ]
> +  },
> +  "target-c-int-width": "32",
> +  "target-endian": "little",

The kernel supports both.  Does that mean there would be two different
aarch64 target.json files, each per endianness?  Maybe not critical
for initial support, but something to be aware of.

> +  "target-pointer-width": "64",
> +  "vendor": ""
> +}
> diff --git a/arch/powerpc/rust/target.json b/arch/powerpc/rust/target.json
> new file mode 100644
> index 000000000000..1e53f8308092
> --- /dev/null
> +++ b/arch/powerpc/rust/target.json
> @@ -0,0 +1,30 @@
> +{
> +  "arch": "powerpc64",
> +  "code-mode": "kernel",
> +  "cpu": "ppc64le",
> +  "data-layout": "e-m:e-i64:64-n32:64",

Seems like this target doesn't set "eliminate-frame-pointer." I think
it should one way or another to be explicit?

> +  "env": "gnu",
> +  "features": "-altivec,-vsx,-hard-float",
> +  "function-sections": false,
> +  "is-builtin": true,
> +  "linker-flavor": "gcc",
> +  "linker-is-gnu": true,
> +  "llvm-target": "powerpc64le-elf",
> +  "max-atomic-width": 64,
> +  "os": "none",
> +  "panic-strategy": "abort",
> +  "position-independent-executables": true,
> +  "pre-link-args": {
> +    "gcc": [
> +      "-Wl,--as-needed",
> +      "-Wl,-z,noexecstack",
> +      "-m64"
> +    ]
> +  },
> +  "relocation-model": "static",
> +  "relro-level": "full",
> +  "target-family": "unix",
> +  "target-mcount": "_mcount",
> +  "target-endian": "little",
> +  "target-pointer-width": "64"
> +}
> diff --git a/arch/x86/rust/target.json b/arch/x86/rust/target.json
> new file mode 100644
> index 000000000000..6e1759cd45bf
> --- /dev/null
> +++ b/arch/x86/rust/target.json
> @@ -0,0 +1,42 @@
> +{
> +  "arch": "x86_64",
> +  "code-model": "kernel",
> +  "cpu": "x86-64",
> +  "data-layout": "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128",
> +  "disable-redzone": true,
> +  "eliminate-frame-pointer": false,
> +  "emit-debug-gdb-scripts": false,
> +  "env": "gnu",
> +  "features": "-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-3dnow,-3dnowa,-avx,-avx2,+soft-float",
> +  "function-sections": false,
> +  "is-builtin": true,
> +  "linker-flavor": "gcc",
> +  "linker-is-gnu": true,
> +  "llvm-target": "x86_64-elf",
> +  "max-atomic-width": 64,
> +  "needs-plt": true,
> +  "os": "none",
> +  "panic-strategy": "abort",
> +  "position-independent-executables": true,
> +  "pre-link-args": {
> +    "gcc": [
> +      "-Wl,--as-needed",
> +      "-Wl,-z,noexecstack",
> +      "-m64"
> +    ]
> +  },
> +  "relocation-model": "static",
> +  "relro-level": "full",
> +  "stack-probes": {
> +    "kind": "inline-or-call",
> +    "min-llvm-version-for-inline": [
> +      11,
> +      0,
> +      1
> +    ]
> +  },
> +  "target-c-int-width": "32",
> +  "target-endian": "little",
> +  "target-pointer-width": "64",
> +  "vendor": "unknown"
> +}
> diff --git a/init/Kconfig b/init/Kconfig
> index 5f5c776ef192..11475840c29c 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -57,6 +57,15 @@ config LLD_VERSION
>         default $(ld-version) if LD_IS_LLD
>         default 0
>
> +config HAS_RUST
> +       depends on ARM64 || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64
> +       def_bool $(success,$(RUSTC) --version)
> +
> +config RUSTC_VERSION
> +       depends on HAS_RUST
> +       int
> +       default $(shell,$(srctree)/scripts/rust-version.sh $(RUSTC))
> +
>  config CC_CAN_LINK
>         bool
>         default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> @@ -2027,6 +2036,24 @@ config PROFILING
>           Say Y here to enable the extended profiling support mechanisms used
>           by profilers.
>
> +config RUST
> +       bool "Rust support"
> +       depends on HAS_RUST
> +       depends on !COMPILE_TEST
> +       default n
> +       help
> +         Enables Rust support in the kernel.
> +
> +         This allows other Rust-related options, like drivers written in Rust,
> +         to be selected.
> +
> +         It is also required to be able to load external kernel modules
> +         written in Rust.
> +
> +         See Documentation/rust/ for more information.
> +
> +         If unsure, say N.
> +
>  #
>  # Place an empty function call at each tracepoint site. Can be
>  # dynamically changed for a probe function.
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 2779c29d9981..acf4993baddc 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2537,6 +2537,106 @@ config HYPERV_TESTING
>
>  endmenu # "Kernel Testing and Coverage"
>
> +menu "Rust hacking"
> +
> +config RUST_DEBUG_ASSERTIONS
> +       bool "Debug assertions"
> +       default n
> +       depends on RUST
> +       help
> +         Enables rustc's `-Cdebug-assertions` codegen option.
> +
> +         This flag lets you turn `cfg(debug_assertions)` conditional
> +         compilation on or off. This can be used to enable extra debugging
> +         code in development but not in production. For example, it controls
> +         the behavior of the standard library's `debug_assert!` macro.
> +
> +         Note that this will apply to all Rust code, including `core`.
> +
> +         If unsure, say N.
> +
> +config RUST_OVERFLOW_CHECKS
> +       bool "Overflow checks"
> +       default y
> +       depends on RUST
> +       help
> +         Enables rustc's `-Coverflow-checks` codegen option.
> +
> +         This flag allows you to control the behavior of runtime integer
> +         overflow. When overflow-checks are enabled, a panic will occur
> +         on overflow.
> +
> +         Note that this will apply to all Rust code, including `core`.
> +
> +         If unsure, say Y.
> +
> +choice
> +       prompt "Optimization level"
> +       default RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +       depends on RUST
> +       help
> +         Controls rustc's `-Copt-level` codegen option.
> +
> +         This flag controls the optimization level.
> +
> +         If unsure, say "Similar as chosen for C".

Yuck. This should be default on and not configurable.

> +
> +config RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +       bool "Similar as chosen for C"
> +       help
> +         This choice will pick a similar optimization level as chosen in
> +         the "Compiler optimization level" for C:
> +
> +             -O2 is currently mapped to -Copt-level=2
> +             -O3 is currently mapped to -Copt-level=3
> +             -Os is currently mapped to -Copt-level=z
> +
> +         The mapping may change over time to follow the intended semantics
> +         of the choice for C as sensibly as possible.
> +
> +         This is the default.
> +
> +config RUST_OPT_LEVEL_0
> +       bool "No optimizations (-Copt-level=0)"
> +       help
> +         Not recommended for most purposes. It may come in handy for debugging
> +         suspected optimizer bugs, unexpected undefined behavior, etc.
> +
> +         Note that this level will *not* enable debug assertions nor overflow
> +         checks on its own (like it happens when interacting with rustc
> +         directly). Use the corresponding configuration options to control
> +         that instead, orthogonally.
> +
> +config RUST_OPT_LEVEL_1
> +       bool "Basic optimizations (-Copt-level=1)"
> +       help
> +         Useful for debugging without getting too lost, but without
> +         the overhead and boilerplate of no optimizations at all.
> +
> +config RUST_OPT_LEVEL_2
> +       bool "Some optimizations (-Copt-level=2)"
> +       help
> +         The sensible choice in most cases.
> +
> +config RUST_OPT_LEVEL_3
> +       bool "All optimizations (-Copt-level=3)"
> +       help
> +         Yet more performance (hopefully).
> +
> +config RUST_OPT_LEVEL_S
> +       bool "Optimize for size (-Copt-level=s)"
> +       help
> +         Smaller kernel, ideally without too much performance loss.
> +
> +config RUST_OPT_LEVEL_Z
> +       bool "Optimize for size, no loop vectorization (-Copt-level=z)"
> +       help
> +         Like the previous level, but also turn off loop vectorization.
> +
> +endchoice
> +
> +endmenu # "Rust"
> +
>  source "Documentation/Kconfig"
>
>  endmenu # Kernel hacking
> diff --git a/rust/.gitignore b/rust/.gitignore
> new file mode 100644
> index 000000000000..8875e08ed0b1
> --- /dev/null
> +++ b/rust/.gitignore
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +bindings_generated.rs
> +exports_*_generated.h
> +doc/
> \ No newline at end of file
> diff --git a/rust/Makefile b/rust/Makefile
> new file mode 100644
> index 000000000000..ba4b13e4fc7f
> --- /dev/null
> +++ b/rust/Makefile
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +RUSTDOC = rustdoc
> +
> +quiet_cmd_rustdoc = RUSTDOC $<
> +      cmd_rustdoc = \
> +       RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
> +       $(RUSTDOC) $(filter-out --emit=%, $(rustc_flags)) \
> +               $(rustdoc_target_flags) -L $(objtree)/rust/ \
> +               --output $(objtree)/rust/doc --crate-name $(subst rustdoc-,,$@) \
> +               -Fmissing-docs @$(objtree)/include/generated/rustc_cfg $<
> +
> +rustdoc: rustdoc-module rustdoc-compiler_builtins rustdoc-kernel
> +
> +rustdoc-module: private rustdoc_target_flags = --crate-type proc-macro \
> +    --extern proc_macro
> +rustdoc-module: $(srctree)/rust/module.rs FORCE
> +       $(call if_changed,rustdoc)
> +
> +rustdoc-compiler_builtins: $(srctree)/rust/compiler_builtins.rs FORCE
> +       $(call if_changed,rustdoc)
> +
> +rustdoc-kernel: private rustdoc_target_flags = --extern alloc \
> +    --extern module=$(objtree)/rust/libmodule.so
> +rustdoc-kernel: $(srctree)/rust/kernel/lib.rs rustdoc-module \
> +    $(objtree)/rust/libmodule.so $(objtree)/rust/bindings_generated.rs FORCE
> +       $(call if_changed,rustdoc)
> +
> +ifdef CONFIG_CC_IS_CLANG
> +bindgen_c_flags = $(c_flags)
> +else
> +# bindgen relies on libclang to parse C. Ideally, bindgen would support a GCC
> +# plugin backend and/or the Clang driver would be perfectly compatible with GCC.
> +#
> +# For the moment, here we are tweaking the flags on the fly. Some config
> +# options may not work (e.g. `GCC_PLUGIN_RANDSTRUCT` if we end up using one
> +# of those structs). We might want to redo how Clang flags are kept track of
> +# in the general `Makefile` even for GCC builds, similar to what we did with
> +# `TENTATIVE_CLANG_FLAGS`.
> +bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
> +       -mskip-rax-setup -mgeneral-regs-only -msign-return-address=% \
> +       -mindirect-branch=thunk-extern -mindirect-branch-register -mrecord-mcount \
> +       -mabi=lp64 -mstack-protector-guard% -fconserve-stack -falign-jumps=% \
> +       -falign-loops=% -fno-ipa-cp-clone -fno-partial-inlining \
> +       -fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
> +       -Wno-packed-not-aligned -Wno-format-truncation -Wno-format-overflow \
> +       -Wno-stringop-truncation -Wno-unused-but-set-variable \
> +       -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized \
> +       -Werror=designated-init -Wno-zero-length-bounds \
> +       --param=% --param asan-%
> +
> +# PowerPC
> +bindgen_skip_c_flags += -mtraceback=no -mno-pointers-to-nested-functions \
> +       -mno-string -mno-strict-align
> +
> +bindgen_extra_c_flags = $(TENTATIVE_CLANG_FLAGS) -Wno-address-of-packed-member
> +bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
> +       $(bindgen_extra_c_flags)
> +endif
> +
> +bindgen_opaque_types := xregs_state desc_struct arch_lbr_state
> +
> +# To avoid several recompilations in PowerPC, which inserts `-D_TASK_CPU`
> +bindgen_c_flags_final = $(filter-out -D_TASK_CPU=%, $(bindgen_c_flags))
> +
> +quiet_cmd_bindgen = BINDGEN $@
> +      cmd_bindgen = \
> +       $(BINDGEN) $< $(addprefix --opaque-type , $(bindgen_opaque_types)) \
> +               --use-core --with-derive-default --ctypes-prefix c_types \
> +               --size_t-is-usize -o $@ -- $(bindgen_c_flags_final) -DMODULE
> +
> +$(objtree)/rust/bindings_generated.rs: $(srctree)/rust/kernel/bindings_helper.h FORCE
> +       $(call if_changed_dep,bindgen)
> +
> +quiet_cmd_exports = EXPORTS $@
> +      cmd_exports = \
> +       $(NM) -p --defined-only $< \
> +               | grep -E ' (T|R|D) ' | cut -d ' ' -f 3 | grep -E '^(__rust_|_R)' \
> +               | xargs -Isymbol \
> +               echo 'EXPORT_SYMBOL_RUST_GPL(symbol);' > $@
> +
> +$(objtree)/rust/exports_core_generated.h: $(objtree)/rust/core.o FORCE
> +       $(call if_changed,exports)
> +
> +$(objtree)/rust/exports_alloc_generated.h: $(objtree)/rust/alloc.o FORCE
> +       $(call if_changed,exports)
> +
> +$(objtree)/rust/exports_kernel_generated.h: $(objtree)/rust/kernel.o FORCE
> +       $(call if_changed,exports)
> +
> +# `-Cpanic=unwind -Cforce-unwind-tables=y` overrides `rustc_flags` in order to
> +# avoid the https://github.com/rust-lang/rust/issues/82320 rustc crash.
> +quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
> +      cmd_rustc_procmacro = \
> +       $(RUSTC_OR_CLIPPY) $(rustc_flags) \
> +               --emit=dep-info,link --extern proc_macro \
> +               -Cpanic=unwind -Cforce-unwind-tables=y \
> +               --crate-type proc-macro --out-dir $(objtree)/rust/ \
> +               --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<; \
> +       mv $(objtree)/rust/$(patsubst lib%.so,%,$(notdir $@)).d $(depfile); \
> +       sed -i '/^\#/d' $(depfile)
> +
> +$(objtree)/rust/libmodule.so: $(srctree)/rust/module.rs FORCE
> +       $(call if_changed_dep,rustc_procmacro)
> +
> +quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
> +      cmd_rustc_library = \
> +       RUST_BINDINGS_FILE=$(abspath $(objtree)/rust/bindings_generated.rs) \
> +       $(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
> +               $(rustc_flags) $(rustc_cross_flags) $(rustc_target_flags) \
> +               --crate-type rlib --out-dir $(objtree)/rust/ -L $(objtree)/rust/ \
> +               --crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
> +       mv $(objtree)/rust/$(patsubst %.o,%,$(notdir $@)).d $(depfile); \
> +       sed -i '/^\#/d' $(depfile) \
> +       $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
> +
> +# `$(rustc_flags)` is passed in case the user added `--sysroot`.
> +rustc_sysroot = $(shell $(RUSTC) $(rustc_flags) --print sysroot)
> +rustc_src = $(rustc_sysroot)/lib/rustlib/src/rust
> +
> +.SECONDEXPANSION:
> +$(objtree)/rust/core.o: private skip_clippy = 1
> +$(objtree)/rust/core.o: $$(rustc_src)/library/core/src/lib.rs FORCE
> +       $(call if_changed_dep,rustc_library)
> +
> +$(objtree)/rust/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
> +$(objtree)/rust/compiler_builtins.o: $(srctree)/rust/compiler_builtins.rs \
> +    $(objtree)/rust/core.o FORCE
> +       $(call if_changed_dep,rustc_library)
> +
> +$(objtree)/rust/alloc.o: private skip_clippy = 1
> +$(objtree)/rust/alloc.o: $$(rustc_src)/library/alloc/src/lib.rs \
> +    $(objtree)/rust/compiler_builtins.o FORCE
> +       $(call if_changed_dep,rustc_library)
> +
> +# ICE on `--extern module`: https://github.com/rust-lang/rust/issues/56935
> +$(objtree)/rust/kernel.o: private rustc_target_flags = --extern alloc \
> +    --extern module=$(objtree)/rust/libmodule.so
> +$(objtree)/rust/kernel.o: $(srctree)/rust/kernel/lib.rs $(objtree)/rust/alloc.o \
> +    $(objtree)/rust/libmodule.so $(objtree)/rust/bindings_generated.rs FORCE
> +       $(call if_changed_dep,rustc_library)
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 1b6094a13034..3665c49c4dcf 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -26,6 +26,7 @@ EXTRA_CPPFLAGS :=
>  EXTRA_LDFLAGS  :=
>  asflags-y  :=
>  ccflags-y  :=
> +rustcflags-y :=
>  cppflags-y :=
>  ldflags-y  :=
>
> @@ -287,6 +288,24 @@ quiet_cmd_cc_lst_c = MKLST   $@
>  $(obj)/%.lst: $(src)/%.c FORCE
>         $(call if_changed_dep,cc_lst_c)
>
> +# Compile Rust sources (.rs)
> +# ---------------------------------------------------------------------------
> +
> +rustc_cross_flags := --target=$(srctree)/arch/$(SRCARCH)/rust/target.json
> +
> +quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> +      cmd_rustc_o_rs = \
> +       RUST_MODFILE=$(modfile) \
> +       $(RUSTC_OR_CLIPPY) $(rustc_flags) $(rustc_cross_flags) \
> +               --extern alloc --extern kernel \
> +               --crate-type rlib --out-dir $(obj) -L $(objtree)/rust/ \
> +               --crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
> +       mv $(obj)/$(subst .o,,$(notdir $@)).d $(depfile); \
> +       sed -i '/^\#/d' $(depfile)
> +
> +$(obj)/%.o: $(src)/%.rs FORCE
> +       $(call if_changed_dep,rustc_o_rs)
> +
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 8cd67b1b6d15..bd6cb3562fb4 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -8,6 +8,7 @@ ldflags-y  += $(EXTRA_LDFLAGS)
>  # flags that take effect in current and sub directories
>  KBUILD_AFLAGS += $(subdir-asflags-y)
>  KBUILD_CFLAGS += $(subdir-ccflags-y)
> +KBUILD_RUSTCFLAGS += $(subdir-rustcflags-y)
>
>  # Figure out what we need to build from the various variables
>  # ===========================================================================
> @@ -122,6 +123,10 @@ _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), \
>                       $(filter-out $(ccflags-remove-y), \
>                           $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(ccflags-y)) \
>                       $(CFLAGS_$(target-stem).o))
> +_rustc_flags    = $(filter-out $(RUSTCFLAGS_REMOVE_$(target-stem).o), \
> +                     $(filter-out $(rustcflags-remove-y), \
> +                         $(KBUILD_RUSTCFLAGS) $(rustcflags-y)) \
> +                     $(RUSTCFLAGS_$(target-stem).o))
>  _a_flags       = $(filter-out $(AFLAGS_REMOVE_$(target-stem).o), \
>                       $(filter-out $(asflags-remove-y), \
>                           $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(asflags-y)) \
> @@ -191,6 +196,11 @@ modkern_cflags =                                          \
>                 $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
>                 $(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL) $(modfile_flags))
>
> +modkern_rustcflags =                                              \
> +       $(if $(part-of-module),                                   \
> +               $(KBUILD_RUSTCFLAGS_MODULE) $(RUSTCFLAGS_MODULE), \
> +               $(KBUILD_RUSTCFLAGS_KERNEL) $(RUSTCFLAGS_KERNEL))
> +
>  modkern_aflags = $(if $(part-of-module),                               \
>                         $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),       \
>                         $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> @@ -200,6 +210,8 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>                  $(_c_flags) $(modkern_cflags)                           \
>                  $(basename_flags) $(modname_flags)
>
> +rustc_flags     = $(_rustc_flags) $(modkern_rustcflags) @$(objtree)/include/generated/rustc_cfg
> +
>  a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>                  $(_a_flags) $(modkern_aflags)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 2568dbe16ed6..a83d646ecef5 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -637,6 +637,56 @@ static struct conf_printer kconfig_printer_cb =
>         .print_comment = kconfig_print_comment,
>  };
>
> +/*
> + * rustc cfg printer
> + *
> + * This printer is used when generating the resulting rustc configuration
> + * after kconfig invocation and `defconfig` files.
> + */
> +static void rustc_cfg_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
> +{
> +       const char *str;
> +
> +       switch (sym->type) {
> +       case S_INT:
> +       case S_HEX:
> +       case S_BOOLEAN:
> +       case S_TRISTATE:
> +               str = sym_escape_string_value(value);
> +
> +               /*
> +                * We don't care about disabled ones, i.e. no need for
> +                * what otherwise are "comments" in other printers.
> +                */
> +               if (*value == 'n')
> +                       return;
> +
> +               /*
> +                * To have similar functionality to the C macro `IS_ENABLED()`
> +                * we provide an empty `--cfg CONFIG_X` here in both `y`
> +                * and `m` cases.
> +                *
> +                * Then, the common `fprintf()` below will also give us
> +                * a `--cfg CONFIG_X="y"` or `--cfg CONFIG_X="m"`, which can
> +                * be used as the equivalent of `IS_BUILTIN()`/`IS_MODULE()`.
> +                */
> +               if (*value == 'y' || *value == 'm')
> +                       fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
> +
> +               break;
> +       default:
> +               str = value;
> +               break;
> +       }
> +
> +       fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, str);
> +}
> +
> +static struct conf_printer rustc_cfg_printer_cb =
> +{
> +       .print_symbol = rustc_cfg_print_symbol,
> +};
> +
>  /*
>   * Header printer
>   *
> @@ -1044,7 +1094,7 @@ int conf_write_autoconf(int overwrite)
>         struct symbol *sym;
>         const char *name;
>         const char *autoconf_name = conf_get_autoconfig_name();
> -       FILE *out, *out_h;
> +       FILE *out, *out_h, *out_rustc_cfg;
>         int i;
>
>         if (!overwrite && is_present(autoconf_name))
> @@ -1065,6 +1115,13 @@ int conf_write_autoconf(int overwrite)
>                 return 1;
>         }
>
> +       out_rustc_cfg = fopen(".tmp_rustc_cfg", "w");
> +       if (!out_rustc_cfg) {
> +               fclose(out);
> +               fclose(out_h);
> +               return 1;
> +       }
> +
>         conf_write_heading(out, &kconfig_printer_cb, NULL);
>         conf_write_heading(out_h, &header_printer_cb, NULL);
>
> @@ -1076,9 +1133,11 @@ int conf_write_autoconf(int overwrite)
>                 /* write symbols to auto.conf and autoconf.h */
>                 conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
>                 conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
> +               conf_write_symbol(out_rustc_cfg, sym, &rustc_cfg_printer_cb, NULL);
>         }
>         fclose(out);
>         fclose(out_h);
> +       fclose(out_rustc_cfg);
>
>         name = getenv("KCONFIG_AUTOHEADER");
>         if (!name)
> @@ -1097,6 +1156,12 @@ int conf_write_autoconf(int overwrite)
>         if (rename(".tmpconfig", autoconf_name))
>                 return 1;
>
> +       name = "include/generated/rustc_cfg";
> +       if (make_parent_dir(name))
> +               return 1;
> +       if (rename(".tmp_rustc_cfg", name))
> +               return 1;
> +
>         return 0;
>  }
>
> diff --git a/scripts/rust-version.sh b/scripts/rust-version.sh
> new file mode 100755
> index 000000000000..67b6d31688e2
> --- /dev/null
> +++ b/scripts/rust-version.sh
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# rust-version rust-command
> +#
> +# Print the compiler version of `rust-command' in a 5 or 6-digit form
> +# such as `14502' for rustc-1.45.2 etc.
> +#
> +# Returns 0 if not found (so that Kconfig does not complain)
> +compiler="$*"
> +
> +if [ ${#compiler} -eq 0 ]; then
> +       echo "Error: No compiler specified." >&2
> +       printf "Usage:\n\t$0 <rust-command>\n" >&2
> +       exit 1
> +fi
> +
> +if ! command -v $compiler >/dev/null 2>&1; then
> +       echo 0
> +       exit 0
> +fi
> +
> +VERSION=$($compiler --version | cut -f2 -d' ')
> +
> +# Cut suffix if any (e.g. `-dev`)
> +VERSION=$(echo $VERSION | cut -f1 -d'-')
> +
> +MAJOR=$(echo $VERSION | cut -f1 -d'.')
> +MINOR=$(echo $VERSION | cut -f2 -d'.')
> +PATCHLEVEL=$(echo $VERSION | cut -f3 -d'.')
> +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
