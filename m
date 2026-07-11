Return-Path: <linux-kbuild+bounces-13990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HK6rIfQcUmp0MAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13990-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jul 2026 12:37:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5C7413D1
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jul 2026 12:37:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=iDe3ONEQ;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13990-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13990-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ACAE301A382
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jul 2026 10:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526DD32E757;
	Sat, 11 Jul 2026 10:37:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64D391E78
	for <linux-kbuild@vger.kernel.org>; Sat, 11 Jul 2026 10:37:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766251; cv=none; b=tjexR164sB6caLywpKKJ+V0NFKabqHbU59Dc16NXSvcQX159va3GAsPJFFCSkyPYZnKk4Zc4Wdb9pqmHR6nPAEWvugKTnlaYwqdfw690Eb/OWTO82G5PmO1/zrC70SRxD+b3K0sjlRYvLU6uNdF5YTMTLJ/uY7wQ+bkIbAITRFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766251; c=relaxed/simple;
	bh=ESLxc1HKNz4yV7ALmx9qcJmM8GSWlhFfKuxx+FL1Gc8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rHk6/rWpRcsaYT08Jfqnq3xDl7c33LUlet5D+0ZaGfbVZdcwjpofkLD2W0Ek3ZnmoF9RWWCB6HXifIAVMEmHYrtS3nPCDGffP4DACLz6VKogs91qiu3UdPFD2KrCV85lVxOEdwpRsgsLBCRrvb90XaV2ye2q0DouyxCTYm9jNJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDe3ONEQ; arc=none smtp.client-ip=209.85.208.74
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-695f710d929so1986188a12.2
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Jul 2026 03:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783766246; x=1784371046; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqnaoUdX2pbKNnqmvPQbVAVYTN3MsRyGvFlrV0MhNMA=;
        b=iDe3ONEQ2H+4OG7IbPLNdwWZ+8P8JIDDi/jTSUwyKNP0t0/5mTdiAp7WCIPFnOxRvq
         mIPWHuc63xWf9MT8av1DLICWTm0OKzlSoL3urEWEoJAA9CyNFsIpuyXSdejwz6xXZjB3
         q0+LWPb1jasNxVzX4a/5OxJqgAe4wOXE8N/jrDKpbVObQr7/xVWtPYPSJmNQVPt3Fzg8
         VE+Fa93BogghNOQ46HDXYjrKK8BZOzzH/eRQ7g5w0wWlgJnFUEUUqK5tiNaSSLKiiMns
         UiCnuA+jL3bnAX80Zp5RZmJKPvZtHk4uf9qgyDb7qn2U90yqTrR8qyHO6pmCFAdpnaO9
         yN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783766246; x=1784371046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqnaoUdX2pbKNnqmvPQbVAVYTN3MsRyGvFlrV0MhNMA=;
        b=dp90+kNwBNAXPYDDXe6oYPSuOp/VX2S4+e/RhBYM+xra6RlG9O+fDZgWUK0V17AGzL
         G6U4pyCN3VBy29CcYQYhH0py4qD0RSIHBCW8u7iZTjuiac/+1EYF/gSWNerb+vV1qtF+
         SD41hjP6H9fx/lrhFU91cpoNim/9z04zL0MG8dvZDMqxxTYAoZmimceoOrHWT0A0NGEV
         sQvX4koqyUjXLAogW6lJ+qp1IwduKRcc2XpycVcgF+tlm+WYuTv22jsTYPPg0wKSJDTi
         GcY6IdVPPfpGNCp3bbPsz9/Kw43Q/pPoFE9CqMI30PBLg/CZWh/o/d/EAwk/d9Eet4m3
         9tUg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6RNnCWJ5zdxwoZWuwIPKcJ9iTyvdM/IrB550xmJ6OhY0ZTbRAGOJ69ZsiKiZ2sNiL6gTQ8sJyNKN7bkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqtzvsFG0/erxl6ns6Igz8jkkfwfgagpeqLaym47Ud3Seovho+
	QOJO3CqxvzcaBvCyb4K/lsXXfAakpW0HpkXeV+19ySp3QDz7r7KSj/3XW7ox5pAjtu5QyHs7y+m
	POihKbvjkO1NssLb+kA==
X-Received: from edaa2.prod.google.com ([2002:a05:6402:24c2:b0:69c:20d9:b154])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51cb:b0:699:39c5:204b with SMTP id 4fb4d7f45d1cf-69c5f0be27dmr1056069a12.18.1783766246370;
 Sat, 11 Jul 2026 03:37:26 -0700 (PDT)
Date: Sat, 11 Jul 2026 10:37:25 +0000
In-Reply-To: <20260625231919.692444-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260625231919.692444-1-ojeda@kernel.org>
Message-ID: <alIc5f-NpbnDr_Ml@google.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.52
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	Jesung Yang <y.j3ms.n@gmail.com>, linux-kbuild@vger.kernel.org, 
	Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13990-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:tamird@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:rust-for-linux@vger.kernel.org,m:y.j3ms.n@gmail.com,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:yj3msn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org,gmail.com,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4F5C7413D1

On Fri, Jun 26, 2026 at 01:19:19AM +0200, Miguel Ojeda wrote:
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.52.
> 
> Most SPDX identifiers have been added upstream at our request [1]
> (without parentheses -- supporting them is an issue on the kernel side,
> but it does already reduce our differences). The CSS one for `rustdoc`
> was added too [2], but will be picked up in a later version.
> 
> For `zerocopy`, enable `--cfg no_fp_fmt_parse`, which was added at our
> request to avoid our local workaround [3]. This means one less difference,
> thus indicate so in our `README.md`.
> 
> For `zerocopy-derive`, enable `--cfg zerocopy_unstable_linux`. This
> allows us to use `#[derive(zerocopy_derive::most_traits)]`, a new feature
> upstream added for us [4]. We noticed a minor doc render bug [5], which
> will be fixed for a future version too.
> 
> The following script may be used to check for the remaining differences:
> 
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/zerocopy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
> 
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/$path |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
> 
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Link: https://github.com/google/zerocopy/issues/3428 [1]
> Link: https://github.com/google/zerocopy/issues/3457 [2]
> Link: https://github.com/google/zerocopy/issues/3426 [3]
> Link: https://github.com/google/zerocopy/pull/3416 [4]
> Link: https://github.com/google/zerocopy/issues/3466 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

