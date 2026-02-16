Return-Path: <linux-kbuild+bounces-11322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIYoDxGBk2nm5wEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11322-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 21:41:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3D14781A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 21:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B43C300679D
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 20:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666FD329C73;
	Mon, 16 Feb 2026 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCb5Ej81"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C8032D7F0
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Feb 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274510; cv=pass; b=lTB9FCXwi/y1yVDM2frHHlU6omg3XdKnZFvW9EcNXO7D+m8wpTKeEOuzl/nZfRFDgCtq8sFSlD5vh+SyhbUAwrZ2q6/AkMvgCsK83JTKgtJgHkjC7jMIJgdZ3V0h/8TK3Ena8CPnNvRVehl3yA29Qy0cdpRkuIGctGTT4/KFx7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274510; c=relaxed/simple;
	bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHFLEbtSYJc4c2oWdIeruB8UAIhHHuum961OQOQUhEJYjs1Q2h6K0SGT3zt6ISv+RfXZ+BmX9yGC42ajYoBjv5nPA7ZZ4A5FPZnOFXNGGsxi5+oRk/J1GW85xzBONBpmTptBOJV2Acd+3brsSrl7BKTFaItsxlavSjgBXbaEeB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCb5Ej81; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2baa1ed79b0so173265eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Feb 2026 12:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771274507; cv=none;
        d=google.com; s=arc-20240605;
        b=FVCUgYMC8yZmLIm4XekLyo/SN4cmkx27p/kP04F8ZSe56X0X51FsxiNmLIVZdTMdM7
         ihxB1PAAPPd9+daFdeHLnV/m8ZszXUEVa1o+qoOJSwjtWOBI0mx/y75F6F1dIOn8iTrd
         m+wEwfAhx3MbI8wFP9FiJwJMuZ65gSyqss//euynFrAll11LwAf8hIZsz7lYYW1dux6Q
         HBVMK4TWbjy9QdDaT7LLlOEbL6FFgkDQfynSBu064hnEhE1GPF3byYf0Hx2MRfZ5XE29
         5CRLH9CTrf738QRU5ErEWlvhxdpUgEFPKlIHlTYpq+JEzXHWKMXqX4j89kQGGZU2xlpk
         hPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
        fh=Lg8y5zpaKnLMeElaR14nH4QRevL1g696rfId1WZk1FY=;
        b=bg8P0JX3ZVJ+RBkDWfg/eYjMQZ4RTDnVbYvbeKuHpWqm6tZrob3+vtmTVrv+r9xidR
         uyOlRtmQibPGUEPqRhiaGaOy/WVyl9KZd3hYQUlaTTiFINj5y2qe5x6OaR+0uBI+/MBf
         UMQCCI5EiRDhlsnrDGEO3qGQ0/NgLb3fh4IJsBWOA3QBZE+VaAoL+NuJzKRhonFaCjye
         +Ap0N+5QiOVct3tTtmxbz+fAuAqIXt81Atmt+Q7Wa+s7eCrqVl0jkmRIMzq512OcwX2F
         iJoASd8SA0dybyTwxebHp5HTBrEyi2cgri2FVppaIHp6gSW3FqP2c+rPA6BSiKs5K7wK
         QDng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771274507; x=1771879307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
        b=fCb5Ej81/1Qbw7KLMj3wl7fKmlXod+7c4JLAgATFJ5/9b4ssG0t8D980sWFuMv2Ufm
         03P5Sd+OT9U6+slGX1R1eAVZozTUlo4Qrj60Pc748fHMNIRTWqX3MqZnhbXjnD95UmB1
         bp19Ex5m7SOahwJlFbuQE4rfgNGvVL/Zm6QjVxLc5VaZ3z54oT2fJKBueNut3XMiOKtV
         O3zTwpAcO0Y/iVOHMYBdMm/f9FQNMG8Kyruxex4g+Xq0uXM2RZLGUwJSqC9BBGuFVXiW
         yhzjakc17WU778oxnW24jE8vMWW+0Z+omJFF8Qj6PXsjc6GD623XEoDL/yzVWn9fY0t3
         InHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771274507; x=1771879307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
        b=WzbeuLKLeHFn51vY/lf8Qz65MGK7pS1HVkr5/pxr6O4+pT5svY6tYcmnsAKgcHAlB0
         hrh7tjQXqgHZSE+gj5nA4wZCsUYIOYadguNIzwRZ2IezeJIWzn4zRSVsluGuL5ofDroV
         vj4OZXdxVLjsfBRQXg1idZKrt+3UN7XNFIrykaX9idkj7Dh1jA/QGZqZpUgDVFaKAwAr
         zyrBCiId3qNXGw39Fe1CbVJnHeLvvMfKvKSdaNu+M90OcMQWV5wKUhgRczW9921zxfVY
         6etwWt5BTkyAt/VRslQhpVwHeBg6TMZJ5zAY4woGxUDe+RLvE5LB6aeevV8w/LWO2K0z
         E3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVEeEk6c5aJKjBm08IkCLpDE+pzsqFW7fL353ChtEQPuJtSztOX156QlWYFpMo1bjq4CWbp1p5L4bk4ijE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/M3FyMTrpxJa0d2qRKh9QY/HOQID7SvTRJy+fPG0YfozEu0hq
	0goKpCwVOv1ZY8GbzWtgxa/U78/HYOXBLL12e7a0G4NjY3yC+zbAYrJfTggeVH97THFcTYTR/yD
	JuJ6bezWiyAYncoHLPlNdYeEZvPpazac=
