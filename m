Return-Path: <linux-kbuild+bounces-5141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D64569F2D52
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 10:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594D5188600E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 09:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A504D202C45;
	Mon, 16 Dec 2024 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="at0nShCd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B74202C49
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342570; cv=none; b=cStYelZDyzCjdOtl9HeZ4rdJ0+LjoLmMkHjzDN/UM7ErHqAjNj5hlNSaYl4VNNKxwERGOAnnH2DYoxgHhqpzJTOmMOvZ9SG95K8sUKurIrIAGueY060ql6RkdJaijwZo4ldYQoYQq7xYH0RF1i9B7axphctt/4ym83tueY27stA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342570; c=relaxed/simple;
	bh=m7eNLiwVcNr4VYpagf7Mnova2uj7RMSPCVLjI5B3ySE=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=s8XWgpBNlwt9VH1lj5NGEEvtNqnAQSia3/GqwMBxhLJn0Ez3ra1zhnG3W/7gMQwHo3RIWpPqALyYjk8KRZ+ZPHXM9h8HB5ZlmhGRySybnnv4WYpjDttqOmigybtkinfRRtDVwZw15dVTzq+PXfSHEBGf+Gx4ufcyGkpvdmS8XEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=at0nShCd; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241216094919euoutp0263c0115d12e23319cdbb6ddcc0408cb9~Rn16Btjv80824708247euoutp02B
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 09:49:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241216094919euoutp0263c0115d12e23319cdbb6ddcc0408cb9~Rn16Btjv80824708247euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734342559;
	bh=XHljTaUaYiVysuCWPyUfGB+8Ik7frnB4fcwKtwtnC/g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=at0nShCdJL0GTtBSHTRNptjTXwSxedCxbPh5tBUvcjelkilXAm2+C7znG8ij+HViX
	 gbpZLNIL9D+JduMeXKrAfiW1v50BzG3+DdcPMe28KL1t57MM8nJZ+IrUjFTx9V23kd
	 zKgdZ7vMTaaLbYweEGuq/h0CC8QZtrO6uC4/FBd4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241216094919eucas1p27866adc2c2fd5423cc14f6b08dd0bec9~Rn15pr6ww0427304273eucas1p2x;
	Mon, 16 Dec 2024 09:49:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 53.26.20821.F97FF576; Mon, 16
	Dec 2024 09:49:19 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241216094918eucas1p2a75ada2d0b07ac20a8025b40adae803b~Rn15Koe9L3043030430eucas1p2S;
	Mon, 16 Dec 2024 09:49:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241216094918eusmtrp29fba798fafb9ad9948181a193cdf62af~Rn15Jyoze2445024450eusmtrp2D;
	Mon, 16 Dec 2024 09:49:18 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-b6-675ff79fc7df
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id FC.67.19920.E97FF576; Mon, 16
	Dec 2024 09:49:18 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241216094918eusmtip266d3061b65016e4a03f412db49ad28f1~Rn149T70P2239522395eusmtip2q;
	Mon, 16 Dec 2024 09:49:18 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 16 Dec 2024 09:49:17 +0000
Date: Mon, 16 Dec 2024 10:49:17 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Tamir Duberstein <tamird@gmail.com>, Masahiro Yamada
	<masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
	Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>, Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH RESEND v6] rust: use host dylib naming convention
