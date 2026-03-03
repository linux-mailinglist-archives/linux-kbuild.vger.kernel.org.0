Return-Path: <linux-kbuild+bounces-11540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAc9EBVPp2nKggAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11540-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 22:13:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C13411F7409
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 22:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43DD830136A8
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 21:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7F7370D66;
	Tue,  3 Mar 2026 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0AEaGym"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1EE1E7C23;
	Tue,  3 Mar 2026 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572312; cv=none; b=BmhHkXbZJx7QCf94lcv4Bx3ryGfHnQbFXSdd6ptAUWOPjvPGzHNZ7n9WLuqMU1Qu0KoVtIUYl/CoNPm38TC6y7U1s8CB+0Y87sOt9d1aQ+wLaUR6VkhuuervL1+ptD9uzbM8t6xV9iqXIhW7bUpnifXGT/raFA1ruBoTrTJJ9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572312; c=relaxed/simple;
	bh=B4jfvkPzpMgLMsTOMh/B/lNzRESpWOgV/OnIyuwBHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/dBBqhAAFVWLeJFWo2Z0UQ9gJHqVQaJc6i/u6nuHOH4C0f627ssVwxXlZzeYTtuLrswY7RkWpN1n5pJs9zWv3xb9vrWo0fVjmU+W5IyhFcIC07fteeK4naRyVGVFKqZt62UhlHI5Mrza5BwVSGUO/HSF4k8R+pJ3K7vkvpECgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0AEaGym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACC4C116C6;
	Tue,  3 Mar 2026 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772572311;
	bh=B4jfvkPzpMgLMsTOMh/B/lNzRESpWOgV/OnIyuwBHt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c0AEaGymjhoqsmSXRaPgBVFkheWOKoeW7LJ3keBJYUZwoId6P7+8epFncp3ekGEBX
	 Zg0i6fJ6z3FtkjxHD/hIGhHG0uMFEr4JxWjXXE7HomqSCunwoTC+2oIyBunZHjVv+s
	 vjzMH/s4+dHfwQ/PCwYn3vQPAF78H9s+CHGZ6QTjakapIybzlcFLg3LzVb2iecapn8
	 mGI/kaPXRbj77P3rZUx5SIbn55P8GdPhlXgGwPDpc8L0ttFDrRgedDziEg+1aSPJ+O
	 xjzWEVlcGLL9IYKqXv64m4bngoMto7jlbbCOFmda4/TB9PUCt48ZGtD15twxXBeLUx
	 7EGt35A75Uoxw==
From: Miguel Ojeda <ojeda@kernel.org>
To: gary@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v4 2/3] rust: ptr: add projection infrastructure
Date: Tue,  3 Mar 2026 22:11:28 +0100
Message-ID: <20260303211128.107943-1-ojeda@kernel.org>
In-Reply-To: <20260302164239.284084-3-gary@kernel.org>
References: <20260302164239.284084-3-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C13411F7409
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,garyguo.net,vger.kernel.org,umich.edu];
	TAGGED_FROM(0.00)[bounces-11540-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 02 Mar 2026 16:42:35 +0000 Gary Guo <gary@kernel.org> wrote:
>
> Add a generic infrastructure for performing field and index projections on
> raw pointers. This will form the basis of performing I/O projections.

A few nits below for patch apply time.

> +/// A helper trait to perform index projection.
> +///
> +/// This is similar to `core::slice::SliceIndex`, but operate on raw pointers safely and fallibly.

Intra-doc link.

> +/// The implementation of `index` and `get` (if `Some` is returned) must ensure that, if provided

Intra-doc link.

> +// Forward array impl to slice impl.

`//` empty line between this and the next one.

> +// SAFETY: safety requirement guaranteed by the forwarded impl.

Capitalization (several similar ones, plus a `NOTE:` one, a "vacuously" one and
a "the provided" one).

> +/// implement `Deref`. This will cause an ambiguity error and thus block `Deref` types being used

Intra-doc links.

> +// currently support that as we need to obtain a valid allocation that `&raw const` can operate on.
> +// SAFETY: `proj` invokes `f` with valid allocation.

Probably `//` empty line between them.

> +/// It is not allowed to project into types that implement custom `Deref` or `Index`.

Intra-doc links.

> +/// `OutOfBound` error is raised via `?` if the index is out of bounds.

Intra-doc link.

> +/// Field projections are performed with `.field_name`:
> +/// ```

`//` emtpy line between paragraphs and examples (several more below).

> +///     // This will fail the build.

"would" may be clearer, unless we add "... if uncommented.".

Perhaps even:

  // The following invocation would fail the build.

And maybe similarly in the next one.

> +#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
> +#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.

Added both (plus `feature(exposed_provenance)`, which Andreas asked
about privately in our Zulip) to our usual lists:

  https://github.com/Rust-for-Linux/linux/issues/1223

linking to the PRs and to this thread etc.

I hope that helps!

Cheers,
Miguel

