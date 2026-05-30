Return-Path: <linux-kbuild+bounces-13437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPfIJ4/YGmp89QgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13437-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 14:31:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7360CD0A
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 14:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 858F7301F7E3
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04FD3AB5DC;
	Sat, 30 May 2026 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPC02kbb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7535202D
	for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780144268; cv=pass; b=h5ufN1isLtJuV41q68Jrw/WR0+h6Ke+9bIRH8DYfu0tMp5WDBwg4oo8rPRVIcI40iN3B1t7eQzyECeRKelrKRAY/pr4fe03AS0br91Iv53ztROVIMSYvX56JcNszWYNZRWl+j1eHga0Tq5Rlbf/b0bXl2wzZ5uVlx6BeSZ7zeV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780144268; c=relaxed/simple;
	bh=5V0JB0seYuuGYGJZkHuPFUN1z102gqlQdDHPXmOEZaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mtln+HvcTd0Xm/pgGFvbppY5Y3mjlJkO4ftMPjUsllDemCAuReKMfG0nzAL9ajWxGS3MFOtNsdlDUeKSu4BesY+0Ra0+ejXitIpQDYu4xDZmxsQ738jdnVXZL6BRyr1pzP62036IGiFQaCAVluapOPGXg6Az52sIdFYyTqL3YxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPC02kbb; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so1100629f8f.3
        for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 05:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780144266; cv=none;
        d=google.com; s=arc-20240605;
        b=eYKHT3/OC/YTI4y++2PJcjc/b7e/6uLa0NqIGOBU3D1q6/3AsdClcldhjhw8Dl9Mm1
         fHGwJVXJe795XpjUhbkfBOser+/t6nD/dSAMXdctTCri+mIJwLFlyjJYiP8saEhasKlg
         413+fCwmsZKajKCUYyLBXhMs2/Jop2kVmpcCjD7Mki8cJSCTGMg+vWj5NPvsqEE1weGq
         BOeMs3czQhOXOqQvBZs5ifjnFuVyKkbVxB8SURyA3+NnofOXOeyKhtCPw8fUPi0QMaUn
         nUdh2pK75vH5RvcxBjFcsvE+5Y9YGvrN4Z8XBJlyzTDJM8Ma4ZvZFru8ThF5pKiiCYoE
         oTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tsmJTUGqQ4t1Byuf+9POVmmmU068+8j9SHedukFDssw=;
        fh=XBsdlTPyOa16Tf0xxjy1gXjQKTqPpgUN4i61fOLNH2I=;
        b=VX5SVuHMEDphtb70zkAfmg6LFP+kkHIitG+OBPFPsp83IEqvUzLFwy6+cPQ4c/Q+58
         KLo8RzqhBLP+zXijto5d4gvHk6UhniNQgXx20SoNp+npFUzht42hv2NfbPs7JPHKB5Dt
         wPCsbwX7RY/M33AvqVtqCKad3iLRxoNEhBf92Za27S/hX5Mbxf0CGsV+tDqKjPn0ma8S
         KavqActJSy0Xb6fruZONQQoWJHKt3R1QmiC/UxNXep5SYdpY8PrnHH/0jCMtJ4Beu+Fl
         vFaXNEmH6vSoT/4MheP8weRpk8HlpNmSt218qaE8ZYINAFf0aYL1cWJrF5CyCzTuWVGq
         LgFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780144266; x=1780749066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsmJTUGqQ4t1Byuf+9POVmmmU068+8j9SHedukFDssw=;
        b=DPC02kbbdtl39Ax4OMAaqWdplckovJegTwKheCKwhoLGyoILKcCMGt2s9PTSzu/Zc7
         4CLZJr9138REQWWMtbEibRIPM04l9ZdmCQCrKUfbwKqKxBkWRofldXVgLrUZWrNxWsrl
         NBgTDdNV8m0TfvFgf5Li/4xTJv+JC3/aG4ajfuQDhlTLwczKAuzWgBaBDUs3Jc2d6i53
         bWvkBNrJxpx0bs50oVfklFVGEDMBIzEeMaZABJoMDm3z1jX456ooq8em/vgwB/VJrZXX
         bxILMDjn6kSvZBXJn5Z0xx7FGhGIXtkr9UqzkAqPkl6BKUeBzu+29IvhQSo1VwbdXeGG
         mwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780144266; x=1780749066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsmJTUGqQ4t1Byuf+9POVmmmU068+8j9SHedukFDssw=;
        b=fPAZe5v++ObjbwWudD3KYENybwTsNHOD9eWwwthKVzWYtFPh2Ju8GJmhff9RMyXxAi
         VN2X4x/uS+v4jUjvhzRcQ7ZXU8bTjQJtLv42AD78f4SHjeZIJNNzv7B4+BbvTQa69nSB
         GKXVFrhUNxaQwsj6xPLMVdXWUpRH/a1iLbQ0P0pJSkaHImXV0pLFh+PDMPqOznK6orp7
         eBKIbtqSAOVbDSt24CSvioXsXd0cX20kh9jwGfEsbWvCnGJgWSUG+HX5+dqASGUA9yV+
         Fu/DemcVFMXbyXwTmWRqyAKLbHRFGNm5oE4zRjRjy492ZWmspySWAFgFOUEw9iH0xKqY
         2CmQ==
