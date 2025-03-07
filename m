Return-Path: <linux-kbuild+bounces-6004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C2A57112
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 20:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 092FD178D2C
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 19:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E58124336D;
	Fri,  7 Mar 2025 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuxXF+6K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7674217B500;
	Fri,  7 Mar 2025 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741374338; cv=none; b=oN2Tvi84121d0CJ65e2dbOn3Y30HiVkmOI768GT0cHGpHSJdQGWhGRlyGQy9HWH/Q5tTz45FT5HJveM8srV74deE1h9rn3L7FW7sjxUXFwxWHW+50jtGrrylDoLu7KgrWL90LsP+DoZR9adbBfRAvJaQOPWLn+VJ2KnLg2JQnYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741374338; c=relaxed/simple;
	bh=TccBvvz4v+KCdOZdoPQHj5/c1x9IAkR8auB8LpNiN7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qs1KIJ2s0MA8FtGjbhY06qjeEGNf5k+/ORtHKtU+NKoqe4cWWvhUX3IeCpjQu2KwF9u1RJHCxrNIUGdmVm2vnPBMk9t1xQP3LZlNgaARuUMn5dxBnf42WYP25Z0Z2Kd4W+8qvxJG5SzU+PVFMV2TKlix9CSI3aJm7UBPxPoPfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuxXF+6K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F120BC4CEE2;
	Fri,  7 Mar 2025 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741374338;
	bh=TccBvvz4v+KCdOZdoPQHj5/c1x9IAkR8auB8LpNiN7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZuxXF+6KFtjVah2Xz0tAjBbb1ZVUq2PQKpBeUjPXXKUGqXnyaS8uLf1RxKE85JVBT
	 Xrja3GzMg1o/j47yYUOuo8l3CXrpCyBa7SmPU5ydxZbHTEyeSH+2R7yCECQT4Knb9O
	 BVDLXyhR90fCw2m0UFRH3AZE35XE7kSP+VQOCTyiN/qTnIiW+OVSGHNp4cJ+on9gVh
	 HohgdzwKOrrOCcEYgx+a7MKVLE4pOolCVV34lKugt0MQn8v3zMt8mR4BdMEv+pfQh/
	 OcRX4cGpKs77HeN7MN6aQ8UA9Xq3T13DajrPyxPttj52HN5ctSQu3LnOfKkBLhIDmZ
	 VFw2l48dpjFhg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfca745c7so4391821fa.0;
        Fri, 07 Mar 2025 11:05:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjryOr65rniLDlKn5V+EW/Sn5Y6otpk2u1PWAkJ/DR1sUqwCqvHLH20K7t2yuH6rhIGNi0zqaRX/9tLMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMG35+OpzLCl53hmQyfv47ywbTniJaed1RdhtMaIVkhbiPLAO
	0ZxHSLEFQsdZHHu2zz1sJsCav8TUE4q2YyCXKNGS2P3/s/FtQfRlqSioxtNPo84nS31cZ90hl0q
	1tuNw9dm4DqrtmPD/Glm6vigZPBQ=
X-Google-Smtp-Source: AGHT+IF0ErMw/KYHCi8EpFKyjzBeH4kl+y1EKTUmtHvr71zHZundRQZjXzzG0cII1VcUlAoQn07ByEvmQesETKya8Ao=
X-Received: by 2002:a05:651c:39e:b0:30b:efa5:69c3 with SMTP id
 38308e7fff4ca-30bf4550e90mr11200001fa.22.1741374336521; Fri, 07 Mar 2025
 11:05:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <20250224132132.1765115-9-ardb+git@google.com>
