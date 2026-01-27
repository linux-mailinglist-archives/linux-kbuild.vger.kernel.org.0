Return-Path: <linux-kbuild+bounces-10902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKXCKIb3eGnYuAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10902-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:36:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1898819
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88E39300903C
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 17:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FF830CDB1;
	Tue, 27 Jan 2026 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKqoq7xJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B03115B1
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535363; cv=pass; b=dAjy+982oIKJRR4apoYxImTAIp9eKJNSsW50G57HLdGe7MPPrleQvXJ1wZfqXgzGa+VFnA9XTS2CUUkR7T/JqKgIsR3enTxoEec755yYlqZYzo7uevaM4YFBLOX/w5blXxuNtHbB6Hdbyrba0EDnb5INrowSp5oK4raAZsN4+xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535363; c=relaxed/simple;
	bh=JD08oiE6Yw2TzJq/rTqPH9uu74PRjIBk6VoEKqCYbbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6s2l70rKqCtCr5d8+qOufVTA5wtUPUZaWKtXIDJwVzs8RKGdk/iquA4b1VREivQoyzWe9ZYcwZYn7dGwXt2y9YmSYk5DKa6tK8tOvrLSK20AfSUFukjYpr+1cnOxtPE5eXjOGyXGC0F+AxQmueS0dtEL6DKiNpsEy+/dFWurW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKqoq7xJ; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b78c97f57bso95258eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 09:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769535361; cv=none;
        d=google.com; s=arc-20240605;
        b=cc9AyTpKDNtKNw8z0JwidFbNH9QjlHnrDDGAjIYj4FBk+7KtMS5k8Sju/hDBVQmtbR
         GLBziOU35ZVYBmICe6lGpdfpWXkXJOEkHNQwDqpGk7dNax0Z4lTfqgpjRvinxe4YmYsg
         BoLbTQmz8FQ2quodech8xQrkUqjxWSAlFVo03ciwWG82sUyeFrOHjoMcTivFYaHi0RQ2
         8PqU8uG+MdOCaFhnxhLFeot9wbXiNOkp16td4G30p3XBgpV5uSZyWuLjbyECmh9AdC/+
         3aTuCUCq4g+07A2mRj90n32JoYetIg76f6+GtN7KhVKOAU5LYLaO8/RzTfazjcaB3upG
         azpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qVhE+FmDW4ydE8053IR3T3lArmmS2wtv26IQxp8zncY=;
        fh=01HMXx3YKsXAB2SraJToIpMomXOovVajAYwLmmTEVE4=;
        b=PL7FA3M4UXKCiJ9hgjnz0uhyJKa1zp/4Jgzj/8WLv5fZejikifukoZ+TUMojtsTroH
         PyqY2NVYjmwiT2mCHXdHMgWLNuiE6DvRVgWen5AoqzV7CZjBnfJF+B0TWKhUxYZopasn
         8gCyymqMNwN+tg+8LFTjYCgbGqVAco/Y4KHKNfBjZGNBeXHD/Coi8X2q5aYu05iWq7ao
         Bzrz7k5VXzUyXn6OyfG+fFIKdsYlBI9FO9EeS2I/x8zM0+Y7PahPZohEnrlAjYPAH1aU
         OhLcsSyNhYnb28j27MNqhGOQne00r5KRpmOL0vUiY1UDkWfOyfJxITP6J9FIMaIEm1vo
         t1bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535361; x=1770140161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVhE+FmDW4ydE8053IR3T3lArmmS2wtv26IQxp8zncY=;
        b=TKqoq7xJ6hPyp8M/UEhK/mq7i2PkyAV4hK2qEEx2MQCCVne+EJhA/BpWuT2uTLSZpk
         elBKzN7Qn7T2+bWqN6kDSs2DSG2JSvj4LUam4e3afsdlW8kY6mq9kunr0a078Fr+czUE
         9Vao7ScK6twPTx/0Dyydc/0v7fj1TUUjQz1ATxpbcGjcn7vdMyHT91sBIIZQsXl1Is9U
         ssPgWktIp9v+vTpqnbLKrZzM+hrjYd/4VclLbJW11UWDPZXQ9q6hoQZqo2EcB3cA4Tj7
         83MdB06PkgQ2hXcgPsgFxvK2SzES3IQqRPVGo2powPVvET0pWs9igz0MoNk9pjQJQnmE
         a67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535361; x=1770140161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVhE+FmDW4ydE8053IR3T3lArmmS2wtv26IQxp8zncY=;
        b=k3D+BTYppmfooZFad3iKFewfD1uws5vubjKrlQF1uvEyA4mC9aHe9gA4KwAwDZL/U5
         yCTcVrzGTKH7aXBC3KIKK8u9tjEtXtXiGwVf2e+jsGpenkTIhbArqCJ3cLhecEQreSpu
         NAlFeadpcKjbKaPpqNN7HYRmooprQ1EKeE8Q1XlI5+xEKHtZPo4xzEMNWc9s9tpog+O/
         jN5T0+kOCWzumy+t01KrBuPkFuLe+0J293wRuOtq+3oDLyzlpd1AHlwqF/Zhtuq8hT+C
         WhetkMLUyqZMRYf6CP3YfCJDJS0J5lx+yMsJlbp/H6mizZdiKkTqjvZ5bN1pC++imhat
         GlaA==