Message-ID: <20241216094917.m265abadlg7boqip@AALNPWDAGOMEZ1.aal.scsc.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105-b4-dylib-host-macos-v6-1-4e66515e6630@gmail.com>
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNKsWRmVeSWpSXmKPExsWy7djPc7rzv8enG1zdxmNx5/4TVou/s7ez
	W5y43sRi8eFaE6vFjQv7mS3WbGlksrh45jWjxZ9dO5gsLu+aw2bx8MENVou96y+zWbSvfMpm
	8WzvCVaLlfOXM1qsf3aY2eLHmT3sFme3nWJ3EPTYdWgzm8eSzl9MHjtn3WX3WLCp1GPTqk42
	j3md85g8vrfvYfPoadvE5PH2RB+rx+dNcgFcUVw2Kak5mWWpRfp2CVwZrw69Zitocq84Pv0o
	SwPjUcsuRk4OCQETiUktl5i6GLk4hARWMEo8WfqRFcL5wijx6cdfZgjnM6PEosUP2boYOcBa
	bp7nhIgvZ5RYtesUK1zRkxlHWCCczYwSk68/ZgFZwiKgKvH3WB8ziM0moCmx7+QmdpAiEYH/
	zBJL7xwAa2cWaGWUaLtzmx2kSljAVeLlpvdsIDavgLfEjC1XmSFsQYmTM5+ATWUW0JFYsPsT
	2E3MAtISy/9xgIQ5Bdwltvy+xgTxnaLEjIkrWSDsWolTW26BfSohcI9TYkXndCaIf1wkrr03
	gKgRlnh1fAs7hC0j8X/nfKg56RJL1s2CmlMgsef2LFaIVmuJvjM5EGFHiYbOJnaIMJ/EjbeC
	EEfySUzaNp0ZIswr0dEmBFGtJrH63huWCYzKs5C8NQvJW7MQ3lrAyLyKUTy1tDg3PbXYMC+1
	XK84Mbe4NC9dLzk/dxMjMP2d/nf80w7Gua8+6h1iZOJgPMQowcGsJMJbYxKbLsSbklhZlVqU
	H19UmpNafIhRmoNFSZxXNUU+VUggPbEkNTs1tSC1CCbLxMEp1cCk43Tm9CVLrrdfW6849W6u
	eWCwR+L6ZeesV4/uTjnkyinIdMr4nlCq1UbOpZ7ln7Zce/FpS9IrvVPL8yWVjFkv75avDfm4
	3nrOnFuPLWZ8KChnczfU3RVvf01j8qeQHXJvZLsmBHHwlzYZlSfOuC2QppC4wDP/LucGBftq
	kc2hxt/PbBBd9vRI8ZIjapMdy6xUxa5MviLYuydYn3XK1Pm/F737f9MhtnnX/cs/DK5OLrvS
	dkdEnyEyvE0o66K2n/b1R393S2/1NpxSvjvHbPNqAUVB/0dlET6aSmdf8q54dvH2ZSu9Wq+e
	LseSAtO3E5yPbXQ8+2tWxPsp5fXvnlizc16eFZzalOV6qaH86iEeJZbijERDLeai4kQAq9sC
	T+4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xe7rzvsenG1y5pWtx5/4TVou/s7ez
	W5y43sRi8eFaE6vFjQv7mS3WbGlksrh45jWjxZ9dO5gsLu+aw2bx8MENVou96y+zWbSvfMpm
	8WzvCVaLlfOXM1qsf3aY2eLHmT3sFme3nWJ3EPTYdWgzm8eSzl9MHjtn3WX3WLCp1GPTqk42
	j3md85g8vrfvYfPoadvE5PH2RB+rx+dNcgFcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaW
	eobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZrw69Zitocq84Pv0oSwPjUcsuRg4OCQETiZvnObsY
	OTmEBJYySjztjwOxJQRkJDZ+ucoKYQtL/LnWxdbFyAVU85FR4v6ZB4wQzmZGiYYjx5hAqlgE
	VCX+HutjBrHZBDQl9p3cxA5SJCLwn1ni8+zvYO3MAq2MEm13brODVAkLuEq83PSeDcTmFfCW
	mLHlKjPEHW4SLw7vZIeIC0qcnPmEBcRmFtCRWLD7ExvI2cwC0hLL/3GAhDkF3CW2/L7GBHGq
	osSMiStZIOxaic9/nzFOYBSehWTSLCSTZiFMWsDIvIpRJLW0ODc9t9hQrzgxt7g0L10vOT93
	EyMwDWw79nPzDsZ5rz7qHWJk4mA8xCjBwawkwltjEpsuxJuSWFmVWpQfX1Sak1p8iNEUGBYT
	maVEk/OBiSivJN7QzMDU0MTM0sDU0sxYSZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5OqQamTcsE
	+oW6efIreU3qJfI0/N8fmNgVJRfqK8tQ86jnbtilNZObln7undVjaSSbc/y/6aeYxWJ3xA9P
	EJtnnm8w+VZKzu0vZrYnml563H0ZFvTk69YJASuYj9+Ysl2p6eSNeaEb6q3d9uftWW7HvZfd
	/pfGp/CEts837L9HTeLs2v2Bb9LUU29WLTbQDstZtikvvLHy/hOxB8Yvskq+Bp2omfdJqObx
	4tN/zWZI2j+OfNeX9u9oKuMHizSBrK97dm+5IRZ//+nNuvn8+hn5a7PiTgrOMPmdEq0n1zD3
	1qSvm/lrpLoWfa//8+iB3e311jbsGYu6VkncYBPStX05YSHP7EmOzHITrJdNvxtXFrQtRYml
	OCPRUIu5qDgRAMLUlZmMAwAA
