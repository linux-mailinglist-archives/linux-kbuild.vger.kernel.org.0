Return-Path: <linux-kbuild+bounces-6143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE90A61B2B
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 20:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA42B3B3E60
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 19:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A8D204F64;
	Fri, 14 Mar 2025 19:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+eFvV4N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F56204C3F;
	Fri, 14 Mar 2025 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982233; cv=none; b=e2DFpw6r9Du2wDp2lZ0QlR8a5o3A/5d3/pIXCBjiiHicf50luOc3BkU1YSMVwyP8MJHft1H9kzYI2LQLS5XvzokgANXe8PwWDma+gFSMnuhUyGUDqdf7K7gUvy9mD1LzscN9Lq9x9XvZ50EGu/rw9ndV9AmOTs0vk7E07rWDML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982233; c=relaxed/simple;
	bh=C/ne6vcmKI6OX7I+ZSHTClMRatk/4KOdl9Td/8MPFNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHQ9IHLq5E0nEgqTduxPQnsK63LVFcEYZAeoTns767sDKwmtjTHLUFYis5T77gTZ3brpY+20Ik8w7vlkw5uMldoXqZszfO4yJW0AccJnFNyKprCKQOrgThjhO/bq/UvaFR1VEoZE1Smfz2H1KCs4X2Bljoz3GtkLV5ry8fa+7d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+eFvV4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FB8C4CEED;
	Fri, 14 Mar 2025 19:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982232;
	bh=C/ne6vcmKI6OX7I+ZSHTClMRatk/4KOdl9Td/8MPFNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R+eFvV4NtGA88LBZUHrnvkCzxg3zH+SCvBsjvCXkIk2lQnC9NMN0bbgpKY8lA/ms/
	 TQzu1Cwi/dq7rUCZI02OJ0GgAEc5BiVNxDoPF/LMP2XYP+1fOV10PX9qCZ//yh1HbI
	 J2mqkhjkxIQ7JsNqQS9JJux/Ivm6KS2OfeFptnraODcEjfUGw3kJMh0od1Rhheem6s
	 uScoumsJH+BNRupW76v9QztIlzqqRA6SZq50F1kJRoLmlG3+1YT0TrPLNpFuDzbbBJ
	 mBdkQDumz2yqUyAkcTkG1lGsPYJLqJkfO44l6NJM7oy6Wmtg4zS27FV1HGOFr9TDKU
	 Go0t1/VcWokag==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so2960692e87.0;
        Fri, 14 Mar 2025 12:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVudpX1ymHWEwmDu79oTm3QhbQqFwdiqujqqjEo/VAXbVG41gfcyLlynKcP/c/RVAX4Tx7BpHCLxpLcceUp5zR/W8fV@vger.kernel.org, AJvYcCXccL+sx5ghJwjSoB0J4MAiKKtZm05A9OfCh32Oymg8hTDCCPIWKG7K7eBUKfWm8En3GXjnRvctkUysNPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu4uAf7OAzI6/nPwi0HKKQdUTS32i2Xqh+TAcanLhyE7T1mUfS
	7UtK5J48a1K65f3hWYndHdqZVyzff+4EKLxqkPRUY+PeYuxJbvKwuyQNoQ/WzsIU7YSVsfz7m8E
	qCztqa5eVJ8/b+hv3xF96GzRm6bc=
X-Google-Smtp-Source: AGHT+IG+otLNYQ+ig42Y1BWjES4bCT6/mZauAjCUgwfhV2DY99PBbypCivkkIQ2IddJ5wXxpiv8RDwNPOGnrDEau3v0=
X-Received: by 2002:a05:6512:2823:b0:548:794f:f9dd with SMTP id
 2adb3069b0e04-549c38f1d97mr1269568e87.10.1741982231472; Fri, 14 Mar 2025
 12:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com> <20250210-debuginfo-v1-2-368feb58292a@purestorage.com>
In-Reply-To: <20250210-debuginfo-v1-2-368feb58292a@purestorage.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 04:56:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQz-BKmWNuw+CWfPHWVmN6x3cpj941_iAp_5xdq+eS1DQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqwXXZvxlBZJSJi0uCPviVL-QF1FTEoHuzeB3oY02PO7mwhOuBonUR6s1o
Message-ID: <CAK7LNAQz-BKmWNuw+CWfPHWVmN6x3cpj941_iAp_5xdq+eS1DQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rpm-pkg: build debuginfo and debugsource RPMs
To: Uday Shankar <ushankar@purestorage.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the long delay.


