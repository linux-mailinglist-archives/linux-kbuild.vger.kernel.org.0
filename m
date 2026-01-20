Return-Path: <linux-kbuild+bounces-10740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKAjCvmrb2mgEwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10740-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:23:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8764769D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45ADE8002A0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 15:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FB731AA8D;
	Tue, 20 Jan 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmTgL1oW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDEF2494FF
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923286; cv=none; b=suGbCC7QG0edZFC8QcVRpKx5v//NRNpMG7e1VYMncfh9Fp3hVNXN3x8R1cVbkNPgP3+pfIGp0RkLAKXsow54oe8mOJ4MxLMj0Ag4GB9RIHRV1QPr8xnen9cH27yIEaT3O8GKMYkgoEO+DGGUgRDRUPop1RYLXseTsJBr1EAZOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923286; c=relaxed/simple;
	bh=84+3F+K+HvADNKqBYURJTnBncEm9TXlfTRYPjrRjeMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt0ZVs76l0A+I8vDsOqIdhvv4yssOZZiWqgf2C6QBAhAK9j2AwpoMfVj/aX0Hq7GCvvNAxwq0W1PIVbDhh/NFKCnCZfPXb37/yVmPEufWGcOcuRQ1TfkiHTjv7fHrkMcdIaIzl/l/N5Noxb6pV7kTp+rcVf+dbcVyL+bcItoER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmTgL1oW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF452C2BCB2
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768923286;
	bh=84+3F+K+HvADNKqBYURJTnBncEm9TXlfTRYPjrRjeMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EmTgL1oWEe5uR6A0U8l7wwTawrV0HWBRbzJ3Ls4VKUQ5ilWxjxsNJMX8JdXhur5sx
	 +PFi+DP8h9RsDJa26I7XFnphgaBWIU5TP6O6A6Y+AI36ufwyLkymOA28qaAnyXZOfX
	 ZiAssgjsq6p3DV3pQkoW/uM85dImh0ghtWGtUWceiZ9zU/uymgJ1pXPRsUqJo6UkKn
	 QHh1Yynlf7LEUtjGetu9YnBKHWwhPtlHUItbzI0oTwu/UcADkC2bUocgEBSv9D3fC2
	 TqOXEFmOx0faxthFisY3PtYhrOhr+piIFzFrhDBFpQyrZBeJQRt6Z3Qu3yXpbh6MB+
	 SCxGOBLxktCDg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso46745731fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 07:34:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrT37KL1byIcmwfP7Xf59DaV8gvha8IcUWOCA16xDw16UP/l2bslC0rMauZ65wfJ2d7A8g60LLaqt10XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQAqNxqHEY8v0GtVz5EKrd6O/W/OCYSEOe2yoEbK1TVhM7pLT
	RLIbs4xNblMu7f7YeQHimQUgA4ZuCG5NbOiPJ2pX9x9I8l24T3u3Tmc6R+cKbXlPUNta2UPhvcl
	ws2Adh6ZC8Dp3ghsGHyPghfkcvp+kSX8=
X-Received: by 2002:a2e:a58a:0:b0:383:271d:5e12 with SMTP id
 38308e7fff4ca-38386c66e27mr37770821fa.42.1768923284453; Tue, 20 Jan 2026
 07:34:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:34:08 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
X-Gm-Features: AZwV_Qi5w0O3GEoHte64Slgta-GNpcPuTJFmH0M9g9dgdp_GnMbzx_0_pM4c3jw
Message-ID: <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot crates
 to sysroot_project
To: Eliot Courtney <ecourtney@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10740-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BE8764769D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 3:55=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Use rust-analyzer's sysroot_project feature to properly configure
> sysroot crates (core, alloc, std, proc_macro). This allows
> rust-analyzer to correctly resolve items from the sysroot and
> automatically add sysroot crate dependencies to all project crates.
>
> Some sysroot crates use #[path] directives to load files outside of
> their directory but still in the sysroot. This is disallowed by
> rust-analyzer, so the sysroot crate are not properly loaded. Loading them
> using sysroot_project tells rust-analyzer to let them load anything insid=
e
> sysroot_src.
>
> The sysroot_project field was added to rust-analyzer in v0.3.2328
> (~1.87.0) and is silently ignored by older versions. In that case,
> rust-analyzer falls back to loading the sysroot via sysroot_src.
> This basically works, but the advantage of using sysroot_project is
> that we can make the set of features/cfgs more similar to what the
> actual build uses.

This is a very nice patch, and perhaps obviates the need for the
versioning infrastructure in
https://lore.kernel.org/all/20260109-ra-fix-primitive-v2-0-249852a4145a@gma=
il.com/.

