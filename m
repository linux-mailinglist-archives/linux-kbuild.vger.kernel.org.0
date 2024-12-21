Return-Path: <linux-kbuild+bounces-5225-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA99F9EE5
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 07:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723BC16AB88
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 06:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B11F78F45;
	Sat, 21 Dec 2024 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vOHUEYf3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0408837;
	Sat, 21 Dec 2024 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734763806; cv=none; b=rfJ/5VGHlyMOIPMp39f3+8jbolPmYqqHbF35z0SLnKO/FBfONKM4W+IQcVASyb6OedFYi0osZajx6XUypQvctQTU/NHBHD6z7yeSGqGUYC2WqKYDEmSFVKNQsh+Msttj4eeffUdoqsJyfmk9p6gqhvDDwYpqtWSoZtNGNUASAQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734763806; c=relaxed/simple;
	bh=aPT/vUsqDrr6wIqMaA6El9GyLb63i2nePKY/bbBGnZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2eBGe3FnOOy11QHzf08CNF5BKq4rViKvyvMZIt3otY8AyB2m2fyRzVqKqYfmgmLLXF8HDbqpLrmF/ht0KWq1HxBkVY7CElvYGor91Wi0YEGVgkS6XrrgqOPkDJFFwyXeM9C+Zyk+feIojsp3OzmsPVzcUpGh1k6VbL1G5ZaPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vOHUEYf3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59052C4CECE;
	Sat, 21 Dec 2024 06:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734763805;
	bh=aPT/vUsqDrr6wIqMaA6El9GyLb63i2nePKY/bbBGnZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vOHUEYf3dUmiv8aabb+OoJ8GPvs3bM6R9YurvOddHC6HLfe1LCZ6Zy/b8eCdccSOR
	 SiHeaILbk3z+uriQR5Q9Etf/2xvHROPG6KB4NU47UeD51GwcrAdFQOpQE22SN7zc2C
	 j+HkIR63OpcM3yxt0zhm7QpAg2xQ2kXASg3JyT5Lp50D4EiZF+odZvERc1PUMVaI2W
	 cf42rhdoUOGTc2ry7O0snqKPlqIsR1acD/9hqAVSXfXPiUPF+n0ta2DSVRhVmtetPr
	 3ncEuZwQHbK5JbzZFd62LXWJxZx5P0o/Cy+G/527ZP8ir252uBl+ggjctH3IPUSf/T
	 1FJp8fibmJGJA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso3992891e87.0;
        Fri, 20 Dec 2024 22:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNmQezMALiKz5TntshTDDJEh1JdzUiW67dsiSRhVmcHJXbrfi2PSg0cT1Gr+kmJswJ1eoQe/pT088b3D0=@vger.kernel.org, AJvYcCWI5sHcd0srxBOmz2JLQxLvRX9o0xn3x85FENBquyZD3mtvZ9dNHiPTWYBcK39kmdqnh9Rw773d73RCMYwU//vFBJ7PWhjU@vger.kernel.org, AJvYcCWwx8Imy7fM7rFWtDNV18/9Hsmd+Oft5R8G2xzyrOUE4eVSh/+vTe5CU0Hvqb/gmVa+g5BqeftHhwsYBN2TibUgyg==@vger.kernel.org, AJvYcCXUvruB0kymeqlCYcTERxTw+AKSookalEIq7WSQ6mUrv59hmvNJyakgtnJ5n2nlzPnffi/TewjbzQXhxk9z@vger.kernel.org
X-Gm-Message-State: AOJu0YxXEitgF5LX9mtXtamN7CjWj3z5NC8ZSur3tuTV5ZOUQtheQPQr
	k4J1lB4S3H80LKTlg6A7z5zTH8u1xhnkoNPmE9M+b8wNW6hXVkbr/gyR9lk451M7OxEIAZX93tS
	MsNxewUG/5wD+YcEdRlU/vMGQhVI=
X-Google-Smtp-Source: AGHT+IEXQFYdtx5Oa0faHkLlK/I2FTVMe0Q27gL7GyYlEMngAiJ96rXV/jhes7CRQcuUuc1jLOX6TQVuUn3WEN3gSQw=
X-Received: by 2002:a05:6512:159d:b0:540:2fd2:6b85 with SMTP id
 2adb3069b0e04-542294509efmr1870468e87.13.1734763804035; Fri, 20 Dec 2024
 22:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2024 15:49:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZLu89uSFrt9=_kEqWpZra_06VDQgOKuKKUiNqM9NJqg@mail.gmail.com>
