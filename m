Return-Path: <linux-kbuild+bounces-11887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNjmHcDBsmmvPAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11887-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:38:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31731272B9A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E9343028EB6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4905935BDAD;
	Thu, 12 Mar 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwMy5Yox"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548834A3D2;
	Thu, 12 Mar 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322592; cv=none; b=qE28X5BmMsd0tijLPJwzUPMZKZBHJ62Xhymmg6jRkP6ymW2g2FAzuxbOYfLaNItWmKKpOfdOKxEmnDevldOcA1C0qsLNqIdCrIk+VEAyM4CuC12fosNmQglc6m+QNYAarJSbOtTxeTewryxPh2UqiF2SUp/7UIJAIkUmoTMX6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322592; c=relaxed/simple;
	bh=EE1NLUQ/36yNz5rQaSP/p0vEnES/aW8yt8Zzw8dXDAo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OYoPbgo0tW1uvlWR6uTkXkE+Nnf61zLfGDwjuHwDkOnJ6wUSSaYnW52vGLVVuF6q/bfgzN3fR2ZDCcGU3tB18g4kQBLAv6pPz5eqmk0VnROJrWnNxjYbdwFS4jl5Voqje2jrEEmlVyn0OSqpaFCH0zN9DcO1DrPix245XcX/fSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwMy5Yox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F70C4CEF7;
	Thu, 12 Mar 2026 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773322591;
	bh=EE1NLUQ/36yNz5rQaSP/p0vEnES/aW8yt8Zzw8dXDAo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JwMy5YoxqhDi96+Wz9mljpxWCfpMsSpdcGNrh4Ql85uSPzFKGY+5MG0TdtpwlaSpN
	 bTrA7kguiaDAkn/oTI1FTfx0veZP43z+FBQ9QF9esRl4oxByotQ63CdUJJfsBwpLzl
	 bV9ZOFEj+xmce4de/K58klPqRInJF3z+8YOSa4YG0DfJ+OCX9wAgc05ZJpf7q/gcsq
	 h2VUQS+eMPmPmf3n7r0yeuvaeIjHPidYQEAymjlRBKjNO5PMYiVuF1kdHbMu71mt8e
	 Sx5+bOTF09VN9NYijuw06Jtp5UrAU0vk1ccl6BnupAmUvwUojep6KzcFzgz1PqbOSN
	 c8mKt8RSZ+TUQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 14:36:27 +0100
Message-Id: <DH0UE67MHS8S.2XO3XB3V39K6Z@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] rust: kbuild: allow `unused_features`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260312111014.74198-1-ojeda@kernel.org>
In-Reply-To: <20260312111014.74198-1-ojeda@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11887-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31731272B9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 12:10 PM CET, Miguel Ojeda wrote:
> Starting with the upcoming Rust 1.96.0 (to be released 2026-05-28),
> `rustc` introduces the new lint `unused_features` [1], which warns [2]:
>
>     warning: feature `used_with_arg` is declared but not used
>      --> <crate attribute>:1:93
>       |
>     1 | #![feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,o=
ffset_of_nested,raw_ref_op,used_with_arg)]
>       |                                                                  =
                           ^^^^^^^^^^^^^
>       |
>       =3D note: `#[warn(unused_features)]` (part of `#[warn(unused)]`) on=
 by default
>
> The original goal of using `-Zcrate-attr` automatically was that there
> is a consistent set of features enabled and managed globally for all
> Rust kernel code (modulo exceptions like the `rust/` crated).
>
> While we could require crates to enable features manually (even if we
> still keep the `-Zallow-features=3D` list, i.e. removing the `-Zcrate-att=
r`
> list), it is not really worth making all developers worry about it just
> for a new lint.
>
> The features are expected to eventually become stable anyway (most alread=
y
> did), and thus having to remove features in every file that may use them
> is not worth it either.
>
> Thus just allow the new lint globally.
>
> The lint actually existed for a long time, which is why `rustc` does
> not complain about an unknown lint in the stable versions we support,
> but it was "disabled" years ago [3], and now it was made to work again.
>
> For extra context, the new implementation of the lint has already been
> improved to avoid linting about features that became stable thanks to
> Benno's report and the ensuing discussion [4] [5], but while that helps,
> it is still the case that we may have features enabled that are not used
> for one reason or another in a particular crate.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/152164 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/pull/114 [2]
> Link: https://github.com/rust-lang/rust/issues/44232 [3]
> Link: https://github.com/rust-lang/rust/issues/153523 [4]
> Link: https://github.com/rust-lang/rust/pull/153610 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 73a39592f112..587345f16c97 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -476,6 +476,7 @@ KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
>  export rust_common_flags :=3D --edition=3D2021 \
>  			    -Zbinary_dep_depinfo=3Dy \
>  			    -Astable_features \
> +			    -Aunused_features \
>  			    -Dnon_ascii_idents \
>  			    -Dunsafe_op_in_unsafe_fn \
>  			    -Wmissing_docs \
>
> base-commit: 487f9b3dc6e507a982f1b984aa6bfbd9dc4b0567


