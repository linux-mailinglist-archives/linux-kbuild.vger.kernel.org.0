Return-Path: <linux-kbuild+bounces-11299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGfbAV38jmmOGwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11299-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 11:26:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5EB13510F
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 11:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60EED301681C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 10:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BB5212554;
	Fri, 13 Feb 2026 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl8DMBhW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BD234F481
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770978391; cv=pass; b=BzVR/KEif+j2nA86DlaoAhu/HB3qbskAkchy1hGWY3G2hVlqK4XkfrQN6cUCMpHRqIx4TTcjQUqpYJiSFqbNDXR8/kip8E40ggEwkz55pwAK7CGjQoYwJC7mC4TvT6tHv5ErARTzZHj2DmPERqVJZBE8IDeQxcb+cq81mmgLhaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770978391; c=relaxed/simple;
	bh=B9wil/U0sbCCZ00shUgxFC/v9GLpNMK8+4AwVbToHoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjSV/uTjQUFAbzuDKd7TI+LFMxItTbedQjG67m8BbOpXM5plpQgl8chLzMDeh17ZqcQI125s31K2VQqpJ4N7Yos4rEVEq6OSUqENiRc7BjRWhMXte57SnjfubllRuVfXFo2x3VwmA/4eJcXkc/2rgSvZ0frHbroIA+2VhFSQdc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl8DMBhW; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so65664eec.3
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 02:26:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770978389; cv=none;
        d=google.com; s=arc-20240605;
        b=R9yYrXbqhVx4T9+ZBrK2LFvGYi0EWjvXwW+aeMAkdGRB+it/npZ5vk2ZAwXz7xgYYn
         a9KSaurANE0LHl5QL9PIRcKc+ZNIekl01R+d1cjVJuaRAdMV9LWGary8+/gHDZghlflh
         6aWrLjbMpsi+E/njTiDQT+sww0FsIv/dG3Zx1gOrfAHPduusW30mTFbRNAz7KHl29Udt
         fLhPPfNQpF4wZlIfDHK4bD45to+CTnBmaoxmWLaHeb43qb6KY8DD+ozA9WAWTTUhRiB/
         Q75QJj+qqU/0VFCwIdN89MNAapItq7F8XJKGABrYzQyJXgBOXft9okZ6bKb0CcEMhP9/
         vhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWwbEaWZswTY3OTEgaDFet626t18kJ8WzoooQK8KyRA=;
        fh=S7N3aTSWER33F4g1s4vxE1x2mDH4gopS2SJg73wmdhs=;
        b=KHuc+M9Crn9h/CAmoevPtBoWOyzcvzJ9SSTvcAsBt6suBeug8FiiAc7/bYW8c5Pp9S
         TCkpk3FfkgGb2pAzKNaMLVFJJzAET1H34XEW/Fv3SCHHg1gC7iIyP78UkDY/mqP+bYw4
         v8ULa1BSmqS+CZXZcFjxOYtfMooFhJXERgILECBwK+cx4Nlv8KGrmk1p9cR/Uqu/RU7v
         7tZg8MGx1jxWmBCo9lqCN3d1DcvpqJ2bm+R8oy3gf4oTs+Cc0S0TWKqCa+wbsxrpgZhA
         keKY50UF3Y40orwtzoCCBVNCyuhmKiBj7ztAYBDVd4JmqFN8C1NVZi08yscOvtAbinZB
         5u8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770978389; x=1771583189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWwbEaWZswTY3OTEgaDFet626t18kJ8WzoooQK8KyRA=;
        b=Jl8DMBhWIXAvmRdDmZhrSXfzjrO5REzme6/jvshb/AJ8yhQRyZv6k1JW4W8srFwE82
         jLpHvM6V380v+Sngtbs+ft9WuWmjqmnfWEa5Qa3N2Dc/7XL+eyaSpaeoA2OQdjAixaX2
         RNkxh8w4pdYKzdt86FKR/LOoKCo/5ZQ3XfzLP/IvcSn2zS90vshiyABu9twrbwbx2bXQ
         lg1EScODvjJfMSokoZ6yXo7qvztyWgnqqY3Wi6o6Gbj7s7aZt8Z9AdkWPzPrD4nva3NN
         eHMCXyJTMUC/UWLjhKriLFR4SLWuMuO/BljEuuN6r2sSpDUdlJsmlSefSDFV2vmf8Qsl
         atFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770978389; x=1771583189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tWwbEaWZswTY3OTEgaDFet626t18kJ8WzoooQK8KyRA=;
        b=d4MLsZrkRIGc2DZTQIAzsBxsm3znDRRBtZZqTCMbq2jsf2qzS4AtlqZDXiv+h6dBYy
         WSEdh1nz71xl+IgL1+fJfhb/c1duKNn0GaTDJdTGuClZlcciqLQKc1cIr5uATxlMVOQp
         Td/W3+ByNQIuZ2WSrSiixo7kuN3AtW1IGv9N6ci3t3H0maidvtxOKXtUUXpxHwT0VmOo
         Zom1D0vnMZSugsWH0fncy4HcbyMN0NGKnAbPusXrpmlrM1WPDJYNS1+iubnHJFDH/N9E
         dhGW2q/SVdqbG037UcP4F7yt7R75BjTqT9bR+JQ0H0/yIflqlV/2/V59xQwCldzdJppP
         an9A==