Message-ID: <CAK7LNASZLu89uSFrt9=_kEqWpZra_06VDQgOKuKKUiNqM9NJqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 8:13=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Similar to ld-version, add a way to check the version of objdump. This
> should most of the time end up being the binutils version or the llvm
> version.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

This patch has no point because 2/2 includes CONFIG option
from the userspace "perf".




> ---
>  init/Kconfig               | 10 +++++++
>  scripts/Kconfig.include    |  6 ++++
>  scripts/objdump-version.sh | 69 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 85 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..0b5d36f939e1de89c12ebdd61=
e4815015314d4f1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -60,6 +60,16 @@ config LLD_VERSION
>         default $(ld-version) if LD_IS_LLD
>         default 0
>
> +config OBJDUMP_IS_GNU
> +       def_bool $(success,test "$(objdump-name)" =3D objdump)
> +
> +config OBJDUMP_IS_LLVM
> +       def_bool $(success,test "$(objdump-name)" =3D llvm-objdump)
> +
> +config OBJDUMP_VERSION
> +       int
> +       default $(objdump-version)
> +
>  config RUSTC_VERSION
>         int
>         default $(rustc-version)
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 33193ca6e8030e659d6b321acaea1acd42c387a4..cb3e2d2564fea8cce780adb3b=
e672c9596b7ccf2 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -58,6 +58,12 @@ $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comm=
a) this linker is not supp
>  ld-name :=3D $(shell,set -- $(ld-info) && echo $1)
>  ld-version :=3D $(shell,set -- $(ld-info) && echo $2)
>
> +# Get the objdump name, version, and error out if it is not supported.
> +objdump-info :=3D $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUM=
P))
> +$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdu=
mp is not supported.)
> +objdump-name :=3D $(shell,set -- $(objdump-info) && echo $1)
> +objdump-version :=3D $(shell,set -- $(objdump-info) && echo $2)
> +
>  # machine bit flags
>  #  $(m32-flag): -m32 if the compiler supports it, or an empty string oth=
erwise.
>  #  $(m64-flag): -m64 if the compiler supports it, or an empty string oth=
erwise.
> diff --git a/scripts/objdump-version.sh b/scripts/objdump-version.sh
> new file mode 100755
> index 0000000000000000000000000000000000000000..fa24f8dc2d3c42fd1195fceb3=
c96b27f7127db25
> --- /dev/null
> +++ b/scripts/objdump-version.sh
> @@ -0,0 +1,69 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the objdump name and its version in a 5 or 6-digit form.
> +# Also, perform the minimum version check.
> +
> +set -e
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +get_canonical_version()
> +{
> +       IFS=3D.
> +       set -- $1
> +
> +       # If the 2nd or 3rd field is missing, fill it with a zero.
> +       #
> +       # The 4th field, if present, is ignored.
> +       # This occurs in development snapshots as in 2.35.1.20201116
> +       echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> +}
> +
> +orig_args=3D"$@"
> +
> +# Get the first line of the --version output.
> +IFS=3D'
> +'
> +set -- $(LC_ALL=3DC "$@" --version)
> +
> +# Split the line on spaces.
> +IFS=3D' '
> +set -- $1
> +
> +min_tool_version=3D$(dirname $0)/min-tool-version.sh
> +
> +if [ "$1" =3D GNU -a "$2" =3D objdump ]; then
> +       shift $(($# - 1))
> +       version=3D$1
> +       min_version=3D$($min_tool_version binutils)
> +       disp_name=3D"GNU objdump"
> +else
> +       while [ $# -gt 1 -a "$1" !=3D "LLVM" ]; do
> +               shift
> +       done
> +
> +       if [ "$1" =3D LLVM ]; then
> +               version=3D$3
> +               min_version=3D$($min_tool_version llvm)
> +               disp_name=3D"llvm-objdump"
> +       else
> +               echo "$orig_args: unknown objdump" >&2
> +               exit 1
> +       fi
> +fi
> +
> +version=3D${version%%[!0-9.]*}
> +
> +cversion=3D$(get_canonical_version $version)
> +min_cversion=3D$(get_canonical_version $min_version)
> +
> +if [ "$cversion" -lt "$min_cversion" ]; then
> +       echo >&2 "***"
> +       echo >&2 "*** objdump is too old."
> +       echo >&2 "***   Your $disp_name version:    $version"
> +       echo >&2 "***   Minimum $disp_name version: $min_version"
> +       echo >&2 "***"
> +       exit 1
> +fi
> +
> +echo objdump $cversion
>
> --
> 2.34.1
>


--
Best Regards


Masahiro Yamada

