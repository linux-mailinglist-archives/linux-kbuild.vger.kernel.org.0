Return-Path: <linux-kbuild+bounces-13440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMAEI4g4HGqSLgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13440-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2026 15:32:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CC61662C
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2026 15:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BDAF301CD99
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2026 13:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD542BD5B4;
	Sun, 31 May 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7aUXPwf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40B286881
	for <linux-kbuild@vger.kernel.org>; Sun, 31 May 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234363; cv=pass; b=FomcMANE9z+s741+5VwwBVHvh/1bsegt0WYvn4k6yYtnxzrYh4IPGiB5fVnw6oviXrtdXqjTMIHt8EUZiC3B7rmHcnvR9flqjEepfDEp2Ip2hAc2UMw1tFLMQupo+hIuP7nlkBfmxKGAgGcsIcs2CKLnSLqVBCuKlIK6/FM8Qw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234363; c=relaxed/simple;
	bh=qAMyTFiFtTC0eh3lc4F6V3JJiXo41Df+HeqxHIXgYe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=py3RaU3FJljDteJowSRanR6xRdftFPKmYa6oPrDaL0A0AbK/egJmH4juW7+aA3qOfJSRNCtvPSMae0ZD91ucbBbOF/BuCwFKh3dKn3c5Q3bL12ErfqtGsgoBo4UjvesavzzoJ9a2dIGjBXkSwJ9uEYXAm3hVTG/Jp+juZJ6v63k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7aUXPwf; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-305056ac6cbso98705eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 31 May 2026 06:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780234361; cv=none;
        d=google.com; s=arc-20240605;
        b=K0Ju7WDBkodIpjCTUCwp2hXZmclrKu8XPzuo2Kq30m7bCmds/oKHgHTp/6ZgE+lLeN
         eL0EB8SYr3W/zAM6ORcQDGhzbxVEvY2b/Hs0Y4OF6oG54d8Cmcii0Fi07jBMGQrDQ5w0
         LpAQjcsIDhcelRyeqzACWJnzF0fVY/mB8EcuBpqBBc+G3f4ZsYIdAMJirFgAhcHzq13J
         VHCF9jnR+feF8Uc81tyITiAyv/gWJOxfH6iTT9+euUtD+Hb0LuxJJjeniVaWOPwpk2ki
         eQnYrdQLZ9OxIgVR8ZKCmpdY8HBNfO9jal9Sgdx3LrE3w2B7b0JvOiqvIeFSNPIzpaE+
         0n/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fWh0gdQbkNaUBMeVhYlkCZO1iRuS2+mRH1lNXIa5o8Y=;
        fh=vcbfkYSwdQYE2cL48erVAQSrHs1Q5vEnAXWrHOk1i7E=;
        b=j0uYfn5rxdszwnkdEvR69+Q5EpElm6jxYtgaepednorcXu8QJH76yr6XnfWI78ZXka
         3KhIwWkah88YcCwrCGRsHEMVfrzFV6tg80udmpahlPwqnNlhFoqcuEjEsiWevugSzHf3
         5BXhW4qwoxN4PXg762NiHNTEpQL0GQ9cHGUQgAqfSr1bwmOOxWV9oMTKo1YKEKGXkU1P
         XRppdRKAW5b0hpDDZvPSNEXQgCD33t2Fw9ph/1Zo3ao7QTNOPcE+YLAMbrkHzx2/Sy6+
         Ze9rpPf6/qNpeWZwFwPYItUDnSLCaJQEKWizg15zShMMjVwcQLB7pPnryLnxv7ziWmwM
         XWxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780234361; x=1780839161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWh0gdQbkNaUBMeVhYlkCZO1iRuS2+mRH1lNXIa5o8Y=;
        b=k7aUXPwfVCa+A1xV3xg7R1gPGpSGX0amSwRUkU0yHjlJVFntutJT3oYHxdVAHsduYv
         DbW2TcAOpzvLKD6xQk4WTMZNY2aRxYb7HgWW2dRvPmlKO6FV8+4/onBc2FccypuIq2PP
         bIRLcb50YgQmUXP8GJ/K/i1jVeDYx6NjYnJd3dpg+IVWFF6eZAdt7vb2dx6OmaWW2oO4
         7aX7GpqaOvtuvpiCuZavI1WACiWxI+XHP5JAdHoI01CjyReD8OcDl2Ei5EA3J7sYZIZM
         vzqqO9jPrh5nKvmryLV2saNrIH7as1zWrScNjqWwyAHn0Jl6si+KZgnPJkAAdQ37l2NB
         o9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234361; x=1780839161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWh0gdQbkNaUBMeVhYlkCZO1iRuS2+mRH1lNXIa5o8Y=;
        b=Xx89T7c+wnLeXL2+WT5uoZTzgY1LjpLwztBlGlWDdAT578gRVzGMVoWtII3qh0jOt1
         CdzgLd2Xd5qae7em4dCHVY3d+B1II9qs+57AI8GioBJ/mkGUFKA8i8eTMp+m0g8kMH05
         Ql/9qwnmNP8VCHZ1CjvjOPAV2c6wyX7w/q2H6hd2T/h6c9NF0NKEXcLFl90Iv8l2Rypk
         gBzTfwbOB6k0o8Viesf44Yz6b983sZXERscZXia2oz1/zFdq+mV6QwjioYwhLCC6YNeR
         DYGociCXtD+pZ1zZaoU8jyDL4GxYjki2MtGGwhl4+OoZ1QDl7HNqbfrZDls50kyjtXgz
         0Uag==
