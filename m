Return-Path: <linux-kbuild+bounces-10910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJg8FntGeWlWwQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10910-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:12:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A31249B55C
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2142F30071F6
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966DC2E9EC7;
	Tue, 27 Jan 2026 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uxj43UCh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15422A4E1
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769555576; cv=pass; b=iGlPnQ0zPEl18SkZBdT76w4el5Ju8y/h6Edd125DI5g1oGxo6VCQdRyCNmCQCU4UHzFRVZp+C+P+Qyi6qYG+w0r6ncWRiAI7bltVVpAfVnfaC5BNwDoCBqvJQfrzw6UvnGlCOOy/u0P00LXiLH6hGtJs0F1qUyGDfArvGxhh4QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769555576; c=relaxed/simple;
	bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Awa648Q7V02KuinPHi4wFKK5x0R2o7H5qDg3g1cQpgCNDDGg9PaoW0MnD2Lf3XJGwGV09V4+wcfmYx8do9mF+sLfbu1zCHSFc2TtbHx0pmRv+e9ic6q3iawAOJv4JE5jyAosgV/iOhQDVQsQN7LcWiBb6NN9x9cvIIHKpgbIywo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uxj43UCh; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b79658162dso34728eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 15:12:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769555574; cv=none;
        d=google.com; s=arc-20240605;
        b=Mde+CJHI9a+TOilX5vJ4xKs/53aka+GrPfkN+dD6aYT5PfszulVToiVbh0z7fAtCot
         4V6ERwAvwR9Yxne3xlKDloDn1MrhYxzmhDpuNjhI0Dfa0krcuiOyjE6Of2f2I7bY3qyy
         BnRBdMnTlMdpMbUEtPzfN8QiWYW2HS+ZH4h353VlvacDw5TUkI5NqbVcGjOALTUDlTnu
         QteqtHJeqBXuuEBt5E6i0nHWWe717jBhMwIJ5plrXd3JGRRLpcpiYGAFarGuLCyThpj1
         JcGc3pM51lgmCRvVwiR0mknECbNIAWW7s6SDxZisSHNKpLp5O7+MFj+95fRhCNa22oH8
         Lozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
        fh=CPM8ifQjYFaLPk+2xiDLfT56P5OeKJnuxGVIyGNmZrE=;
        b=TF7YUgtKlHsVgpiMSxurOBSrq3jtbs3mWXWRXeI0kIk5cpkKee/l+sLoU+qEvTv0PZ
         6Q/WaQlmvT8D0O+PXfdXJV8GJXcpSx183E5y7K9y5yWv6Nn0X+EP3uvZSsE8nQwiD262
         xWvqaRZ7cvGhElcAKwjrpj+kf3BDvvkowI3Edf5mgN8bMHIXi6trvCCARo5BWEMjPKRL
         pp4HFUlZUqPbJWBKbkPrvd3HI5hsePDWpb7kKf7Gk+2OH7AsPMlWk0GDrepvCjNdpYHD
         f+mHt8Z2MzBf/qSWGz8QAiXJp83/gfny2NAqnZyGMJXpRjG712yiCbDmiEIZSR0iHb5b
         S0+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769555574; x=1770160374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
        b=Uxj43UCh5MTkPmoKbU6MJPcekp/Kt8q2HXDA3ivmSr5672k5snxUzpz2YkdfxeNXZP
         teFWlEkPV7DQLYCzyUQU8YeAVwnzBNGNMf/dSKnOilw/BjYbZ6hmxvm1o5BXISCxZHqR
         3UwtaYQJ0mCARjF/+13FC5StKub7r54kxwp5vOpBkIdy96Imvoz1eozew3B+0s+PNHEQ
         60RBOsNHwRheGd7nZtlPL2OEOOLv68t16eL4hThji1SZfcM0l3zETQDraFTECl498ELq
         FwGh8NXbh0iU6F6QtqP4BFc8TeAt3wmuxC1zcB7srzA/TU4WDHOa5ozIYpM6jU73P4NR
         pHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769555574; x=1770160374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HthKMYjEmoTgAxQ42X81lehERqNzy/n4B5fMDfQ6XN8=;
        b=r/O4pXKFVM9O89Q7P/MVsPnUv0YfxyWOT3b6eSnbH17VfgbmRjJJ9SUxX0VARQ1/zE
         dmAtzjH1pFG4ysGFkX3hWlojNvNlBFEU//yrXlGTt3sh1Zf/P4CQfSLcCiG2aU/e+ane
         LNr1Z+jExwFdplAxMDzJlgkn7JdBdepSxJ3Q4uMKdpSF/VNOtq0cqmAgFCDSzBV6JfiN
         5v52F5qbFqMCWIzg/dQ1pRQ2yZs/zrZ8zB9xFN9NpMHdwzw0vDHpix8xj8ZEzeqEaCt5
         YyHeidNkItehFTvkVBO8+sAn45NWhnlayvJa/clqnlLWre/ZAifTtC/ixOzOHinUW4mo
         XRVw==
