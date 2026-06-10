Return-Path: <linux-kbuild+bounces-13690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MFRRCChlKWq2WAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13690-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 15:22:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68014669AAF
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 15:22:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mBjj6lsT;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13690-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13690-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E614D31A98FA
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 13:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3220A408634;
	Wed, 10 Jun 2026 13:19:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAE407CE1
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 13:19:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097549; cv=pass; b=bbJXN10KqkEF0DvNC63dydk37uzTBUg3yLEE/XoxuzPdWmTs0ujY0+os2XV9Jxl+38CDLrWqbz+nrLSpXYMsrAH0KPIYK/Wl/5ixtnkDTsL1q51z0YoCLOfsCCqF7kRzOh87u5z56CHYkQqBOnBkX3kymKPnDzvkf09jowIl7TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097549; c=relaxed/simple;
	bh=/YmVURK0MDp3LHoT2Hf1OEAZRy1gwpXJffVWgEOo8oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6Fy9/3NsFXm+AeIjkLdUQ05cBl++QOxOxe4fC6hqq2m1pGOh4RbYSv/sb65YtHQcRkzAaq7jMal2NBJe3tyklgj72fwLuF2/b/xaYKorKMb70OAZM9EEt1JB42DKCW6E7DOmWJZwJl2aHX6M/icfYBotmumdto4UTVhKaVWHbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBjj6lsT; arc=pass smtp.client-ip=74.125.82.172
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so606245eec.0
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 06:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781097547; cv=none;
        d=google.com; s=arc-20240605;
        b=BF4yWo8fHSaciVby3zQEd3LyTMimkoM+mgmyxlaw3vgr2/ChQe8BKO9xp5f3y74L9s
         WvB902yPQz+tsrFgdvAXyrGV4cWrDJRJczvqNZ34aI2Db/D5jglXzpjErORriBtG7VuQ
         fEwrkZiBtJulClZE9pmX3hA6CzNt4GaijxxZlJCZ7D0yfMoIIxwR4VEz+c9E6g3nZvwR
         uuEbver3yJqWfe9lkcXwBSttelqqM04pBox3kbF+PA3zZz1nadJ2bLdTZXpSVNEmoeN9
         XW6toueLy3vfdjesMz+ZA/hBhyhxXY4VD15OaBTlQIJWPlYJHHjG0EiBFWfSGSID1A+l
         KaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2Vk4rSVCosFIh1AvgCOfAqs7WWptxzKC/NrQJphsHI=;
        fh=DQJryjynQf5SUA3md9K170PiywgmGZSufhqKsc19ZNY=;
        b=BlZI2Mpnlbm0tQuPzN6/syGVl2yvvORA3WzyQiS9S2wByYA3oXslwiEBbJlcfYCZIb
         /Q2Snm/w7jcRp2dOToU2OSnoKJ8MfgGVr3TTBxL4o6ghYJ9esLS1P7hjREz7to6xhKC5
         f7qsk9n6+/rncIw40wC3j3ssKrMUD/fQzu7irSo3vzwEq8YfFzK6slX+6SR93KLojDF3
         Sz7bI0IYMVKVhhAmTdnvWEXl5saSAdsEp1Rwr6OKt2Cq0jMh3kbMSI9QK8QNHmRL8Q4d
         xElcxMgEyBEruLccPqy6Di4NqZOg+Zb2IKoQ85F2RXooCFYSAge4D+axMIsNqOsIaaFw
         e9Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097547; x=1781702347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2Vk4rSVCosFIh1AvgCOfAqs7WWptxzKC/NrQJphsHI=;
        b=mBjj6lsTem36Y5xvr3oWO35MJ20O6TJpUY2Cfjj8giQGAkse3vgwU40aOcsGea13WM
         o88hggX4lYj0QwWcxcJ2DIMRxw8ahxacC/U+5ohxLoCUp+no4syPvS5wAFWVXWD/FzMs
         vI9DT5GXsVRzoYisZ/RTmjOr5Nf9jvz7dMTZYlJk3QI75qacfxGr7vBx6H5EKCFGsbSn
         1mtFAPtclCesfZeYVetn20AqLEyPu6oDpIM+Cs9jJZIoL4j4IJcJlEWzNWYaliGvd8ZN
         a6MRPQFJ4jC8O+BgVSqwvq1wf/NFJYefQ3gTVSRk8/E6v7TwS7W6X3masNsEF5/0rIOP
         ++7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097547; x=1781702347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2Vk4rSVCosFIh1AvgCOfAqs7WWptxzKC/NrQJphsHI=;
        b=Gmk9tXM6BBe9H3ldONaxHMJ71DlaDBWyqGSAXzDTLovmd2QnW10Wjmrn2eIhgZEPcC
         K6nYLfvLiMEoCdCwREZwMBfOSpYB9ObNZsKKQBxiXkY/7KmwbFyzhxO85xrkanNRI408
         WFWRsuSav4+F5irEY8aQqEkaffuP21tDZ1xRRMW1hVaxOTh/zk0IVjfEZw2Lvfe4i9jp
         0RtwrL4zM8Z/wPJmBcNNP/exxSsjltzI6RMQL0dBzTlFhmY5tVjk4Z7VX0sugbuOCGCC
         1SUvaHk3ET0M+/VJu3x0NJC8FcJc2I5hUWTxgOIpiGvUKk+c5ERdkWvzhIPZRZ1W/3a8
         PFiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KiLpe9Gx0z4jsB5ieqbZc/L+fZn/azrxGO9Kle/ETsW1yngcb2I04rhwZ6fVLwbIuMNhkdQoz2ia6zHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0kMVvbZ1NmlTPQncbwPWs3ZFa7hAW8JKAs1lNZCTy/ilqnqa
	xlbApIlgkwhJIinGJlO38SxB9dtiZzohN59GCsnek0bV7zer7D9D23T5xQvrwvn2Aezb33qtr40
	hnF1ioBUkErhxfV0hJ3beERZrwxzKbmg=
