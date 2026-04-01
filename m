Return-Path: <linux-kbuild+bounces-12462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA5QOh+0zGlWVwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12462-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 07:58:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A0375008
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 07:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01203307D4C5
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 05:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73AC2F3C37;
	Wed,  1 Apr 2026 05:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="miOiiczj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8906328B61
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 05:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022837; cv=none; b=hePOwE5BV/j5BowiHHYDW6ZiJ6ZTQY/kazbK49v2fCl5oM6kJ9uFaqwbfRewAzvpKiDi0aR3MOnQ2A+FVG7AM6tXs62zfPR2uzKZ86voWWROrv2bVsVReoci1h7I2gsLo1A+nH2BUHJrzulJ2m+w/k8sxseRgSSd+5O/3bVvXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022837; c=relaxed/simple;
	bh=g2FoQjD+ArNIPRI0HL34xQaUJLyLkCq+KRxmtHtpMeg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To:
	 References:In-Reply-To; b=H/nx/gincQ763CiW46Qu6ONnsMFbY9zRakrat9PgELhDUuioqgQiUrQbq+wAU6CAY8qLqgujnf1CL0eB5yTTFuzkyC0JzHAAvtK5oaTe3uyqAwovhfduAdm1d7ruV9ZHUaAEIZYrwr9T2iWz0160lOpFbU/4tr8dtHNPu/f1EX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=miOiiczj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so7629385e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 22:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775022834; x=1775627634; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB7/8kUkGjpEbBIqSBg4jtEPus045GV075WAdXE0OaU=;
        b=miOiiczjl+VIf5jZ1SvdCFwI9wqlPFLwyiQuvl1aznCpFaTCrj9zlMQW7b7byeIrR2
         ezSXGp1bKSkGxm7b4btUCigPC4NrjxcxZX7YMbtervBsy2JIdiINEzLY9obrWMh+tHCI
         6Shyofb6VIWb9sj5rgxnYtea8+tr80h2ZkoTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775022834; x=1775627634;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XB7/8kUkGjpEbBIqSBg4jtEPus045GV075WAdXE0OaU=;
        b=NdCJXoQ9/OPagzhBhHzK75berrcujfPN2LoKRziNUNUtHGSuKhC9MR+c23nO1NC7tq
         rGPv0oMkgyJX58kYVj+5kZE/3LNAotGkxIhodujR554t3MyZywm3YqMQ2wRPWI/DoVfp
         bhWDxs7wILKEb41Tmq9jQeN6Z4AkQMKCAPbriY8gk84dXOQwiuQRQhHCNgqwE2VTbQsW
         a9qXQSAlgcvBp0xDpfWnQAwaBkiX5L4OWHaZk4RDAMWPCsmtuEFj9Jock/1n+1+oUI3F
         qQo8QJKurO7/LxspmQheK6yMTOmSDwj/IAczxeHd95g501hHxf9WEbzAcEwF8kf//Ue9
         pDog==
X-Gm-Message-State: AOJu0YxAuLsp+6Dldj/z8KhpWuOGoMtYCdIK3zFkNRjolqfnOdBT2jGt
	pcotEh4nAOsYZ5vgYfKUWWak7KoQc4I6JnhYvIOTI4dqEFe0xsxEbSz4k7uFIj9esDc=
X-Gm-Gg: ATEYQzxuma+lFjTjTvHf2Vuz+BGDYr76AduDyvr5A9Fyv2Th62+Ot8xLJMqapteVEzg
	yMUSK1OUYC6FKUdYISegMbGJat4eyRdUn7G3qQVsMzR6oxYTNaSs28ICiPYdsjikItcHTxnwput
	iXo4yzlQr0wlV70gKcvswXDlsIJvAGctHURDFXOFj7nt+c+eeUD8KWNDQm6QG+x5UpHH22MN9uq
	Sx75qMYb6BeaId6NYhbrvWTtM0+h5Msw4Y8yXK+Ezv/YqhtdNIKW0ACdBRJMi4bZ+mzgoHMX5Qa
	6o/kIRN8hCmgOGSUzF1kjKe/pT3RhXMuJb1BehiKA6VRAbqnnPfr+u5ENDC1T6b1Oe7cdLBaW/E
	PvDv0HM6YqbsoyOFdrUI8RTA0vUKqLx+i6NeWMwAQPJ9AShw/K/vbBCUvcsdsRMre1URH6gsAit
	xgXibUvc3PmrNgW0sn2btSeypKw7Qt0TuSgLcBsu2B7dGM2Q/QAncpoBOg9jPRzN5fKVr223sTl
	V8qlRtUTYRU
X-Received: by 2002:a05:6000:1789:b0:439:f605:afde with SMTP id ffacd0b85a97d-43d1511182dmr4123708f8f.51.1775022834019;
        Tue, 31 Mar 2026 22:53:54 -0700 (PDT)
Received: from localhost (2a02-8440-250e-3787-955e-4c3b-8b0d-0555.rev.sfr.net. [2a02:8440:250e:3787:955e:4c3b:8b0d:555])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2a7asm35560544f8f.7.2026.03.31.22.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 07:53:52 +0200
Message-Id: <DHHL2VVCVYHU.5RMX7GJ73MDR@smile.fr>
Subject: Re: [PATCH v6] kbuild: host: use single executable for rustc -C
 linker
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Mohamad Alsadhan" <mo@sdhn.cc>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260331000802.380-1-mo@sdhn.cc>
In-Reply-To: <20260331000802.380-1-mo@sdhn.cc>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[smile.fr,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[smile.fr:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12462-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[sdhn.cc,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[smile.fr:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yoann.congal@smile.fr,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fr:dkim,smile.fr:email,smile.fr:mid,sdhn.cc:email]
X-Rspamd-Queue-Id: 433A0375008
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 31, 2026 at 2:08 AM CEST, Mohamad Alsadhan wrote:
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

I tested this patch in the original environnement for the issue : a
ccache-enabled Yocto build. It works. Thanks!

Tested-by: Yoann Congal <yoann.congal@smile.fr>

> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> ---
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
> ---
>  Makefile              |  3 ++-
>  rust/Makefile         |  8 +++++---
>  scripts/.gitignore    |  1 +
>  scripts/Makefile.host | 23 +++++++++++++++++++++--
>  4 files changed, 29 insertions(+), 6 deletions(-)
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
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..77a76c1d1 100644
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
> +		'exec $(call escsq,$(HOSTRUSTC_LD)) "$$@"'
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
> +		 -Clinker-flavor=3Dgcc -Clinker=3Dscripts/rustc-wrapper \

Does using "scripts/" without a $(obj)/$(srctree)/... prefix always works?
I know I've suggested this as a quick fix. But I did not think about it
a lot.

>  		 -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> @@ -153,7 +172,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
>  quiet_cmd_host-rust	=3D HOSTRUSTC $@
>        cmd_host-rust	=3D \
>  	$(HOSTRUSTC) $(hostrust_flags) --emit=3Dlink=3D$@ $<
> -$(host-rust): $(obj)/%: $(src)/%.rs FORCE
> +$(host-rust): $(obj)/%: $(src)/%.rs $(obj)/rustc-wrapper FORCE
>  	+$(call if_changed_dep,host-rust)
> =20
>  targets +=3D $(host-csingle) $(host-cmulti) $(host-cobjs) \


--=20
Yoann Congal
Smile ECS


