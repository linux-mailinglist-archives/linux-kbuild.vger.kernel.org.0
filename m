Return-Path: <linux-kbuild+bounces-13526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZxC3JqcXH2rPfQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13526-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:49:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A7630D69
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:49:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ISvL/b8A";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13526-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13526-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 975E03029A63
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E03C3FBB55;
	Tue,  2 Jun 2026 17:47:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA982F7F0B
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:47:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422451; cv=none; b=uGCklkQa3FTRK0QBVKy5+uzflvophNtnQf7AuABjBGAtoK4sv0OiKEe7Ns8lZJyXSasBp3dgk8elFNkSiKgFk+GGpFsh6uoL2QwWVzv99C+/vhqlHWJB37k32Rs3uumz1fmUw54uo08rBE2gNUbdnKRi0u8CpTkdT0Kwm0vi5NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422451; c=relaxed/simple;
	bh=zvteCyhZMsOT50L2mPu/FnwAckinwpibhaA1/zEmzVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcVnBUMl0LgrDGWV4Af4Wf3a0cBXDvksmBR/dtE6OriHUsGZkw2CbBWmptWdVM6gmgRGKGJDAeYvbbkF4VHz3LDbfm4ccMiqA0kpYeA02akt1mnXDYHtsbyl0h1YJGtDfwjJXLhSu0E7w/Inawtdz8V8ImM7ErtaAvKt05q6ayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISvL/b8A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6941F0089D
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780422449;
	bh=ByTpW95bbwKEQFcTn9bTj12DYQn9TMAGM7wlfAii8ww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ISvL/b8Ay5MNq2FI4/SPim5hpf00o9WCT7fG5mxN/gDzL6LIEe/lMKvbav4BGEaWn
	 aR5Lh5Was0LWf1mWPiBfb3Drpb6DamSQClRxrpV8J88RAD8j9YCycF5RuoAjagN73/
	 QDdCjMp7ctBR8yAIpWMuHsPAeDa3eOXaazzVkHf8komXiCxcmdmn4qvGVPC6y9jW6S
	 UZJZbiDJ5qEDXHUBtJ+u0CxXfxC+hOrFEoPpFICOBAiAmV4DDfVJsnyDrXOJldKr0c
	 n13+pCo8sqBO1CVVHHJZEnwg/QBMAFZiyg4pwQu3a6S+N9EzbCm82cCTdgxbswt0h+
	 Py+vEKuXwZc6Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39677c434efso32306221fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 10:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gxijcOzctBhhazBB2kxsXeUUb9OxjJoR9Mj4A8Hb0NoVQM/jZiwLCpnAkVDQLexLxcav7BBI6rkvVOcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQOSN8y/RGFqrUnQeOYEFcqaGtQ3ENx3j+yXWGlj0/u6AUnUH
	khXXmyvtLreS+hcdYkRDfWH1UyURgyq5T/6KWX2ib5HCJVOuXfY68uDVAOen8StH8UzdJIw6Q5z
	H9OamaoMwv5cLlakdQ3rv828hK+a9TLE=
X-Received: by 2002:a2e:be9e:0:b0:396:5999:1f42 with SMTP id
 38308e7fff4ca-396ac308359mr2347661fa.20.1780422448423; Tue, 02 Jun 2026
 10:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-2-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-2-ojeda@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 2 Jun 2026 13:46:52 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com>
X-Gm-Features: AVHnY4J1pOFcXdatCidZ25Wt0EIlLMX7JVDKpbZy0hMmJINDFX__l9UzntAhIe8
Message-ID: <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com>
Subject: Re: [PATCH 01/18] scripts: generate_rust_analyzer: support passing
 env vars
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13526-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 023A7630D69

On Tue, Jun 2, 2026 at 1:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> A future commit adding `zerocopy` support will need to pass an environmen=
t
> variable during its build.
>
> Thus add support for an `--envs` parameter, similar to `--cfgs`, that
> allows to pass a map of variables to set for a given crate.
>
> This allows us to keep a single source of truth for those values.
>
> No change intended in the generated `rust-project.json`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index d5f9a0ca742c..cede76af8425 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -26,6 +26,14 @@ def args_crates_cfgs(cfgs: List[str]) -> Dict[str, Lis=
t[str]]:
>
>      return crates_cfgs
>
> +def args_crates_envs(envs: List[str]) -> Dict[str, Dict[str, str]]:
> +    crates_envs =3D {}
> +    for env in envs:
> +        crate, vals =3D env.split("=3D", 1)
> +        crates_envs[crate] =3D dict(v.split("=3D", 1) for v in vals.spli=
t())
> +
> +    return crates_envs
> +
>  class Dependency(TypedDict):
>      crate: int
>      name: str
> @@ -61,6 +69,7 @@ def generate_crates(
>      sysroot_src: pathlib.Path,
>      external_src: Optional[pathlib.Path],
>      cfgs: List[str],
> +    envs: List[str],
>      core_edition: str,
>  ) -> List[Crate]:
>      # Generate the configuration list.
> @@ -74,6 +83,7 @@ def generate_crates(
>      # Now fill the crates list.
>      crates: List[Crate] =3D []
>      crates_cfgs =3D args_crates_cfgs(cfgs)
> +    crates_envs =3D args_crates_envs(envs)
>
>      def get_crate_name(path: pathlib.Path) -> str:
>          return invoke_rustc(["--print", "crate-name", str(path)])
> @@ -92,6 +102,10 @@ def generate_crates(
>              is_workspace_member if is_workspace_member is not None else =
True
>          )
>          edition =3D edition if edition is not None else "2021"
> +        crate_env =3D {
> +            "RUST_MODFILE": "This is only for rust-analyzer"
> +        }
> +        crate_env.update(crates_envs.get(display_name, {}))

This can be

crate_env =3D {
  "RUST_MODFILE": "This is only for rust-analyzer",
  **crates_envs.get(display_name, {}),
}

>          return {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -99,9 +113,7 @@ def generate_crates(
>              "deps": deps,
>              "cfg": cfg,
>              "edition": edition,
> -            "env": {
> -                "RUST_MODFILE": "This is only for rust-analyzer"
> -            }
> +            "env": crate_env,
>          }
>
>      def append_proc_macro_crate(
> @@ -347,6 +359,7 @@ def main() -> None:
>      parser =3D argparse.ArgumentParser()
>      parser.add_argument('--verbose', '-v', action=3D'store_true')
>      parser.add_argument('--cfgs', action=3D'append', default=3D[])
> +    parser.add_argument('--envs', action=3D'append', default=3D[])
>      parser.add_argument("core_edition")
>      parser.add_argument("srctree", type=3Dpathlib.Path)
>      parser.add_argument("objtree", type=3Dpathlib.Path)
> @@ -357,6 +370,7 @@ def main() -> None:
>      class Args(argparse.Namespace):
>          verbose: bool
>          cfgs: List[str]
> +        envs: List[str]
>          srctree: pathlib.Path
>          objtree: pathlib.Path
>          sysroot: pathlib.Path
> @@ -372,7 +386,7 @@ def main() -> None:
>      )
>
>      rust_project =3D {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.core_edition),
> +        "crates": generate_crates(args.srctree, args.objtree, args.sysro=
ot_src, args.exttree, args.cfgs, args.envs, args.core_edition),
>          "sysroot": str(args.sysroot),
>      }
>
> --
> 2.54.0
>
>

Acked-by: Tamir Duberstein <tamird@kernel.org>

Did you want to take this through rust or did you want me to pick it?

