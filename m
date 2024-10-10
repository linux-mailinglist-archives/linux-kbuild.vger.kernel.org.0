Return-Path: <linux-kbuild+bounces-4020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D96998018
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 10:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79610B225B6
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 08:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9692D207202;
	Thu, 10 Oct 2024 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PIU4Bg3T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E11BC066
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728547713; cv=none; b=XD2f0jZrBp9Ec5fF65ARfEqbgfa1hq344x32uRtF7UwMbz8L6h9V1ERGrbNokNx9h+sD2YDOnNHAsNonT/MykWZ54locaW+oiKnl6LAVYb9Tr0ouZiV0uJpGQ/xalXXKFQvxeAE8dX4WvHkHcvw68Sb1Qbjn2guUcxUSRIHY9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728547713; c=relaxed/simple;
	bh=6LfLvuozBsFESg5xBvp/Nzqd+4QnsUeZ6oLk5+7Ck/k=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 In-Reply-To:References; b=QZPv5lFALk76M/JIkqDRseA2I9Oc6RBppIsFTa3SdxIGH0hOphfN39K4hvV1cJJsTTHy1a+F04Een/4Kj1MbTrVll5GlpedO+50G/Y0hnS1uG+h8aRhp5v+0wuxwjm0t8WQ+8t3PDollQjv3rtNys24bCSyn0id8MCaxAQ94bgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PIU4Bg3T; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241010080829euoutp02694a01be9c22804ce64512860bb958c8~9CPvPerET2497324973euoutp02q
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 08:08:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241010080829euoutp02694a01be9c22804ce64512860bb958c8~9CPvPerET2497324973euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728547709;
	bh=uz8XX1w5feObD3mHRhgAxNu5iMqxGZeFAx269fgk0rs=;
	h=Date:CC:Subject:From:To:In-Reply-To:References:From;
	b=PIU4Bg3TRRFCy0C2Nlez7mW2nMi9pzY8MlntncxR3uqT5GL4W4Ilidq5B6nXQPpK8
	 8iaijRpLYapUpxvqZBWJYQUd+nkP3xFmxbRCu2V9r50qjxYmIjfnBwlCChrFwJlt80
	 nkXGco7wWCaa9AHBNJkXGYHPy95Aj8KMdm9bcVOA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241010080829eucas1p2b91381f729e3b82c8d1cca97f1bea865~9CPu1dARb1587215872eucas1p2E;
	Thu, 10 Oct 2024 08:08:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 2A.08.09620.C7B87076; Thu, 10
	Oct 2024 09:08:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241010080828eucas1p1a1fbd99e5f7bb1c454f14ba4fa19a3e1~9CPuSlH712476824768eucas1p1L;
	Thu, 10 Oct 2024 08:08:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010080828eusmtrp1b09b3e22a0cc3cadf487da1e5a8caae9~9CPuR0Z9U1100011000eusmtrp1G;
	Thu, 10 Oct 2024 08:08:28 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-31-67078b7c5aab
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 82.80.14621.C7B87076; Thu, 10
	Oct 2024 09:08:28 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241010080828eusmtip16e598a5d16dcef675bc865cb0eceb3d0~9CPt_CMWL1310813108eusmtip1L;
	Thu, 10 Oct 2024 08:08:28 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 10 Oct 2024 09:08:26 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Oct 2024 10:08:26 +0200
Message-ID: <D4RZ0TWSGGPX.3M4FKLTO3WPZ7@samsung.com>
CC: Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, "Nicolas Schier" <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, "David S.
 Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>,
	=?utf-8?q?=C3=8D=C3=B1igo_Huguet?= <ihuguet@redhat.com>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, Vegard Nossum
	<vegard.nossum@oracle.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] rust: query the compiler for dylib path
