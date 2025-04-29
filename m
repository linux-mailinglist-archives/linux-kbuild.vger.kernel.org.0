Return-Path: <linux-kbuild+bounces-6800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68DAA1C3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 22:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC151BA8803
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 20:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F7825EF84;
	Tue, 29 Apr 2025 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HzGlbmp9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F9713C3F2
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958872; cv=none; b=q7WcQsR3gSWb9NpPqldmkOXUHXpATeGeEy3/CQ8ku91+epBecD11QjKzwWESNYuyr+IXGXM2+yoNgMfjrXrYbPdfezT/RwykwR1HiizWPYBEX50xhabauwQP1d2FxuNLXHE4kIGeHyDPQdlzvalBkgl7ywd0eeqJIcIZ7k3JJfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958872; c=relaxed/simple;
	bh=sGlnrQ/MOQplxDlbDhA79T/eVHpLdXq6Ayvj/XA97Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfdpgspoZrUZ41Jzidj0rU07j3dyZNSsN4o/eOpGFtHAV/Nvuou8AERqnIUFP+Uvaeoand4PmR2ER7Py/HNX72HMQwq5z1WMeEw6szdLzRS64X8E1djOeo7cN6WU677N1DwJU1m/luQov9fZ8TQQpbDJva4wPWA36lK1X8iDMAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HzGlbmp9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe808908so74045e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745958868; x=1746563668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6tMfh0HII/co4dwYxVDVqR67wVyNotROtYhKBa1M7Q=;
        b=HzGlbmp9coYHsEhXZLJMiWNRB50mMWX66aG4KoTbp5vMv2s5L4gk/tQmf0YE4c/zcs
         Jw11VXsIoXe9jEmIUw9AbOjm7iXmIHPCvY4ZoJ9cDx5XHPDJTEvagruwWY+zYvlsBbmC
         p0quDtF6v/q4u8nsEiqZTJiWyWnE46cYah8sDJ4sNb4e2qSkQZKHDMWbyQheM+tGTRiE
         G0j5beAQNJBENPkQje64BxvOfGxLFYy32/l+JmghFn3zOBhtdkky6eryUuZoWgXnBmTw
         D90wXjpbjObJhsx8KbUT3Yby0hC/jcioj9wCcTxfWZptv3//aij9VIYVFRZLoiEu7011
         Gecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958868; x=1746563668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6tMfh0HII/co4dwYxVDVqR67wVyNotROtYhKBa1M7Q=;
        b=uoBEU5BLBNfyncq+J3BM15sHOyPto9HjPNUYFNPLiPCwrSAsSdxFyHQu/ItQxNvNzQ
         VRSzPFw3ydEw1NK+F7uNN3nagZyGhC8MpOLRmqqWi/nuPFWvTQ8xcMFhkVetYpLf8Roc
         EfkEunYNMcAXAsp/uGZFUsGaIGsz9c6ypne8ni0iChjz0WNp1KQNuoUFdsMbYqv8iOUw
         Jzvm5OgXjnOh2lvinAnyZg0Y8g3cBf0jo1RaDo7ehjGPmb8i1OWY8ySYaEi8a7MhCcVy
         WdahcYnqmDcgM3sEWs4tOci0OReFAG1T/07cuVV4LC+m6FIIiZ0NfR5XeBv9pG31jq7R
         GK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtbECgS9mneg7wZZsoRcKZl8lu3rSVn9awMiBeTN9OSQbWQL3GLk6clQynyxyiv612xgXqqf4m1XOVuCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR3FpifVMr5DheyP2KZYx+ev716rhDFTvrwTgxjXCMAT8GreYE
	QLnSzmUSW8hH5VjzKft0usAeSxQxgTgjBukJtqaq/i3Vs/c9UUjbRBbJI/SC5AKHwYhK16DuKtF
	pcXr6B+1oX9L5Bts8DHz2PyKRQHuVAN619Lgewbyr7J8YAHSqUK+td2c=
