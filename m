Return-Path: <linux-kbuild+bounces-11066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DIrII1dhmlfMQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11066-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 22:30:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAE103721
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 22:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9370F3009B35
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 21:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2228F2405EC;
	Fri,  6 Feb 2026 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMNfM0ZH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AE11F5842;
	Fri,  6 Feb 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770413451; cv=none; b=DadaaW+MkUeaxm0nhtPYG4pq6Qh73wS1galw4Sde/RMoL/YKtcoCjixHqReWcxrGqzEkQT+Dd++uUDVSi+yUxoCt9VUZInjmllztSprkUHQEqmvZo3Xsg3X0SAMhGvla6Zk2y1KF58H0BZZtPZp16BzRGjX8SAzXLYYN5m0sjO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770413451; c=relaxed/simple;
	bh=UZ7BN+nVDIIBisJquvlyLN3E457oHPK0JvY6/3d2KaE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=YzIrOvKYH387LURZXzdr5bT3VD2JNVwuV8OyIQTWzbsYim77AQDMAv0EzD3VD9LRKiSwMLhUQxSyXBvfCWiVAC6QKgaGumfN2BsgSuciFKIN0eD+t4otrDtmvRBahld7+06FFR+GRZrsxDUXKwZgHnofWScWwIx7EG30M9fSWbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMNfM0ZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E82C116C6;
	Fri,  6 Feb 2026 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770413450;
	bh=UZ7BN+nVDIIBisJquvlyLN3E457oHPK0JvY6/3d2KaE=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=vMNfM0ZHxTk8nIbRp6CSo8CW8ZVrDt1WMODe7VlqMyF1XIZdJNvF64uaZexgaYbb9
	 LiMm+PC0n8N/qzWjJLeQndz+nOKjKV0pKRO4l1ki5BbV9injJSlrFq0Ftqg9qw5Xmw
	 F9RNAWcROK2yE/sC2jdt+zoMHLIzu7mA41ItK/M5Ya2H/H3H6ND6o44YHolYkrXswa
	 KrkjzVG37U8WLJcaW7N7M3sw+bLJS+cAFnuKlCp1WapR16d2J0mbbSFH0QQRui3q4Z
	 NCamFZhQ9Cp9rnmJqphGWk5WHENyoVh0ARiYF4mbrF3LwcE6GZoVens3osl+IJFYbp
	 RMXKNH1ysx8eQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 22:30:45 +0100
Message-Id: <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
In-Reply-To: <20260206171253.2704684-2-gary@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11066-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DACAE103721
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 6:12 PM CET, Gary Guo wrote:
> +/// Assertion during constant evaluation.
> +///
> +/// This is a more powerful version of `static_assert` that can refer to=
 generics inside functions
> +/// or implementation blocks. However, it also have a limitation where i=
t can only appear in places
> +/// where statements can appear; for example, you cannot use it as an it=
em in the module.
> +///
> +/// [`static_assert!`] should be preferred where possible.
> +///
> +/// # Examples
> +///
> +/// When the condition refers to generic parameters [`static_assert!`] c=
annot be used.
> +/// Use `const_assert!` in this scenario.
> +/// ```
> +/// fn foo<const N: usize>() {
> +///     // `static_assert!(N > 1);` is not allowed
> +///     const_assert!(N > 1); // Compile-time check
> +///     build_assert!(N > 1); // Build-time check

I think having "Build-time check" here is a bit confusing, how about we
change it to "Link-time check"? Since a "Compile-time check" also is
done at "Build-time"

Cheers,
Benno