X-CMS-MailID: 20241216094918eucas1p2a75ada2d0b07ac20a8025b40adae803b
X-Msg-Generator: CA
X-RootMTR: 20241216094918eucas1p2a75ada2d0b07ac20a8025b40adae803b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241216094918eucas1p2a75ada2d0b07ac20a8025b40adae803b
References: <20241105-b4-dylib-host-macos-v6-1-4e66515e6630@gmail.com>
	<CGME20241216094918eucas1p2a75ada2d0b07ac20a8025b40adae803b@eucas1p2.samsung.com>

On Tue, Nov 05, 2024 at 08:05:43AM -0400, Tamir Duberstein wrote:
> Because the `macros` crate exposes procedural macros, it must be
> compiled as a dynamic library (so it can be loaded by the compiler at
> compile-time).
> 
> Before this change the resulting artifact was always named
> `libmacros.so`, which works on hosts where this matches the naming
> convention for dynamic libraries. However the proper name on macOS would
> be `libmacros.dylib`.
> 
> This turns out to matter even when the dependency is passed with a path
> (`--extern macros=path/to/libmacros.so` rather than `--extern macros`)
> because rustc uses the file name to infer the type of the library (see
> link). This is because there's no way to specify both the path to and
> the type of the external library via CLI flags. The compiler could
> speculatively parse the file to determine its type, but it does not do
> so today.
> 
> This means that libraries that match neither rustc's naming convention
> for static libraries nor the platform's naming convention for dynamic
> libraries are *rejected*.
> 
> The only solution I've found is to follow the host platform's naming
> convention. This patch does that by querying the compiler to determine
> the appropriate name for the artifact. This allows the kernel to build
> with CONFIG_RUST=y on macOS.
> 
> Link: https://github.com/rust-lang/rust/blob/d829780/compiler/rustc_metadata/src/locator.rs#L728-L752
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

This works for me. In macOS, I've built the rnull driver as built-in and
as module.

Tested-by: Daniel Gomez <da.gomez@samsung.com>

Thanks,
Daniel

