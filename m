Return-Path: <linux-kbuild+bounces-7907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059BBAFB58B
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 16:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42EBB3A6547
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 14:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19F32BDC2D;
	Mon,  7 Jul 2025 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kru11H6h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE017A31B;
	Mon,  7 Jul 2025 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897172; cv=none; b=CCGn9LGR9B4nc4O5L9T8s5Hjo6bbxZ1l4PUeiaAoViKyKJAKQ5I8sM015zbHCnTZUPt/gPsCOhjiFYh+K1Z+/wiBvy4iV9HKFaO8GLB01ZKsnZlf2muA186Ae++f8ynRsxiDQNJJEi64022fyHO2YSzT+jiZZd7L25om4yKl0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897172; c=relaxed/simple;
	bh=WjLJQ8DJG9dk9LY4/WcdTGq2agiZKN8nJ1UypqgJtcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIaJQ3u4u+rNDwt4hNzqTIRzbdNL/5Ulg80vCHHIAEW9tIkT4VXsLIxDdkI2+/cIScBK7rg849UJknjZugBgRc1mCEIQNlhDG+DE+X/lzdEyAb0YnSqXvB54iNJUPFprqYgmY1LsA3lyTNjiVrgwws2DXNCXEB2T6XhZ82zUJrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kru11H6h; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31306794b30so710729a91.2;
        Mon, 07 Jul 2025 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897170; x=1752501970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5eHXbB0tLWoYkJp+N7tByAI0f211iSmpcNJkEa+CDI=;
        b=kru11H6h65fP6wlHsnsE0kR+r+VHP4n16TjURr6Vf6VtgFplwNVRH760k4/eZk9VYe
         TXQDrvNh/xVo5OFrO1BaCviV9zvmNpogJTJi3J/wN/oi7NR9jXbZPLtbOZ5XXGqtzrT+
         7VQTrX+xF9gfzswtG4fXnmREzgD6AIuvlmVtUYJJb9SZtNLZcZh8jbL91jvwjYgdEb1K
         5TBmoY+VX6Ir4rnrFbU164lCPH+CLF/1U7ddQAosuWEW5WYUiv40lZ/oXv9nA2CljDua
         xna0K8q+86zU8dV6Mg9Y6xLtgHG2sE4r3srXCjHOPfYhWSR1DxLChYysxSmp3n2t56/w
         Rw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897170; x=1752501970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5eHXbB0tLWoYkJp+N7tByAI0f211iSmpcNJkEa+CDI=;
        b=BXhBSMQOoFcFLEAwt18h5RZa23l4weZyz3x/EZcmCa+HdKLZjLeQzR190QsNVWgg/7
         PnNEUEMr7+0pChfUW456bROklETSgRTB7+QryE0V7qQgHYOCnhl1x6Q++Js0itBgRmBb
         52QZ8YilPbdhkdZiWf0DXbV0Oe8j36GWWzQA9dpt1oSLvUn1iuOJucDDaEJ4he+IGQ2h
         0d3khZw4uMtIPLJsoHPx+fdtbMY4ViDdgch+LNCvoUG0KkYBmKT6y7hpzPd5mRBNLQmo
         nBapW2jB5s2mWd8pt0iD5Qp8pHzonZJFRW00f3mAxS+OcefulP78W1qkYBjJlPuQH31O
         Syow==
X-Forwarded-Encrypted: i=1; AJvYcCUA+zJx1pvuzcwigIhLrQ2DOTwN7tYAWqyXZy3WsEuKZeAmrnWoHYfP7kBEa4RsMr3d762Uzrnnn2byCnwvb5I=@vger.kernel.org, AJvYcCWAfRtwQf7i6xa8QPrGFO68iw5fP1FT6lLNoKJbydKD4iV6g+dWVN+20wNUaaUNXvTXnC/Y7ewqdxOuT9DZTw==@vger.kernel.org, AJvYcCWb7xr7ok02SkUnfJ6sMAF9Awvw8ipLypxYnMuQTul5OreU3egBzDWZvB+HEC6EK9y9E0Ra/l1Ewv0m3sk=@vger.kernel.org, AJvYcCWhW73cbkYSU1ij/FtZaI5NOUIRmCtVhXx64N0X9a/1BcbbUSG3BInPrA8vxHMNOivQO2ludn6aHRuFiL3I@vger.kernel.org
X-Gm-Message-State: AOJu0YxElf4xE0sWYAGQSS19qlj4kY7FppN1ZE+A8uEP+fe0M6paWxgk
	7pzIshnRliYWA9lbHo+6FfZZR/N4bzqkiP8X8tuiSJN5qWOJpc4k7FFNFkDKSmVZ+Cg65lc+d8R
	9pnJpvYGIircw6gWOKX+Bd0pBoS+3eWE=
X-Gm-Gg: ASbGncuUcyiNDCHWhYQar0IHhWFOP0pEU1QTIzUJ0z7lQSo6l2zNVJ0QpfanG3im5G/
	NL70T5xKNIAwvUqhZ+k6LlE4iLZrkSGKo2B874P7IS2oKd06tbziVtYVw6AeX+vQ2O8kdksKqQp
	RvkGvT0Lyr5k95/qwer3zfBnWsahAZ7lC6pCA3OoWgyrL57tXvg+zy4U8=
X-Google-Smtp-Source: AGHT+IHYDP2ItVDS65gAYycZ9ux53Zh85xSymAbd42Tqj326gWzFunD0tX8YRk4m/jajtZi6K8fatKyug2zlraKKOWU=
X-Received: by 2002:a17:90b:5408:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-31aac545128mr7024651a91.5.1751897170250; Mon, 07 Jul 2025
 07:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Jul 2025 16:05:56 +0200
X-Gm-Features: Ac12FXx9s4CqlK2pHGTaw_tDQW6E2_Qdww9gpUjj8n34vHnupqPLYoqsVo1mv7E
Message-ID: <CANiq72k5mU7cACFh8TZC1+NfUQpdrZBToZ-jd75DfCNTfMU1fA@mail.gmail.com>
Subject: Re: [PATCH v15 0/7] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:31=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branc=
h [1].

I would suggest adding this sort of note to the commit messages,
especially since the commits have no Co-developed-by/Link tags
otherwise.

From our discussion in Zulip: the code itself is older than that the
merge above. I think you wanted an example sentence for this --
something simple could be e.g.

    Based on the original module parameter support by Miguel [1],
later extended and generalized by Adam for more types [2][3].
Originally tracked at [4].

    Link: https://github.com/Rust-for-Linux/linux/pull/7 [1]
    Link: https://github.com/Rust-for-Linux/linux/pull/82 [2]
    Link: https://github.com/Rust-for-Linux/linux/pull/87 [3]
    Link: https://github.com/Rust-for-Linux/linux/issues/11 [4]

By the way, I guess you should inherit that issue in the last link :)
It had some details about things we may or may not want to support
etc. that I looked up back then. If you prefer that we close it or
that we create sub-issues, that is fine -- up to you!

Finally, if you end up adding strings, please link to Adam's
https://github.com/Rust-for-Linux/linux/pull/110.

Thanks!

Cheers,
Miguel