In-Reply-To: <20250224132132.1765115-9-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Mar 2025 04:04:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGEK+2=QXzE61YuzaMbZwS5JOVSFxhtCLWqfmt2QwFMA@mail.gmail.com>
X-Gm-Features: AQ5f1JpUHVlcqarxcFH-dMrGmc9qWN1zNx_sSzc-K0V1MdQ9M67NGDzhzwIBTCU
Message-ID: <CAK7LNATGEK+2=QXzE61YuzaMbZwS5JOVSFxhtCLWqfmt2QwFMA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 10:22=E2=80=AFPM Ard Biesheuvel <ardb+git@google.co=
m> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The imperative paradigm used to build vmlinux, extract some info from it
> or perform some checks on it, and subsequently modify it again goes
> against the declarative paradigm that is usually employed for defining
> make rules.
>
> In particular, the Makefile.postlink files that consume their input via
> an output rule result in some dodgy logic in the decompressor makefiles
> for RISC-V and x86, given that the vmlinux.relocs input file needed to
> generate the arch-specific relocation tables may not exist or be out of
> date, but cannot be constructed using the ordinary Make dependency based
> rules, because the info needs to be extracted while vmlinux is in its
> ephemeral, non-stripped form.
>
> So instead, for architectures that require the static relocations that
> are emitted into vmlinux when passing --emit-relocs to the linker, and
> are subsequently stripped out again, introduce an intermediate vmlinux
> target called vmlinux.unstripped, and organize the reset of the build
> logic accordingly:
>
> - vmlinux.unstripped is created only once, and not updated again
> - build rules under arch/*/boot can depend on vmlinux.unstripped without
>   running the risk of the data disappearing or being out of date
> - the final vmlinux generated by the build is not bloated with static
>   relocations that are never needed again after the build completes.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---

I already expressed my concern in the cover-letter.

Other than that, there are some nits:

 - You need to update .gitignore to ignore vmlinux.unstripped
  and the 'clean' target to clean up vmlinux.unstripped.

- cmd_strip_relocs can be moved to scripts/Makefile.vmlinux
  from scripts/Makefile.lib




>  arch/mips/Makefile.postlink  |  2 +-
>  arch/riscv/Makefile.postlink | 11 +--------
>  arch/riscv/boot/Makefile     |  5 +---
>  arch/s390/Makefile.postlink  |  4 +---
>  arch/x86/Makefile.postlink   |  8 +++----
>  scripts/Makefile.lib         |  2 +-
>  scripts/Makefile.vmlinux     | 25 ++++++++++++++------
>  7 files changed, 26 insertions(+), 31 deletions(-)
>
> diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
> index 6cfdc149d3bc..ea0add7d56b2 100644
> --- a/arch/mips/Makefile.postlink
> +++ b/arch/mips/Makefile.postlink
> @@ -22,7 +22,7 @@ quiet_cmd_relocs =3D RELOCS  $@
>
>  # `@true` prevents complaint when there is nothing to be done
>
> -vmlinux: FORCE
> +vmlinux vmlinux.unstripped: FORCE
>         @true
>  ifeq ($(CONFIG_CPU_LOONGSON3_WORKAROUNDS),y)
>         $(call if_changed,ls3_llsc)
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index 6b0580949b6a..0e4cf8ad2f14 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink
> @@ -10,26 +10,17 @@ __archpost:
>
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> -include $(srctree)/scripts/Makefile.lib
>
>  quiet_cmd_relocs_check =3D CHKREL  $@
>  cmd_relocs_check =3D                                                    =
 \
>         $(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OB=
JDUMP)" "$(NM)" "$@"
>
> -ifdef CONFIG_RELOCATABLE
> -quiet_cmd_cp_vmlinux_relocs =3D CPREL   vmlinux.relocs
> -cmd_cp_vmlinux_relocs =3D cp vmlinux vmlinux.relocs
> -
> -endif
> -
>  # `@true` prevents complaint when there is nothing to be done
>
> -vmlinux: FORCE
> +vmlinux vmlinux.unstripped: FORCE
>         @true
>  ifdef CONFIG_RELOCATABLE
>         $(call if_changed,relocs_check)
> -       $(call if_changed,cp_vmlinux_relocs)
> -       $(call if_changed,strip_relocs)
>  endif
>
>  clean:
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index b25d524ce5eb..bfc3d0b75b9b 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -32,10 +32,7 @@ $(obj)/xipImage: vmlinux FORCE
>  endif
>
>  ifdef CONFIG_RELOCATABLE
> -vmlinux.relocs: vmlinux
> -       @ (! [ -f vmlinux.relocs ] && echo "vmlinux.relocs can't be found=
, please remove vmlinux and try again") || true
> -
> -$(obj)/Image: vmlinux.relocs FORCE
> +$(obj)/Image: vmlinux.unstripped FORCE
>  else
>  $(obj)/Image: vmlinux FORCE
>  endif
> diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> index 1ae5478cd6ac..c2b737500a91 100644
> --- a/arch/s390/Makefile.postlink
> +++ b/arch/s390/Makefile.postlink
> @@ -11,7 +11,6 @@ __archpost:
>
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> -include $(srctree)/scripts/Makefile.lib
>
>  CMD_RELOCS=3Darch/s390/tools/relocs
>  OUT_RELOCS =3D arch/s390/boot
> @@ -20,9 +19,8 @@ quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/relocs.S
>         mkdir -p $(OUT_RELOCS); \
>         $(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
>
> -vmlinux: FORCE
> +vmlinux.unstripped: FORCE
>         $(call cmd,relocs)
> -       $(call cmd,strip_relocs)
>
>  clean:
>         @rm -f $(OUT_RELOCS)/relocs.S
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> index 8b8a68162c94..445fce66630f 100644
> --- a/arch/x86/Makefile.postlink
> +++ b/arch/x86/Makefile.postlink
> @@ -11,23 +11,21 @@ __archpost:
>
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> -include $(srctree)/scripts/Makefile.lib
>
>  CMD_RELOCS =3D arch/x86/tools/relocs
>  OUT_RELOCS =3D arch/x86/boot/compressed
> -quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/$@.relocs
> +quiet_cmd_relocs =3D RELOCS  $(OUT_RELOCS)/vmlinux.relocs
>        cmd_relocs =3D \
>         mkdir -p $(OUT_RELOCS); \
> -       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
> +       $(CMD_RELOCS) $@ > $(OUT_RELOCS)/vmlinux.relocs; \
>         $(CMD_RELOCS) --abs-relocs $@
>
>  # `@true` prevents complaint when there is nothing to be done
>
> -vmlinux: FORCE
> +vmlinux vmlinux.unstripped: FORCE
>         @true
>  ifeq ($(CONFIG_X86_NEED_RELOCS),y)
>         $(call cmd,relocs)
> -       $(call cmd,strip_relocs)
>  endif
>
>  clean:
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cad20f0e66ee..7a023f17a21d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -377,7 +377,7 @@ quiet_cmd_objcopy =3D OBJCOPY $@
>  cmd_objcopy =3D $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>
>  quiet_cmd_strip_relocs =3D RSTRIP  $@
> -cmd_strip_relocs =3D $(OBJCOPY) --remove-section=3D'.rel*' $@
> +cmd_strip_relocs =3D $(OBJCOPY) --remove-section=3D'.rel*' $< $@
>
>  # Gzip
>  # ----------------------------------------------------------------------=
-----
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 3523ce3ce3dc..1e3ea8e4b4b0 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -9,6 +9,17 @@ include $(srctree)/scripts/Makefile.lib
>
>  targets :=3D
>
> +ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
> +vmlinux-final :=3D vmlinux.unstripped
> +
> +vmlinux: $(vmlinux-final) FORCE
> +       $(call if_changed,strip_relocs)
> +
> +targets +=3D vmlinux
> +else
> +vmlinux-final :=3D vmlinux
> +endif
> +
>  %.o: %.c FORCE
>         $(call if_changed_rule,cc_o_c)
>
> @@ -47,7 +58,7 @@ targets +=3D .builtin-dtbs-list
>
>  ifdef CONFIG_GENERIC_BUILTIN_DTB
>  targets +=3D .builtin-dtbs.S .builtin-dtbs.o
> -vmlinux: .builtin-dtbs.o
> +$(vmlinux-final): .builtin-dtbs.o
>  endif
>
>  # vmlinux
> @@ -55,11 +66,11 @@ endif
>
>  ifdef CONFIG_MODULES
>  targets +=3D .vmlinux.export.o
> -vmlinux: .vmlinux.export.o
> +$(vmlinux-final): .vmlinux.export.o
>  endif
>
>  ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> -vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o
> +$(vmlinux-final): arch/$(SRCARCH)/tools/vmlinux.arch.o
>
>  arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE
>         $(Q)$(MAKE) $(build)=3Darch/$(SRCARCH)/tools $@
> @@ -72,11 +83,11 @@ cmd_link_vmlinux =3D                                 =
                 \
>         $< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";       \
>         $(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>
> -targets +=3D vmlinux
> -vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> +targets +=3D $(vmlinux-final)
> +$(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>         +$(call if_changed_dep,link_vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF
> -vmlinux: $(RESOLVE_BTFIDS)
> +$(vmlinux-final): $(RESOLVE_BTFIDS)
>  endif
>
>  # module.builtin.ranges
> @@ -92,7 +103,7 @@ modules.builtin.ranges: $(srctree)/scripts/generate_bu=
iltin_ranges.awk \
>                         modules.builtin vmlinux.map vmlinux.o.map FORCE
>         $(call if_changed,modules_builtin_ranges)
>
> -vmlinux.map: vmlinux
> +vmlinux.map: $(vmlinux-final)
>         @:
>
>  endif
> --
> 2.48.1.601.g30ceb7b040-goog
>
>


--=20
Best Regards
Masahiro Yamada

