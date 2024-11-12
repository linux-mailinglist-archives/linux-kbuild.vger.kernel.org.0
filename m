Return-Path: <linux-kbuild+bounces-4651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C269C4D94
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 05:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EEB6B21BA8
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 04:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76AE207A35;
	Tue, 12 Nov 2024 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWMa90aM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7664720494F;
	Tue, 12 Nov 2024 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731384561; cv=none; b=UIf0MFSM76uamdbiyDHYb17L3Uvk/1PG4kTtqyoI887IqWewCayksd8SsZGUFL1Lbc2laW6UYG4MBOr6/SkivmiWXoDK4ZWMma6ERkGw1jv+7YTDgKMmqASpyUnQcOovX0Bepi5HpiAANi8/FXq150RHLq9wbU5eAFohXqoIyUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731384561; c=relaxed/simple;
	bh=pR0BtV89O5c28HlJXTslOQmSq8i0VdMQqs5jp/cnj4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZ+PO2hECXLNpL1y9OJDOrdblEPkvJkZWPeaQjB0JWM4d0zQCQdbPSA5WZ7obRHBLWyDXel76iWK/kGvjGEpszqxvfybWWuvNiUh9zSXjNysL7mfbvC/vI3JpkEpjCwd61b2bD3Fu5lOJcVOvexurRB83P1iKje6pPcMBMrLIRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWMa90aM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6EAC4AF09;
	Tue, 12 Nov 2024 04:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731384561;
	bh=pR0BtV89O5c28HlJXTslOQmSq8i0VdMQqs5jp/cnj4M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eWMa90aM8vmXm3QDmMl7620F2UhYvu7a6kfzejmyc+ZsWSOU2KND7KWoXmAEyW6RZ
	 tlqXMNrWThUaB+pyOstes05Jevr/4rfWHADdNxVMXrRDMaYGzcfSgUFG3H95VSrvOo
	 AXuo4cYVPEBVVoh+64JGORTU4dldDEKvKCXFF5e5fykR5tYhK7BFgCo9YZiJjqIov+
	 7JM8VH0Snux9uCnCdEXibzYa2D3NRY/RoSoW9ze0XjuL+Uv64seT2hF2zC/qBGdmcS
	 TjnUMjJAD2hV4S6Bt3o68aq+W42276DtW5jr9W05naxj/SVDLi/cRY2AY3txoZx6t3
	 cdfpdbWXDte5Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so46833881fa.0;
        Mon, 11 Nov 2024 20:09:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpjJrzQX/cBoBPWZywmlYR9NR0Ft1NdXDLzFczDXwatIoz/rKJxmWhF1ESlg4XA5jhDnNvObEISxF16S46QQ==@vger.kernel.org, AJvYcCUwgLHeIIlKSs66SOfW+OFyEkLZOpK5S7tQSpHSDmyoZv3YeSIkl+uw4zZm4GlsExRPfA49+mOXI0Deaa8=@vger.kernel.org, AJvYcCVgXwncbS88Up1LWyKVVYUsKTGfr5ZVj4YfmjIcJygGChiLsn1kZpVC2x281Eny1Tp1Rl6Xsab66kWUXpPD@vger.kernel.org, AJvYcCWUyc2XVh4egDLGUfZdv9SKZwMvdKaRXieU1PuDW8JrjeZDa64ckprndrIJP77Gfdh06WkI2pRBm5W+BvbE9rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIw3QQUvrSVGwiL03rg5pKNyEH7usenoXMf2dUJVN6jSKk7nPi
	5i7DGmy7J1Y7yXgUtR8dzFLygwUkm/4ReYADsu9OZqBjBCVrwG3ZzrWGgu2tjlxkz8/6YumojiC
	WYu/t/MyicGroAaRlYtAi8nU7NFQ=
X-Google-Smtp-Source: AGHT+IHCz5Kq6glWndE0YFj2o5thdpPMvoFZsNuNTIzXPJG19tiU0tqQWVzQvxPj8BIf5QDsKUvqgDusa+OmiJvxhUw=
X-Received: by 2002:a05:651c:198a:b0:2fb:4c5c:3f7d with SMTP id
 38308e7fff4ca-2ff426972bemr5425751fa.5.1731384559779; Mon, 11 Nov 2024
 20:09:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com> <20241030170106.1501763-39-samitolvanen@google.com>
