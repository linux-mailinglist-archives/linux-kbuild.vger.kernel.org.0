Return-Path: <linux-kbuild+bounces-10738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEYdGaTQb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10738-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:59:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E7F49EE3
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74A819E4A8C
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C61480943;
	Tue, 20 Jan 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHrpevJl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479446AF2E
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922948; cv=none; b=iziF+tackXP430bGGy7Ej0sRvBjXNCFESbzTfHDDO4JthhAZR/fCZX10RVkuwbi8+vPsgiynntV4l6sWym1fXOq1K2Uyu36020PPtc6wyn1XAS5n+LL2G5Zikv2KFANL/V/tFaPCM5ldY7D6xo35ukTWoxsBjb4JpdJGaUCBpes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922948; c=relaxed/simple;
	bh=oLbuaCTYVsHWTVMEEEQJ9oIjZY1jigcX1hV1nM/VLAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHRPw6qBVwEkicRqnuVSjYfaO0TfICKyMCcEemfcFntvgi/11aKIxTeBsEzObLR6Y1uCdGCwP8Tpe5egwCCQb9QLE+daJ3Py119ExFF7fExhF9y9jL2b1v54D03oS2Vg/dTH4PjQNJiOrumh93XQr0opRcXbPch1u3VojSBNAr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHrpevJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F9CC2BCB0
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922948;
	bh=oLbuaCTYVsHWTVMEEEQJ9oIjZY1jigcX1hV1nM/VLAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LHrpevJl5YTVOqsUkQhGXaNvz4qGC6FDEFnT3NbaAMJhD5N5n6pbCdduLxpZ2wpZe
	 goJujT0kD+mZTWEHp7AkN5Bz+1A3LM42IR63cZCpDSHakasBeuFLEWzuFwx55Ck1Hp
	 U+YMHcdfelIkDNmSdJ0ACcXWmpCATKObcYf6jkp4PztVGlALI9aKmJSQbMd7C9CUL0
	 HgnUVVYsf6ppGmI5BFDmcX2wnXWXhjPDJWJQD3y9aMt2eojE0k6g/rMaBfkY+Ju0Ul
	 tkTCs6S3waRKasTVGuRsgxYxHcPUtn+PfWq33PwwqF/IWMEkVrAMfW9GOKcVHtXTxI
	 Yd/oprS80Zx7Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b6f52eea8so4723821e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 07:29:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVt2cZrA9xj21rc4Gh+FTGFFpTYi2aeiRCaB45xrz7thPMJuwBo/Vmx5K3k3Wc2g1B8/9XQKkzBtqoGlmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtcUEJBkRgC1XAGSd2uK95SmW+tU3r8b0m2smvFVrTGcqQGuy
	8PSIMwZrBRUWOIbIWffrCpH3nA1HbmdXiF6q4mEYN/HwkX21II+4mutJGujmIiiTV0ASfZjafWM
	jfqTa1gH9ZMsGwdIRSXC1aK515SaaAsQ=
X-Received: by 2002:a05:6512:b88:b0:59b:7a4e:3366 with SMTP id
 2adb3069b0e04-59baffc5b2bmr5300111e87.30.1768922946790; Tue, 20 Jan 2026
 07:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-4-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-4-829e4e92818c@nvidia.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:28:30 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=LZBSyQ3Sbszb2rjMrG9BDWeFr+Z4bwZzhW07XGwOB-A@mail.gmail.com>
X-Gm-Features: AZwV_QgA32-7CI7DDz5KHTooXDmXCTkfOJdjvlwfS6Zg78WaRRYgB7tLrOHCeCU
Message-ID: <CAJ-ks9=LZBSyQ3Sbszb2rjMrG9BDWeFr+Z4bwZzhW07XGwOB-A@mail.gmail.com>
Subject: Re: [PATCH 4/6] scripts: generate_rust_analyzer: plumb common
 crate-attrs for non-host crates
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10738-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: A5E7F49EE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 3:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add --common-crate-attrs argument to specify crate attributes that
> apply to all non-host crates. This means no_std will be specified where i=
t
> should be, for example.
>
> Proc macro and libraries used by proc macro crates run on the host and
> do not get this set of common crate-attrs. This mirrors
> rust_procmacrolibrary in the build system.
>
> Create scripts/Makefile.rust to hold shared Rust definitions.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

This looks ok to me, but I would prefer to land type annotations
(https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67fe5c38a@=
gmail.com/)
first.


