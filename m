Return-Path: <linux-kbuild+bounces-12001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK1xBfQQuWmFowEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12001-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 09:29:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 803AC2A5AB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 09:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B133D304D679
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 08:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1CA396D2A;
	Tue, 17 Mar 2026 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUcG/RcM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B9396596;
	Tue, 17 Mar 2026 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735960; cv=none; b=jlbglMPnlMH2dSQj8d4ZuWW50A2JYEntAeXl4bmOgVQmP1QiYYQ27gstkLbC2mfiX9G5Iv+oQHDcAj5SeVuk05Px9yyzX2IWVf00HPT9WYISStE0KsfdpLmIVKlF10Y6DaSiWGLWuK+bJK72HPBrwWixXvM0Ebsy4dn/WJBPjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735960; c=relaxed/simple;
	bh=6HCO5uPSGeOaMZcJw6nr0BVRKGBfSPMmN8QCDipCPTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zi7sSIiPCmEoCkb1N1Jn6AEqYC/W6lFQtKWf1HVCbJ2d0FYt5MXALLErEDeC06ImRK5GYGQvcIWLf24+g18uBMTtw+pb4L4T+MRlAQiqfbHgB9YMTRLznHLw2kv5iOuR1qjXFCwrHLGFKlVRjt86cMI5Cdk15jAyxagc84ZqDww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUcG/RcM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B294C4CEF7;
	Tue, 17 Mar 2026 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773735960;
	bh=6HCO5uPSGeOaMZcJw6nr0BVRKGBfSPMmN8QCDipCPTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eUcG/RcMZtaj14Gihl0G/ahNqH+BeBeIakaQmbDtYO95yN5aBqlhS17SCZzXnqzSK
	 tt4jainE8Ae1JjEz4Bx8Txdi21R2Cxvbv4UFiCLGf7S/Ii3s130y0a+ef53ttNF6j8
	 oyWVVSe++PFiYUTROTpRvwUfy/XNQ8hxvxAl+Oa3lvFmbbkqz2PRmBzn8Kvxu6U4Qt
	 /FQIywhewBIhiwmhr4xFiRqep87IBrnz3mMnEUrUbVTBmqrVfE8Q5PJ4Z115yrGWCP
	 gCNlJlV+Cu9SKs8x55zjEd2KAfQCjuzWT7rRhxMYULSWdOXlpAL89d8jKX8EOtcufk
	 /w0Pdf6T7O37g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, Alice Ryhl
 <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Date: Tue, 17 Mar 2026 09:25:42 +0100
Message-ID: <877brasvzt.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,nvidia.com,infradead.org,arm.com,google.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	TAGGED_FROM(0.00)[bounces-12001-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,t14s.mail-host-address-is-not-set:mid,rust-for-linux.com:url]
X-Rspamd-Queue-Id: 803AC2A5AB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Alice Ryhl <aliceryhl@google.com> writes:

> Currently the only way for Rust code to call a static inline function is
> to go through a helper in rust/helpers/. This introduces performance
> costs due to additional function calls and also clutters backtraces and
> flame graphs with helper symbols.
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.
>
> I ran a microbenchmark showing the benefit of this. All the benchmark
> does is call refcount_inc() in a loop. This was chosen since refcounting
> is quite hot in Binder. The results are that Rust spends 6.35 ns per
> call vs 5.73 ns per call in C. When enabling this option, the two
> languages become equally fast, and disassembly confirms the exact same
> machine code is used (in particular there is no call to
> rust_helper_refcount_inc). Benchmarking Binder also results in an
> improvement from this change.
>
> This patch is complementary to:
> https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>


Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Tested with the rust null block driver patch series [1]. I did a
few functional verification tests and a set of performance tests.

For the rnull driver, enabling helper inlining with this patch gives an
average speedup of 2% over the set of 120 workloads that we publish on
[2].

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/rust-for-linux/20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org/
[2] https://rust-for-linux.com/null-block-driver