> ---
> V5 -> V6: Removed setting `no-clean-files`. Rewrote description.
> e4 -> V5: Added missing `shell` in rust/Makefile.
> V3 -> V4: Added motivation. Added missing Signed-off-by.
> V2 -> V3: Added .strip() to rustc output to remove errant newline.
> V1 -> V2: De-duplicated and sorted imports. Changed Signed-off-by to
> Co-developed-by.
> ---
>  .gitignore                        |  1 +
>  Makefile                          |  2 +-
>  rust/Makefile                     | 20 +++++++++++---------
>  scripts/generate_rust_analyzer.py | 15 +++++++++++----
>  4 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index a61e4778d011cf706e6784818a1357f392f3a669..088696a6a46a12fdb77eb9ccab5b6b7b11ef4707 100644
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
> index a9e723cb05961877d5e6b50920dcabc78cf4988f..470e6f20c513bf0f90a42c586aa92dd7a8b16fb0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1513,7 +1513,7 @@ MRPROPER_FILES += include/config include/generated          \
>  		  certs/x509.genkey \
>  		  vmlinux-gdb.py \
>  		  rpmbuild \
> -		  rust/libmacros.so
> +		  rust/libmacros.so rust/libmacros.dylib
>  
>  # clean - Delete most, but leave enough to build external modules
>  #
> diff --git a/rust/Makefile b/rust/Makefile
> index 3678e79317f12d7116ad0c2ac1ca416ee5b969aa..0d882103375aa45be78e22f59c64739c8722fd98 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -11,9 +11,6 @@ always-$(CONFIG_RUST) += exports_core_generated.h
>  obj-$(CONFIG_RUST) += helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
>  
> -always-$(CONFIG_RUST) += libmacros.so
> -no-clean-files += libmacros.so
> -
>  always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
>  obj-$(CONFIG_RUST) += bindings.o kernel.o
>  always-$(CONFIG_RUST) += exports_helpers_generated.h \
> @@ -36,9 +33,14 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
>  obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
>  
> -# Avoids running `$(RUSTC)` for the sysroot when it may not be available.
> +# Avoids running `$(RUSTC)` when it may not be available.
>  ifdef CONFIG_RUST
>  
> +libmacros_name := $(shell $(RUSTC) --print file-names --crate-name macros --crate-type proc-macro - < /dev/null)
> +libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
> +
> +always-$(CONFIG_RUST) += $(libmacros_name)
> +
>  # `$(rust_flags)` is passed in case the user added `--sysroot`.
>  rustc_sysroot := $(shell MAKEFLAGS= $(RUSTC) $(rust_flags) --print sysroot)
>  rustc_host_target := $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
> @@ -104,10 +106,10 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
>  	+$(call if_changed,rustdoc)
>  
>  rustdoc-kernel: private rustc_target_flags = \
> -    --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so \
> +    --extern build_error --extern macros \
>      --extern bindings --extern uapi
>  rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
> -    rustdoc-compiler_builtins $(obj)/libmacros.so \
> +    rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
>      $(obj)/bindings.o FORCE
>  	+$(call if_changed,rustdoc)
>  
> @@ -325,10 +327,10 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
>  		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>  		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
>  		--crate-type proc-macro \
> -		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> +		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) $<
>  
>  # Procedural macros can only be used with the `rustc` that compiled it.
> -$(obj)/libmacros.so: $(src)/macros/lib.rs FORCE
> +$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
>  	+$(call if_changed_dep,rustc_procmacro)
>  
>  quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
> @@ -401,7 +403,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
>  $(obj)/kernel.o: private rustc_target_flags = \
>      --extern build_error --extern macros --extern bindings --extern uapi
>  $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
> -    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
> +    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
>  	+$(call if_changed_rule,rustc_library)
>  
>  endif # CONFIG_RUST
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index 09e1d166d8d236fcf8c2b2375624b243ebf6e7f7..aa8ea1a4dbe5f9037c8c231d87ddc8d95c297f12 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -8,6 +8,7 @@ import json
>  import logging
>  import os
>  import pathlib
> +import subprocess
>  import sys
>  
>  def args_crates_cfgs(cfgs):
> @@ -35,8 +36,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>      crates_cfgs = args_crates_cfgs(cfgs)
>  
>      def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
> -        crates_indexes[display_name] = len(crates)
> -        crates.append({
> +        crate = {
>              "display_name": display_name,
>              "root_module": str(root_module),
>              "is_workspace_member": is_workspace_member,
> @@ -47,7 +47,15 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>              "env": {
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
> -        })
> +        }
> +        if is_proc_macro:
> +            proc_macro_dylib_name = subprocess.check_output(
> +                [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
> +                stdin=subprocess.DEVNULL,
> +            ).decode('utf-8').strip()
> +            crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
> +        crates_indexes[display_name] = len(crates)
> +        crates.append(crate)
>  
>      # First, the ones in `rust/` since they are a bit special.
>      append_crate(
> @@ -70,7 +78,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>          [],
>          is_proc_macro=True,
>      )
> -    crates[-1]["proc_macro_dylib_path"] = f"{objtree}/rust/libmacros.so"
>  
>      append_crate(
>          "build_error",
> 
> ---
> base-commit: 6ce162a002657910104c7a07fb50017681bc476c
> change-id: 20241016-b4-dylib-host-macos-16757c350b49
> 
> Best regards,
> -----BEGIN SSH SIGNATURE-----
> U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7h
> JgsMRt+XVZTrIzMVIAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
> AAAAQFg99wbgHLYJEpFzt5B+h6GLMb65HtsNoryxz5lkEldZ7z5BEXUUDiFLlDnDu8jlkv
> SiANzyz5noKnp8NCgIxQk=
> -----END SSH SIGNATURE-----
> -- 
> Tamir Duberstein <tamird@gmail.com>
> 

