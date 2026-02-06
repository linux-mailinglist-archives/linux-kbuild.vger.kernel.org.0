Return-Path: <linux-kbuild+bounces-11064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FAHcMAxWhmmlMAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11064-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 21:58:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38A1034ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 21:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 973143003368
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 20:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FF9311592;
	Fri,  6 Feb 2026 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzkenpvu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE630C35D
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Feb 2026 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770411528; cv=pass; b=F5IsvplNkIcEOJWqU7A4j6cjMLWh7qQLysfFSsvB5ETe5dfzYJdawEqdYpP3W0if2E+ExQPGKjlCIXfNkheqavnmcpW0F6PL24BY4T1R9iL6iSwUXEZMbIbiDi2IDqvV8Vng7LuBOFpl5vaCp1gCgUNWnzLs+dfKLycPMCFLGsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770411528; c=relaxed/simple;
	bh=9Vj7+gNg+Rff5ch0nT6eI5MqIw2L9AbA2OQUscfwkE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hc5sfhV/LZSb4xokNEk4eGhHSxJSVMQM4akG2HhzFyFCRsn63p2Ar5nE7dekeTR506dtxSdZNFSTLv8j2ZP/2gSgGpZuLKKCA4YpKARe8OfJMhKYLhpTqLR5a8Hyw7+CRFOADmLYppttoM5AMxaDTt4tiTXV08Os1XMbTffrqaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzkenpvu; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124b07e5fe4so187301c88.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Feb 2026 12:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770411527; cv=none;
        d=google.com; s=arc-20240605;
        b=Wfwpt9YhZySt60AIstGtjz7Ti9Df2DSKA2iZBub/Jut8bp7eucOeXFCfGDvF+yJN/7
         eQqDje9kPLu3GLnpMY/NakhDp14Ls3g8msrm+WE+DoleK57EDSBtwMlfhbPxK+h0FB2x
         YhN4fR0uFcu3ZFVGMSkSKS73kUnPaLuF/Mp6bGO3inNcE0ABUfiQBRIMyP6gI5lXZMf1
         WswgEKS9nUt7GVXcHJwxpw3LADqdYPZZBBteeoQ9amPP8pr+8nSG+tNtSiFVFzhSsVYA
         Z3BXD2YVQ0lrIQfrjUWv9kgv/AA1T35x8UIF+pIXBuQB8mjVzFU3rmc7TIZTjS3t6pLl
         W9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XiLzMc768cl15yir/Bv2tnr2hc7r4QX37903QHVCto8=;
        fh=7kQAUoUFPexEKHZpz4abCXWmIzv5ZSCCwL1cPCrc8E8=;
        b=aRP8D6O2xK4qkz0FM9IG2r9fLuovcWfL0LNk7qeEVrF4JHa0vVSwopH5z6WxkI3Ghp
         SBiOB1NpBZxlrIp6/eCBZ60xKKi5BJdphhv0bSeOWK+aBSW95fHUDjjvAGVpWvvc3Oi5
         Z8iMiSdWRtwx4hxEbk6gLPvCHbfSdajPauuLxOu1QXsHH7w58RWdxry30OykF+1B9+x9
         Hw6bRxe7K6Gh7ixiGs1Ut0/TwtC6JUuSvdFFAPXBXu0iBLafdG6T3xZJMxLUmjPg9XIb
         AweIu2oYxCSfU2akvPwGzoggaiQ4EeDilA8OsIebRRP12rRIkKG0LgmWS6K3lnjK+DWg
         ealw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770411527; x=1771016327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiLzMc768cl15yir/Bv2tnr2hc7r4QX37903QHVCto8=;
        b=TzkenpvuDn4cfMRbodGHRhtGOZtc1QPjvUpZtfu2KAMqE7ER/CCfYSLsbF9jeg+Ca7
         Q7ZU0qv7jDgdmujZfKtEKwU+vmnfFAzxUUDTOmnaf+81zPW0cQBjitDd4dpT30qPR73n
         j4HNuMR12JtsMQt5P/Z6OXTBiyWTcurigrrWXBz35jr9iRqEhbNkt+gbAuknP1E56Svn
         ANux+25YckW9HM41sMgqF0Z1daHUS7uTkjC2oB6jo26EUmJ0b9CzLH1q/qCOWdQz4XpS
         GQ3kuudAEuDlApJcXjco3/hiwluFm+RExKaMdWCPI305yfIpD3QPKRVuazadtWFNvALx
         sCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770411527; x=1771016327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiLzMc768cl15yir/Bv2tnr2hc7r4QX37903QHVCto8=;
        b=R4DerilgvbNsc4yZyf6o1Kol2OuiRJspzKK9doHv6F/3xCAZBW40RuBU+3a/eUZR4E
         SOTvF0cj9ASb0SPlZZIP3nHQSnX+LGLS0xQSQ8FrVWp+08NjFOEXwq1RviC/faagmUNZ
         fyA4aL/BR0DYUxp1Yi/Ivt1sJfeRhZN+ZD0zaapcRZCamk/hnEGTbMRjmxbUP91LUTsx
         wcVtVAXxI8FuspF7ieGvUCilZkpcuduyCKu2uo/Xmh5jS6t2bRnQtEDbArTe/9PADQgY
         fnnti6FVpQB7vd98vSO3C4h1m+z6oR4HwyneQhC75LfxHOsNEhcB2U7G/XXNd9bK9Q7u
         1HTg==