X-Forwarded-Encrypted: i=1; AJvYcCUBbNmp2AGgrQHv4Cxgk6hc3k8WL4IFeJzlHGHydCN60KuC7bwHMV0j67/sDYQg/E81nn/CZCgdyqE7HHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/CE8T5RD0qizFS5HyzYYOlIEX7yutuefl+lkFOyVywiwyiwS
	zqFzgf2CGOQm31tH+zYptH3LJXRq7k38+Pm/hHIQFcDMwHNLXvYIcarnVeYTrf2Dxk9+BHCHHuE
	lY7eygKlwcwQAA7WaNqnoxq/j9VK79n0=
X-Gm-Gg: AZuq6aKMsRLXJJXy5V//vei8GxVsrvGG5DD5xCGh9CkRsqap2ed7Wsg4A3UoSvZ17Se
	j7EXsPAoSo43Te95dt4a7A65O/4Zn6KlQWGCi0aueyP0ZNCWcXl0HT3B7su3HHW8fezEGRcUfL2
	65qfw0MuDMMaguDOI+fYffLPhQw9xlPQVQD3SGUH+oekYdhROolakKI6shIVj4moowVFpJtrvOA
	WlYeZWtoDsMQZZDjNcEim1PIiDUe07OpqX6X1YChIqs6u6sxKxp7bg0ZwMiED7BMHKzVXKHGKf7
	fgMQNRs6kV/4zdAaQar5JePnlfSqSomMPrLviQMA2C2ye5fL1YTIB6kuM575/mcoalBiIakjWHf
	u27eS+r01WqBF/6LoYbryu4dd
X-Received: by 2002:a05:7300:c618:b0:2b7:f145:a66 with SMTP id
 5a478bee46e88-2bab9fdaf65mr426129eec.2.1770978389157; Fri, 13 Feb 2026
 02:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206171253.2704684-1-gary@kernel.org> <20260206171253.2704684-2-gary@kernel.org>
 <aY57Y9WorBLiJR8E@yury> <DGDPR33UQJVR.2HABXQ4SFAGVA@garyguo.net>
In-Reply-To: <DGDPR33UQJVR.2HABXQ4SFAGVA@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Feb 2026 11:26:16 +0100
X-Gm-Features: AZwV_QjnC60VDimHgNkweprxDvtzaN3Jw9j5IHjtNSeyBlRlAAJi5S81AX-ZSr0
Message-ID: <CANiq72=qOJPHJ1w-gtF+uK-DG5oHSHNhaY+FMxotbynMbkGf3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11299-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,protonmail.com,google.com,umich.edu,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4F5EB13510F
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:07=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> The reason that I want to omit "link-time" is that our `build_assert!()` =
*can*
> still be checked before link-time. Again with example above, user can wri=
te
>
>     static_assert!(foo(0) =3D=3D 0);
>
> which means that now `foo` is evaluated by the compiler. When this happen=
s,
> `build_assert!()` also abort the build during compilation time, not link-=
time.

Another reason would be that, ideally/eventually, Rust could perhaps
provide something like GCC/Clang `error`/`warning` attributes, and
thus it could fail earlier like the C side one (perhaps still at the
end of LLVM, but not as late as linking).

Cheers,
Miguel

