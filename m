Return-Path: <linux-kbuild+bounces-5154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C389F34E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 16:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C968D1884303
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 15:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D579A1474BC;
	Mon, 16 Dec 2024 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCAihe3h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7753E23;
	Mon, 16 Dec 2024 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364116; cv=none; b=ljC489C5fZCcaTDDjMChKXLeyd0U0BF2ThVRkjRohvHIq8D1D08GmEqevJomW1MEPmJms1w/6tVT59nTFERDfHpGB8cNOj5OUblRM4h9H769WPQc3e0SoQQQ8E6MWEb2XAYNrgjGZNnEOfDf5Hi2ryIHt2eWQyZub8y9M7d/Mf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364116; c=relaxed/simple;
	bh=kGbZ7NqEnBAwCOzYxMyAeLrgogRuew36P4L0wzBun4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqbXO034mRln2mmgB3TbcyCyNHNgxP+P10QySBJRE4UJPVf7Ym/RgwRvYhn3eM39S6NDW1xGcVOFHYBy2JWif3G3GKRntA6E235ltop0ALjmH1Zg8uQhe9JK0Ookeg+oujYqasDYwMH4Q1/gx3UEhk9C9SoS7DN5nFBKraBhPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCAihe3h; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee7c059b97so764551a91.0;
        Mon, 16 Dec 2024 07:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734364115; x=1734968915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCyg2R9ae6q3J3HI3LMA0B4dQRci3oFcga8rAAxtT9o=;
        b=BCAihe3hwCsxb02ZOxyPKQVfAW+gicYfgcs9eRauD8uDJH+gPQmTdyPUq5Rsh3dBiI
         8xDIX6McBXl/vF0osMELKaj4cPy5JKmC4NyX79yLTIQR1zTfvGasBqL6cApUlGbz43mR
         Eo1xwnLaLD+lNEuPitK0kqGnQxz6KSVzz3E3K6oLGYbByYq2mepPgpNtwldm7IpfShnm
         nYJLmPtt2KdLIoRG+toHbqLLqbFYtLph7keAVDE/Vcxa4u/i6fFY7US93++4SwLUEpUB
         czfaPdnouOaOCvfwZPzDK0D73UAh9DqWMX2Rps4cppgjdVuSj+kiZ3u+ZyCR8n5MRziH
         oDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364115; x=1734968915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCyg2R9ae6q3J3HI3LMA0B4dQRci3oFcga8rAAxtT9o=;
        b=mxK8UeSd2t/tqViPKen/dblXaI6+985aCRuejA6+hJ0ti6GNx5+0Gu4sgER0MTLgCE
         Vgi1Q6ScKl9Bd1SyrLuCd/H5xz0eWDulRxsJKXwR8pz5Qyzymnk5x0W5W5K8oI8izBix
         8My9E8DrG/Rsi9Uq8ZJHBmZS2Vd1TUOUEtYglYep6b81yck7lhmiuGlJ1flSN9wfl/C1
         fkLGycxRBbrud7ikjpm2++2ZfDLrQEs0PaPrb8pvtrZBrg3d7hVa4CTd/uSkm+dSgzzR
         6CHvMQfdJ3ssujv20ZGudlCOALMPdblougs5ADQtP+xnTl5z0HiogDZLE0yilkJ4434t
         MFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqquptP0kRg930HtZCjNnTh30vuAT1ys2JlpaJ35eKZWQaR3jgfYr2rAD0uLkRe3zeOJoXH3QN2e7H6ls3kME=@vger.kernel.org, AJvYcCUxYxJnyID5hMB32+BXYiDPotqY+8UK0ILgt5pPCeH3vS1X7NNRNthCa9U02512habRrsVW9xuZxfJXYlnB@vger.kernel.org, AJvYcCVBgvR0pWUbXQDG/tmu5XqEozzl4ZlPK3/2Yg2vQEmQ444otmVkpY1iVbQtmUwOUJ7OklL0eNXyt+FRj9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/zR3HmK2BjvC6MUkjeFShHpBBECcvziWbqm9i4sztjKY016r
	BdpPxkibb+vKro9hbWYDrmSgX+ikdPD73IcenYJoPIG9aL6OeHF1WX8pOi+WrhXfk0KX9mT/81y
	Voz3hVvhdeyaLsmuJd0WqzHCvy1k=
X-Gm-Gg: ASbGncuDEGbvbABfo3icKqzgPWW6jJXG4Wm2raSw6i2DEjTsbnLYe/pdSaoxCDGrs3S
	OP/pwmv/GWS5lh5e8sgivH6hhD77jlmoPRnqRVQ==
X-Google-Smtp-Source: AGHT+IF1h3ZqTQb/vuAJYpU3eBygJPGLyROOe4tTXVSMcOhJ/PkrHPs9pNaQs2rToTt6ocbxCSbN7DfEWISNJQ4yIho=
X-Received: by 2002:a17:90b:17c6:b0:2ea:5e0c:2851 with SMTP id
 98e67ed59e1d1-2f28f85e830mr7140654a91.0.1734364114717; Mon, 16 Dec 2024
 07:48:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh> <87ttb7d24p.fsf@kernel.org>
 <hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
 <2024121344-excusably-resurrect-d01a@gregkh> <87h674c5vq.fsf@kernel.org>
 <UW-ATumT4L-13ZXX-lO1inQGeZK7VgQWNAHE3688ulGj-rvzxWkUdrmnAUlufI1W5-9d6vzH3TXZ4VOmYh9wxA==@protonmail.internalid>
 <2024121646-shelve-series-5319@gregkh> <877c7zbx2u.fsf@kernel.org>
 <8e1b5c5e-52ae-4332-a49c-990add7611f6@kernel.dk> <2024121630-steed-grating-6352@gregkh>
 <64a40555-e3f8-4671-8ece-3c3b677ccdfb@kernel.dk> <CANiq72=01Oaszr08hV2ABLbd0RJt9oO=j=aWAizbbCUg+T+aNQ@mail.gmail.com>
In-Reply-To: <CANiq72=01Oaszr08hV2ABLbd0RJt9oO=j=aWAizbbCUg+T+aNQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Dec 2024 16:48:21 +0100
Message-ID: <CANiq72n+XM9qgMGq_94OOawOU0NC+7b=mF1dpSSBq2_AtVJung@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 4:39=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Agreed. I would suggest to consider marking it as a Rust reference
> driver, since it is a prime candidate for it:
>
>     https://rust-for-linux.com/rust-reference-drivers
>
> That way, it is clearer that the duplication is meant to build the
> abstractions and temporary in the long-term.
>
> Then we can also easily track which ones are meant to be those, and
> Greg can get justifiably angry at you/us if the duplication isn't
> resolved when the right time comes... :)

By the way, I half-jokingly suggested this elsewhere, but we could
trivially allow module parameters only for particular modules, i.e.
only allow to use the `params` key here if the name matches `rnull`
(or if they set a special flag or whatever).

Yes, it is a hack, but it would give people pause when trying to use
the feature, i.e. to think twice. And, to me, it makes sense to
encode/acknowledge this kind of thing explicitly anyway.

So if that would unblock this and reduce the chance of repeating
mistakes of the past, then we can easily do that too.

Cheers,
Miguel

