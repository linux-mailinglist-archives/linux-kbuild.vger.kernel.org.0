Return-Path: <linux-kbuild+bounces-10739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPYqEP29b2lTMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10739-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:40:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C128448BAB
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A79ED9E4FC4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 15:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAFB48096F;
	Tue, 20 Jan 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNzn1BPj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E348096E
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922955; cv=none; b=aoyEUlQIv8yUwGH0IyiA7bnVR6w1cpJiCMkXyCqNSV6Xf8nVQj//9AQ16Dz52QH0mC8EmyX7FbhGQ+nWWP/k4EUYGJFYnaikOZqfxoTJ31WmLx5mpwOLxkJrUESncGncBf/MryY4JtlQS8wPeRzTyGmgcpa634umgQl8K5S56VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922955; c=relaxed/simple;
	bh=7nFaVaBDQupl2/82TagtHbtrlVL3WH0jkNckxwToNA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2OopL4VqVdpLOVt2QZR8WX8ZD8VSEd7QG+qgv7VCQQFBUqz6Wwz0RvdBozzqYXPE4tQYIbZExZ/y75byqsw9gtK9rIjXQZpb+5QH+/1kR4Pd6a7H43jh/AYVDabw43wz48DZNAvv2cwo0eGrUO55oh6w3EUvrL5A/9kBuudxLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNzn1BPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB48C2BC9E
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922955;
	bh=7nFaVaBDQupl2/82TagtHbtrlVL3WH0jkNckxwToNA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vNzn1BPjB/Fx4pEWRpkL1/qxWdzOCyq0eQBf04ut1stUBec1pT9KEvezIq7HixU3y
	 fcpLLCFaEf5uG3PXzPl43kn/fqMwogHe1ndQuLTezZrYSdl7m9wkiOG1JifxUn2j4m
	 YZE+oQuqTq0vEqfHFf6rFp5YfeELDmMQPBVHa+kSCVRdzxY36PzeWHnJ1Vq2k1a3HQ
	 18cN+H6EaW0MZZk11/8FOrHECZ4xxnN/PtW9Meb1uJOGVY8cZ5y3OBPoiiRfDHF03C
	 ex4bdZH+l7A7k6e5U0dc/VdLuVeUUbbiLflhtCpSF87Z6bgpkXiNVj/XCxQ5keKo9z
	 KEddyEOOrG/Ww==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b855a4700so5115488e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 07:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBBGY1367PsYcgPjw1VINC0pfjfx26ggHCROPQrRZcBx2d8Jl1cRg3QAaSf/JqXdgLE3UCuq3pXjf82TE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1cE28EVyfnUepritCAy+7dVrbU445dYD8M/HJy4SJ6/CDGMfu
	AThX75uAovE7Be8TcmLFs3WsdsMHdmJ8aKa2EvCYzeSjTLvWXkPUBXXyikLDMRsjSxOk1JrGjhe
	vvfGgKhil3PMHZnTqK01jv+ex02LAVTg=
X-Received: by 2002:a05:6512:60f:20b0:59b:b2ee:d40c with SMTP id
 2adb3069b0e04-59bb2eedac8mr3267853e87.9.1768922954110; Tue, 20 Jan 2026
 07:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-5-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-5-829e4e92818c@nvidia.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:28:37 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=oSsT1j9_2meVHF8mq=WeUSPLfH2-3n0zcqMNRWQPR_g@mail.gmail.com>
X-Gm-Features: AZwV_QiiZgktJ_2n3B0IfxRX728_nbH8idZKCYrZOp43hGdX5lGQabP9RdinT5c
Message-ID: <CAJ-ks9=oSsT1j9_2meVHF8mq=WeUSPLfH2-3n0zcqMNRWQPR_g@mail.gmail.com>
Subject: Re: [PATCH 5/6] scripts: generate_rust_analyzer: add pin_init to
 driver crate deps
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
	TAGGED_FROM(0.00)[bounces-10739-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C128448BAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 3:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> This adds the missing pin_init dep to driver crates.

This needs citations, and perhaps a Fixes tag.


>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 0d93e8a8e4bd..ba2f6b0fb99b 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -234,7 +234,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, editions,
>              append_crate(
>                  name,
>                  path,
> -                ["core", "kernel"],
> +                ["core", "kernel", "pin_init"],
>                  cfg=3Dgenerated_cfg,
>              )
>
>
> --
> 2.52.0
>
>