X-Forwarded-Encrypted: i=1; AJvYcCX89Twr6rVpV26d+G9sLhJIUGIopKmNKXV/NangGDy8ABBIU8/iR1o047RGX/aZeLagbG5YHazebUAI+Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVCol9hBdUIKNBQH5jEaype1KWmhxY7ZzfGgd/2O9GaoZbLh4
	NhRZL8yLiqrlSXhDcu2JfjPq6ia3ePNgjJwVLCvYGqFe/9s9wRZDnySxk+hKhM+GncfzUUwhnD8
	ryYLmDCkaBt2h78MTd6G6TXXUkwShcQJqNa8t
X-Gm-Gg: AZuq6aJYnYmYM3MCqCb8AlUgvjwb7WCQX1WyS+2RgqpVRh2//Cqn4sEJntlarz03gFr
	nBOeLvSDAvr15A71x+oBszNHD3q3noKub+01WiZkyRYGAp+H9Zq3QYtwOQ0gGVmD1uvPzc2Jj8w
	9uhzXBK1+dy/BaX3LLg3JdU/1/RgqpZk9JbJP9dJOqD8UVpPL9uXArgMMCEd2seXtsQMLxRulPs
	ItfQez2B5XhVYpcBUwzirPKJUo5hs1ifmams9cqJqtLq4m9GEdMqsPfvk7sEGiY91fjbEFGw47l
	SjR6fdEwsAzztSEM4/fb7tS/nkwfc7+Vvc1b4LXkqtMWMdulFR8vNUH5U4KnjiQb4hxkGBEpS1F
	CLdgW95F3Qtv6
X-Received: by 2002:a05:7300:fb91:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b78da099c0mr810010eec.7.1769535360687; Tue, 27 Jan 2026
 09:36:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127172330.1492107-1-gary@kernel.org>
In-Reply-To: <20260127172330.1492107-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 18:35:47 +0100
X-Gm-Features: AZwV_Qgm_3IfGEvKbTylRDY_m1P1aUTje3EQ2OOkhht5rNH93Rxk8Gai-6rcDW8
Message-ID: <CANiq72nJHqOaZEF+RSTu40kFAKgSiJ6u2TTKj1q-2fzmseW2rg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Initial klint integration
To: Gary Guo <gary@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10902-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1AA1898819
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 6:23=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This RFC series introduce klint integration into the kernel.
>
> Klint is a linting tool (in the form of a custom Rust compiler driver,
> similar to how Clippy works) that I have been working on since 2022.
> It was initially created to help lint on code that can trigger panics on
> allocation failure; this feature has been long obsolete after we started
> vendoring alloc crate and subsequently replacing it with a custom
> implementation, but over time it also gains some other useful lints.
>
> Lints that are considered ready currently:
> * Items available via kernel prelude but imported via other means
> * build_error/build_assert calls not being optimized out (klint will
>   provide you a backtrace to ease analysis, as opposed to just a linker
>   error).
> * Stack frames larger than desired (configured via CONFIG_FRAME_WARN).
>
> The kernel is not currently lint clean. I've already sent out a series
> to fix the prelude imports; there is a true-positive with Nova-core's
> Cmdq::new method's excessive stack usage which needs fixing.
>
> Many of you may have also heard about klint's ability to perform locking
> rule checks, however I did not consider it ready (due to false positives
> and inability to analysis some code patterns), so it is not enabled in
> the series.
>
> The source code is available at https://github.com/Rust-for-Linux/klint.
> It is licensed in "MIT OR Apache-2.0", the same license as the Rust
> compiler, as the tool is heavy dependant on the Rust compiler internals.
> Currently, there's no pre-compiled binary available; it should be easy
> to build for rustup and Nix users; if there are enough demands I can
> also consider providing pre-built binaries.

Thanks Gary, it is great to see Klint coming to upstream after all the
efforts you have put into it -- for others that may not be aware,
Klint already discovered actual non-trivial bugs in the past!

This initial integration looks straightforward to me -- later on we
can add `KLINT=3D1` or similar.

It would be nice to add a short paragraph somewhere in
`Documentation/rust/` or even better, just start a small `klint.rst`
doc there with something like this introduction and an example command
line to run it (`RUSTC=3D...` I imagine) and a link to
rust-for-linux.com/klint or GitHub directly (unless you really want to
keep it only for experts for now). Later on we can add more docs as it
gets more used and integrated.

Regarding the pre-built binaries, Nathan kindly agreed to add the
klint binary into the LLVM+Rust toolchains if we start doing pre-built
binaries, so that is great too for others to easily try and to use in
CIs etc.

Cc'ing Kbuild.

Cheers,
Miguel

