Return-Path: <linux-kbuild+bounces-10836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOvmNdVHc2mHuQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10836-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 11:05:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A573E39
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 11:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FFDE303C610
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FF735CB8D;
	Fri, 23 Jan 2026 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIIII3SU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26682326D5E
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162650; cv=pass; b=eYh1oKF+DlDxqXsWFbu8gsQXoMdloBNB5IxxU+K7NU/BGvyjHHi2TPjU8DDujmjJrOVdEKSLux3Av2syz8iN4OPjE/hL7SOYxzRTnuiLiKdNn8zPzjgVswhUyaN8+3yLK6pwYCEatV0loPtbTTGxsuYW6t5gqNWxPIjw0ls5OEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162650; c=relaxed/simple;
	bh=BRIfbKHKfVzkLXmQL298DB7cbBMiKdki5CBIhdL7KC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzB/nTEgAy1SEAfkIC9Q/tdvUw11+7A7FBvNoN8MiXcJ7TbJGP9tS2BQeEzZa/DwckU1sBM/+e9SwKyW1n4+L8l0foYPPKWi/okeEbRZWiSE1/PNuZoBARlvNHC2bYoaUxw0S8dltxLFq8Ok68q1rAwuJcTWIibE+eQl3xN8Jkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIIII3SU; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b7267ff06fso164210eec.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 02:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769162635; cv=none;
        d=google.com; s=arc-20240605;
        b=C0XeNhFot1/Dn4Q7J3z/dWRv1rnhmoSZOjl9Hhl0xMUdelVGQpW/IVjUwuYW82rH9a
         aXRuJ17fzYV4P1QNk9Peec5lBZuQI0s5uVRcDjbvZLa9io/pkp802xqD8UFVf4pV9ipk
         dcj44YOFbwW3YHuiHblypaBSIxavvZJd79lRKdtCaXRZw28mIcq/I16KeYTbrZToHvo+
         Tylb59oHzk3aO/nx+E7bziJ3/pnB2Y6Vu+9qutmc3/6uU/BTf51Zl5L/8HNaE4srpcAe
         AyJCApBpK7UjS/1Wt3XZj4zjbCltPVSfqADIpQSVYLAdPTGHehS2f6Qs7HiwG8yIT17Y
         HhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CE4OiFC6+ZBXl8BzgB29qbXF34gjOePJNZ1Ruw2PvIM=;
        fh=6nSymot3dDGHP6g7v1qXEiB6hRvapC0TqZIve0vyDYk=;
        b=jLko2QxPrAX2TNxx0z3fxsjoU1cQf06R/MYrUlgtVhERgdAsax6NkgkvIARLpn8/Gg
         w5WJAP+XcVLiGbGM9Es3nGBovEmS+U2LyoU+fXPuMO2AqcUd4uAExOUyAQcFS3AefzBQ
         c5D62QN+bBNZaFgVVxfrpGZKl2Q7FUuPrmPpE/bGIDvWlgbxBtblZfezo6I2xihKlZXp
         p7wVvdI7pY0685JRllCI5mhT3IL4uWj/RxL8WY16b/Fses3gb0A4rt9JKCfUK2ajcgqI
         BZ3vwEu6larrK1a0BM6dGBJnYZYcwjwWDkRn5L0HyaPiGdL08SX1Dersa/LIHRw99zSo
         Iw0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162635; x=1769767435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE4OiFC6+ZBXl8BzgB29qbXF34gjOePJNZ1Ruw2PvIM=;
        b=RIIII3SU0MNdXn1asIYD6kCWQFZQeIZY3auTiH6Jt8LPpUhJ/10EGPO3mn78SKH3yP
         zjiJybWiTbS81sSeKuqRzd1gKtOizcco7XtDd8hql9U0lkp2mOmAYylfSg2LzvCSZUO9
         eavt7zJm21tYlE5MHm3TCEOt702PsVefSEYjwplFU9oF6eEaLckXTGAwiWX9Rh3L8qj5
         hgnSdVNj7y2+6dUMIlEDw/zwifame6Zoa3usrrNh+mutUAwBY4dcaXOQuATIYRDFnghN
         LQ+s1DivBaFzmn7Zr0LZoczjyTuB6yEOaWstRuHpkipMn3Ha6wZd/J1b7o7+TAlORgTO
         VI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162635; x=1769767435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE4OiFC6+ZBXl8BzgB29qbXF34gjOePJNZ1Ruw2PvIM=;
        b=WW4h9YWmOG7E0mspnOy1I2BcnRAqjGq5UCP0PD+yXPHrxMwk082LmzFANTZUFE/zHe
         3qTaZoTY1JEL5CVJMU3o4XYq6sWc29OwO14n7hybB4S9W0hYptOcSTADc1TOQhe4Rrt0
         ZqSp2HSfbciluTDQVH0bdt4nFHeTdVPSXHqT3SJEDnCaJ3toxH+6mu1fSAokpMznGvWF
         InnsioNBGqP8w2mjVqnq2yl9DEVa3nG24I6PwFOv0mNWOmjIQFIp7/u7iII1mAb6ehaf
         ycD/jKTJFicYl0HGcPIxaC+B+DmNu1Lu5Bwx62TuwrF8WI72kIz21+Abw78JrwpJMwub
         zn+w==