On Tue, Feb 11, 2025 at 10:12=E2=80=AFAM Uday Shankar <ushankar@purestorage=
.com> wrote:
> Note that this feature is incompatible with CONFIG_MODULE_COMPRESS -
> if it is turned on, the module .ko files are compressed before
> find-debuginfo.sh sees them, and it will not be able to extract
> debuginfo from them. There are two potential paths forward here:
> - teach find-debuginfo.sh to extract debuginfo from compressed kernel
>   modules
> - teach the kernel build process to produce split debuginfo and then
>   package that directly, bypassing find-debuginfo.sh


'make bindeb-pkg'  (Debian package) is able to build the debug package with
CONFIG_MODULE_COMPRESS enabled.
(see scripts/package/builddeb if you are interested)
I have not checked if this works for 'make binrpm-pkg' or not.
If this is a tricky case, I am OK with giving up CONFIG_MODULE_COMPRESS.



> But leaving CONFIG_MODULE_COMPRESS off seems common, so taking this
> patch as is still feels useful.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  scripts/package/kernel.spec | 31 +++++++++++++++++++++++++++++--
>  scripts/package/mkspec      |  3 +++
>  2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index ac3e5ac01d8a4daa031bc9e70b792a68f74c388b..efd7b1f43c64c8324bb0a6e54=
0f2ba5f77f9de1e 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -2,8 +2,6 @@
>  %{!?_arch: %define _arch dummy}
>  %{!?make: %define make make}
>  %define makeflags %{?_smp_mflags} ARCH=3D%{ARCH}
> -%define __spec_install_post /usr/lib/rpm/brp-compress || :
> -%define debug_package %{nil}
>
>  Name: kernel
>  Summary: The Linux Kernel
> @@ -46,6 +44,24 @@ This package provides kernel headers and makefiles suf=
ficient to build modules
>  against the %{version} kernel package.
>  %endif
>
> +%if %{with_debuginfo}
> +# list of debuginfo-related options taken from distribution spec files
> +%undefine _include_minidebuginfo
> +%undefine _find_debuginfo_dwz_opts
> +%undefine _unique_build_ids
> +%undefine _unique_debug_names
> +%undefine _unique_debug_srcs
> +%undefine _debuginfo_subpackages
> +%global _find_debuginfo_opts -r
> +%global _missing_build_ids_terminate_build 1
> +%global _no_recompute_build_ids 1
> +%{debug_package}
> +%endif
> +# some (but not all) versions of rpmbuild emit %%debug_package with
> +# %%install. since we've already emitted it manually, that would cause
> +# a package redefinition error. ensure that doesn't happen
> +%define debug_package %{nil}
> +
>  %prep
>  %setup -q -n linux
>  cp %{SOURCE1} .config
> @@ -89,8 +105,19 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot=
}/lib/modules/%{KERNELRELEA
>         echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
>  } > %{buildroot}/kernel.list
>
> +# make modules executable so that find-debuginfo.sh strips them
> +find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \
> +       | xargs --no-run-if-empty chmod u+x

This seems necessary and correct.

One side-effect I noticed is that *.ko under /lib/modules/$(uname -r)/
now have +x permissions. (Previously, they were non-executables).

I checked Fedora. Modules under /lib/modules/$(uname -r)/
do not have +x permissions.

Do you know how Fedora's kernel.spec handles this?



> +
> +%if %{with_debuginfo}
> +mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
> +cp vmlinux %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
> +%endif
> +
>  %clean
>  rm -rf %{buildroot}
> +rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources=
.list \
> +       elfbins.list
>
>  %post
>  if [ -x /usr/bin/kernel-install ]; then
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 4dc1466dfc815c110eb7206f83dd874b17f5170f..4c96bdca381a2fb4cc57415ca=
914d14e37e16caa 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -23,6 +23,9 @@ else
>  echo '%define with_devel 0'
>  fi
>
> +WITH_DEBUGINFO=3D$(grep -c CONFIG_DEBUG_INFO=3Dy include/config/auto.con=
f)
> +echo "%define with_debuginfo ${WITH_DEBUGINFO}"
> +

How about this code?

if grep -q CONFIG_DEBUG_INFO=3Dy include/config/auto.conf; then
echo '%define with_debuginfo %{?_without_debuginfo: 0}
%{?!_without_debuginfo: 1}'
else
echo '%define with_debuginfo 0'
fi

This allows users to skip the debuginfo package
and aligns with the existing code a few lines above.

Also, it is compatible with Fedora's kernel.spec.
https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel.spec#_236


If you do not support CONFIG_MODULE_COMPRESS,
you can check it here.


>  cat<<EOF
>  %define ARCH ${ARCH}
>  %define KERNELRELEASE ${KERNELRELEASE}
>
> --
> 2.34.1
>
>


--=20
Best Regards
Masahiro Yamada