X-Forwarded-Encrypted: i=1; AFNElJ83v8C17Uz/jTwhdRM7vi9Gnz7u6Fkgq12PX39xhHJA0YZE/p46dsfTJ72CbmSCUCSz1JMWnR1K380z3YU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEruMGk9gzPCnzv+xIe6F+9il1P7H2OgpGLPwYwBIrTFqatPi
	O+NbnlklOFEjGeF4t/0r0sldHvM3lEkZq+TaygQxEXaWqIaspJanKYqNjXPCalKJaiB+Z+u1+pa
	e8Z4U/Wr1eonPIzpL6WGH1erOuqIFNbArKuATQa7+
X-Gm-Gg: Acq92OHBLrTzXJnN9ZQ9ZM6+qHvZxQq2/MomJl4tpkIV23nKglP//WNwLhZZrvoTbfL
	DdGiuPJDzLNxwY88a3xmKRu93q/3HgiKzJqV1yLRlWbjwMRih+y6w404Mvx78ZwIn70SNfjB57h
	k68wxK34PDrOKqLHLY3rFGH7fGFhdp78vPiV7FEXzmD3HWnZINSULZZTBT2mk0ZolvZ7uVhTWgm
	pGZGNfOjs4xXQh0JMxHn62EiGHOkgBD3BTy6cfxF+TY2RdoWjhwoihQ7O3WDJAjyAXyan6lr6lt
	wKOm3tjJjT/xiBPgvemSTVI3z5Rf0RVzlZx3fN1gxzl7Go4x
X-Received: by 2002:a5d:4387:0:b0:453:e3a1:6580 with SMTP id
 ffacd0b85a97d-45ef6b5af04mr4608951f8f.25.1780144265270; Sat, 30 May 2026
 05:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530114925.260754-1-ojeda@kernel.org>
In-Reply-To: <20260530114925.260754-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 30 May 2026 14:30:53 +0200
X-Gm-Features: AVHnY4LccWAtRKrASCOhbKiSp_wJ9_ymIUBVUkcrjZtT13a4agAHvAMnhzm1asI
Message-ID: <CAH5fLgiXzxWD3t09PpiLhqNP_D5L3wX3dtqZC1kqOHupOVednA@mail.gmail.com>
Subject: Re: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13437-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,zytor.com,ralfj.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,ralfj.de:email]
X-Rspamd-Queue-Id: 45D7360CD0A
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

With UML updated too:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