X-Gm-Gg: ASbGncsveuOwFTxxCLGY067eGZ0yEalw/SCSWSYtskAAqu2AfPOdrza+HOU/IzvKjlv
	aPhUuFBu/7RHrwgOCUf36Nc+GjlCuR8o6SgxWGFE5YnC7RIqM5gb0NvhXVZIWpHvK3iiBCFPEW7
	2KLJiSXCXrDGRw0NWIlUVp3u6iGIlqD0i1j6n4ojgURkw9e2ZpeG8=
X-Google-Smtp-Source: AGHT+IEnc0fv+sueFCuA+iPG4MIqFaER7pRMaCfTPn52Qp04oCY6VYoXgjVhIFsQZ4Z+tXZbgJPJcnyieZkG1svQynw=
X-Received: by 2002:aa7:da0f:0:b0:5f8:7b57:e5c2 with SMTP id
 4fb4d7f45d1cf-5f896f24328mr22797a12.4.1745958852127; Tue, 29 Apr 2025
 13:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250420010214.1963979-1-xur@google.com>
In-Reply-To: <20250420010214.1963979-1-xur@google.com>
From: Rong Xu <xur@google.com>
Date: Tue, 29 Apr 2025 13:34:00 -0700
X-Gm-Features: ATxdqUF38hTBVGnmkK7BzLGfbjEInGx7B6MqwpurnFwvQhy1LHTObI4gin51Pwg
Message-ID: <CAF1bQ=RWmNt1xnnoQrsBG6-TXzSiqX6e-_Squ22UOSmUi-Tr8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: distributed build support for Clang ThinLTO
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rong Xu <xur@google.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just wanted to gently follow up on this patch that I sent previously.

From a toolchain and compiler perspective, I genuinely believe that
kernel ThinLTO builds should use this. I really want to get some feedback
and reviews on this patch.

Thanks,

-Rong

