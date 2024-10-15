Return-Path: <linux-kbuild+bounces-4120-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E220799E271
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 11:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDE01C21FB8
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6251DACA6;
	Tue, 15 Oct 2024 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URveVPnX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288B1D9A71;
	Tue, 15 Oct 2024 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983448; cv=none; b=FLU4Rb9NiBOOGK9XJuswCGt6yO73yhHQQzcKIMRwGzwke5Y9PncRJB22EUMZuC75rfW8fIJQynS3ozdpnyzZlXYa4fWA6K4/o8wOIlu/Qo4W2pEfn8/gltPVW0uEfWku2qxgliQ7hxgvcZGj9UMsRdRa8x2NqUwp059rZcI1zXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983448; c=relaxed/simple;
	bh=cR540dZmBzwpTX6Wh1/ls2Pc4BJzzAEpA/3IzRGRs8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYiZqSMWNoamCcI3DMYbtr4DZ4vk4KYcPh9Et/xYgsdDIaAxjfYqo9GHj6JJryTRcVkqnXlIYoqkCLWNtP5Y/TdV2di4MxWrFa5zDHXu3u93klk3MgLceG32SWLMF22q/qhIQJEQEMJnXIMpiQFXNvLj9H5NT3oylYh1FkOMKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URveVPnX; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so1034172a91.0;
        Tue, 15 Oct 2024 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728983447; x=1729588247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR540dZmBzwpTX6Wh1/ls2Pc4BJzzAEpA/3IzRGRs8w=;
        b=URveVPnX942Flucimxccxb8uB6/dFE/DrnrLHewt6X46Qka1sw0ymZNqs1ickq9fwP
         XLqB3xHyoa8ShkffsgVFiTfKB9YQGrbfa58KzNqAPY1QUKbno8hQzY9IpnsvTfjlwARc
         zAUF9wPdxvPSl8v5jMcmOHjp7AA94kT2qFD06ArNZ4Pd52CEjMVLqIdTrT/424ePqo+t
         wHoyj8yzOpfZBnwuj+nZA6OIizi0s1KMEWu5AIjSIl+MvZH5UvwXdfB7OVTSq0pgLqmm
         6y4G3gSOE79BpdsxmxBalAqSMLbqNTKpViMb2yG0Hz3LoX01TAJkYb9gEjoTQuYRFn1d
         DzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728983447; x=1729588247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR540dZmBzwpTX6Wh1/ls2Pc4BJzzAEpA/3IzRGRs8w=;
        b=V15btyHJQV/TJ4jZhsyXqjlyG0oznHW3RV8+r1w30q5QhweHs+DkGHjGsP9pXU9BVg
         ROzwq+6mBESL/Q0MXx//lGfIh06Yx8IZmTcJ8d0oKsVRSIcm9NyMzAScvOjIq/Mlg7Sq
         qAovb6jwiFe9V3xCnlH08F2eDZ5fcjZltn6s0RF2Z1unyJOpairlm/9rjIVNpmn4rSdy
         lT7DEuLysfQhJgPV3SFMGYepavA14tKdiMovHmCH337OZULKMNirG2sYkf9o7XlmUPfP
         0swG/H9mkgNOx4TSA/fGuIatn9q2X9UbVA8ujz4KN6CDGBS3Qg8WB8Dw9Bvwuys27G+J
         N5fg==
X-Forwarded-Encrypted: i=1; AJvYcCUJkOsE3oSSQbCIGFLaS1VxVpQ2R5bWD435ydTUa8MS1ptd2Pq/gjaCl2b+2RlkGnAMazDxmGd09V4AJpE=@vger.kernel.org, AJvYcCVPSMC3fE9MEiEOo+87WVv1JpWhLtwAmzX3JaR85X8iU0wgYuymx7HxBBMpRSObjnCwQYFU7EPFsr+yYZuY@vger.kernel.org, AJvYcCWSdUiBkE0bLJ4mp8mfxzv2sYMnIHd+J394clP4lU2vpS6nagQY5aLxutFMh3CRU5eGa7x1O9F3rkGU2pLBWCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdz4IvhL3JHV79reXOR2YbZtf40VIO14pJAkyvpZLoF2uIW8Y
	LUen3EtG7vJHkZxvmOnmBQW/pdzT4f8vJ5wdD9JEwycensLhrpRdrqV22lf3kntu9mtsbeEYGbv
	BIjS0z5ETvOqmhshyvKfXA/98z2de648B+zA=
X-Google-Smtp-Source: AGHT+IGZsNDB+ABXPBlmyO/cf/3TEXkJdKaH6E2+ZYW7ktKw6b71kXpHZSGypfjgoQez1xtdGHoqIn7dJ3k/qVX+y4E=
X-Received: by 2002:a17:90a:1f8a:b0:2e2:e929:e8d2 with SMTP id
 98e67ed59e1d1-2e2f0d7843bmr7394920a91.4.1728983446822; Tue, 15 Oct 2024
 02:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com> <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
In-Reply-To: <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 11:10:33 +0200
Message-ID: <CANiq72=a5QzdBbMkEHUu2L44oNCWDNKbvgx69zSvLQV7E0wAbw@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 1:53=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> A symlink would possibly work (unless rustc refuses to load anything
> other than .dylib on macOS for whatever reason), but wouldn't be very
> ergonomic; you'd have to create the symlink blind or else run the build
> system until it fails, then create the symlink, and then run the build
> again.

Could you please test if the symlink work?

It is definitely not elegant, and if we start having several macro
crates, it will not really work for you.

However, it would be good to know the potential options available here
and, if it works, it would allow you to get it working right away
while upstream Rust replies.

Thanks!

Cheers,
Miguel