As with the other commits in this series, we need citations of the
claims that these newer fields are properly ignored by older versions
of RA.

>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  scripts/generate_rust_analyzer.py | 118 ++++++++++++++++++++++----------=
------
>  1 file changed, 70 insertions(+), 48 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index ba2f6b0fb99b..f8666050a997 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -27,25 +27,14 @@ def args_crates_cfgs(cfgs):
>
>      return crates_cfgs
>
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, e=
ditions, crate_attrs, common_crate_attrs):
> -    # Generate the configuration list.
> -    generated_cfg =3D []
> -    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> -        for line in fd:
> -            line =3D line.replace("--cfg=3D", "")
> -            line =3D line.replace("\n", "")
> -            generated_cfg.append(line)
> -
> -    # Now fill the crates list -- dependencies need to come first.
> -    #
> -    # Avoid O(n^2) iterations by keeping a map of indexes.
> +def generate_sysroot_crates(cfgs, editions, crate_attrs):
>      crates =3D []
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
>      crates_editions =3D args_single(editions)
>      crates_crate_attrs =3D args_crates_cfgs(crate_attrs)
>
> -    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse, is_proc_macro_library=3DFalse):
> +    def append_sysroot_crate(display_name, deps):
>          # Miguel Ojeda writes:
>          #
>          # > ... in principle even the sysroot crates may have different
> @@ -72,6 +61,52 @@ def generate_crates(srctree, objtree, sysroot_src, ext=
ernal_src, cfgs, editions,
>          # assumption if future edition moves span multiple rust versions=
.
>          edition =3D crates_editions.get(display_name, "2021")
>
> +        cfg =3D crates_cfgs.get(display_name, [])
> +        crates_indexes[display_name] =3D len(crates)
> +        crates.append({
> +            "display_name": display_name,
> +            # Paths in sysroot_project are relative to sysroot_src.
> +            "root_module": f"{display_name}/src/lib.rs",
> +            "is_workspace_member": False,
> +            "is_proc_macro": False,
> +            "deps": [{"crate": crates_indexes[dep], "name": dep} for dep=
 in deps],
> +            "cfg": cfg,
> +            "edition": edition,
> +            # Crate attributes were introduced in 1.94.0 but older versi=
ons will silently ignore this.
> +            "crate_attrs": crates_crate_attrs.get(display_name, []),
> +            "env": {
> +                "RUST_MODFILE": "This is only for rust-analyzer"
> +            }
> +        })
> +
> +    append_sysroot_crate("core", [])
> +    append_sysroot_crate("alloc", ["core"])
> +    append_sysroot_crate("std", ["alloc", "core"])
> +    append_sysroot_crate("proc_macro", ["core", "std"])
> +
> +    return crates
> +
> +def generate_crates(srctree, objtree, external_src, cfgs, editions, crat=
e_attrs, common_crate_attrs):
> +    # Generate the configuration list.
> +    generated_cfg =3D []
> +    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> +        for line in fd:
> +            line =3D line.replace("--cfg=3D", "")
> +            line =3D line.replace("\n", "")
> +            generated_cfg.append(line)
> +
> +    # Now fill the crates list -- dependencies need to come first.
> +    #
> +    # Avoid O(n^2) iterations by keeping a map of indexes.
> +    crates =3D []
> +    crates_indexes =3D {}
> +    crates_cfgs =3D args_crates_cfgs(cfgs)
> +    crates_editions =3D args_single(editions)
> +    crates_crate_attrs =3D args_crates_cfgs(crate_attrs)
> +
> +    def append_crate(display_name, root_module, deps, cfg=3D[], is_proc_=
macro=3DFalse, is_proc_macro_library=3DFalse):
> +        edition =3D crates_editions.get(display_name, "2021")
> +
>          crate_attrs =3D crates_crate_attrs.get(display_name, [])
>          # Apply common crate attrs to non-host crates.
>          if not is_proc_macro_library and not is_proc_macro:
> @@ -80,7 +115,7 @@ def generate_crates(srctree, objtree, sysroot_src, ext=
ernal_src, cfgs, editions,
>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> -            "is_workspace_member": is_workspace_member,
> +            "is_workspace_member": True,
>              "is_proc_macro": is_proc_macro,
>              "deps": [{"crate": crates_indexes[dep], "name": dep} for dep=
 in deps],
>              "cfg": cfg,
> @@ -100,37 +135,20 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, editions,
>          crates_indexes[display_name] =3D len(crates)
>          crates.append(crate)
>
> -    def append_sysroot_crate(
> -        display_name,
> -        deps,
> -        cfg=3D[],
> -    ):
> -        append_crate(
> -            display_name,
> -            sysroot_src / display_name / "src" / "lib.rs",
> -            deps,
> -            cfg,
> -            is_workspace_member=3DFalse,
> -        )
> -
> -    # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
> -    # here is important for ensuring that rust-analyzer can resolve symb=
ols. The sources of truth
> -    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml"=
 for crate in crates)`.
> -    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", []))
> -    append_sysroot_crate("alloc", ["core"])
> -    append_sysroot_crate("std", ["alloc", "core"])
> -    append_sysroot_crate("proc_macro", ["core", "std"])
> +    # Sysroot crates (core, alloc, std, proc_macro) are in sysroot_proje=
ct,
> +    # and their deps are automatically added to all crates by rust-analy=
zer.
> +    # We only need to define deps between our own crates here.
>
>      append_crate(
>          "compiler_builtins",
>          srctree / "rust" / "compiler_builtins.rs",
> -        ["core"],
> +        [],
>      )
>
>      append_crate(
>          "proc_macro2",
>          srctree / "rust" / "proc-macro2" / "lib.rs",
> -        ["core", "alloc", "std", "proc_macro"],
> +        [],
>          cfg=3Dcrates_cfgs["proc_macro2"],
>          is_proc_macro_library=3DTrue,
>      )
> @@ -138,7 +156,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, editions,
>      append_crate(
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
> -        ["core", "alloc", "std", "proc_macro", "proc_macro2"],
> +        ["proc_macro2"],
>          cfg=3Dcrates_cfgs["quote"],
>          is_proc_macro_library=3DTrue,
>      )
> @@ -146,7 +164,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, editions,
>      append_crate(
>          "syn",
>          srctree / "rust" / "syn" / "lib.rs",
> -        ["std", "proc_macro", "proc_macro2", "quote"],
> +        ["proc_macro2", "quote"],
>          cfg=3Dcrates_cfgs["syn"],
>          is_proc_macro_library=3DTrue,
>      )
> @@ -154,20 +172,20 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, editions,
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",
> -        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
> +        ["proc_macro2", "quote", "syn"],
>          is_proc_macro=3DTrue,
>      )
>
>      append_crate(
>          "build_error",
>          srctree / "rust" / "build_error.rs",
> -        ["core", "compiler_builtins"],
> +        ["compiler_builtins"],
>      )
>
>      append_crate(
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> -        ["std", "proc_macro"],
> +        [],
>          cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )
> @@ -175,14 +193,14 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, editions,
>      append_crate(
>          "pin_init",
>          srctree / "rust" / "pin-init" / "src" / "lib.rs",
> -        ["core", "compiler_builtins", "pin_init_internal", "macros"],
> +        ["pin_init_internal", "macros"],
>          cfg=3D["kernel"],
>      )
>
>      append_crate(
>          "ffi",
>          srctree / "rust" / "ffi.rs",
> -        ["core", "compiler_builtins"],
> +        ["compiler_builtins"],
>      )
>
>      def append_crate_with_generated(
> @@ -204,9 +222,9 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, editions,
>              "exclude_dirs": [],
>          }
>
> -    append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
> -    append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
> -    append_crate_with_generated("kernel", ["core", "macros", "build_erro=
r", "pin_init", "ffi", "bindings", "uapi"])
> +    append_crate_with_generated("bindings", ["ffi", "pin_init"])
> +    append_crate_with_generated("uapi", ["ffi", "pin_init"])
> +    append_crate_with_generated("kernel", ["macros", "build_error", "pin=
_init", "ffi", "bindings", "uapi"])
>
>      def is_root_crate(build_file, target):
>          try:
> @@ -234,7 +252,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, editions,
>              append_crate(
>                  name,
>                  path,
> -                ["core", "kernel", "pin_init"],
> +                ["kernel", "pin_init"],
>                  cfg=3Dgenerated_cfg,
>              )
>
> @@ -261,7 +279,11 @@ def main():
>
>      common_crate_attrs =3D args.common_crate_attrs.split() if args.commo=
n_crate_attrs else []
>      rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs, common_cr=
ate_attrs),
> +        "sysroot_src": str(args.sysroot_src),
> +        "sysroot_project": {
> +            "crates": generate_sysroot_crates(args.cfgs, args.editions, =
args.crate_attrs),
> +        },
> +        "crates": generate_crates(args.srctree, args.objtree, args.exttr=
ee, args.cfgs, args.editions, args.crate_attrs, common_crate_attrs),
>          "sysroot": str(args.sysroot),
>      }
>
>
> --
> 2.52.0
>
>