X-Forwarded-Encrypted: i=1; AJvYcCVlOcvrlOS/8TkFe+zkL4X6OrFeKk2FgdrmVBJo1wOLnbVg4h89NDCgU8KkMf6FYVDgVemQC0U5p13dbAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrDkIL1dQBZZW8MycGYFjl2XShsE/ewnfCuHG137RMJBoJnR7
	asG+8/pm8rVxSPXkpNekQzza69ErDjhNPehodjmdJWQYn8kcT6BqcgeyrdPxwI+IToFoEYOTwRm
	7HcdCfkq1eOHbgnqHgyFFwGyZb5DOXpA=
X-Gm-Gg: AZuq6aII1BRBD0P7LqqEnyEl/XUcmiD6zfz6rsimp4x7xMyNrl6WghVDcdCEM+R0bdy
	xhXDg0SVKNY02evAmav5KTWhjKgKzPYiOzpTDmCGe5bKgJiXKML6JBfTCuVq/EYhEF+2M8k5guc
	mJ3I2fP2RtQONOMRscb0n/jX9tx1J+CpxH1j9SBCFN7sjGYTYw1WHOoGDOKXum5Lf6XY3Aw7X21
	wMLYq1pdg6jCSOE1rSWo46Sck4wwPP56XPKbsZ+pPaT59Z1v4oHAebybuDucLDkV0YajtSFMB77
	n65Pqp8k3313PuTwaXypjIvSrdx6KmT4FKD/xKe8/7d43PyzXUax0GhNYWWWkrP80sU9OA/HwHe
	HVPsF9bZ3PTAV
X-Received: by 2002:a05:7300:f081:b0:2b7:24fc:f625 with SMTP id
 5a478bee46e88-2b7397b575dmr574956eec.0.1769162634772; Fri, 23 Jan 2026
 02:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122054135.138445-1-ojeda@kernel.org>
In-Reply-To: <20260122054135.138445-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 11:03:41 +0100
X-Gm-Features: AZwV_QjWr0oPOG3Wnr9kQVoosMcSP9b13bD5dE0oUkBJ5yESEySGOVGmDsfyPvg
Message-ID: <CANiq72=f=PO9OFHkTwLDVgibwWznTZLX1hg1CV13GM0Avvbk4w@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10836-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E7A573E39
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 6:41=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The Rust compiler cannot use dependencies built by other versions, e.g.:
>
>     error[E0514]: found crate `proc_macro2` compiled by an incompatible v=
ersion of rustc
>      --> rust/quote/ext.rs:5:5
>       |
>     5 | use proc_macro2::{TokenStream, TokenTree};
>       |     ^^^^^^^^^^^
>       |
>       =3D note: the following crate versions were found:
>               crate `proc_macro2` compiled by rustc 1.92.0 (ded5c06cf 202=
5-12-08): ./rust/libproc_macro2.rlib
>       =3D help: please recompile that crate using this compiler (rustc 1.=
93.0 (254b59607 2026-01-19)) (consider running `cargo clean` first)
>
> Thus trigger a rebuild if the version text changes like we do in other
> top-level cases (e.g. see commit aeb0e24abbeb ("kbuild: rust: replace
> proc macros dependency on `core.o` with the version text")).
>
> The build errors for now are hard to trigger, since we do not yet use
> the new crates we just introduced (the use cases are coming in the next
> merge window), but they can still be seen if e.g. one manually removes
> one of the targets, so fix it already.
>
> Fixes: 158a3b72118a ("rust: proc-macro2: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

I am applying this one fairly fast since Rust 1.93.0 is out and folks
may trigger it in linux-next.

Cheers,
Miguel

