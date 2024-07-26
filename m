Return-Path: <linux-kbuild+bounces-2675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02E93D316
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 14:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C748B28181F
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 12:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F2F17B43D;
	Fri, 26 Jul 2024 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfGXioFc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3E917B428;
	Fri, 26 Jul 2024 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721997404; cv=none; b=nlLR3sPh6p8KldBRrLH4HrMWJWRmxnVlXA8RxU8FmpjB+lu4PG4rpaoNvPwWE7CVCoDzo2ob3U2mZtg6JgVc6fiqtjV+Kac9eVEWogJQuV4tG83Wxt9yFUupbPnMo4AN/gghQ32ZdvP2zPC1kpIEiq4W4k/i0COUwyea2dErNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721997404; c=relaxed/simple;
	bh=1zWDRWp+paDjK/r/9N7qgoFAesuhA/2QMW3EwgwYqcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6dLn8+VvpIE6AB+DRvcJGhKAtQm4pW0StpxkwPxuIk3D2F/Ic/Q0fhSVBoSYrCdQT4Zuabv1w6WLPmt4H62H1E2r8RhAkg1YsPlIuf6uiJxEvVKEk+qTwq7/B/RxxGswo8n266XKMDABxbs/a4T0g0caAkxT4DowTsvsAN2Lag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfGXioFc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc587361b6so5393235ad.2;
        Fri, 26 Jul 2024 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721997402; x=1722602202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zWDRWp+paDjK/r/9N7qgoFAesuhA/2QMW3EwgwYqcg=;
        b=GfGXioFctx7+yPViCkHs9jyE+okbW4RPqB8XAzsJon7Q8s8IRxMZCTf7s9EStDNX/6
         cyLVjAQcdgzTc2MuWDhKUHGhebL/F9yuOx1VaTvQ481sjKuUOsRHHxRwhzCqtoUU+1De
         ln8XoBH8nC197TcPpIQKB+K9sKWdVhMab3djHyniTt0UHvynqeB8MUNbEPHCNKkG3R/v
         g5WVZwHO+xBAdgiqHxDIn4e/9ZwCbLn300kJbCtYZQ4o4kCZtdJrb+duxqe5LLnSjNQX
         FUsDdmc9MUMPcp9vwIhmHkir6oQ7OK/74hr9t7iLsChLKM5Z0HbPGmRriVbu/F/QPlch
         Jc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721997402; x=1722602202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zWDRWp+paDjK/r/9N7qgoFAesuhA/2QMW3EwgwYqcg=;
        b=XcAEqGkp4XrR26+iVeHVgKznyXNwDKqQcr9qSHIvhtsEqu7J0lKChV1E3LE7f4PcAY
         BZhy7lUcH7Im6wsdGqZMLiqkYTNiPb/o0seUPn3ZEUTLUNg0YQjybFLY591pmuqQeWCn
         oqSWRDeISJsXdEEXa5UolMVsGvOp0RN/izQlQHb6+W2hqmcDEKMEKc1aUBKGcs/zUK6y
         gk9EcN51fxdz/VzUzLQQXRrE2MwvVkkCykvp72zpEI4yJw7381/EKx6i138wvii+ZMAG
         MYFOb5z/4dgjUUbBA3NSxF6zqbyVIcZ8HBvpiG+LTfVuV+grgrkaAkhCfwZlR3hQ23+L
         g5sg==
X-Forwarded-Encrypted: i=1; AJvYcCXbQ9dpi45lDA5oOn2DfZO3eqXFLMCMYLpNROapmRT34qaBTSA1clvWu9yWOnAmWP24R3CvzD88v4xG1oc7tkC3jfLVxL3h99br5po4BnjdlA3GLGiwX+milZP/tNobRf+hnYU/KiquV7QNftWC+cJPXO/b27wKLJrhS9ib+y7d7+Y3wm0uMVAPBM4=
X-Gm-Message-State: AOJu0YxrylFGUGnk974sFCPr3mdv6LKQLDdf111lgRgWD73k7ZCMbsol
	bTDZJSSkkwEqwTCgTE5gPL42zTgjfMTlV20v5UC49px3iJPTFG/1Mjmzn5s6+sUBdZ7ZNrkxErl
	JEbEgrp0MfPrqmPzxKkXztaUjdr0=
X-Google-Smtp-Source: AGHT+IHt4VEqTzpVq8r5CzvzfWANcuIs631ikOmdea7VFGcamFNux9yi9tHxpM7rdXBU4AZ90s8oyeHEh8iuSzasv6Q=
X-Received: by 2002:a17:90a:1fc8:b0:2c9:57a4:a8c4 with SMTP id
 98e67ed59e1d1-2cf2ebb9251mr5312268a91.42.1721997402182; Fri, 26 Jul 2024
 05:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com> <20240725232126.1996981-3-mmaurer@google.com>
 <CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com> <CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com>
In-Reply-To: <CACT4Y+Y+XmdNervhF5WAEyVwprJ32m7Pd8FF2fKy3K9FiTpJtQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Jul 2024 14:36:30 +0200
Message-ID: <CANiq72kb0df5k-8njjNgfFFVj7Cfx-uiTSEtMt5Cbb8f3DkjWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: Enable KASAN support
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 12:23=E2=80=AFPM Dmitry Vyukov <dvyukov@google.com>=
 wrote:
>
> This is great, thanks, Matthew!
>
> Does Rust support KUnit tests?
> It would be good to add at least a simple positive test similar to the
> existing ones so that the support does not get rotten soon.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/m=
m/kasan/kasan_test.c

Yeah, we have Rust doctests converted into KUnit tests, as well as
upcoming `#[test]`s support (also handled as KUnit tests). For this, I
assume the latter would make more sense, but we have to merge it.

Cheers,
Miguel

