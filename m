Return-Path: <linux-kbuild+bounces-10737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOniBWyzb2nHMAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10737-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:55:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A1480D0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 358B99E4231
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 15:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A3548035C;
	Tue, 20 Jan 2026 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7T6BtI5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1909480357
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922938; cv=none; b=Ff7J3OgR6qT/4Lu6Q4cVrdTgT6bu1DN9tTrHBWWM9D3D1AhbLd3cQ2u6HPru3lZp6tHLygKYvYvicuodNpWlyHST39KAdht+1hcGJMR+lujeiQHpDgU+WDjaD/dgFJDMFQQgaullEu1m/qqdPaGzlbBqcdmSQqU3FvhBhBSPiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922938; c=relaxed/simple;
	bh=IvCBOJsyp4jJf5j7bOKWY8QnmddhJ1IJm+3EBzoWwGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ER3f7fHGuV4fa0h3ctUkSqGoOVIR4YLJB4YNuWbuGASB1ezaYxW/BCjnazXlwpSE9DVlKvRgE0MqyhqW8Vv5HS002L75nyZxV4hfv6eiL9kKnt/1+sTuhLXqwVkyVuVe4i1KyM7UsxDNvyC3Ro9TXO46LHYt06+XQpTXiKI/+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7T6BtI5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77006C2BCB0
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922938;
	bh=IvCBOJsyp4jJf5j7bOKWY8QnmddhJ1IJm+3EBzoWwGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V7T6BtI5SYdGHoupHnzXXv/JfqxSquvGfgFNxHw1eJO/pgHFuAv7yo97IMmGvrcHX
	 lgT8l3zynbd7bvULOOuakecCzajWO4zzLei21VinO7GFDTRYgms6c3D7KzqMuHZ6oL
	 G9FGdN34R4DBy7WMKJKoK1phSaMp9z/bcBhqHC9LaRyR7E2IlmDicINVMm/Z2RaY01
	 OF/UIcsy0ANXsIX4d8/A4sl1JY7dy4gDGrxeWJLLIA4JRGfFFdt5Sy5nhsO9D2cRQT
	 kw20T0uG1VSQCVIQ8tZv9bJhSt7b9Dk45gfV0bOCPOMgE7/akaGzzcjDYI9DJpnkBf
	 IizVCRdJIdspQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-383138a497bso53523851fa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 07:28:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXamxwoaJrPMz5agsNRVHO/oRlRY2QiO8cOqFrJJ3IIrv2vU/yv4dyLZAsavGVNbAnpMfhv5qtrzEkxGLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgBIRwpvTd/2fuRyEhl0BFlbXLn/svqjYA1CpmiiwFhYz9QfV
	wDP1pcE7qiGIZnMcq0YdYKrAXKxAfePwoyNHM9njd2xX6Qci28bLXanOz07+02hr1SOnEIsxf8m
	7KZPSddZwio23DtVTa1N/jKDrHMjjNas=
X-Received: by 2002:a05:651c:3135:b0:37f:d18e:15f8 with SMTP id
 38308e7fff4ca-38386a263aamr43785091fa.22.1768922937133; Tue, 20 Jan 2026
 07:28:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-3-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-3-829e4e92818c@nvidia.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:28:21 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=Sc=sdWo+6u3+rHhEmCcU_WbFMvowmfgmsS0s5iyrduA@mail.gmail.com>
X-Gm-Features: AZwV_QgEELRWyFhIJ6jLFEbp5U5lJpzOCxtgiXiZbsYYMWErsdC901P28SJwwvE
Message-ID: <CAJ-ks9=Sc=sdWo+6u3+rHhEmCcU_WbFMvowmfgmsS0s5iyrduA@mail.gmail.com>
Subject: Re: [PATCH 3/6] scripts: generate_rust_analyzer: plumb crate-attrs
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
	TAGGED_FROM(0.00)[bounces-10737-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7C0A1480D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 3:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add --crate-attrs argument to pass per-crate attributes.
>
> The crate_attrs field was added to rust-analyzer in v0.3.2727 (~1.94.0)
> and is silently ignored by older versions, so it's safe to add it.

Please add citations for both claims made here.

>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/Makefile                     | 5 ++++-
>  scripts/generate_rust_analyzer.py | 9 +++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 2238b0b69197..e6c5108ab625 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -84,9 +84,11 @@ proc_macro2-cfgs :=3D \
>      $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macr=
o_span_location)
>
>  # Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macr=
o_c_str_literals)`.
> +proc_macro2-crate-attrs :=3D feature(proc_macro_byte_character,proc_macr=
o_c_str_literals)
> +
>  proc_macro2-flags :=3D \
>      --cap-lints=3Dallow \
> -    -Zcrate-attr=3D'feature(proc_macro_byte_character,proc_macro_c_str_l=
iterals)' \
> +    -Zcrate-attr=3D'$(proc_macro2-crate-attrs)' \
>      $(call cfgs-to-flags,$(proc_macro2-cfgs))
>
>  quote-cfgs :=3D \
> @@ -575,6 +577,7 @@ rust-analyzer:
>                 --cfgs=3D'syn=3D$(syn-cfgs)' \
>                 --editions=3D'core=3D$(core-edition)' \
>                 --editions=3D'quote=3D$(quote-edition)' \
> +               --crate-attrs=3D'proc_macro2=3D$(proc_macro2-crate-attrs)=
' \
>                 $(realpath $(srctree)) $(realpath $(objtree)) \
>                 $(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(=
srcroot)) \
>                 > rust-project.json
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 17ed5546504b..e8c50812fb9f 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -11,6 +11,7 @@ import pathlib
>  import subprocess
>  import sys
>
> +
>  def args_single(args):
>      result =3D {}
>      for arg in args:
> @@ -26,7 +27,7 @@ def args_crates_cfgs(cfgs):
>
>      return crates_cfgs
>
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, e=
ditions):
> +def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, e=
ditions, crate_attrs):
>      # Generate the configuration list.
>      generated_cfg =3D []
>      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> @@ -42,6 +43,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, editions)
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
>      crates_editions =3D args_single(editions)
> +    crates_crate_attrs =3D args_crates_cfgs(crate_attrs)
>
>      def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse):
>          # Miguel Ojeda writes:
> @@ -78,6 +80,8 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, editions)
>              "deps": [{"crate": crates_indexes[dep], "name": dep} for dep=
 in deps],
>              "cfg": cfg,
>              "edition": edition,
> +            # Crate attributes were introduced in 1.94.0 but older versi=
ons will silently ignore this.

Citations needed.


> +            "crate_attrs": crates_crate_attrs.get(display_name, []),
>              "env": {
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
> @@ -233,6 +237,7 @@ def main():
>      parser.add_argument('--verbose', '-v', action=3D'store_true')
>      parser.add_argument('--cfgs', action=3D'append', default=3D[])
>      parser.add_argument('--editions', action=3D'append', default=3D[])
> +    parser.add_argument('--crate-attrs', action=3D'append', default=3D[]=
)
>      parser.add_argument("srctree", type=3Dpathlib.Path)
>      parser.add_argument("objtree", type=3Dpathlib.Path)
>      parser.add_argument("sysroot", type=3Dpathlib.Path)
> @@ -246,7 +251,7 @@ def main():
>      )
>
>      rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.editions),
> +        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs),
>          "sysroot": str(args.sysroot),
>      }
>
>
> --
> 2.52.0
>
>

