Return-Path: <linux-kbuild+bounces-6146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C7A61E41
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 22:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97961884E7C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 21:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F3B1A317D;
	Fri, 14 Mar 2025 21:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuKedqkB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE4019049B;
	Fri, 14 Mar 2025 21:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988204; cv=none; b=LEHlh2kJBQD6TeHqdwd13obn88L/3IlcqHsLmQNPF+WUVqx7YXki3cbiWBIIW1rm6+s9DYUheU8X0ewDG/uuzRWEOYQCUFj2DzmSQvrX7H83N+kHdYvaer0fit6BfFIYSuLi2c22YCQlvgitZXzmf5cZJ9776psftipPRr6rBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988204; c=relaxed/simple;
	bh=DuI5fdexKmuVNIkgj0doEhrrSj9lwTE7w+QftVl8670=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNQ/9k4yZ5XTpkUCWrsAmS6MPX2dHLG0KTLBSxvl/AH9lW7uXaPjrTDo3S5bTUYsqee8z/sfRVBq9td78K7w1VDnTvt7ZPXyRulJbDmehCiHAoAsU/xHQDAvU68iFu5lIrxkLWdSRrV4+nW94xVf9uDqbgF4g0xEm8yiCr+io7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuKedqkB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso32435a91.2;
        Fri, 14 Mar 2025 14:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741988202; x=1742593002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkxOdoGkj2S85XbuHwDlotUnmp+P62RFh14UjI5Rl7A=;
        b=WuKedqkB82wLvV9XJ0gebA3cFDaslwRXBSZ6s/CFVhwz7Ctw61vzyaWU6b5JijwcFZ
         YjCGBAY47jorxU1OWbMEEWdPzCj2hlYbxQSP/47oiM0JZ7Y6RZIz3Wqv3jODXCDbOYG4
         2nih/5fhTColAde0swQhbnuABT017SbHqOa30CcCPu1gubQ1KdNoU+55nwMV5S22b83E
         /6dwO+TgY0vqmU4TslgZJP/W3pjPArOikv1RRI9bOhFtC7hgUOraUW0N2kaCBixXqtV1
         ZrAYshz2M/ReJ4RFvWPm5WEYcDwG6snK/myUdwumkFeVAkPOuOKikbRKqt9qiQqRPsyN
         5vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988202; x=1742593002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkxOdoGkj2S85XbuHwDlotUnmp+P62RFh14UjI5Rl7A=;
        b=OXJTPdYhAyEovhwa1iiaPqtpG1mXvyPcRzOcIM3fEniA2/5b6i5n1ANl3SK8ZvA2kc
         9TO8fSGwgWYs16wvfo58JSC/v/wDC+kv3zfI44HCY+Pm/vvjKrC5I3Q7O3eH62Me2RdH
         zPQykQTUOS3GZ1dvfJbrx2cV4RQOf1LQHtuHMhW4t0b6yFIYnRSuX/elHxMvBrxQBoRI
         KwmUpKNfwetyaMSxgaR7zlILEypnvwNbooR0lQZ09br9gglgHQsGcxDi4KN41P15Hko1
         Mh99EVHUrv28QWM+46bs+xst1zVfzq3A93r4uZWOU5aPecPKl4qCy4s5ksXNX2IJ6vel
         LbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcAMThYGQtwaYFTBn/aGOrvKc7LXQGhVzQk6VzX9/UhG7D3D+HlbjQkX2JaKfg+hjuEh3+kdEO9mDA4g2@vger.kernel.org, AJvYcCX75T9BmK8dSNxpvXL5vDVKQQ/f0+HCWtScPguJSedWtmLQs2VPqE1Q2Ooxv5kY7H5B58sAKHb26Wrd5cn5BbA=@vger.kernel.org, AJvYcCXnt1lmsl3LU7SAzFWWAntF5jvHVkEQKDJ4+m7SGiyVeXh5MEPZgoMEO6PNV5ay6b+S0lxO1WMatFTCHa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyukr8Ggy0bjDlwU5mQBF4GtgbHQy1VolGe0Mu6dS9TQozquGvQ
	BbVU9toIgxcoX8b18f1L0Ym35ZJ7h3qUoYIeO7CKeAyLvKIfPC0eWExnRHpFgLcHVzFVLqhUuQi
	GPUZqZC7wJqLb7TnrIirf9ViPg5I=
X-Gm-Gg: ASbGncv1FCBbxRLf4JHPL+VE7qjiNRz10+HcUqVATN3eicAqw/xBIH0Y3+AdPsboK7i
	x3iJktphPcyUdIOOo4bGeBgMAYHRlTWFHC40tzOyDbJ/lvbpV4vSuyuMyeJmQVHOLJtWk4S76TF
	gnydMyjpwuWLKjS7gJyLXLKIbLDQ==
X-Google-Smtp-Source: AGHT+IFMzi5bsnAMWDE73f44EIdHWPSeNL8D0h0dz3GJFlYoOk+HOHpuo5utaGcvPYmvqUGJNqncwKf54NnLt7opVHA=
X-Received: by 2002:a17:90b:4d8d:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-30151c88d93mr1879925a91.2.1741988201771; Fri, 14 Mar 2025
 14:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
 <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
 <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
 <c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk>
 <CAK7LNARdPcnsaP-z7tZUQLqAgBXD90XsEWAtTy8aTwDpTqMo9A@mail.gmail.com>
 <ed6acfb2-f1a0-4713-8401-60b0cfcd2e91@t-8ch.de> <CAK7LNAQHCoUdgMVDxw=EOcqv9_BfKPGooYJBoM_rTL5R2ieJJA@mail.gmail.com>
In-Reply-To: <CAK7LNAQHCoUdgMVDxw=EOcqv9_BfKPGooYJBoM_rTL5R2ieJJA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Mar 2025 22:36:29 +0100
X-Gm-Features: AQ5f1JpUh2cuOLQvrwSnxm4Szfj5F9tgnz6-J_QRLrufmUB-GGhLWIGICpL-xbk
Message-ID: <CANiq72ntZj10H1DBqRyX=uLertMw59e=PM7ESVJ0zWfu_ECnnA@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Ben Hutchings <ben@decadent.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 1:35=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Yes, I pushed.

I have noticed in linux-next that the flag triggers an ICE when
building the docs with `O=3D` -- reduced and reported to upstream here:

    https://github.com/rust-lang/rust/issues/138520

Moreover, the flag was only added (to `rustdoc`, not `rustc`) starting
with 1.81.0, so we couldn't pass it anyway unconditionally to
`rustdoc` (it is OK for `rustc`).

In the meantime, the easiest to avoid both issues is to avoid passing
the flag when building docs -- I have sent a patch:

    https://lore.kernel.org/rust-for-linux/20250314213333.2230670-1-ojeda@k=
ernel.org/

Cheers,
Miguel