> ---
>  rust/Makefile                     |  3 +++
>  scripts/Makefile.build            | 14 +-------------
>  scripts/Makefile.rust             | 20 ++++++++++++++++++++
>  scripts/generate_rust_analyzer.py | 20 +++++++++++++++-----
>  4 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index e6c5108ab625..750db2885ba2 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -1,5 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> +include $(srctree)/scripts/Makefile.rust
> +
>  # Where to place rustdoc generated documentation
>  rustdoc_output :=3D $(objtree)/Documentation/output/rust/rustdoc
>
> @@ -578,6 +580,7 @@ rust-analyzer:
>                 --editions=3D'core=3D$(core-edition)' \
>                 --editions=3D'quote=3D$(quote-edition)' \
>                 --crate-attrs=3D'proc_macro2=3D$(proc_macro2-crate-attrs)=
' \
> +               --common-crate-attrs=3D'$(rust_common_crate_attrs)' \
>                 $(realpath $(srctree)) $(realpath $(objtree)) \
>                 $(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(=
srcroot)) \
>                 > rust-project.json
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0c838c467c76..e9af8a11f2dc 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -34,6 +34,7 @@ subdir-ccflags-y :=3D
>
>  include $(srctree)/scripts/Kbuild.include
>  include $(srctree)/scripts/Makefile.compiler
> +include $(srctree)/scripts/Makefile.rust
>  include $(kbuild-file)
>  include $(srctree)/scripts/Makefile.lib
>
> @@ -306,19 +307,6 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  # Compile Rust sources (.rs)
>  # ----------------------------------------------------------------------=
-----
>
> -# The features in this list are the ones allowed for non-`rust/` code.
> -#
> -#   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
> -#   - Stable since Rust 1.82.0: `feature(asm_const)`,
> -#     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> -#   - Stable since Rust 1.87.0: `feature(asm_goto)`.
> -#   - Expected to become stable: `feature(arbitrary_self_types)`.
> -#   - To be determined: `feature(used_with_arg)`.
> -#
> -# Please see https://github.com/Rust-for-Linux/linux/issues/2 for detail=
s on
> -# the unstable features in use.
> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg
> -
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
> diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
> new file mode 100644
> index 000000000000..d96662d1ac17
> --- /dev/null
> +++ b/scripts/Makefile.rust
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +# Rust shared definitions
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +# The features in this list are the ones allowed for non-`rust/` code.
> +#
> +#   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
> +#   - Stable since Rust 1.82.0: `feature(asm_const)`,
> +#     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> +#   - Stable since Rust 1.87.0: `feature(asm_goto)`.
> +#   - Expected to become stable: `feature(arbitrary_self_types)`.
> +#   - To be determined: `feature(used_with_arg)`.
> +#
> +# Please see https://github.com/Rust-for-Linux/linux/issues/2 for detail=
s on
> +# the unstable features in use.
> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,offset_of_nested,raw_ref_op,used_with_arg
> +
> +# Common crate attrs for non-host, non-sysroot crates.
> +rust_common_crate_attrs :=3D no_std feature($(rust_allowed_features))
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index e8c50812fb9f..0d93e8a8e4bd 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -27,7 +27,7 @@ def args_crates_cfgs(cfgs):
>
>      return crates_cfgs
>
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, e=
ditions, crate_attrs):
> +def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, e=
ditions, crate_attrs, common_crate_attrs):
>      # Generate the configuration list.
>      generated_cfg =3D []
>      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> @@ -45,7 +45,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, editions,
>      crates_editions =3D args_single(editions)
>      crates_crate_attrs =3D args_crates_cfgs(crate_attrs)
>
> -    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse):
> +    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse, is_proc_macro_library=3DFalse):
>          # Miguel Ojeda writes:
>          #
>          # > ... in principle even the sysroot crates may have different
> @@ -72,6 +72,11 @@ def generate_crates(srctree, objtree, sysroot_src, ext=
ernal_src, cfgs, editions,
>          # assumption if future edition moves span multiple rust versions=
.
>          edition =3D crates_editions.get(display_name, "2021")
>
> +        crate_attrs =3D crates_crate_attrs.get(display_name, [])
> +        # Apply common crate attrs to non-host crates.
> +        if not is_proc_macro_library and not is_proc_macro:
> +            crate_attrs =3D common_crate_attrs + crate_attrs
> +
>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -81,7 +86,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, editions,
>              "cfg": cfg,
>              "edition": edition,
>              # Crate attributes were introduced in 1.94.0 but older versi=
ons will silently ignore this.
> -            "crate_attrs": crates_crate_attrs.get(display_name, []),
> +            "crate_attrs": crate_attrs,
>              "env": {
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
> @@ -127,13 +132,15 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, editions,
>          srctree / "rust" / "proc-macro2" / "lib.rs",
>          ["core", "alloc", "std", "proc_macro"],
>          cfg=3Dcrates_cfgs["proc_macro2"],
> +        is_proc_macro_library=3DTrue,
>      )
>
>      append_crate(
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
>          ["core", "alloc", "std", "proc_macro", "proc_macro2"],
> -        cfg=3Dcrates_cfgs["quote"]
> +        cfg=3Dcrates_cfgs["quote"],
> +        is_proc_macro_library=3DTrue,
>      )
>
>      append_crate(
> @@ -141,6 +148,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, editions,
>          srctree / "rust" / "syn" / "lib.rs",
>          ["std", "proc_macro", "proc_macro2", "quote"],
>          cfg=3Dcrates_cfgs["syn"],
> +        is_proc_macro_library=3DTrue,
>      )
>
>      append_crate(
> @@ -238,6 +246,7 @@ def main():
>      parser.add_argument('--cfgs', action=3D'append', default=3D[])
>      parser.add_argument('--editions', action=3D'append', default=3D[])
>      parser.add_argument('--crate-attrs', action=3D'append', default=3D[]=
)
> +    parser.add_argument('--common-crate-attrs', default=3D'')
>      parser.add_argument("srctree", type=3Dpathlib.Path)
>      parser.add_argument("objtree", type=3Dpathlib.Path)
>      parser.add_argument("sysroot", type=3Dpathlib.Path)
> @@ -250,8 +259,9 @@ def main():
>          level=3Dlogging.INFO if args.verbose else logging.WARNING
>      )
>
> +    common_crate_attrs =3D args.common_crate_attrs.split() if args.commo=
n_crate_attrs else []
>      rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs),
> +        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs, common_cr=
ate_attrs),
>          "sysroot": str(args.sysroot),
>      }
>
>
> --
> 2.52.0
>
>

