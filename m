Return-Path: <linux-kbuild+bounces-11122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA8fNb5djGmWlwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11122-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 11:45:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389621238DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 11:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C9330CC678
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 10:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F222331A5C;
	Wed, 11 Feb 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niAB0vv5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B41369223
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Feb 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806482; cv=pass; b=Z4hFdqzCrGew12gnSm6DEVwz+YgOYolIav0cnDwtwkhcslnHJnwD/evq9qz/WGUj64AQe/kFjyx0VmUmKy+ZMz5sFsRZlapB/7pg5etb/76/fgCRrT+t29wTSpsQyyyumdyuHyfVWC5a626KjkkixkaXp/BDeIE8nVs8kkFieJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806482; c=relaxed/simple;
	bh=ygS/KJIrgTEQGYtzJb6sDuaxRuXu9QCFvwwEJ6ybjPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJzi4ogSUThEosswQRT521WOVK1BchP2PsYChrnNZcFEozReWvKqLaYhUkluezeFfnyr9iZ8kKkm58iWOpfHXokEavSpwTMBTpRi8d0MAe8umiQVOmT47TUf0A8x6xtzhe9sC+hniWiA8D6yEdz4QFbPugaaNek/GN1gr2eYmP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niAB0vv5; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b8095668ebso539271eec.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Feb 2026 02:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770806480; cv=none;
        d=google.com; s=arc-20240605;
        b=gRnDqws6Qg/VUJXkNy96odLCbPFagzabk5DEkt+IHhsIxrLVHuKAnfdYgyoqthYSFs
         55NT0WO53AIylg7yXy+LaMsh2+06onJd2xdWKO5EFYze1eUojkg0uaUOS9wd6KLvpNdd
         xwKnBQ+EXEVp8OTudLw9MzoP5ZytZ0GBISEOg/0EwiYUFHQHpAosV4t4BWVWgPGVtwRa
         +Rh+eWEzNvWkPZaUIPLgA5vBXjiTocrhRNBP+2rGMqPAEIGn5GeR9gvCAloAroHv51Tz
         dv7y46ePbhWG+uwGnsrO93JVMS6Co3GteD3lB6kWbhgKPE8/Xzh0u8oEA4Y/y36l81cm
         PiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXHp7S/iyLvY9ql3/OnccpMG4H/yun2WlS91VGZ5/Lg=;
        fh=iBBtKoFSHyPNmI/4e4JKgy8Q9mjejiluG7xxjcGml+s=;
        b=DXk9vcRd08OfRv9gVujWvG0Z1xqnXUnaMafAVhFDaoMhLRDaIzq4rPFRTzNh44HFGt
         xYkdwUWtO5hubJ5OgmSmPG/jnKEj1nCWx0MCZQxNrrFLN15lVJJEqci1XqFHmxR506v2
         eo1ErYLN1KvxhM3z9+jgDFXTlemmhBHFO8yhLjaTOz4AzWqzkJhF4XsfpJIDWVM24YHt
         YAS1ka+TVL0eBCQS9yiO/mqnuKa+cNz5/H077P920r9xk49cdRMkIGpKA/SVWh+Vt0oV
         E+CLyRE9zkv710Yv+DFnbYETSt6ARsCi3DPjSiw2jCg2qHEe7nxyc73nPoYyj1BlEe8W
         zGng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770806480; x=1771411280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXHp7S/iyLvY9ql3/OnccpMG4H/yun2WlS91VGZ5/Lg=;
        b=niAB0vv5fkMVHGGctevdm0M+COomci0y6ApcLBPj+mIzBzFDpOFWkOOOX5Bw3WRhwc
         k2x2JVEBFObuMj6fw9o0LDIrUt2OAMVLYHc/XrI6mYwS2S3/EpSqacL78sshaaPK31gP
         4+sdH8nS2XIsLjxwstJCCO6W/nSR1w7YYpa5XPNn2Zk9SOweALh9HBPyxWXEcbV09e+K
         30cQ14dZJtMea+4TKM9+c1CypjsCumBABwp22pl7/camZcuqejsIZ2l9lS5crMEFk3YF
         R1gWNgg24r54yu9on1ntrTfOOBTf4XIxuhnCnff+hW/8Iqtc0OjlMEzxcfhtFyg5L7XP
         shaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770806480; x=1771411280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXHp7S/iyLvY9ql3/OnccpMG4H/yun2WlS91VGZ5/Lg=;
        b=emOtJ70ktnmwrkUZ8UK+NZYao60HaWl9KeIc9KYJBsxBfXc4U/fSO0IGehX1lM50v5
         gUJEJZo+YwBKDxwnHJS4GXx49Wlnjev5zpqqF/4nPWe2VzMVuftEodhFe6ZlPlNbk7LP
         dnzuAoeXRhbbxZhNHl20cpRjywXEcEoq674xTkqGdw5BdfPcL62qYbTZr09SQtppmE6K
         mqqbHvv1NnsO2phcWFmfI1m7yGqN4QlgQzd6yR0srh+4BgnqDNok9B79OSla2TDRmeM7
         P+TTxD6EpPm8jbYnllayyPZ4iTV46eUaW/QEhENjbqOxgJGlPE3sdE3Yb221hsDExZ7K
         Y+AA==
