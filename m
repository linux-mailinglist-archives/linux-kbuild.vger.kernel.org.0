Return-Path: <linux-kbuild+bounces-12813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFZtC3Lo4WmKzgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12813-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 09:59:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD93418526
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 09:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC4C43008D69
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 07:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19D43644D7;
	Fri, 17 Apr 2026 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="q3xaMSW2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D63363C5A
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412764; cv=none; b=exUAqqp+PVegJajYbtMJHuo4Ffb/mJwudU4vJdmvVsrzZ8z5f2laYUF1JK/LAzTdlUxcOtbLLnlHJXy/fq1slDQPPWx519pNVQai2uLmdN0Fw0QiPVZiySB6FIH1NHdZWZTWEo0L0cSaCklkSbb7da1MtAAvmVWt2Faxm9ebrJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412764; c=relaxed/simple;
	bh=b73RzdUS/AhXKTeo9UxaTSG1AzRzQnQfKScZhyngb4s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:Cc:
	 References:In-Reply-To; b=fWk4E7JEMEw58kF8QH8fXbgZPI+UlALVrW+l0G0tAwj44Le7Q+x6u8Nvh20iEPMH47pXpf7dylFQLBS6PKLQ9HVilZTrt+oGO4Jvav8GvdR8VM/m/QlIfT6HPVGEhKDHNd7ivNr3m2lWxC2tVr02ANkNnNWw2CLQ04dWgQBrp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=q3xaMSW2; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso5092625e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2026 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776412759; x=1777017559; darn=vger.kernel.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31UWIJM9A6eAc2iRDPL1yGS0uLREp+NPbJkYvqiAyi0=;
        b=q3xaMSW2QvNv+ZvGl8YGdNDqw4G0cB6OtCR3v6w6FHpzTzouQGnnnKo+I+ulQRKDF4
         9x7H3mXkcjqykSTKxKeEGZ2K1mxtZj+FxO8P2+WECxVE1IfaxV005LVp1b6pDhyCjMlE
         OnuRwXz7SLiHTU6Pzl61pRfoCdGa/QRTVtOF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412759; x=1777017559;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31UWIJM9A6eAc2iRDPL1yGS0uLREp+NPbJkYvqiAyi0=;
        b=Qn9eMHhJVvJKYrVwC0rrGTA53E49N773CYLISfXB2QGSS1lgTBN/2fJejks4G4w2Ed
         bG3+eQR9uRezL59CjqaJzyvLxBk+6fseWA9Qw7VFuCj/XrQVHId1igi75lLnZMsePZ+g
         VY3tGk/OV5nwzV8f1kb3/cNukHMrkByUGb3ZmVorc/jVtfmT3/biYrQ2JntZXFNozxf6
         x1XrgDw1N9P7FWwSaS4VPHF40/zQaAjK2XZOAxJQ8RNmApzfNal6dQcUQryKmEeUOMAx
         fLB7iViG5jr4InDPW5uyASLShnral2dmp/TmMtA0kyRIanyvWJi6g6p/32BoLHUI2wzr
         TanQ==
X-Gm-Message-State: AOJu0YyWkN8L8yXvTCYvhZMUD7Zkmzi1XwvywfloCKvtxq9t5nloOCLL
	pHT2xKCVhOpZ5J9jXWpgJaed5eV3FDNggKn2qs4328HaoY50RcWgJcwt25Sntdov1Ao=
X-Gm-Gg: AeBDietH1UXaJ320+IKGiqCXD/UyMyTVIDDGlj7gSu/V9K8KhTeKmZ2eFLUXp/OGgFl
	1i7dOToNtE8XuMohf6nV1YmpMiweM1JTYlJLInUV5WL1792pG0DS3tsJkCIxNyP5PnILtMxCe6x
	CBdWrCktbRJuXxIdZ5o/NdrjzOaTCrk1OhRQVjlFpJbXf5HoYUqamEaIbtxwnVqrDi+6yKxBfZD
	J60WwVNB5etpH7wkvfjFJ//L4+JTe7tNjp6TMRzbTP7xVp7GuUZCtG1G8k1hBY6utgPXgkjxJO3
	8qPuN/cj3tNyREDftaN+FvExNZISMscTAFkglHqLl/FZrHUfIlX/D+awn1MzfhABcLsWxMUVNak
	rN50Zzx9nifeootEhOY8xGbQPYs4vvlzY51Bd+X8BX6PjMA3IFnpy5lO4F4AskBWNWyXv/g/sN+
	K011ojbEehxePFlqbOJY3X3YkTwMLuGiluFa4FZAH0OF6dimlLnfm/69Stih/fQ/B5lMrMI/2zZ
	svyh7dp+WzPd1CGObcbajU0aw==