X-Forwarded-Encrypted: i=1; AJvYcCXfX9U4Y1x6VuTUZ5keAHZSEEF7PNtC4GtGg/XzkSIA6Qnj8e5zD7SPI+V/16k6D8jzhgYZbvhWZekbiQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LEdcTewOTnEZtIkJ2Hd/pyeWylBH3Vw2GBp/0nDj37fiD4js
	I+/sCWoZqvZGTJb+H66cvOUgaGIa0ochgEmanYr7EyZFLlju4FG58ZTuQwjpOs0+WiMg1bMMBQK
	saWZYyEtLumlvJgKDbl11dXg/uyKqZZc=
X-Gm-Gg: AZuq6aK269vA6YukzaK4lpwH9RLJGGyVvyCf9gRA+OMlLPytiIo9yJZo3WIQfaJUnaf
	pEPYks0NMxkM4F/Habntg6jmWQsee5KSG76YXCpaCuXwUmgTwwbUBgm26FiRivtmp20JSrd1VxT
	hGpBRepf2KQuNWgrsqh1ztL7koRv1MirvkM8aFzF8mLSg1LD41LkNSiJD3BPuyQgeKbOm2QRwJV
	cX+BEpzAtndz3KZDR03a89UcS3nwgKzqxTWy5LW0WmXQ6hFqGqJi5YAWlsybuXJ6NOkEegvJwai
	hLaztaK0Hotd95Em2uHtOX3xMB12jtM0ifH2lE5oGtXSsPpcCjc7zRJtsMm5rtjlC87j+NVt1A3
	4VSdMECql4ANRB+Tf9DXtuXk=
X-Received: by 2002:a05:693c:3116:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b7a13d0870mr92023eec.3.1769555573758; Tue, 27 Jan 2026
 15:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127172330.1492107-1-gary@kernel.org> <20260127172330.1492107-3-gary@kernel.org>
 <20260127221531.GC3382807@ax162> <DFZQMVAWC7IS.7MTK7QGQLDB8@garyguo.net>
In-Reply-To: <DFZQMVAWC7IS.7MTK7QGQLDB8@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 00:12:41 +0100
X-Gm-Features: AZwV_QiQyGfc1KRtBDat9MzNxqUgcPnaQBIC9cGWTvm_0m1vAuibj1sujx4f_Oc
Message-ID: <CANiq72nK2K4mZNnpJSWP+Z1h3hkwSLtN+FOWKzUYdEJD92sU7A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide CONFIG_FRAME_WARN
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-10910-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: A31249B55C
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:51=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Lints in Rust do not take arguments, so there's no way to represent somet=
hing
> similar to `-Wframe-larger-than=3Dfoo`. However, I've made klint search [=
1] for
> `CONFIG_FRAME_WARN` and use whatever value is there.
>
> Link: https://github.com/Rust-for-Linux/klint/blob/168031d93c3aa538c8ef71=
d1e448ae77c2cef7a7/src/binary_analysis/stack_size.rs#L70-L82 [1]

I would have suggested a `.klint.toml` like Clippy, but with Clippy we
also want to eventually have a flag-based configuration instead of a
static file (or attributes in the source code which means probably
using conditional compilation in some cases).

So, even if the lint is toggled with `-[AWDF]` style flags, could the
limit be configured in a separate non-`-W` Klint-only flag? Or doesn't
`register_tool` allow for that?

Thanks!

Cheers,
Miguel