X-Forwarded-Encrypted: i=1; AJvYcCUe33U3C76TEmwM/9fN4WJvAZzFP4sBvdP7IhG1aoEBM8rzpGOrw9ZnNLVLGey3bUtExwJ+Fzmy6Gxm3jA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrq1AWe68aYS5IibTbuws+tUrM2FYmRPOkHUCDUeinqNlWpAjQ
	XlbXzeP+1XSfcqJJyqLSzLETbTHdjyxID2GGwH0AJLlRRGpGukzSikmNQ2D3HpghF2FhbTirKR+
	ZBpvtYEuVsWhC8GelP2whu3zjR62FGW4=
X-Gm-Gg: AZuq6aJ95/PG1pQhWyuCIHl4AOVyADSIUX0UqhrE3mcwOWQHoTErrDXh1Cmiwk+zMbo
	spEB7dgiWxKtZBcSmV6Vus57m0WYOAWcSBdXpgtkgMDn9mtNN7HRRsGFatwyPaNGzBKEq0WJd87
	BFet9M2odVrEoXOt/W2NtuVjSONRGJqPPnCbTz4IFf2VJPCDVMHnA11JecrXes+XUZ1fpUzAuEf
	xYHzeyQ6FSNvz8pFo4ZekbwSyRdiosJQ6DmcW6O5fTtX+kHRyCZdKR6oig7aNEH6Vu0eBziGaVn
	s02JycLjp+uIyiTe9gAAQ0ut7GXSYHANp/NZfTkWxCjjD9h04L+CQS+wTOsDyDaRea5p0689m2W
	oel7xTpesl8a4cl3R3Aivs8sS14uL7w7q+v8=
X-Received: by 2002:a05:693c:40dc:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2ba9e05a837mr206329eec.1.1770806479793; Wed, 11 Feb 2026
 02:41:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211095807.132855-1-9erthalion6@gmail.com>
In-Reply-To: <20260211095807.132855-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 11:41:06 +0100
X-Gm-Features: AZwV_Qi8-0s8a064H_jd0KP3XaMxJ_Cg3S2G28D_5OStfj3L5c7hvaHWqbAT4yI
Message-ID: <CANiq72mFBaFm9QVotxeDB0TanKxQRko7ZFhuF-RHq-8WCemCTQ@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix feature test for rust compiler
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
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
	TAGGED_FROM(0.00)[bounces-11122-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,test-rust.rs:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 389621238DD
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:58=E2=80=AFAM Dmitrii Dolgov <9erthalion6@gmail.=
com> wrote:
>
> Currently a dummy rust code is compiled to detect if the rust feature
> could be enabled. It turns out that in this case rust emits a dependency
> file without any external references:
>
>     /perf/feature/test-rust.d: test-rust.rs
>
>     /perf/feature/test-rust.bin: test-rust.rs
>
>     test-rust.rs:
>
> This can lead to a situation, when rustc was removed after a successful b=
uild,
> but the build process still thinks it's there and the feature is enabled =
on
> subsequent runs.
>
> Instead simply check the compiler presence to detect the feature, as
> suggested by Arnaldo Carvalho de Melo. This way no actual test-rust.bin
> will be created, meaning the feature check will not be cached and always
> performed. That's exactly what we want, and the overhead of doing this
> every time is minimal.
>
> Tested with multiple rounds of install/remove of the rust package.
>
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>

Not sure if Kbuild covers this given it is `tools/`, but just in case
given the `MAINTAINERS` file, Cc'ing them, as well as rust-for-linux
since we try to use it as an index of Rust-related things there within
the kernel.

I hope that helps.

Cheers,
Miguel

