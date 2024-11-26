Return-Path: <linux-kbuild+bounces-4878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5229D9C12
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 18:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D5AA2840E9
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 17:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1901D9341;
	Tue, 26 Nov 2024 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xbmu7P3C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24E1C5799;
	Tue, 26 Nov 2024 17:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732640877; cv=none; b=e2ZfFv+OQK2U6DTNU2BDR68gn4qdIvHWP3wbf+RWHE+AI56Ue3I1Zn1QPJwnTRkx74f/dbSXQTrg0FDR1DCTzxRkIfgmDfwlgJpvQ0EjZUc77SdG5zLqTrPJ9MDUVmUZW5PTgQ/fvkjmQS4cI94h8/WIPEUMRDzOJE6Tn/Kb+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732640877; c=relaxed/simple;
	bh=pV/9u4I8GzbUzuhef6l8bVcuRWjBHjz/xWKgCklFCCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYct4UMQ8X4HyjWguW8+xgcyIe/JR2tjgFpR6LjzMWiBnn0i+iiKgMeX3hwGXCndlTEEIh86tyRKHor+gwr2NaCZA+97uImV9MDO+gWtVjFEQ9BNzE+zZmF+G9SDAH8QnOnMGkfwH/8AWFYTquXWFlA77EDLqXLy78wslhRhDJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xbmu7P3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C832AC4CEDC;
	Tue, 26 Nov 2024 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732640876;
	bh=pV/9u4I8GzbUzuhef6l8bVcuRWjBHjz/xWKgCklFCCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xbmu7P3CxXdzZ1ojMF1f0tfwsfzxc/67inreyFT4h9ch3TgnJtWBWhOryHi1y42K1
	 NUodPUWXsr3b0up4YdlJWyS5fqSmHNgZ108i2j3jHzXzHzgZ3Tj2/JEBGb/BN+LaUh
	 iy1XA0viYqxHdfsKXh2WMWp3hj/CSAnHKVFlfn6X7dzuTmRGAQpc6nQ7DHQwtMadKl
	 M0F7x2X3YDqcFFbunyt/b6l/sNIsd14pcWD10f84fGKj5trcDL+fSEi2MwBTCHXMUq
	 rURtg5U3VqJorN95Pna6kLRLgKsGHuFqAEyjYKaRQObGpuz3XOkrDdQ1IRNGVqK9Cz
	 HGcReODgJ1kGQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dd668c5easo4408167e87.1;
        Tue, 26 Nov 2024 09:07:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4XgDaRhDqRpi4m8BrtyZ0xQdWqTOWgs0qxB7QLwqZdT7O8jQAewnJ7q0MwfkhZRw1Lynzno3gjZr5WONY@vger.kernel.org, AJvYcCVWdkVr80Exy6A+rX63AaD0q3mAuSnoF+/y2Upqod9zGHUWO+T1ELlPYGwIWdooZu5eyJ2XoD8i7aO31Uc=@vger.kernel.org, AJvYcCW3td9V9MYCzClJLYis6NWyGyi3QEUtMIN5utwyKgV+JSs4KMbJ8Mhl2GktUYeQLBt982P0/XFOc3KIQedRCw==@vger.kernel.org, AJvYcCXqOwYkJylU9q+zMdC+9SsDTpAMydqGGi4cDX3lSg2ji8nMTgUXopa3zDgxkmUZYBiz/3RtVWnNZW5cO5NMi6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9TSDugWpQTHyvpj5I+mDXssGoRGM37c/0pMD+eECON9Ry9tz
	dAi8SmheHIjklpAQ/0EProE81t/tjZ+HhdJXhsRjdUEybDKnW1TUHcBUNfN5CdeAjKgJYhhH3+P
	zGJXR9wIKArGOmpr1tqyma9GwZ3w=
X-Google-Smtp-Source: AGHT+IEsHaKYGw7w+gVoJMAtUh2GgApnKj5MhP1ZudIvdeWbErn4bg7YUAsqfagcTYCCPN44cxsWm6jAxXerxT2y9nk=
X-Received: by 2002:a05:6512:224f:b0:53d:de87:d82f with SMTP id
 2adb3069b0e04-53de8800089mr1246206e87.4.1732640875354; Tue, 26 Nov 2024
 09:07:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <20241121204220.2378181-37-samitolvanen@google.com>
In-Reply-To: <20241121204220.2378181-37-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 27 Nov 2024 02:07:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUkMtRmyiovCebrXhrdz2GnUo+0SQMHaCc0evZatohfw@mail.gmail.com>
Message-ID: <CAK7LNAQUkMtRmyiovCebrXhrdz2GnUo+0SQMHaCc0evZatohfw@mail.gmail.com>
Subject: Re: [PATCH v6 17/18] kbuild: Add gendwarfksyms as an alternative to genksyms
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

On Fri, Nov 22, 2024 at 5:43=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
> implementation, but default to genksyms.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
>  scripts/Makefile       |  2 +-
>  scripts/Makefile.build | 35 +++++++++++++++++++++++++++++------
>  3 files changed, 54 insertions(+), 8 deletions(-)
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

This is redundant because the first entry is the default.



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
> index f41ce2131979..d6b211a7b261 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -107,13 +107,24 @@ cmd_cpp_i_c       =3D $(CPP) $(c_flags) -o $@ $<
>  $(obj)/%.i: $(obj)/%.c FORCE
>         $(call if_changed_dep,cpp_i_c)
>
> +getexportsymbols =3D $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/$(1)=
/p'
> +
> +gendwarfksyms =3D $(objtree)/scripts/gendwarfksyms/gendwarfksyms \
> +       $(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=3D.symtypes))  \
> +       $(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable)
> +
>  genksyms =3D $(objtree)/scripts/genksyms/genksyms                \
>         $(if $(KBUILD_SYMTYPES), -T $(@:.o=3D.symtypes))  \
>         $(if $(KBUILD_PRESERVE), -p)                    \
>         $(addprefix -r , $(wildcard $(@:.o=3D.symref)))
>
>  # These mirror gensymtypes_S and co below, keep them in synch.
> +ifdef CONFIG_GENDWARFKSYMS
> +cmd_gensymtypes_c =3D $(if $(skip_gendwarfksyms),,       \
> +       $(call getexportsymbols,\1) | $(gendwarfksyms) $@)
> +else
>  cmd_gensymtypes_c =3D $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
> +endif # CONFIG_GENDWARFKSYMS
>
>  # LLVM assembly
>  # Generate .ll files from .c
> @@ -279,14 +290,26 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
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
> +     $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
> +
> +ifdef CONFIG_GENDWARFKSYMS
> +cmd_gensymtypes_S =3D                                                   =
 \
> +       $(getasmexports) |                                              \
> +       $(CC) $(c_flags) -c -o $(@:.o=3D.gendwarfksyms.o) -xc -;         =
 \
> +       $(call getexportsymbols,\1) |                                   \
> +       $(gendwarfksyms) $(@:.o=3D.gendwarfksyms.o)
> +else
> +cmd_gensymtypes_S =3D                                                   =
 \
> +       $(getasmexports) |                                              \
> +       $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> +endif # CONFIG_GENDWARFKSYMS
>
>  quiet_cmd_cpp_s_S =3D CPP $(quiet_modtag) $@
>  cmd_cpp_s_S       =3D $(CPP) $(a_flags) -o $@ $<
> --
> 2.47.0.371.ga323438b13-goog
>


--=20
Best Regards
Masahiro Yamada