X-Gm-Gg: Acq92OFxGQqifutfjVhli4sdb2IznetKcAHEraKnO11ps4w6mreF5SH5C+LRWzXFsTg
	4tha6F+wJh2BJJsBfftFX3LhFQIrNFMZzsjbR5a13txsdSyAvR4LJig6wVNXzVt1O+Z0Nm3BZmy
	PBiTBLfOG892hCK9K2cBxR61itXAFh0K2uDQ0oSVcuCOZGgDsQd7tyV5Q6vO2HONPNxZV6j3X9g
	zq8hR/AtIagRnsUd/SVmxMUVjVo7dlblXthQP4v7DPfEvW4XgSDY7NinpWYRA6lqYhCFziaWku/
	WFnp2DKbwSTqvgNJFJ8pEkFfpQDkmf+qeh7c6MRia21mLj9z3AmewJA6R184R3eBx5KAFRz7cCM
	DhLxiHER+9nhCmQdRkYZZyeXKvv59kVQEstyC5WVfQuW9
X-Received: by 2002:a05:7301:1e4a:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-3077b3668c1mr7212725eec.3.1781097546906; Wed, 10 Jun 2026
 06:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509101939.27108-1-mo@sdhn.cc>
In-Reply-To: <20260509101939.27108-1-mo@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 15:18:54 +0200
X-Gm-Features: AVVi8Ce0AUySVEkoo7wKF84aAmre-48CnOK0Dpfz19rQsNTXlYuYUWWeQqyyDcE
Message-ID: <CANiq72=p+NG_JRuDBJPPtN2QkmFGJ0BuFNMWnQ=Vg+v8x9+0yg@mail.gmail.com>
Subject: Re: [PATCH v8] kbuild: host: use single executable for rustc -C linker
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13690-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mo@sdhn.cc,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:yoann.congal@smile.fr,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68014669AAF

On Sat, May 9, 2026 at 12:20=E2=80=AFPM Mohamad Alsadhan <mo@sdhn.cc> wrote=
:
>
> rustc's -C linker=3D option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=3D$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:

I have been taking a look at this, and considered applying it since
Kbuild is OK with it (thanks a lot for all the work during the
different versions), but I am not sure if the following bits are all
intended:

  - Shouldn't `HOSTRUSTC_LD` be documented in `Documentation/kbuild/kbuild.=
rst`?

  - Why do we do both `clean-files` and `CLEAN_FILES`?

    + In fact, should we do it on `clean` or `mrproper`? Nicolas
originally suggested `MRPROPER_FILES`, but this is on `CLEAN_FILES`.
But more on that below, since I guess it depends on how we treat
out-of-tree modules...

  - Was this tested with an out-of-tree module? I am asking because:

    + It does create an unused wrapper in a `scripts/` folder in the
out-of-tree module directory (i.e. the one used is the in-tree one) --
is that intended?

    + If we remove the wrapper during `clean` as the patch currently
does, then it means we cannot build Rust host programs in an
out-of-tree module (because it uses the in-tree one). Should it be in
`mrproper` instead, or should we generate a per-out-of-tree-module
one?

      While I think the kernel generally expects that the same
toolchain is used for both the main build and out-of-tree modules (it
may happen to work otherwise, but as a policy it is not supposed to be
supported, or at least that is what I recall I was told), I am not
sure if it applies to host programs. I guess someone may want to use a
different host toolchain vs. the one used to build the main kernel,
and I guess things would generally work.

  - The `filechk` could fail if we use Rust host programs in more
folders later on, i.e. if two submakes run it at the same time, and
one at the end deletes the (shared) temporary, then the other will
fail if it was in the middle of updating it.

  - Since we have now `zerocopy-derive`, which is a proc macro, I had
to add a dependency for that one too like the other two.

Some good news, though, is that the whole `clean` thing made me
realize I missed the `mrproper` for `zerocopy-derive`, so I am sending
a quick patch for that.

Cheers,
Miguel