X-Gm-Gg: AZuq6aL47JVWMCS+407+wcO2paRP7dw8AfInCyqqpj9RCR63FTQTxhXk9sLROE2nv0Y
	1vqPuFIpfi+4ledfErMiTRlNCRL/wx+d4QMyfWFwV7RXc6NFU2/9JzBLE6j8u1xuDgE5e1Ri6lH
	aYSgFcixux9CBUQUUcrm6D/EEQbC49KtcIUWWdUhMNcXF+jAPF7oRaxrOx3vX7UCp/dzzZDqckP
	ZObCO18nEvdoQ3lbuMBokwBxiqTYrtnatMgwyM5bippi4LdVa5verEzXZQnsUZdNRbmobCYrXBU
	QjhqlMbmULu+sZWgC0Sq48vWBNKjmltWaw/RG8a3/TOJ1BaD7Da97nSOiKmG8r8wdDaKdnizW3H
	vD5UpPpvOI6/SM9KstpjERrhw
X-Received: by 2002:a05:7300:d709:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2baba03c364mr2814598eec.3.1771274507004; Mon, 16 Feb 2026
 12:41:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213191212.33328-1-9erthalion6@gmail.com>
In-Reply-To: <20260213191212.33328-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Feb 2026 21:41:34 +0100
X-Gm-Features: AaiRm52AQh1nLse1tepTu3V9vLsY4p9m5Cmmc1cWP7wLS8GwhehvOv2qge2KTzw
Message-ID: <CANiq72n3FPOBVbR83-Vp6uetu8RnazMuu6MhzG_hA=_j18_BTA@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11322-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8FB3D14781A
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 8:12=E2=80=AFPM Dmitrii Dolgov <9erthalion6@gmail.c=
om> wrote:
>
> Currently no target is specified to compile rust code when needed, which
> breaks cross compilation. Detect required target and pass it via
> rust_flags to the compiler.
>
> Note that CROSS_COMPILE might be different from what rust compiler
> expects, since it may omit the target vendor value, e.g.
> "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
> explicitly map supported CROSS_COMPILE values to corresponding Rust
> versions, as suggested by Miguel Ojeda.
>
> Tested using arm64 cross-compilation example from [1].
>
> [1]: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/
>
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>

I think this was meant to v2.

By the way, should this have a Fixes: tag? i.e. since it sounds like
this fixes an issue. Perhaps to 6a32fa5ccd33 ("tools build: Add a
feature test for rust compiler"), or something else? I also usually
recommend showing the error message in the commit message.

(Also, you can use "Link: ... [1]" for the link.)

Cc'ing Kbuild maintainers too.

I hope that helps!

Cheers,
Miguel