From: Daniel Gomez <da.gomez@samsung.com>
To: Tamir Duberstein <tamird@gmail.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.18.2-67-g7f69618ac1fd
In-Reply-To: <20241008224810.84024-1-tamird@gmail.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1DTZRzHe74/xzzgy/CO5+iHx4A6SrAuhcfTSzvTvplHQdlBd10u+N6w
	YHCbQ/LaYkuZA2+Ilemm/DgX2wiFxhqEg3Kk/BzkyEBUpAS6g0imMSyg2vhixz/PvZ735/N+
	P8/zuUeAi05Q0YL9sgOcXCbJFVNCwnnlr/5EVRktfXbxOEA3b4+TaMnUTKOuIS2BZn/Wkmj4
	x+9wVO/QYOjMwGECXe2bBqjR/hOOBuaWcKSvMNNosbUFQ4OtZyi08GASQ7+MDZOorWGQQjrb
	BIUm27pIZKuyANQw2YGjB30uGnmcPYFFW09uj2IdtusY2+puoliz/m+M/dZ4i2ar7UrWdPQ0
	ydrr9BRbqa/EWN/ECMHO61wUe6zEjrF3269R7EyXgWTv259gy8uu0K+Hvy3cms3l7i/k5Bte
	2CfM8TsOUwXWlKKhTgtdDAzrS0GIADIbYeNUMRZkEWMF8Nfej0qBMMB/Aqiza0h+cx/A3rJq
	8qGjfGoC8AULgKMXruH/d3251LOyaQLQODdFBS2hTATsPj1OBBlnnoG1NdM4zwnwSPMCHWSC
	iYcjgyaM798IL/kbl4NwxkdB/ex8IEggiGS2wnv+5Uwq4G3vti971zKvwNGhRYy/3pPw3/KK
	5bNCmGSo05lX9Bh4qsJG8KyCPY4RLJgPGZsQ6isHiGA+ZF6Czu/f4Xsi4VSng+b5Mdj76bEV
	rxSaLxhXuAC6bhhJ3roFGvpyeflF6L9aT/NyGByeieBfGwZPOL/AeTkUHi0RHQdxxlXzMa6a
	j3HVfKoBXgeiOKUiT8opnpdxB5MUkjyFUiZNysrPs4PAt+39p3OuBVinfElugAmAG0ABLl4b
	mlhDSkWh2ZIPD3Hy/HflylxO4QaPCghxVGh89jpOxEglB7gPOK6Akz+sYoKQ6GKsVv1WZNH8
	+OexmWsKlxZ9WduP3Gkzh28r3anLSH3jXIkHGg5+tq+5Qk+MtaeP6vwx8R1f3V4TWa6YmW5o
	UI98fX7DnkhXdNZTyS//kKqiitCW2Hvqi96qkxbvuLLm/TBtxN4boydfq4427Q0TFiXsMuxU
	+9Xn03blbOpf941lZL0j75YCS7Ua1MPtu90fpxtU7KExTdzjdzWJKMP1B4qNTXrkTmFXuv7N
	3bVeVtZ4PdOLJX4SPqtyOS63xDVppVXvJXRf9Lt+J+qYTd4FV35a1G8D2sJLKabNYxmZ55J9
	GtzjicpJ6/BZN8fsqPNe3raj0+o5+2pKv7NLfLMxp+esRUwociTPPY3LFZL/AFmCiKMlBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsVy+t/xu7o13ezpBgefiFncuf+E1eLv7O3s
	FieuN7FYfLjWxGpx48J+Zos1WxqZLOacb2GxuHjmNaPFhk1XmC3Of/3LbNE5cQm7xZ9dO5gs
	Lu+aw2bx+8czJouHD26wWuxdf5nNon3lUzaLZ3tPsFqsnL+c0WL9s8PMFj/O7GG3OLvtFJBo
	WsPqIO6xZeVNJo9dhzazeSzp/MXksXPWXXaPBZtKPWZ3zGT12LSqk81jXuc8Jo+PT2+xeHxv
	38Pm0dO2icnj/b6rbB5vT/SxenzeJOfR332MPYA/Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
	yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j25YWtoIV5hXXjy9nb2Ds0+li5OSQEDCR6H/1
	lLGLkYtDSGApo0TH2d8sEAkZiY1frrJC2MISf651sUEUfWSUWH74CxOEsxmo4+IDsCpeAUGJ
	kzOfgHUzC2hLLFv4mhnC1pRo3f6bHcRmEVCVuHV5NhNEvYnEwW8bmEEGMQt8ZJPo23gWyOHg
	EBawkfj0jQ2khg2od9/JTWC9IgKeEveu/2GCuEhN4n//RLBdQgKmEmuvXGAEsTkFzCTa25dA
	1ShKzJi4EuqbWonPf58xTmAUmYXk1FlITp2F5NQFjMyrGEVSS4tz03OLDfWKE3OLS/PS9ZLz
	czcxAhPStmM/N+9gnPfqo94hRiYOxkOMEhzMSiK8ugtZ04V4UxIrq1KL8uOLSnNSiw8xmgL9
	PJFZSjQ5H5gS80riDc0MTA1NzCwNTC3NjJXEed0un08TEkhPLEnNTk0tSC2C6WPi4JRqYNLM
	11c0sI5j9eK0iGW0e1kRHWEz9fqla4vk26zCDpw4XL2pldl3SabAkv9nHfyX+bNu2qn36CNX
	pLnGKrM17yPyjQSuyFXoPnA1ebvxZNfuG+sv99p6tNz07Dn2x9FIbYF7fw9j/eutaubO618k
	ci1ILfrX1dUWWdU441qo+LEvr6eksdYUH754tmKp8vK0OZd8itNORm8XTSqMYLmXHMvZsf9d
	x7mE/D9thbO5WNOrhANZGTij5W/ceSqdffB0panoSh1e2RsruyUCGbL036yIuCx7SjpT2ijh
	U9O8TNuXxh6PLxztnD3lzQsdj+7633O8jBrvnxF5l6Nz3n55ws/9j9YyNl8U1H1ff4dDiaU4
	I9FQi7moOBEA1Pk01dEDAAA=
