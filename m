Return-Path: <linux-kbuild+bounces-4348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A59B215D
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 00:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D211B20C2D
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 23:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321C7187862;
	Sun, 27 Oct 2024 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN7TMRxO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6329B17C219;
	Sun, 27 Oct 2024 23:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730071723; cv=none; b=LRuLkOdkDnAtCTIT6kYHYRYeVl7hj/kyef9cVs2Pn5fxkY1ptikpC+3Yr+apnIawGgswQ8jcc6Zx8hUTO2e1FRLBbHnKXPLGohJhbUElYrmS5G3AoLOpv4PL6xftpLaZ0PryDW7vL+dcSbRWErd3hMieRllLGWRVefnyCOv1AiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730071723; c=relaxed/simple;
	bh=CYK5sksRp+HHK6ke3ltM89SdmUKYCjXGNd/ci7rSmkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrQvM+qzHnX6QG/ObXO+ijuNRSeHm5AgAq8TTT9EQ8w6O/S2ObpQKg3kZi6Wm2PxhHnnKhs7+HZlbZgMTgBYkTQ9SpDYBVzakE5vrJwuwCTYXRTQON//MVcKPOWUoVtUcEa5dH9ncHwkPsj0VED70pxHHnpvPoziar/oEAzsqM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN7TMRxO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e31977c653so588256a91.0;
        Sun, 27 Oct 2024 16:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730071721; x=1730676521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYK5sksRp+HHK6ke3ltM89SdmUKYCjXGNd/ci7rSmkI=;
        b=DN7TMRxOkfiU/Rt5+9UyIAWcW2QimeXJtztz97csRUA3PyTKNfUmAuB3YZCbN+/etB
         k4OHdmnFC8kwz3kSn/ZATzeypYNMehipj9iV7vRGyS9Ztk9hUbLiRwHRO/Cz4VqJyUBN
         v6PnLyrhhD21ZGiWmTIAYqXn6IphKoxU/xMkhiEpNW+REZvF5WOadfI2IDzbvAGm4o50
         0IsXOj50l1l0XURAe+JGXEUKKfQWglVYSS5iak40OlAXE8c5uljqz6vynpiVKi8WByBs
         Ev+LjOp9ciGjZFF44JZ6SgP83onb3Z9c13lkEiWQSSHRZt/91iXNhdVgKSrfEikGlpKp
         BwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730071721; x=1730676521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYK5sksRp+HHK6ke3ltM89SdmUKYCjXGNd/ci7rSmkI=;
        b=Fx7XibrQa5VknO0pzObVlbtLPadnHUSql1GyB9nnjr6UEcxstztgxOivws6mf71cuC
         LbsevgwXBDzjCZAL2m4SY+8Qtz4lXELP9TFISCA7mOr+CFNmZ+DBPnpopa/mnK+YEMs7
         FHC13ulbXWwrllMQWL2l3ZzxEPuA18kM7yVNo9LxKQH1tEReTtjE96wZQFYILVSdEX8T
         tN9WqJaOV6ngjNEc2Qn1tFwGmujGvvn9vBpGk/ZntPM9B52mWH/s901ttppfokr13AeY
         RwNDxqCRPJuMmzr8WeF4Vc7UeTJ0wpR9mY947oRodZ0wvAJICFrwSy4ES0Z6trLR0mwc
         k2ug==
X-Forwarded-Encrypted: i=1; AJvYcCURPvHzDO9I9j3ecMT0tiYkhIPcZQ/FoKX6tbg75Ca07F2ohbdsiXhFquvs0705JhcLcU8VV3xJIXqLyp8=@vger.kernel.org, AJvYcCV8D30umIiubxuoz9u5Dp/kFYO7tbzj5qp+S5tATc9YLAofj52pqn107XxlTzSzyMA5iRp0yiR7cTNHL+6AZ9g=@vger.kernel.org, AJvYcCXXc3of2SHBWw7/sBpaLmSLZ5gceKAdsuxTrcmLx9VzPlEG3KdF6WIEq9P4nYNVB6La/qEGcfvpn+H0bLTg@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkXxzvam/uEJzON4NNaHMzNfw4itQciLYTiDytwENL2qkO85c
	TrPIpixpy7FX9OFfFdIxTKrEQfqLuSSTSbMg9qTRu0BSUa60vlZWpzMm9X2ZnmwYte8LXO1MrMV
	zznoK6Qkxy27cR5W1h/oh3evaOGQ=
X-Google-Smtp-Source: AGHT+IHq8rw6W8p4S0W/aeuhnIgrpHXtsRtdd+z1XCCrOBHUp853lIr5u8gfY2RgCHl2JwvNYEokrNqMnwuiiLIT1kU=
X-Received: by 2002:a17:90a:718c:b0:2e2:abab:c456 with SMTP id
 98e67ed59e1d1-2e8f1051e49mr3244664a91.1.1730071720605; Sun, 27 Oct 2024
 16:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241027145636.416030-1-ojeda@kernel.org> <20241027222505.GA2882707@thelio-3990X>
In-Reply-To: <20241027222505.GA2882707@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Oct 2024 00:28:28 +0100
Message-ID: <CANiq72my=xgeu=TZZAZKEvRq_wKm=tr=Juv1Mxdf50MEVxi53Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: avoid errors with old `rustc`s without LLVM
 patch version
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Thorsten Leemhuis <regressions@leemhuis.info>, 
	Cameron MacPherson <cameron.macpherson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2024 at 11:25=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> and it still works for me with rustc 1.82.0:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks for checking! I took the tags.

Cheers,
Miguel

