Return-Path: <linux-kbuild+bounces-13988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kRG9EgAjUWpZ/wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13988-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 18:51:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6B73CBFF
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 18:51:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mVO0d8fH;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13988-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13988-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54CE5301AD02
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2026 16:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0DF43B497;
	Fri, 10 Jul 2026 16:45:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0743B4B9
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 16:45:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701909; cv=pass; b=W1NO6iAdqQZA0XCJnTZ9bdmBoIftQNBcUPJ+KrMvKG+QEOw4GPYXScNM4TS1EHIsaecmKJENZGi0lnrujNb+WnIQme+LL2D12nb+xe6m5rodQ+cxB3v5MJvfOWsQeEyhfETz2lDNlnuAetsVU60V61FrRYT3CAViOWP+lEyYucY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701909; c=relaxed/simple;
	bh=xCjy7nX78kVpVGwcDacIhBhg3InIXD0P3WacXKtfrO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5G/laiZLcpzEpNwr7ZvEByVl3imfj/LXinfYy/tE++9ILon59tS0q1tK112Ztt3P0DQQqKIq4H9MvFo7MjGO2Bn6mGanetYDDizXyDE/cZIjFmXCFQgzPIayPw6BMZcxyAiOLj7NzrNfdD5jqbfz9nYE10eiaYHApMA0c5EWdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVO0d8fH; arc=pass smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso100225a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 09:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701905; cv=none;
        d=google.com; s=arc-20260327;
        b=V2WrGMGAWLCR6s3fyn9ntSldQCe/lRalCxtGB9aDitViYSYYrOONBQHNyX8gYBc0HM
         HgaMgjW6+lhjAmqoxl1+CakBw+DdEYRt47tO2dOPKNZVQUvEZOe4SGiJgQBY7KHxz10L
         cw71LzmvPrqbPNhW64zmyjOhb2zOV0bltP89T0wdtZz1DUtQO06kScafSxeBQMEhIDIR
         9riP9ePWcueoqvoWPPAPziC3DNgLO/VyyyuxWjkpndfgprt1TG6DpJW2cfF7J3fQwWiS
         hgqT6nLtUd46SKyzMkQeVQGFa/mfVJW79UcvXAetBbBik0c8QfdZ+uI13gCbTkoly4D2
         KmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBlwEABXvW44zvsPx6ksviQAF3K4tXM0YakCYODCtvI=;
        fh=yk83jKDjlvkj+1Zwf8+hRbSmFEAd/Haa9NWtgIACqjc=;
        b=rHxzYQpLZN4Ha2TFdFhwj5ycxV/NCzDyCDDVVwtIB0+WoYUxV4ohnWYJsGArd0JUj2
         7u7SqBI3JXti2E042GAjY5wVwXhSc95an5PISHC2uQcjNz2DqoEtWB/yHs5EolmQSAbE
         ajYdMTYfBKogn6fBdZQy9c6zwsqJBSXS4xexYMdmJXIL+VEgYDutStfH9AT8EyWCRfXT
         mAxb+DRLnFcqIOiOMhaeEJd4JKzztFGyctYGoCIdSWB6KA+QLMKIbNQVuszvi764gvAe
         vtaCwI3tU3DoBRlNJJJ5yTcSNpRcpR55bILAHkUNGo64E5X1Ejw0yGau2JivdQa/Eyqf
         FA7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783701905; x=1784306705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBlwEABXvW44zvsPx6ksviQAF3K4tXM0YakCYODCtvI=;
        b=mVO0d8fH7l0iUdZfxMaQeXaQcug6AsjTvO8fkDsZvJP+hoNzJi6vA23dNzU3U1+rdp
         hEZP1z2fCWOF0ZnmPGSfeBSA2lXet25HFHLQWg8wf6LItvChJkm3GdJzdGBL1CuAvrR1
         FtPZQ0uHDb3s2v4IpWl6Iy7UzPl/bHjiNcfbfpVbr1S3uKfZNnn9lMqM42/iAoJpj49G
         uG8BnGlCuPM4yC3QPPDMLmeRRPveXa0aeDCfAs0LKSfippe96vwBShrwB/RPJe52aXFe
         mWNbArMer+IVhPWJ4wVrqK6oiIpMqCIKhMgeYcsBhTX2SySgZV0YVkrpZ1YFtRkkjVOW
         K83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701905; x=1784306705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBlwEABXvW44zvsPx6ksviQAF3K4tXM0YakCYODCtvI=;
        b=RleQext6/5VLR0IAtIjE4511UQnI+I+RMhTq7zdO5PlddXIqx2zn0o79pFpDxAhTU9
         DlSD1y72YRl7Yx/CwRhUuBGXy+Oe6ZHYiZgNd9i9SVHokbZnVmZYYreRtIcBEVH6bDSC
         UniTJoVqoL5lTKFbFl8YPIi/ZmTd033pKiG9wO/ILwo4R6B+6BrLwsWRqsk55XDKuLAm
         f+AAn1IyQU1T1LpvaBbHH35CcOOlO6GRt0StQpGCa/a2lJwc+KcDnywhKIZ3AlVB+Km3
         FHRNLngszKYWgm93rXQf0TixkE9FlbzyaYVbdhnH7RhV+12qhE63bz97k0p4IUNhrNSu
         ZcYg==