X-CMS-MailID: 20241010080828eucas1p1a1fbd99e5f7bb1c454f14ba4fa19a3e1
X-Msg-Generator: CA
X-RootMTR: 20241010080828eucas1p1a1fbd99e5f7bb1c454f14ba4fa19a3e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241010080828eucas1p1a1fbd99e5f7bb1c454f14ba4fa19a3e1
References: <20241008224810.84024-1-tamird@gmail.com>
	<CGME20241010080828eucas1p1a1fbd99e5f7bb1c454f14ba4fa19a3e1@eucas1p1.samsung.com>

On Wed Oct 9, 2024 at 12:48 AM CEST, Tamir Duberstein wrote:
> Rust proc-macro crates are loaded by the compiler at compile-time, so
> are always dynamic libraries; on macOS, these artifacts get a .dylib
> extension rather than .so.
>
> Replace hardcoded paths ending in .so with paths obtained from the
> compiler.
>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  .gitignore                        |  1 +
>  Makefile                          |  2 +-
>  rust/Makefile                     | 21 ++++++++++++---------
>  scripts/generate_rust_analyzer.py | 16 ++++++++++++----
>  4 files changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index 56972adb5031..7cfe4f70b39a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -22,6 +22,7 @@
>  *.dtb.S
>  *.dtbo.S
>  *.dwo
> +*.dylib
>  *.elf
>  *.gcno
>  *.gcda
> diff --git a/Makefile b/Makefile
> index c5493c0c0ca1..3808869fb95b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1506,7 +1506,7 @@ MRPROPER_FILES +=3D include/config include/generate=
d          \
>  		  certs/x509.genkey \
>  		  vmlinux-gdb.py \
>  		  rpmbuild \
> -		  rust/libmacros.so
> +		  rust/libmacros.so rust/libmacros.dylib
> =20
>  # clean - Delete most, but leave enough to build external modules
>  #
> diff --git a/rust/Makefile b/rust/Makefile
> index b5e0a73b78f3..a185a4d05b08 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -11,9 +11,6 @@ always-$(CONFIG_RUST) +=3D exports_core_generated.h
>  obj-$(CONFIG_RUST) +=3D helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-decla=
rations
> =20
> -always-$(CONFIG_RUST) +=3D libmacros.so
> -no-clean-files +=3D libmacros.so
> -
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D alloc.o bindings.o kernel.o
>  always-$(CONFIG_RUST) +=3D exports_alloc_generated.h exports_helpers_gen=
erated.h \
> @@ -36,9 +33,15 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_ke=
rnel_generated_kunit.c
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated_kunit.=
o
> =20
> -# Avoids running `$(RUSTC)` for the sysroot when it may not be available=
.
> +# Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
> =20
> +libmacros_name :=3D $($(RUSTC) --print file-names --crate-name macros --=
crate-type proc-macro - < /dev/null)
> +libmacros_extension :=3D $(patsubst libmacros.%,%,$(libmacros_name))
> +
> +always-$(CONFIG_RUST) +=3D $(libmacros_name)
> +no-clean-files +=3D $(libmacros_name)
> +
>  # `$(rust_flags)` is passed in case the user added `--sysroot`.
>  rustc_sysroot :=3D $(shell MAKEFLAGS=3D $(RUSTC) $(rust_flags) --print s=
ysroot)
>  rustc_host_target :=3D $(shell $(RUSTC) --version --verbose | grep -F 'h=
ost: ' | cut -d' ' -f2)
> @@ -115,10 +118,10 @@ rustdoc-alloc: $(RUST_LIB_SRC)/alloc/src/lib.rs rus=
tdoc-core rustdoc-compiler_bu
>  	+$(call if_changed,rustdoc)
> =20
>  rustdoc-kernel: private rustc_target_flags =3D --extern alloc \
> -    --extern build_error --extern macros=3D$(objtree)/$(obj)/libmacros.s=
o \
> +    --extern build_error --extern macros=3D$(objtree)/$(obj)/$(libmacros=
_name) \
>      --extern bindings --extern uapi
>  rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
> -    rustdoc-compiler_builtins rustdoc-alloc $(obj)/libmacros.so \
> +    rustdoc-compiler_builtins rustdoc-alloc $(obj)/$(libmacros_name) \
>      $(obj)/bindings.o FORCE
>  	+$(call if_changed,rustdoc)
> =20
> @@ -339,10 +342,10 @@ quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUI=
ET) P $@
>  		-Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>  		--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --extern proc_macro =
\
>  		--crate-type proc-macro \
> -		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> +		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) $<
> =20
>  # Procedural macros can only be used with the `rustc` that compiled it.
> -$(obj)/libmacros.so: $(src)/macros/lib.rs FORCE
> +$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
>  	+$(call if_changed_dep,rustc_procmacro)
> =20
>  quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_=
QUIET)) L $@
> @@ -421,7 +424,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
>  $(obj)/kernel.o: private rustc_target_flags =3D --extern alloc \
>      --extern build_error --extern macros --extern bindings --extern uapi
>  $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.=
o \
> -    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
> +    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
>  	+$(call if_changed_rule,rustc_library)
> =20
>  endif # CONFIG_RUST
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index d2bc63cde8c6..3834ab0eea9d 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -9,6 +9,8 @@ import logging
>  import os
>  import pathlib
>  import sys
> +import os
> +import subprocess