X-Forwarded-Encrypted: i=1; AFNElJ9NhIg5Enzs2g1P/vQ35Y7Gypejy3QOYBJy8A/LAB3d1t1ULv7n8jfOXDJWucY8ilV/090LJljSGv7iPIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLoxrdKjLhw6iNXsKt0O6qjUZq/8nE6Xo0zrRLhVXhYMKlTtr8
	CRZZiqw7OSOHu3jFqxDefmnnohi8ZvuXNuq6y1stEMpdH1O6WNMgdfMor1eunCYNAVnBI7y0vSa
	2ybYoponrchMs31EMKOPFPgDufTozk1g=
X-Gm-Gg: Acq92OG1T9DX/IdIjF2Hu8JWi2zOpJte3CgTrk4jG5vv7DQyBB6OM0mGK70aPnJygee
	hpvA6pQE4nDeDI4lr/dkWBBeLDI/f4YpaVLhJLxV+vHaiszmPIkW0Pz1URcJ0kJCRBF46a7AwkC
	SmptJv+vVeyzgIp6RfBavDH2xXee/pXFCYvEVfdrXJi25tfP9Ia0V888st46WrFeu8qD8NKKu+j
	JxoNGbjQqIM1r1BCIjTMfP7P1DP59RMW49IdCvKyfsLvBdbtVjFkL39mUgxMD2w4lTQ9r2r5o9a
	5RJP92cpQK0MrDBdDXZB0JH9PPdIdByr40OpibMrrGUAy2xgzYkdfITFwLAt8BJIvpFOG3ctzZa
	MNEkBk3x4eavkqrApB7lgatyKmGThVX7cRA==
X-Received: by 2002:a05:7301:6785:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-304fa6815a1mr1660153eec.5.1780234360638; Sun, 31 May 2026
 06:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530114925.260754-1-ojeda@kernel.org>
In-Reply-To: <20260530114925.260754-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 31 May 2026 15:32:26 +0200
X-Gm-Features: AVHnY4LkFossGWgF2BUdrWeoDzVI1qLwed4mxEucX-F3jYH0q0QFqR2HJgvbDJ8
Message-ID: <CANiq72nJP0+FED8MRX9_Jz0WX9ZeTekqE8xE2066VGsQPns-QA@mail.gmail.com>
Subject: Re: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13440-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,zytor.com,ralfj.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,ralfj.de:email]
X-Rspamd-Queue-Id: 458CC61662C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 1:49=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), the target spec will not
> support `x86-softfloat` anymore [1]. Instead, `softfloat` should be used,
> which is an alias. Otherwise, one gets:
>
>     error: error loading target specification: rustc-abi: invalid rustc a=
bi: 'x86-softfloat'. allowed values: 'x86-sse2', 'softfloat' at line 3 colu=
mn 32
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>
> Thus conditionally use one or the other depending on the version.
>
> The alias has existed since Rust 1.95.0 (released 2026-04-16) [2], but
> use the newer version instead to avoid changing how the build works for
> existing compilers, at least until more testing takes place.
>
> Cc: Ralf Jung <post@ralfj.de>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/157151 [1]
> Link: https://github.com/rust-lang/rust/pull/151154 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` early so that we start getting testing
tomorrow -- thanks everyone!

Tags still welcome for a day or so.

(I considered `rust-next`, but to simplify testing for ~2 weeks for
those that want to use nightly, I decided to put it in `rust-fixes`
instead.)

Cheers,
Miguel