In-Reply-To: <20241030170106.1501763-39-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 12 Nov 2024 13:08:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
Message-ID: <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
> implementation, but default to genksyms.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
>  scripts/Makefile       |  2 +-
>  scripts/Makefile.build | 41 +++++++++++++++++++++++++++++++++--------
>  3 files changed, 58 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index f9e5f82fa88b..e6b2427e5c19 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -169,13 +169,36 @@ config MODVERSIONS
>           make them incompatible with the kernel you are running.  If
>           unsure, say N.
>
> +choice
> +       prompt "Module versioning implementation"
> +       depends on MODVERSIONS
> +       default GENKSYMS
> +       help
> +         Select the tool used to calculate symbol versions for modules.
> +
> +         If unsure, select GENKSYMS.
> +
> +config GENKSYMS
> +       bool "genksyms (from source code)"
> +       help
> +         Calculate symbol versions from pre-processed source code using
> +         genksyms.
> +
> +         If unsure, say Y.
> +
>  config GENDWARFKSYMS
> -       bool
> +       bool "gendwarfksyms (from debugging information)"
>         depends on DEBUG_INFO
>         # Requires full debugging information, split DWARF not supported.
>         depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
>         # Requires ELF object files.
>         depends on !LTO
> +       help
> +         Calculate symbol versions from DWARF debugging information usin=
g
> +         gendwarfksyms. Requires DEBUG_INFO to be enabled.
> +
> +         If unsure, say N.
> +endchoice
>
>  config ASM_MODVERSIONS
>         bool
> diff --git a/scripts/Makefile b/scripts/Makefile
> index d7fec46d38c0..8533f4498885 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -53,7 +53,7 @@ hostprogs +=3D unifdef
>  targets +=3D module.lds
>
>  subdir-$(CONFIG_GCC_PLUGINS) +=3D gcc-plugins
> -subdir-$(CONFIG_MODVERSIONS) +=3D genksyms
> +subdir-$(CONFIG_GENKSYMS) +=3D genksyms
>  subdir-$(CONFIG_GENDWARFKSYMS) +=3D gendwarfksyms
>  subdir-$(CONFIG_SECURITY_SELINUX) +=3D selinux
>  subdir-$(CONFIG_SECURITY_IPE) +=3D ipe
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8f423a1faf50..d2a0440cdb79 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -107,18 +107,31 @@ cmd_cpp_i_c       =3D $(CPP) $(c_flags) -o $@ $<
>  $(obj)/%.i: $(obj)/%.c FORCE
>         $(call if_changed_dep,cpp_i_c)
>
> +getexportsymbols =3D $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(=
2)/p'
> +
> +gendwarfksyms =3D scripts/gendwarfksyms/gendwarfksyms    \
> +       $(if $(1), --symtypes $(2))                     \
> +       $(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable)
> +
>  genksyms =3D scripts/genksyms/genksyms           \
>         $(if $(1), -T $(2))                     \
>         $(if $(KBUILD_PRESERVE), -p)            \
>         -r $(or $(wildcard $(2:.symtypes=3D.symref)), /dev/null)
>
>  # These mirror gensymtypes_S and co below, keep them in synch.
> +ifdef CONFIG_GENDWARFKSYMS
> +symtypes_dep_c =3D $(obj)/%.o
> +cmd_gensymtypes_c =3D $(if $(skip_gendwarfksyms),,       \
> +       $(call getexportsymbols,$(2:.symtypes=3D.o),\1) | \
> +       $(gendwarfksyms) $(2:.symtypes=3D.o))
> +else
>  cmd_gensymtypes_c =3D $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
> +endif # CONFIG_GENDWARFKSYMS
>
>  quiet_cmd_cc_symtypes_c =3D SYM $(quiet_modtag) $@
>        cmd_cc_symtypes_c =3D $(call cmd_gensymtypes_c,true,$@) >/dev/null
>
> -$(obj)/%.symtypes : $(obj)/%.c FORCE
> +$(obj)/%.symtypes : $(obj)/%.c $(symtypes_dep_c) FORCE
>         $(call cmd,cc_symtypes_c)
>
>  # LLVM assembly
> @@ -314,19 +327,31 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
>  # This is convoluted. The .S file must first be preprocessed to run guar=
ds and
>  # expand names, then the resulting exports must be constructed into plai=
n
>  # EXPORT_SYMBOL(symbol); to build our dummy C file, and that gets prepro=
cessed
> -# to make the genksyms input.
> +# to make the genksyms input or compiled into an object for gendwarfksym=
s.
>  #
>  # These mirror gensymtypes_c and co above, keep them in synch.
> -cmd_gensymtypes_S =3D                                                   =
      \
> -   { echo "\#include <linux/kernel.h>" ;                                =
    \
> -     echo "\#include <asm/asm-prototypes.h>" ;                          =
    \
> -     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p=
' ; } | \
> -    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> +getasmexports =3D                                                       =
         \
> +   { echo "\#include <linux/kernel.h>" ;                               \
> +     echo "\#include <linux/string.h>" ;                               \
> +     echo "\#include <asm/asm-prototypes.h>" ;                         \
> +     $(call getexportsymbols,$(2:.symtypes=3D.o),EXPORT_SYMBOL(\1);) ; }
> +
> +ifdef CONFIG_GENDWARFKSYMS
> +cmd_gensymtypes_S =3D                                                   =
 \
> +       $(getasmexports) |                                              \
> +       $(CC) $(c_flags) -c -o $(2:.symtypes=3D.gendwarfksyms.o) -xc -;  =
 \
> +       $(call getexportsymbols,$(2:.symtypes=3D.o),\1) |                =
 \
> +       $(gendwarfksyms) $(2:.symtypes=3D.gendwarfksyms.o)


I do not want to see crazy suffix replacements like this.

I decided to delete this.
https://lore.kernel.org/linux-kbuild/20241111171753.2917697-2-masahiroy@ker=
nel.org/T/#u



--=20
Best Regards
Masahiro Yamada

