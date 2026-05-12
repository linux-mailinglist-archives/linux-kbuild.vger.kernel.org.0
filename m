Return-Path: <linux-kbuild+bounces-13129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGyDLjxkA2oq5gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13129-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 19:32:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3475525DCA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 19:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11904301348A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 17:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93B732E137;
	Tue, 12 May 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="zf928kZ5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF0C2F8BF0
	for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607154; cv=none; b=HbadPqI0Dg0SDd4XatRqfvbZFcZd1mqKFM5/+Dho9SVgBeb7Uij3DaO8gUtka+Mlw/YTkpH5xUQi+SY4+brXqbhk6hXb+vuxSuYmughZECE/e6NzaALwxmbQPyEa6y6mQtjJzlOOGB5F7dvd3jSLSdQpv+hccoSSF8zJZA/llxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607154; c=relaxed/simple;
	bh=wasTAmUnlPHCWNCO1NNzU/7RXRKLWVuTlOQ4LM5T3EI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Cc:To:Subject:
	 References:In-Reply-To; b=NAGQagVl4HdEoPKcrQGfMvDTLdo4FryDpnMWSh8hsTKQowdP+FQM3imQwdk6c5/BZyyIgZeAxDju7WgDH4AGcjUlCtO0lhLS8ngau4pjOgCHFlINVu6+M5AwFrI7hm/9DlVim1wr/pRH46Q30HSPHS0lpzXHYdT+koUdkbEuPVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=zf928kZ5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44b052142e1so3274778f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2026 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778607151; x=1779211951; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDkgxRYYpSgkWTPDWm99tv97/cJvBdRz9u+9Ggr+frk=;
        b=zf928kZ5FBN/RXWnCmTbXrpGCB7aSBgMeW7pXqJOJB45KMQvvcvdKoP8dR1OrwKhe+
         rgs4RdIaI2+nmwhYLYnq6nuzq6/5ZvtQGHF+SZRHs7MQOUZ73c1IamkgFTY8cHY/W/td
         OV7HDJLM87fbj+/LQbH1TQ7og3fzySa/bQ2QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607151; x=1779211951;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDkgxRYYpSgkWTPDWm99tv97/cJvBdRz9u+9Ggr+frk=;
        b=LpxDsJn9GUMKIrSv3KUZP9AYxilIHkEA7nU0pw1taJw+mAO8ZGZjOCIj1h9Bo5CfTS
         /pyVUPYGv1P+NLNwio9NxPnnhOOHGFkntdzDJiZqJOjqp/brz56D9HvYYsAvYwW4CwAL
         tpzcdxBIn1v2bFfFx8w73Nul25d54in3Y2/Jv+bYlGhUCI8e7WkN1gKFwZbw0ZqfBnQk
         aFZxNFufZPrX8EppKBMd/Z84f5t9sN5d0DbyTnoarZfbuRw+ORCTnN0fBhTXQWtwRvwM
         W13tERsPNuxg4WQqLAhgbBo32TXZRqZNW4jcZtzvshduCfc1MlMvHE8NtTF03f2/oAAT
         RX2A==
X-Gm-Message-State: AOJu0YxU+8dzRoPlviVOQOnyDm3rzaeQIhZDU33xuFBtN1X/3ft1vUTB
	iChzwUzeTMPMIHLd0tli2iXM5E+OsQkczU6XuBS2VnKKSJcTYW3wb0GydVACq+rNbEZPsgUR+3Q
	jFlwIeo4q4A==
X-Gm-Gg: Acq92OHfaRbTics+Rr/GMDGK97vVP5ePfPfJ9AqLhduuFk9Ie79VmUrb473gvGZ3q3C
	80PGNvlYPHi9MUI2Va4ON4G2564ysKrXV8A64qEXBPrwAeDC90I4C5EKPIO7NhBOOe7/+Q/QD83
	TCVMdON/64p/KygK+3zdWjTCmQavbZfwePWxVuqmFsoR9hHBzMj6b/SbrmE4m5v3Qd3Q9qbfcxW
	cmBnHWuwqz4YO+OPWVYV2TBlr7WzpWHdnzVAa6dpBWrIq1JvfLeZhq60uZNA2YN4m/LnbE0z0Tn
	fWwVNRI4vAc5AryKqAotruzJ9Ssi6tIxH/j+8p9lrQWCcyVgrGDOLiTUi1nVANdA3IHMqgS5eum
	FXJVLzXlKNRFS6s8XvIeQ1gEovoUhI54yn5FpUm+HeZ2rWg8MgYJzf43tJeuWzYd1Hb1ElP51AG
	/Rhx2l9qtzis8oNvia94wfqlbOeDjnprESayiDHrVm2vdJ2WXqHcHyHAIwcY4yXgy1jgGmnUmga
	RDRX4YzfXDYr1SWcdX2E41I/w==
