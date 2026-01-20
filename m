Return-Path: <linux-kbuild+bounces-10735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAD7C+6/b2kOMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10735-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:48:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0448D5A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6194066CF7D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 15:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03224508F3;
	Tue, 20 Jan 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfT2R8Do"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529C44BC89
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922922; cv=none; b=m3U6OvQR4YQWLVs3OVrUGINIVFQ/v8kSr3f/qsMbNo26LhX7K2UZHbfyTqTA1dxGsjlNCSnJ7Myx8qxMKKe/4CG4YAAROfGNsZ5fE3B7NtdSJGAtql+sUZBzYsoohBKwr4a5dQirFAuA97+5xyHnd99JRNrZhkVXTr8n8US/O5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922922; c=relaxed/simple;
	bh=N1p2eB8cizghq/v2wz0MGbnVNRrBVHwcukqm9lffkkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTtUpOuCulmeZSt3Sx6ULoOb+WcgX2OkVJoZKzHdrVW05DptKhPMUECtFYvFqgcUJrtMYiC0duURVtkQzr8qeUNV4ZUW/HU2fHOlGs04Q3b/OM6LcqIHT496zu4Jsu716aPG2qgUtwoBKBpTApQAwHvxcobrX1LOkYUfB+jud9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfT2R8Do; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63563C2BC9E
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922922;
	bh=N1p2eB8cizghq/v2wz0MGbnVNRrBVHwcukqm9lffkkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RfT2R8DoRDuGQkPCQJoPMx7lBL9QRfBIZM+PWyCFQ4P4YcLiS8OY4bY319pVLbiBo
	 ogKC1Fz0jHoeSNd0HPA20PIvEJwoLbkC0vRKJw6KUyJ7d6hyXP4JQfXI9xOuztFOJ+
	 C1m1H1JHcIUYwqMAXAM77uqa400Av8yDYc/qa+aTjaWsQgq1OMk6oIDEVhyZxqU2tu
	 WcRxb7QBIwwa6jnbbTMfNdK9RoPK8P7uwoGzN/GrbunvGUa/bGeHi6fDiSsi/gXYgr
	 VrXY5XVyx8eUuD+q5IpZ2NXf/uLNBZuRz/wwoJ2Z64wr7VuT81H6E/T0ifI1y776DF
	 qG7dt1JGCDUwg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-383153e06d6so45536291fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 07:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkZJSfQsUl+eJEKFRCf4/ucTAfmV/qWA+gz+fDfHPk9MBKaRuwP08/X/53PV4kJFkY15bGGRbeuKFVZHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrFBEEMOmWsJnEjfeonyeHnNF+iPmvDSpxp5R9mmeF47dE89l
	/XSa9WCRTLXgDRa9BCaWa5ZChcGN5mHLvV/NhUXStwxjJxTfu5hjMe4+s6VXQubPCrK83xTreP7
	hVPzcKPuT2bo15HglXRGeP1QSF2Q53YE=
X-Received: by 2002:a2e:b8cf:0:b0:383:1832:958a with SMTP id
 38308e7fff4ca-385a54b99bcmr9040841fa.44.1768922921008; Tue, 20 Jan 2026
 07:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-1-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-1-829e4e92818c@nvidia.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:28:04 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nhmTbGS0aeFkFnHLB=u_3g6A2qgpFhZu6E4oXrhP9U2A@mail.gmail.com>
X-Gm-Features: AZwV_QhP_Ddj7lJs7tPk_tmydh7MIhX7Xt7MWWNNm2655zo1xcWwH_Gkb-SmWfU
Message-ID: <CAJ-ks9nhmTbGS0aeFkFnHLB=u_3g6A2qgpFhZu6E4oXrhP9U2A@mail.gmail.com>
Subject: Re: [PATCH 1/6] scripts: generate_rust_analyzer: rename cfg to generated_cfg
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
	TAGGED_FROM(0.00)[bounces-10735-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: EEA0448D5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 3:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> This variable is for the cfg from generated files. It's also easy to
> confuse with the `cfg` parameter in append_crate(), so rename it.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

I have the same change sitting around locally.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>


> ---
>  scripts/generate_rust_analyzer.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 3b645da90092..c188d1f1fd5b 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -21,12 +21,12 @@ def args_crates_cfgs(cfgs):
>
>  def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, c=
ore_edition):
>      # Generate the configuration list.
> -    cfg =3D []
> +    generated_cfg =3D []
>      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
>          for line in fd:
>              line =3D line.replace("--cfg=3D", "")
>              line =3D line.replace("\n", "")
> -            cfg.append(line)
> +            generated_cfg.append(line)
>
>      # Now fill the crates list -- dependencies need to come first.
>      #
> @@ -173,7 +173,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>              display_name,
>              srctree / "rust"/ display_name / "lib.rs",
>              deps,
> -            cfg=3Dcfg,
> +            cfg=3Dgenerated_cfg,
>          )
>          crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
>          crates[-1]["source"] =3D {
> @@ -215,7 +215,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>                  name,
>                  path,
>                  ["core", "kernel"],
> -                cfg=3Dcfg,
> +                cfg=3Dgenerated_cfg,
>              )
>
>      return crates
>
> --
> 2.52.0
>
>

