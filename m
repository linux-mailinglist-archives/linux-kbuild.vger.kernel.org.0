Return-Path: <linux-kbuild+bounces-12135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKz1A5tFwGnhFQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12135-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 20:40:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC62EA853
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 20:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 027CC30022D8
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 19:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9E63382EC;
	Sun, 22 Mar 2026 19:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLbPcWiI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938D1A6814;
	Sun, 22 Mar 2026 19:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208408; cv=none; b=DMUvsN0Pk9nIOnA0RDM9SoTIraGi9V9cq6TwvT0ewxXxSPbHAPPu6MbDsg3aQf7vAuxu+rxZd5huQlIbZNHTXKW+0IBbSqptmqHr7wa1LTCHqGG72OD/mE466p1PU52HxcIkarAHFzJ/wsAXgWE4cx/GzpbKbUjKUnvEX4q6SHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208408; c=relaxed/simple;
	bh=LmSsPswxZJyi7uyr8x6P1FPNjN1VACNlrBgkCkSkAP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sG+SPVKETyS0yhtXv9aA3ybTBxt7Spn4/wDvj5FKKtZ8RxJTa9F0OUZOT1nEcMhw42yaFF6dusxYcEMfRPq44kUp8nqYnBOyhFO44WD0MC92Hnalqj9fdODmL34YXYzmEolE8IZ0g0vhpknXPl57JoEskJcEbIkaWxynwXWq340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLbPcWiI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773E3C19424;
	Sun, 22 Mar 2026 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774208408;
	bh=LmSsPswxZJyi7uyr8x6P1FPNjN1VACNlrBgkCkSkAP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLbPcWiIbbxn7OdK2L+WCXVhbxqwQdPh2l75KmHFLZfVu+hn4dywhz3ud4tx6qJl7
	 7a/Mi90Abm1OGSp1kBwcpD9waRFSX9kZ1r9O+DIdQ+XYgcDIwgHdW68Nj9GYLyNGmf
	 I4q8LNcPUOQ+lENOSwv36knt9/YDorltIFC5qKtT/R6NhePAJsSRV3B02BJsEc1Cu4
	 S8acANr+Be+hA9NKIhNcJ5CdalqY+U8Ayjuq1iqAQTSOhugvvvb7705mNARXeJ3EvP
	 XmfSiLR6esl4sZQwU6w5jNugUfMg2qWrsNHmzi3Vd9sac20+v/tBNdVllME6U7cCHp
	 E7Z1uW68ZN+qA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jean Delvare <khali@linux-fr.org>,
	ojeda@kernel.org
Cc: linux-kernel@vger.kernel.org,
	a.hindborg@kernel.org,
	acourbot@nvidia.com,
	akpm@linux-foundation.org,
	aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	david@davidgow.net,
	gary@garyguo.net,
	johannes@sipsolutions.net,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-mm@kvack.org,
	linux-um@lists.infradead.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	mark.rutland@arm.com,
	mmaurer@google.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev,
	nsc@kernel.org,
	peterz@infradead.org,
	richard@nod.at,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	urezki@gmail.com,
	will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Date: Sun, 22 Mar 2026 20:38:30 +0100
Message-ID: <20260322193830.89324-1-ojeda@kernel.org>
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
References: <20260322192159.88138-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	TAGGED_FROM(0.00)[bounces-12135-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,linux-fr.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91AC62EA853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
>
> I will reply to a couple other bindings in separate emails to avoid
> spamming people too much.

In a series of tests, in some cases, I noticed an `objtool` warning for
x86_64:

    rust/kernel.o: warning: objtool: _R..._9RegulatorNtB5_8DisabledE3get() is missing an ELF size annotation
    rust/kernel.o: warning: objtool: _R..._9RegulatorNtB5_7EnabledE3get() is missing an ELF size annotation

I noticed that it only happened when `CONFIG_REGULATOR` was disabled. It
seems that we have undefined behavior in `regulator.rs`...

We have `Regulator<Enabled/Disabled>::get()` which calls
`get_internal()` which calls the `regulator_get()` helper, which returns
`NULL` when `CONFIG_REGULATOR` is not set. Then the return value is
passed to `from_err_ptr` which checks `IS_ERR`, which returns false
(unlike `IS_ERR_OR_NULL`), and thus we return an `Ok(NULL)`, which we
then pass to `NonNull::new_unchecked`:

    // SAFETY: We can safely trust `inner` to be a pointer to a valid
    // regulator if `ERR_PTR` was not returned.
    let inner = unsafe { NonNull::new_unchecked(inner) };

So we should fix that -- it is there since its introduction in commit
9b614ceada7c ("rust: regulator: add a bare minimum regulator
abstraction"). How to fix that depends on whether the Rust abstraction
supposed to work transparently like the C API, I assume.

Now, two improvements I think we should independently do too:

  - The docs on `regulator_get()` don't say it may return `NULL`. It
    originally that case, but commit be1a50d4eba4 ("regulator: Let
    drivers know when they use the stub API") changed that without
    changing the docs.

    I mean, the "docs" are on the real function, but still, one may look
    into those and not realize the stub does something different.

    The implementation comment on the stub is also a bit contradictory.
    The original sentence (which still is there) says that nothing
    should look at the value, but then it goes onto say that drivers may
    actually look at the value.

  - On the Rust general infrastructure side, we should document more
    prominently that `from_err_ptr` may return `Ok(NULL)` just fine,
    since it calls `IS_ERR`. It may be obvious, since `NULL` is not an
    error value, but still, it could have perhaps prevented this issue.

    We should also include an example to the doctest showing and testing
    that particular case to drive the point home.

    I can add that as a "good first issue".

Cc'ing Liam, Mark, Daniel, Jean.

I hope that helps.

Cheers,
Miguel

