Return-Path: <linux-kbuild+bounces-11407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMhnAjPBnWnzRgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11407-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 16:18:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE74188E8A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 16:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E4E7301C8A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 15:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2EC3A0B0E;
	Tue, 24 Feb 2026 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hxUGMi5a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186DF19CD03
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946241; cv=none; b=G0ccDl4yLu/9f6dtR3wkGQQBD2kC2Qgn3T9Vjf7G+hQF5QeqH+VtEF8WpdO2FsXMUxMg3fJdPKzBw6QizOCNRhecKlITWWazIt8KaGAAsIuB6J9dreyIoRaLVdMsuJjoPwhC0UT23RGmwQu2VRT5GSTPJbkoT4xXgiK9fuQJskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946241; c=relaxed/simple;
	bh=bpTGTozvD3yasSrq4XIec/IuQ7bIWRv4psvjDM1rGY0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EocvpJQXW7XDYDeCRkL2jMxTo/pFM5lueyC9EanBtX9ymuoe8FSLQiKdN41cTL1/mnPLjLTWN6DBEQx26olI9+75iQIPCAzRsaJn8kwHssubyJCbh+XNg67Uo6kfV1t8Hezj/QHrCjVAVhJqZUYxILV0vrc1ds4/Y7GIfah6IjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hxUGMi5a; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso59422745e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 07:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771946237; x=1772551037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpTGTozvD3yasSrq4XIec/IuQ7bIWRv4psvjDM1rGY0=;
        b=hxUGMi5aqKDDy6pjXae5Sew+FIKjn9h3BhLsS2xvH9jNpaYIvjfX+XymKGwiTqnb6V
         vDDP2r0LL2h2qV62u8jxqh3mu+izE8+DWxOgtQW5hfQa1cMN8kdzeh+5wwa71jBTGN9M
         0cg37cl0yDHflGq6y3YrADsZfWuhisdlSyDHIm4cz7HptAL2/TVOVk9BGcGuRZrKN7I2
         Fje6aFCj9/xIxbhhI2FO1S+sGNJ5uAR7o8aV28rBpm5W/JquAqGleCVGZwbeR5GRpDkn
         qxkwOXTN7Iibz3DN6As1xHnWi3+Y+Cc62H+SXBNLc6Rl+SMRToGi7YbgLIXC+FKwqEJF
         NkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946237; x=1772551037;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bpTGTozvD3yasSrq4XIec/IuQ7bIWRv4psvjDM1rGY0=;
        b=gvda6ry7llxu6Khtp9bu7RUsg9ZrbG8U3o1FvnDVxblrPi3xAlV3l/213yT0JpNhHs
         xH/bD+9LUM0C+P+xGnI/sdPsru1m63c7Kp5MXqOMziMU2idjCDnpEUm+6RfKes/rEhXG
         JI1fKQjQjGzIehH2hqgu0GfiAWi6A2E6eJUfnk5nAuu6mYFn4K+nrmt1fXM6TeTNXc+z
         oslR5Gokp2onAcUtc46tRodf8E2opLBZeGXwjUxqnlKL2c4WFs27QXHTXfPL7d4Kjt7w
         85r4p08WpJbeURtSNeozWJqGepCJd8j6UkIZHFZag1dRZTG8NlZpG52x4ufgS9v0EmJB
         RLYA==
X-Forwarded-Encrypted: i=1; AJvYcCVr8ZrYyYl0OuSoq4MCKnG2d0B2an0ovgxzExIC74cJv3SLN9yPdqjmlA+NqZQHVZPk6wd2xd25sOsNuE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYwed+DccIsKaDgSMICLLfGV12WvXtTDBKf8kz/atOZE/Cy6o
	r6m4U8XIY9JkXMn0gKpsiGAzInYeEKy1UMpIal3EuoSpN/l3X9DMjAJlziufTWtfGUylhMkS8yA
	7dniUyCenwkYF+7WorA==
X-Received: from wmof9.prod.google.com ([2002:a05:600c:44c9:b0:477:988a:7675])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f93:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-483a962dff6mr201499035e9.17.1771946237254;
 Tue, 24 Feb 2026 07:17:17 -0800 (PST)
Date: Tue, 24 Feb 2026 15:17:16 +0000
In-Reply-To: <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com> <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
Message-ID: <aZ3A_KBWFJES0d_t@google.com>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11407-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,binder.rs:url]
X-Rspamd-Queue-Id: 5DE74188E8A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
> On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Currently the crate name of the Rust Binder driver is rust_binder_main,
> > but I'd like it to be called rust_binder instead. This affects e.g.
> > symbol names in stack traces.
>=20
> We discussed allowing to customize crate names years ago, at least for
> dashes vs. underscores, for matching C names more closely and perhaps
> other needs.
>=20
> Back then, we decided to keep things simple to avoid confusion (i.e. a
> single identifier used everywhere the same way is simpler, at least
> for humans) and to avoid having to deal with those dual names
> everywhere (e.g. adding workarounds for rust-analyzer here).
>=20
> I talked with Alice about what she needed here -- could we rename that
> source file to just something like `binder`? That would avoid the need
> to have a custom name, so everything would still match (symbols,
> source file, object file...), and it would give you even shorter
> names.

Sure just renaming rust_binder_main.rs to binder.rs would work too.

Alice

