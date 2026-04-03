Return-Path: <linux-kbuild+bounces-12633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEV1J5W7z2mj0AYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12633-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 15:07:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13877394510
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 15:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 006A73014C59
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 13:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9DF3ACA46;
	Fri,  3 Apr 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBA7C0LY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E9026E71F
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221650; cv=pass; b=kQsGuooqQxYpsKp0WRI8ZK50TSLhQxeT7RaNK255fFtdiUdFMEOOlfOsbsLHueU2bdazgD/tLGLluYn4DpIw+kf2EQ9te8oNdtD1UNKgFQP5IJrmI1yuPXmDpmbL2F+pXf14UNosHEI4lpxTqRPLq8uR/0cdjWKpr8r4GINbrTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221650; c=relaxed/simple;
	bh=+uZaDMP/AozcYqTZf/oaFF3EszPbfJb/aEebqbPHujU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KF91kgTXau3V8mnz4+x+iMn+If2vqQ5tysw5ojoF5Wsed8dx93MHhbEAHJNAC0LXbprS6R7tUsauAWbi5ejjLlzUOyFI7j4CyJ3zYu7ferJZ14a6nuXBKVYlZVh+MCn8NbVTBsz7CqeyzidJqyTFq1Wu5Nltm1PRFMwJdtgIJLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBA7C0LY; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd801b40dbso166946eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2026 06:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775221646; cv=none;
        d=google.com; s=arc-20240605;
        b=OAP1LR+ccxQ2V3m98HRRlq1CZvsCi25MT+xgD7WXJZRgCT+mPSP2ugNQlvZa5cuEca
         o6Gh3HiLTQ8F69p/+DZOHgdtOxZTFc8qSEyWWTYNkWMbXwFkT2zIn9ZOacDWL5hVFMje
         G2qYEpQonBkU6n+781GSPPz3GHfjehtc39skbmoGgz6NvBoJ6OHHDGI6Hla1ZFT5xa1h
         agpcZD7+YKmlM2f6PTiburTVt0J1T+8xfkF2qnnUesGWbZRRzubLlctJ7qQbJeBIKy4d
         Ulv8UYWuUBM/dwzOjZNVHiolfUkhGgpyA/7B0ELEt2LmVfTa58uLQ3Zc0p8Y+3ZWnvAB
         O2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LexMMltL/kK/wLwnO1jphEmsYhPwoj9kNcnexg4bI8=;
        fh=o5fxdBXKBPrIvf/Z7wntPCS+291HX1467fzawKtK7GE=;
        b=X8N0Kem93QB16GH4AYcqDs/Ts5RGsBE5nQgB8hu3kHkRSrzRJW13ic45/99HtsQrBL
         8ED6x4nhaf6pDVo6lknTBVtPoNFls6zFsO6SmbMfksDEmZC98ZujVBG0+bNLsY2Cu+SY
         xDfGKJQUW+HuTmdEI5PipiPH9mUbmbfoj8covUk8oxXi18ou3jRYgDGENOC28742RhiV
         gWX4HmtgvhTUYHt3Fv+SEpuqggYkYCp3N+kZ2ndxI208sLVH1qWzZllMWoiAih17TUqu
         gW26q++sQ2zbKx6wD0ueBAjhQvaJp+1uCAimCUV37DEPNQWiWgNxNj7Zx9Rc8h1jhv9Q
         20zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775221646; x=1775826446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LexMMltL/kK/wLwnO1jphEmsYhPwoj9kNcnexg4bI8=;
        b=ZBA7C0LYezdbT1eDixqh2nwBPi6Y/sO93F7TCx7DyANmm6gIDgbFFxef+JZijrv975
         tduR58jh/u2ErihNLY/8s8OYU6/ZS1qhZpd8bmVLN/XbQxAHNCJuNZRIUIklqojelYHi
         vS9Fg5Axg+GG3RAVC+mIeO7hWo/YSw4e3LV8savuLGj5CFn0Jnjwgqz6IcoDyMMbdq1I
         1nsLQt+VePCtm/wEcXJHvN9yTpOol7iPLAgmvSeh2rEg2CHOxCqH2pVrPJlCkimfCj2i
         TWe5j561urXIGJJT/jppo89HR6EQcRqD41zUbjkkZCNjMneOy3Q2I0euYG3eBbXyF8vq
         QoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221646; x=1775826446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LexMMltL/kK/wLwnO1jphEmsYhPwoj9kNcnexg4bI8=;
        b=Z5M2UGs2vYjtreRo3p87bmVaEQZovL6LrEM/NUW2IuKBjqoNoWOOuSIqVcCCoBchO0
         ZHJTF65remJ4IhfgBM84kI0c7JSFdx15+lcqF0qeiThVlSSVM91Kigj3wiTukTSf1of4
         zEqc80wR9AI6pAyuyx+MSYpYj3/HDB86xdgDiuApTdFt91xkhfNJQlqIvXXobVbBVLRm
         Qny+SG7+5cH/PLShpf5rithhv15lrrppRETYZsMJ6qstLE8hx3OG4shEpKJ/oqjR3XMG
         VHz9c42qEZFggo60dNBvPHxz2FBsxsTtcr2P5FfSTqdxZhQ5GgfevGfajTQgGyQoP0T9
         7SJw==