X-Received: by 2002:a05:600c:628b:b0:48a:557e:6b4f with SMTP id 5b1f17b1804b1-48e706cd77dmr256061885e9.23.1778607150713;
        Tue, 12 May 2026 10:32:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d68b14sm11749665e9.12.2026.05.12.10.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 10:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 19:32:29 +0200
Message-Id: <DIGVM4J2H478.3CY9IHNUCU7EP@smile.fr>
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
Subject: Re: [PATCH v8] kbuild: host: use single executable for rustc -C
 linker
X-Mailer: aerc 0.20.0
References: <20260509101939.27108-1-mo@sdhn.cc>
In-Reply-To: <20260509101939.27108-1-mo@sdhn.cc>
X-Rspamd-Queue-Id: C3475525DCA
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-13129-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sdhn.cc:email,o.map:url,smile.fr:email,smile.fr:mid,smile.fr:dkim]
X-Rspamd-Action: no action

On Sat May 9, 2026 at 12:19 PM CEST, Mohamad Alsadhan wrote:
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
>   ccache gcc "$@"
>   ```
>
> Note that the wrapper intentionally avoids a leading `exec` to
> naturally support leading environment assignments such as:
> `VAR=3DVAL ccache gcc`.
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
Hello,

I also tested this one:

Tested-by: Yoann Congal <yoann.congal@smile.fr>

Thanks!
> ---
> v7 -> v8:
>   - Unify into a single global `scripts/rustc-wrapper`, instead of
>     generating per-directory wrappers.
>   - Use `$(objtree)/scripts/rustc-wrapper` when passing the wrapper to
>     `rustc` for clarity.
>   - Keep make dependencies on `scripts/rustc-wrapper`, since the rule
>     is defined for that target name.
>   - Drop the sample-local clean/ignore handling that was only needed
>     for per-directory wrappers.
>
> v6 -> v7:
>   - Always generate `scripts/rustc-wrapper` when `CONFIG_RUST=3Dy`,
>     including cases with no Rust host programs in `scripts/`.
>   - Use `$(obj)/rustc-wrapper` for host Rust programs, fixing builds
>     outside `scripts/`, e.g. `samples/rust/hostprogs/`.
>   - Remove leading exec (again) to allow leading env vars e.g.
>     HOSTRUSTC_LD=3D"VAR=3DVAL ccache gcc".
>   - Track, clean and ignore generated wrapper as needed.
>
> v5 -> v6:
>   - Add fix to `rust/Makefile` as well
>   - Include script to `.gitignore` and make clean
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
>     a proper fix which turned out not that complex to implement.
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
> v7: https://lore.kernel.org/all/20260416211525.13847-1-mo@sdhn.cc/
> ---
>  Makefile              |  3 ++-
>  rust/Makefile         |  8 +++++---
>  scripts/.gitignore    |  1 +
>  scripts/Makefile      |  3 +++
>  scripts/Makefile.host | 23 +++++++++++++++++++++--
>  5 files changed, 32 insertions(+), 6 deletions(-)
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
> index 5eca6a817..620d397db 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -565,7 +565,7 @@ $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote=
.rlib FORCE
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>  	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
> -		-Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +		-Clinker-flavor=3Dgcc -Clinker=3D$(objtree)/scripts/rustc-wrapper \
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
> index c1dedf646..ab810e42b 100644
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
> +# To work around this, we generate a script that invokes `HOSTRUSTC_LD` =
with the
> +# linker arguments appended so such commands can be used safely.
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
> +scripts/rustc-wrapper: FORCE
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
> +		 -Clinker-flavor=3Dgcc -Clinker=3D$(objtree)/scripts/rustc-wrapper \
>  		 -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> @@ -153,7 +172,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
>  quiet_cmd_host-rust	=3D HOSTRUSTC $@
>        cmd_host-rust	=3D \
>  	$(HOSTRUSTC) $(hostrust_flags) --emit=3Dlink=3D$@ $<
> -$(host-rust): $(obj)/%: $(src)/%.rs FORCE
> +$(host-rust): $(obj)/%: $(src)/%.rs scripts/rustc-wrapper FORCE
>  	+$(call if_changed_dep,host-rust)
> =20
>  targets +=3D $(host-csingle) $(host-cmulti) $(host-cobjs) \


--=20
Yoann Congal
Smile ECS