import os is duplicated.

> =20
>  def args_crates_cfgs(cfgs):
>      crates_cfgs =3D {}
> @@ -35,8 +37,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):
>      crates_cfgs =3D args_crates_cfgs(cfgs)
> =20
>      def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse):
> -        crates_indexes[display_name] =3D len(crates)
> -        crates.append({
> +        crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
>              "is_workspace_member": is_workspace_member,
> @@ -47,7 +48,15 @@ def generate_crates(srctree, objtree, sysroot_src, ext=
ernal_src, cfgs):
>              "env": {
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
> -        })
> +        }
> +        if is_proc_macro:
> +            proc_macro_dylib_name =3D subprocess.check_output(
> +                [os.environ["RUSTC"], "--print", "file-names", "--crate-=
name", display_name, "--crate-type", "proc-macro", "-"],
> +                stdin=3Dsubprocess.DEVNULL,
> +            ).decode('utf-8')
> +            crate["proc_macro_dylib_path"] =3D f"{objtree}/rust/{proc_ma=
cro_dylib_name}"
> +        crates_indexes[display_name] =3D len(crates)
> +        crates.append(crate)
> =20
>      # First, the ones in `rust/` since they are a bit special.
>      append_crate(
> @@ -77,7 +86,6 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs):
>          [],
>          is_proc_macro=3DTrue,
>      )
> -    crates[-1]["proc_macro_dylib_path"] =3D f"{objtree}/rust/libmacros.s=
o"
> =20
>      append_crate(
>          "build_error",