On Sat, Apr 19, 2025 at 6:02=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> Add distributed ThinLTO build support for the Linux kernel.
> This new mode offers several advantages: (1) Increased
> flexibility in handling user-specified build options.
> (2) Improved user-friendliness for developers. (3) Greater
> convenience for integrating with objtool and livepatch.
>
> Note that "distributed" in this context refers to a term
> that differentiates in-process ThinLTO builds by invoking
> backend compilation through the linker, not necessarily
> building in distributed environments.
>
> Distributed ThinLTO is enabled via the
> `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
>  > make LLVM=3D1 defconfig
>  > scripts/config -e LTO_CLANG_THIN_DIST
>  > make LLVM=3D1 oldconfig
>  > make LLVM=3D1 vmlinux -j <..>
>
> The implementation changes the top-level Makefile with a
> macro for generating `vmlinux.o` for distributed ThinLTO
> builds. It uses the existing Kbuild infrastructure to
> perform two recursive passes through the subdirectories.
> The first pass generates LLVM IR object files, similar to
> in-process ThinLTO. Following the thin-link stage, a second
> pass compiles these IR files into the final native object
> files. The build rules and actions for this two-pass process
> are primarily implemented in `scripts/Makefile.build`.
>
> Currently, this patch focuses on building the main kernel
> image (`vmlinux`) only. Support for building kernel modules
> using this method is planned for a subsequent patch.
>
> Tested on the following arch: x86, arm64, loongarch, and
> riscv.
>
> Some implementation details can be found here:
> https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/859=
34
>
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  MAINTAINERS                       |  5 +++
>  Makefile                          | 40 ++++++++++++++++++++---
>  arch/Kconfig                      | 12 +++++++
>  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
>  scripts/Makefile.lib              |  7 +++-
>  scripts/Makefile.vmlinux_o        | 16 +++++++---
>  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
>  scripts/head-object-list.txt      |  1 +
>  8 files changed, 171 insertions(+), 15 deletions(-)
>  create mode 100644 scripts/Makefile.vmlinux_thinlink
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c966e71ea60bb..40d3bc223e4b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5782,6 +5782,11 @@ F:       scripts/Makefile.clang
>  F:     scripts/clang-tools/
>  K:     \b(?i:clang|llvm)\b
>
> +CLANG/LLVM THINLTO DISTRIBUTED BUILD
> +M:     Rong Xu <xur@google.com>
> +S:     Supported
> +F:     scripts/Makefile.vmlinux_thinlink
> +
>  CLK API
>  M:     Russell King <linux@armlinux.org.uk>
>  L:     linux-clk@vger.kernel.org
> diff --git a/Makefile b/Makefile
> index e65f8735c7bf6..18da9a40dd2c8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -298,7 +298,8 @@ no-dot-config-targets :=3D $(clean-targets) \
>                          outputmakefile rustavailable rustfmt rustfmtchec=
k
>  no-sync-config-targets :=3D $(no-dot-config-targets) %install modules_si=
gn kernelrelease \
>                           image_name
> -single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
> +single-targets :=3D %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.=
final_o \
> +                 %.final_a %.o.thinlto.bc %/
>
>  config-build   :=3D
>  mixed-build    :=3D
> @@ -991,10 +992,10 @@ export CC_FLAGS_SCS
>  endif
>
>  ifdef CONFIG_LTO_CLANG
> -ifdef CONFIG_LTO_CLANG_THIN
> -CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
> -else
> +ifdef CONFIG_LTO_CLANG_FULL
>  CC_FLAGS_LTO   :=3D -flto
> +else # for CONFIG_LTO_CLANG_THIN or CONFIG_LTO_CLANG_THIN_DIST
> +CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
>  endif
>  CC_FLAGS_LTO   +=3D -fvisibility=3Dhidden
>
> @@ -1218,8 +1219,34 @@ vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-obj=
ect-list.txt FORCE
>         $(call if_changed,ar_vmlinux.a)
>
>  PHONY +=3D vmlinux_o
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +vmlinux.thinlink: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_thinlink
> +targets +=3D vmlinux.thinlink
> +
> +vmlinux_final_a :=3D $(patsubst %.a,%.final_a,$(KBUILD_VMLINUX_OBJS))
> +quiet_cmd_ar_vmlinux.final_a =3D AR      $@
> +      cmd_ar_vmlinux.final_a =3D \
> +       rm -f $@; \
> +       $(AR) cDPrST $@ $(vmlinux_final_a); \
> +       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F =
-f $(srctree)/scripts/head-object-list.txt)
> +
> +define rule_gen_vmlinux_final_a
> +       +$(Q)$(MAKE) $(build)=3D. need-builtin=3D1 thinlto_final_pass=3D1=
 need-modorder=3D1 built-in.final_a
> +       $(call cmd_and_savecmd,ar_vmlinux.final_a)
> +endef
> +
> +vmlinux.final_a: vmlinux.thinlink scripts/head-object-list.txt FORCE
> +       $(call if_changed_rule,gen_vmlinux_final_a)
> +
> +targets +=3D vmlinux.final_a
> +
> +vmlinux_o: vmlinux.final_a
> +       $(Q)$(MAKE) thinlto_final_pass=3D1 -f $(srctree)/scripts/Makefile=
.vmlinux_o
> +else
>  vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
> +endif
>
>  vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
>         @:
> @@ -1577,7 +1604,8 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
>                modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>                compile_commands.json rust/test \
>                rust-project.json .vmlinux.objs .vmlinux.export.c \
> -               .builtin-dtbs-list .builtin-dtb.S
> +              .builtin-dtbs-list .builtin-dtb.S \
> +              .vmlinux_thinlto_bc_files vmlinux.thinlink
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
> @@ -2028,6 +2056,8 @@ clean: $(clean-dirs)
>                 -o -name '*.symtypes' -o -name 'modules.order' \
>                 -o -name '*.c.[012]*.*' \
>                 -o -name '*.ll' \
> +               -o -name '*.final_a' -o -name '*.final_o' \
> +               -o -name '*.o.thinlto.bc' \
>                 -o -name '*.gcno' \
>                 \) -type f -print \
>                 -o -name '.tmp_*' -print \
> diff --git a/arch/Kconfig b/arch/Kconfig
> index b0adb665041f1..cbeeeb9b076d8 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -810,6 +810,18 @@ config LTO_CLANG_THIN
>             https://clang.llvm.org/docs/ThinLTO.html
>
>           If unsure, say Y.
> +
> +config LTO_CLANG_THIN_DIST
> +       bool "Clang ThinLTO in distributed mode (EXPERIMENTAL)"
> +       depends on HAS_LTO_CLANG && ARCH_SUPPORTS_LTO_CLANG_THIN
> +       select LTO_CLANG
> +       help
> +         This option enables Clang's ThinLTO in distributed build mode.
> +         In this mode, the linker performs the thin-link, generating
> +         ThinLTO index files. Subsequently, the build system explicitly
> +         invokes ThinLTO backend compilation using these index files
> +         and pre-linked IR objects. The resulting final object files
> +         are with the .final_o suffix.
>  endchoice
>
>  config ARCH_SUPPORTS_AUTOFDO_CLANG
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 13dcd86e74ca8..87259b0e2bfc8 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -50,18 +50,23 @@ endif
>
>  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> +builtin_suffix :=3D $(if $(filter %.final_a, $(MAKECMDGOALS)),final_a,a)
> +ifeq ($(thinlto_final_pass),1)
> +builtin_suffix :=3D final_a
> +endif
> +
>  # subdir-builtin and subdir-modorder may contain duplications. Use $(sor=
t ...)
> -subdir-builtin :=3D $(sort $(filter %/built-in.a, $(real-obj-y)))
> +subdir-builtin :=3D $(sort $(filter %/built-in.$(builtin_suffix), $(real=
-obj-y)))
>  subdir-modorder :=3D $(sort $(filter %/modules.order, $(obj-m)))
>
>  targets-for-builtin :=3D $(extra-y)
>
>  ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
> -targets-for-builtin +=3D $(obj)/lib.a
> +targets-for-builtin +=3D $(obj)/lib.$(builtin_suffix)
>  endif
>
>  ifdef need-builtin
> -targets-for-builtin +=3D $(obj)/built-in.a
> +targets-for-builtin +=3D $(obj)/built-in.$(builtin_suffix)
>  endif
>
>  targets-for-modules :=3D $(foreach x, o mod, \
> @@ -337,6 +342,10 @@ $(obj)/%.o: $(obj)/%.S FORCE
>  targets +=3D $(filter-out $(subdir-builtin), $(real-obj-y))
>  targets +=3D $(filter-out $(subdir-modorder), $(real-obj-m))
>  targets +=3D $(lib-y) $(always-y)
> +ifeq ($(builtin_suffix), final_a)
> +final_o_targets =3D $(patsubst,%.o,%.final_o,$(targets))
> +targets +=3D $(final_targets)
> +endif
>
>  # Linker scripts preprocessor (.lds.S -> .lds)
>  # ----------------------------------------------------------------------=
-----
> @@ -347,6 +356,24 @@ quiet_cmd_cpp_lds_S =3D LDS     $@
>  $(obj)/%.lds: $(src)/%.lds.S FORCE
>         $(call if_changed_dep,cpp_lds_S)
>
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +# Generate .final_o (obj) from .o (bitcode) file
> +# ----------------------------------------------------------------------=
-----
> +quiet_cmd_cc_o_bc =3D CC $(quiet_modtag) $@
> +
> +cmd_cc_o_bc      =3D $(if $(filter bitcode, $(shell file -b $<)),$(CC) \
> +                  $(filter-out -Wp% $(LINUXINCLUDE) %.h.gch %.h -D% \
> +                  -flto=3Dthin, $(c_flags)) \
> +                  -Wno-unused-command-line-argument \
> +                  -x ir -fthinlto-index=3D$<.thinlto.bc -c -o $@ \
> +                  $(if $(findstring ../,$<), \
> +                  $$(realpath --relative-to=3D$(srcroot) $<), $<), \
> +                  cp $< $@)
> +
> +$(obj)/%.final_o: $(obj)/%.o FORCE
> +       $(call if_changed,cc_o_bc)
> +endif
> +
>  # ASN.1 grammar
>  # ----------------------------------------------------------------------=
-----
>  quiet_cmd_asn1_compiler =3D ASN.1   $(basename $@).[ch]
> @@ -360,7 +387,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objt=
ree)/scripts/asn1_compiler
>  # ----------------------------------------------------------------------=
-----
>
>  # To build objects in subdirs, we need to descend into the directories
> -$(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
> +$(subdir-builtin): $(obj)/%/built-in.$(builtin_suffix): $(obj)/% ;
>  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>
>  #
> @@ -377,6 +404,12 @@ quiet_cmd_ar_builtin =3D AR      $@
>  $(obj)/built-in.a: $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
>
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +# Rule to compile a set of .final_o files into one .final_a file.
> +$(obj)/built-in.final_a: $(patsubst %.o,%.final_o,$(real-obj-y)) FORCE
> +       $(call if_changed,ar_builtin)
> +endif
> +
>  # This is a list of build artifacts from the current Makefile and its
>  # sub-directories. The timestamp should be updated when any of the membe=
r files.
>
> @@ -394,6 +427,14 @@ $(obj)/modules.order: $(obj-m) FORCE
>  $(obj)/lib.a: $(lib-y) FORCE
>         $(call if_changed,ar)
>
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +quiet_cmd_ar_final =3D AR      $@
> +      cmd_ar_final =3D rm -f $@; $(AR) cDPrsT $@ $(patsubst %.o,%.final_=
o,$(real-prereqs))
> +
> +$(obj)/lib.final_a: $(patsubst %.o,%.final_o,$(lib-y)) FORCE
> +       $(call if_changed,ar_final)
> +endif
> +
>  quiet_cmd_ld_multi_m =3D LD [M]  $@
>        cmd_ld_multi_m =3D $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
>
> @@ -459,7 +500,8 @@ $(single-subdir-goals): $(single-subdirs)
>  PHONY +=3D $(subdir-ym)
>  $(subdir-ym):
>         $(Q)$(MAKE) $(build)=3D$@ \
> -       need-builtin=3D$(if $(filter $@/built-in.a, $(subdir-builtin)),1)=
 \
> +       need-builtin=3D$(if $(filter $@/built-in.$(builtin_suffix), $(sub=
dir-builtin)),1) \
> +       thinlto_final_pass=3D$(if $(filter final_a, $(builtin_suffix)),1)=
 \
>         need-modorder=3D$(if $(filter $@/modules.order, $(subdir-modorder=
)),1) \
>         $(filter $@/%, $(single-subdir-goals))
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb..ce341ed8d1df3 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -34,8 +34,13 @@ else
>  obj-m :=3D $(filter-out %/, $(obj-m))
>  endif
>
> +builtin_suffix :=3D $(if $(filter %.final_a, $(MAKECMDGOALS)),final_a,a)
> +ifeq ($(thinlto_final_pass),1)
> +        builtin_suffix :=3D final_a
> +endif
> +
>  ifdef need-builtin
> -obj-y          :=3D $(patsubst %/, %/built-in.a, $(obj-y))
> +obj-y          :=3D $(patsubst %/, %/built-in.$(builtin_suffix), $(obj-y=
))
>  else
>  obj-y          :=3D $(filter-out %/, $(obj-y))
>  endif
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 938c7457717ea..4f04eb2c11412 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -9,6 +9,14 @@ include $(srctree)/scripts/Kbuild.include
>  # for objtool
>  include $(srctree)/scripts/Makefile.lib
>
> +ifeq ($(thinlto_final_pass),1)
> +vmlinux_a :=3D vmlinux.final_a
> +vmlinux_libs :=3D $(patsubst %.a,%.final_a,$(KBUILD_VMLINUX_LIBS))
> +else
> +vmlinux_a :=3D vmlinux.a
> +vmlinux_libs :=3D $(KBUILD_VMLINUX_LIBS)
> +endif
> +
>  # Generate a linker script to ensure correct ordering of initcalls for C=
lang LTO
>  # ----------------------------------------------------------------------=
-----
>
> @@ -18,7 +26,7 @@ quiet_cmd_gen_initcalls_lds =3D GEN     $@
>         $(PERL) $(real-prereqs) > $@
>
>  .tmp_initcalls.lds: $(srctree)/scripts/generate_initcall_order.pl \
> -               vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +               $(vmlinux_a) $(vmlinux_libs) FORCE
>         $(call if_changed,gen_initcalls_lds)
>
>  targets :=3D .tmp_initcalls.lds
> @@ -59,8 +67,8 @@ quiet_cmd_ld_vmlinux.o =3D LD      $@
>         $(LD) ${KBUILD_LDFLAGS} -r -o $@ \
>         $(vmlinux-o-ld-args-y) \
>         $(addprefix -T , $(initcalls-lds)) \
> -       --whole-archive vmlinux.a --no-whole-archive \
> -       --start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> +       --whole-archive $(vmlinux_a) --no-whole-archive \
> +       --start-group $(vmlinux_libs) --end-group \
>         $(cmd_objtool)
>
>  define rule_ld_vmlinux.o
> @@ -68,7 +76,7 @@ define rule_ld_vmlinux.o
>         $(call cmd,gen_objtooldep)
>  endef
>
> -vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
> +vmlinux.o: $(initcalls-lds) $(vmlinux_a) $(vmlinux_libs) FORCE
>         $(call if_changed_rule,ld_vmlinux.o)
>
>  targets +=3D vmlinux.o
> diff --git a/scripts/Makefile.vmlinux_thinlink b/scripts/Makefile.vmlinux=
_thinlink
> new file mode 100644
> index 0000000000000..13e4026c7d45b
> --- /dev/null
> +++ b/scripts/Makefile.vmlinux_thinlink
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +PHONY :=3D __default
> +__default: vmlinux.thinlink
> +
> +include include/config/auto.conf
> +include $(srctree)/scripts/Kbuild.include
> +
> +
> +# Generate a linker script to ensure correct ordering of initcalls for C=
lang LTO
> +# ----------------------------------------------------------------------=
-----
> +
> +quiet_cmd_gen_initcalls_lds =3D GEN     $@
> +      cmd_gen_initcalls_lds =3D \
> +       $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +       $(PERL) $(real-prereqs) > $@
> +
> +.tmp_initcalls_thinlink.lds: $(srctree)/scripts/generate_initcall_order.=
pl \
> +               vmlinux.a FORCE
> +       $(call if_changed,gen_initcalls_lds)
> +
> +targets :=3D .tmp_initcalls_thinlink.lds
> +
> +initcalls-lds :=3D .tmp_initcalls_thinlink.lds
> +
> +quiet_cmd_ld_vmlinux.thinlink =3D LD      $@
> +      cmd_ld_vmlinux.thinlink =3D \
> +       $(AR) t vmlinux.a > .vmlinux_thinlto_bc_files; \
> +       $(LD) ${KBUILD_LDFLAGS} -r $(addprefix -T , $(initcalls-lds)) \
> +       --thinlto-index-only @.vmlinux_thinlto_bc_files; \
> +       touch vmlinux.thinlink
> +
> +vmlinux.thinlink: vmlinux.a $(initcalls-lds) FORCE
> +       $(call if_changed,ld_vmlinux.thinlink)
> +
> +targets +=3D vmlinux.thinlink
> +
> +# Add FORCE to the prerequisites of a target to force it to be always re=
built.
> +# ----------------------------------------------------------------------=
-----
> +
> +PHONY +=3D FORCE
> +FORCE:
> +
> +# Read all saved command lines and dependencies for the $(targets) we
> +# may be building above, using $(if_changed{,_dep}). As an
> +# optimization, we don't need to read them if the target does not
> +# exist, we will rebuild anyway in that case.
> +
> +existing-targets :=3D $(wildcard $(sort $(targets)))
> +
> +-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> +
> +.PHONY: $(PHONY)
> diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
> index 7274dfc65af60..b300222e99a6b 100644
> --- a/scripts/head-object-list.txt
> +++ b/scripts/head-object-list.txt
> @@ -18,6 +18,7 @@ arch/arm/kernel/head.o
>  arch/csky/kernel/head.o
>  arch/hexagon/kernel/head.o
>  arch/loongarch/kernel/head.o
> +arch/loongarch/kernel/head.final_o
>  arch/m68k/68000/head.o
>  arch/m68k/coldfire/head.o
>  arch/m68k/kernel/head.o
> --
> 2.49.0.805.g082f7c87e0-goog
>