X-Received: by 2002:a05:600c:1e28:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488fb77fbf3mr22693185e9.20.1776412759199;
        Fri, 17 Apr 2026 00:59:19 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc189f2esm40534265e9.7.2026.04.17.00.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 09:59:17 +0200
Message-Id: <DHV9RMX3PLT6.JO8708PRE7S@smile.fr>
To: "Mohamad Alsadhan" <mo@sdhn.cc>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7] kbuild: host: use single executable for rustc -C
 linker
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260416211525.13847-1-mo@sdhn.cc>
In-Reply-To: <20260416211525.13847-1-mo@sdhn.cc>
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MV_CASE(0.50)[];
	URIBL_RED(0.50)[sdhn.cc:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ANON_DOMAIN(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12813-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[smile.fr:s=google];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[smile.fr,reject];
	FREEMAIL_TO(0.00)[sdhn.cc,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	DKIM_TRACE(0.00)[smile.fr:+];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.340];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yoann.congal@smile.fr,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smile.fr:email,smile.fr:dkim,smile.fr:mid,sdhn.cc:email,o.map:url]
X-Rspamd-Queue-Id: BCD93418526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 16, 2026 at 11:15 PM CEST, Mohamad Alsadhan wrote:
> rustc's -C linker=3D option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=3D$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
>
>   error: multiple input filenames provided ...
>
> Generate a small wrapper script and pass it to -Clinker e.g.
>
>   ```
>   #!/bin/sh
>   exec ccache gcc "$@"
>   ```
>
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
>
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

This does work on my ccache-enabled Yocto build, so:
Tested-by: Yoann Congal <yoann.congal@smile.fr>

Thanks!

> ---
> v6 -> v7:
>   - Always generate `scripts/rustc-wrapper` when `CONFIG_RUST=3Dy`,
>     including cases with no Rust host programs in `scripts/`.
>   - Use `$(obj)/rustc-wrapper` for host Rust programs, fixing builds
>     outside `scripts/`, e.g. `samples/rust/hostprogs/`.
>   - remove leading exec (again) to allow leading env vars e.g.
>     HOSTRUSTC_LD=3D"VAR=3DVAL ccache gcc".
>   - Track, clean and ignore generated wrapper as needed.
>
> v5 -> v6:
>   - Add fix to `rust/Makefile` as well (Yoann)
>   - Include script to `.gitignore` and make clean (Nicolas)
>   - Add back the outer `exec` to the command
>
> v4 -> v5:
>   - Fix word splitting issues
>   - Remove unnecessary `exec sh -c` and simplify generated script
>
> v3 -> v4:
>   - Use filechk instead of if_changed macro to regenerate script
>   - Remove trailing space at EOL
>
> v2 -> v3:
>   - Scrap previous hacky approaches (e.g. using lastword) and go with
>     a proper fix (Gary) which turned out not that complex to
>     implement.
>
> v1 -> v2:
>   - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
>   - Introduce explicit HOSTRUSTC_LD override
>   - Warn when falling back due to multi-argument HOSTCC
>   - Error out if a user-specified HOSTRUSTC_LD is not an executable
>
> v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
> v2: https://lore.kernel.org/all/20260227132713.23106-1-mo@sdhn.cc/
> v3: https://lore.kernel.org/all/20260312002852.11292-1-mo@sdhn.cc/
> v4: https://lore.kernel.org/all/20260317112021.14353-1-mo@sdhn.cc/
> v5: https://lore.kernel.org/all/20260321150034.9915-1-mo@sdhn.cc/
> v6: https://lore.kernel.org/all/20260331000802.380-1-mo@sdhn.cc/
> ---
>  Makefile                          |  3 ++-
>  rust/Makefile                     |  8 +++++---
>  samples/rust/hostprogs/.gitignore |  1 +
>  samples/rust/hostprogs/Makefile   |  2 ++
>  scripts/.gitignore                |  1 +
>  scripts/Makefile                  |  3 +++
>  scripts/Makefile.host             | 26 +++++++++++++++++++++++---
>  7 files changed, 37 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1a219bf1c..5ebeef67f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1651,7 +1651,8 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
>  	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>  	       compile_commands.json rust/test \
>  	       rust-project.json .vmlinux.objs .vmlinux.export.c \
> -               .builtin-dtbs-list .builtin-dtb.S
> +               .builtin-dtbs-list .builtin-dtb.S \
> +	       scripts/rustc-wrapper
> =20
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
> diff --git a/rust/Makefile b/rust/Makefile
> index 5eca6a817..6bc761a31 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -565,7 +565,7 @@ $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote=
.rlib FORCE
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>  	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
> -		-Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +		-Clinker-flavor=3Dgcc -Clinker=3Dscripts/rustc-wrapper \
>  		-Clink-args=3D'$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
>  		--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --extern proc_macro =
\
>  		--crate-type proc-macro -L$(objtree)/$(obj) \
> @@ -576,12 +576,14 @@ quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUI=
ET) P $@
>  $(obj)/$(libmacros_name): private rustc_target_flags =3D \
>      --extern proc_macro2 --extern quote --extern syn
>  $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rli=
b \
> -    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
> +    $(obj)/libquote.rlib $(obj)/libsyn.rlib \
> +    scripts/rustc-wrapper FORCE
>  	+$(call if_changed_dep,rustc_procmacro)
> =20
>  $(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D $(pi=
n_init_internal-flags)
>  $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 \
> -    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib F=
ORCE
> +    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib \
> +    scripts/rustc-wrapper FORCE
>  	+$(call if_changed_dep,rustc_procmacro)
> =20
>  # `rustc` requires `-Zunstable-options` to use custom target specificati=
ons
> diff --git a/samples/rust/hostprogs/.gitignore b/samples/rust/hostprogs/.=
gitignore
> index a6c173da5..d88a75790 100644
> --- a/samples/rust/hostprogs/.gitignore
> +++ b/samples/rust/hostprogs/.gitignore
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
>  single
> +rustc-wrapper
> diff --git a/samples/rust/hostprogs/Makefile b/samples/rust/hostprogs/Mak=
efile
> index 8ddcbd741..9c9663a77 100644
> --- a/samples/rust/hostprogs/Makefile
> +++ b/samples/rust/hostprogs/Makefile
> @@ -3,3 +3,5 @@
>  hostprogs-always-y :=3D single
> =20
>  single-rust :=3D y
> +
> +clean-files +=3D rustc-wrapper
> diff --git a/scripts/.gitignore b/scripts/.gitignore
> index 4215c2208..b3948b148 100644
> --- a/scripts/.gitignore
> +++ b/scripts/.gitignore
> @@ -6,6 +6,7 @@
>  /kallsyms
>  /module.lds
>  /recordmcount
> +/rustc-wrapper
>  /rustdoc_test_builder
>  /rustdoc_test_gen
>  /sign-file
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 0941e5ce7..287421322 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -29,6 +29,9 @@ generate_rust_target-rust :=3D y
>  rustdoc_test_builder-rust :=3D y
>  rustdoc_test_gen-rust :=3D y
> =20
> +always-$(CONFIG_RUST) +=3D rustc-wrapper
> +clean-files +=3D rustc-wrapper
> +
>  HOSTCFLAGS_tracepoint-update.o =3D -I$(srctree)/tools/include
>  HOSTCFLAGS_elf-parse.o =3D -I$(srctree)/tools/include
>  HOSTCFLAGS_sorttable.o =3D -I$(srctree)/tools/include
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..84fd87a53 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,30 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
> =20
> +# rustc's `-Clinker=3D` expects a single executable path, not a command =
line.
> +# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"),=
 which
> +# would otherwise be split by the shell and mis-parsed by rustc.
> +# To work around this, we generate a wrapper script that forwards argume=
nts to
> +# `HOSTRUSTC_LD` so that such commands can be used safely.
> +#
> +# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
> +HOSTRUSTC_LD ?=3D $(HOSTCC)
> +
> +define filechk_rustc-wrapper
> +	printf "%s\n" \
> +		'#!/bin/sh' \
> +		'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'
> +endef
> +
> +$(obj)/rustc-wrapper: FORCE
> +	$(call filechk,rustc-wrapper)
> +	$(Q)chmod +x $@
> +
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> -		 -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +		 -Clinker-flavor=3Dgcc -Clinker=3D$(obj)/rustc-wrapper \
>  		 -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> @@ -153,10 +172,11 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
>  quiet_cmd_host-rust	=3D HOSTRUSTC $@
>        cmd_host-rust	=3D \
>  	$(HOSTRUSTC) $(hostrust_flags) --emit=3Dlink=3D$@ $<
> -$(host-rust): $(obj)/%: $(src)/%.rs FORCE
> +$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
>  	+$(call if_changed_dep,host-rust)
> =20
> -targets +=3D $(host-csingle) $(host-cmulti) $(host-cobjs) \
> +targets +=3D $(obj)/rustc-wrapper \
> +	   $(host-csingle) $(host-cmulti) $(host-cobjs) \
>  	   $(host-cxxmulti) $(host-cxxobjs) $(host-rust)
> =20
>  # %.lex.o <- %.lex.c <- %.l


--=20
Yoann Congal
Smile ECS