X-Forwarded-Encrypted: i=1; AJvYcCUow1VqhOxTEE+B6Qjiino68ZAbo3K+OtLhzWawfi/woQOfaj8bDnriYDD4Ap1qS6rxTb2NFRlDVkqN38U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4bhYZFohBoQPZ6duS725Du3OCdeWO/wpXweRh46wCSXHwzYl1
	0Jrwqr2zgdNExa5LsMH+eAcSIuiPDqOXaeP5pMxdamOIRBprxK8hCT+6h6+AdSvgVYeRRhHGUf9
	0GRwAX3lFigryEX78Rxt4kifWkkgnyZU=
X-Gm-Gg: AZuq6aL+GQkmJVcMpIWnR6DIBWNACLYpb/hesBxx5nJrff+WaYrEOnU2wvHwlBWss4D
	RaprV7k64sNEcvU9ASrSzY6SZSA+672OrLl0H7pSMzajFc2iZOV+j6ml3BwUD2lL+nX8TiwjAY7
	BuEQagkkw8tpvBvE0cVw9hUPT3C8zHiv22D7+OCpaKUrxRhg19sO5MCOGhHO3lZo7d705tG/ddh
	vJilBAK/0xpbQ+GPkrdH8Q1g9BMbBExhsroQl6rnmpaD9d/DzIky/X+7h++KKQ8I8rO+IUFc8DU
	XCY5XcbZTQYOdP/B27a0yKNbJ6EG9coseBzYGrv0SfTTUjWsailjM8l1OpsVQTikQyx6Azpxagh
	qCO6O6dXIHUfkuYZofhjPTr0=
X-Received: by 2002:a05:7301:1f05:b0:2b7:fac6:a9f4 with SMTP id
 5a478bee46e88-2b856a4c965mr894233eec.4.1770411527540; Fri, 06 Feb 2026
 12:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206204535.39431-1-ojeda@kernel.org>
In-Reply-To: <20260206204535.39431-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Feb 2026 21:58:34 +0100
X-Gm-Features: AZwV_QjnlqMiABU0YrbzCweRFmE6MMjSKa8gYyl4g5kYhVu4C4USU974IEBp7uQ
Message-ID: <CANiq72mnw40Ha19CuoXCVncdx1N=VafuxC+ZQ-1vTNba5iorDg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11064-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fjasle.eu,protonmail.com,google.com,umich.edu,vger.kernel.org,davidtw.co];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,davidtw.co:email]
X-Rspamd-Queue-Id: 5B38A1034ED
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 9:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Custom target specifications are unstable, but starting with Rust 1.95.0,
> `rustc` requires to explicitly pass `-Zunstable-options` to use them [1]:
>
>     error: error loading target specification: custom targets are unstabl=
e and require `-Zunstable-options`
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>
> David (Rust compiler team lead), writes:
>
>    "We're destabilising custom targets to allow us to move forward with
>     build-std without accidentally exposing functionality that we'd like
>     to revisit prior to committing to. I'll start a thread on Zulip to
>     discuss with the RfL team how we can come up with an alternative
>     for them."
>
> Thus pass it.
>
> Cc: David Wood <david@davidtw.co>
> Cc: Wesley Wiser <wwiser@gmail.com>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/151534 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

For reference, this commit is the same one I gave David for the
upstream Rust CI.

Gary would like to have it in `linux-next` for Klint that uses Rust
nightly, so I think I will put it into `rust-fixes` soon-ish to help.

Cheers,
Miguel