X-Forwarded-Encrypted: i=1; AJvYcCVbBrr3eB9UXCkAlDjRyi08uy21/tb51DxxPClom90PIvBTaOK7Uuk9C4WVNK3fJGTbXOJ/IpuAwtENqRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tfhvS/BmJOlp1Qyt1sU99PZ/8fHCo6GljNo1EXAOfAAwMorR
	O7980qekmb4m7fDzVGvp4OM2zaCm8OKlsMf39LdN2IXnWKl5SevDZRuTvg5AD3d7xY6LiWKlz7O
	IG3vckGbaueSvOlW4iV2eoPIZjDBDp24=
X-Gm-Gg: AeBDiet9qtAYA79dy8lJYWvzgKu4ANOmb2bGn54XRS/UiS1wwSUCS3MDqvFT8fGznHa
	5yWWrR0kyBrQ0MRUTCwk8VYuUKtx8GGM2MGiDSSPyA0/UOEyAHDNkEAtP+FcfB2Pbw7mcL7FfBv
	oEgkOZfDft4xBlzdrixOgoG7z+jiQh/mguAHV45pRY+HST/NtT+94Y0jukR1hIlu6VWOdruiOro
	Eb/r9tmWQlET5LfI/Y82vJtdM5WwQVB8xVRcjxdS2OT0yR+i48DRZYD0OkvswEPz76OTMjCpmde
	9ycv4uOPJp1roMnybAIpwPQuvuw1WxikgZUUtwg/26iM27CFa6J/ZR9epKA5gV3GGds5lP56zsa
	WVE4hZY+DiOTbMOW6G0OzPzA=
X-Received: by 2002:a05:7301:6093:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2cbfbc82969mr602584eec.4.1775221646195; Fri, 03 Apr 2026
 06:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 15:07:12 +0200
X-Gm-Features: AQROBzAi7I-5aiPFC3vwoZZjn0KQTGSqr8-BroXwKxkn5hps7t8T0SwwfFMqiV4
Message-ID: <CANiq72mKuQgK_R=xs6270nwYigzCvJiFJ1PcOB+WT3OdXO7E0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12633-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 13877394510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 12:25=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Seeing this patch a bit late but in clippy 1.85.0 there is
> `#[clippy::format_args]` which would permit us to make the lint work
> with our custom macros.

+1, that may be good to consider, especially with the bump -- added
and backlinked in:

  https://github.com/Rust-for-Linux/linux/issues/349

Maybe an issue would be good to create too.

It is good to see Clippy adding more attributes, because I requested a
similar one for other lints involving macros in that list, e.g.

  https://github.com/rust-lang/rust-clippy/issues/11303

So hopefully we will eventually get those too.

Thanks!

Cheers,
Miguel