X-Forwarded-Encrypted: i=1; AHgh+RqgB6FCB1Kn5c6WmVc9IrG9DgNYGHDp11Arop3ChrxHMvbprMBHvezwNFQlPkHURdUad8/REVFLsMwEyfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOIguJSS0GYaRVLVcy/21QS6e5DjLyDK0eV6/5fisedY4s4rU
	sA4rqKj8OSeDf7bnnW9q+fD7qsT/M/IS4NDLU6fUQ2o2Bz9U/vGVf3xbbJcNY8PGAVJcizzksHm
	eShjHcgIPiwrNAOnFJogGRt2vafZRmyQ=
X-Gm-Gg: AfdE7clT9Tz+r+oSvOGgK88u80Uk6IA+Ta0Qfj7jWi4aRnzowf2Z1IwsFYqt8won7qw
	KzTrZevga8IPjN4lW4647BBsNAJjc2JgmE9sBtgcjb9fjqA8/GXSq8W2gh14w6ci4qIR5yH3yee
	Wr9r4HsWMQQ9pcWnHuSvgHauqaU/8HOMaIbiRFZuNQ35ATTZ2LxdvGY+YD82gOikhsNVpYuLjwT
	hyD/3VPo29LUxKQCuYdFgSxvSEwEXUeQYn4TRBCHcYfuYKZgFp1dQadl9HCbWKmXwfd4+GXbaOb
	GRfZOWLc7fYOhmCFeIzq8UHCugQ99egRrfo7F7rkHzAJBJy9IVBQo1Y8upK/iEI/mR/q0IKyJVc
	lJsLl9RAkmPE9MzyFx81eAAg=
X-Received: by 2002:a17:90b:4c0e:b0:381:1ffc:7d35 with SMTP id
 98e67ed59e1d1-38a2122c84amr8231942a91.6.1783701905167; Fri, 10 Jul 2026
 09:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625231919.692444-1-ojeda@kernel.org>
In-Reply-To: <20260625231919.692444-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 18:44:52 +0200
X-Gm-Features: AUfX_mz8DZWlL1QD9ua806LSMQX3ccUfIVTtJeIAxBxmg2orczQrnhnY_ukACyY
Message-ID: <CANiq72=z6p0LH1Wq+_r4c9Zctvwmu-8m6rdw2Tufg_BuOGwpPg@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.52
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:tamird@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:rust-for-linux@vger.kernel.org,m:y.j3ms.n@gmail.com,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:yj3msn@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13988-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96E6B73CBFF

On Fri, Jun 26, 2026 at 1:19=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.52=
.
>
> Most SPDX identifiers have been added upstream at our request [1]
> (without parentheses -- supporting them is an issue on the kernel side,
> but it does already reduce our differences). The CSS one for `rustdoc`
> was added too [2], but will be picked up in a later version.
>
> For `zerocopy`, enable `--cfg no_fp_fmt_parse`, which was added at our
> request to avoid our local workaround [3]. This means one less difference=
,
> thus indicate so in our `README.md`.
>
> For `zerocopy-derive`, enable `--cfg zerocopy_unstable_linux`. This
> allows us to use `#[derive(zerocopy_derive::most_traits)]`, a new feature
> upstream added for us [4]. We noticed a minor doc render bug [5], which
> will be fixed for a future version too.
>
> The following script may be used to check for the remaining differences:
>
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name READ=
ME.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/zeroc=
opy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
>
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md);=
 do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/$path=
 |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
>
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Link: https://github.com/google/zerocopy/issues/3428 [1]
> Link: https://github.com/google/zerocopy/issues/3457 [2]
> Link: https://github.com/google/zerocopy/issues/3426 [3]
> Link: https://github.com/google/zerocopy/pull/3416 [4]
> Link: https://github.com/google/zerocopy/issues/3466 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Tags still welcome for a couple days.

Cheers,
Miguel

