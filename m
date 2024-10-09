Return-Path: <linux-kbuild+bounces-4004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1695996B43
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 15:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D5E928943F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF6512B94;
	Wed,  9 Oct 2024 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTOAPp+V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA81EA91;
	Wed,  9 Oct 2024 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478824; cv=none; b=CoaC5LbKY8BsKrEYlR78OkJqSGmRy5wzPVK0s4AeIUKmT5cqAgMyoBZgoQgh2wRRHPbjZy0hLyZnsi0T9WztmxFilNUoY+0yjYBKcL6KPKnikaiW71u7fEbzqeCaf/nbJ5tqgw3TZ952aJ8B25MmJXRiiCg4U4uaJVu79dXuT2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478824; c=relaxed/simple;
	bh=KZfd22BMhEgpaN3s2NFsTfKGuLivo1oewb91MjRpynA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkNWmj6glYwfDCv86I9IHD/m44AcNX4tIbxSs0ZIvObVM18CWbyMHYTWChYlJNqaz4lYDhzAGqt1EYhyeaPOQNfejlWAwGkgShbv+XBS1ZdS8AvgoymaaKpyrPX6pKscFsKhYcQNfiW9zVFQ6msEUtjHmO0KmydsafU0avR75Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTOAPp+V; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71df49bbc2fso629643b3a.1;
        Wed, 09 Oct 2024 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478823; x=1729083623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZfd22BMhEgpaN3s2NFsTfKGuLivo1oewb91MjRpynA=;
        b=LTOAPp+Vn6ela6Na9cyHg+e4B9v+heog9MGKhCgD5h6+M8ouZ6kqv07hEOGsqZvV2/
         3zQEhrqGRadFghRxo/ukLJP+1NQESC63phPDA/FaZCEiqnJbA0LtEWxrQQqy4dTsPFLo
         bYaMy/7s6I8IjeTtu74xsvuiAD4VOxD44yOwLwrfijG8zeRb56YevioYfZIigGHg9qse
         4b6A8RRusffR8nOebsR2CeqwMBw4LpeBYF7jieoRFioqdB0+3z4ezE2aDot7MJo6FVcZ
         FR5puRvHZgJt57MXphAQNVEh27pUkSYL3h500mEUkaM93qhknAx6fPSbjdkzdnaebDgR
         s/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478823; x=1729083623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZfd22BMhEgpaN3s2NFsTfKGuLivo1oewb91MjRpynA=;
        b=w/HCMr7uKg4diT+CvUb/ClgVNX53868hJpbt7RwUrBX5zJoTByYuXV3QZlBcvPrPaZ
         6gig1w85hDXjCSNoC4PmSyeWAIfxSGggNfgnXLa94Tx+UJ4Bimc+IUONGUeakWjc8UCm
         l0FHFxgOELvtQEHL3we7EcgX+FeWje/8z5rJypZ0iceTg6EwfuyEuwUGfsEkaclzdgqh
         v0oZafOYryiExMPpOdI+hTabfLFbyHLOwwnHJbXmY/LasxkTtmeQ8RwRRAPxFxfJUhWr
         /3/pHHIRG77IMSAs1zRyW0NCuYvSG8K8VIRvYGF0cVYi0mFvYHCQjBXp3vng8qd45thX
         59zg==
X-Forwarded-Encrypted: i=1; AJvYcCVYMjr8l4RoUN65IV7eHNDDaq5CTYWMrk4kPgU2Zo6wqcGP6HIU2o42pnGDQTm9E+Twuahm/8kpj5OiaY3hLRA=@vger.kernel.org, AJvYcCWbZfKTLFS214uxR9kVYQYQdf0t3iwZoD0IgUvricQYlC8oBO2s2pCcm11xoVOj6F6Yr6htrK47+r/dpks=@vger.kernel.org, AJvYcCXHF0HY2eWIWqa6P4Sfkfp/AFOA4H7T3Za/DOZ68ofUcUcc+G3nRvFknFsnLJBtVfcu8v2DmhRuyZJdL0Dm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7jJDhhsO8YqYiL6Mnot/2DSS0e0Q3fZJkaRY/E7bkqX6pk3Fn
	TGOLhD4y9rWmmxPqMGPbTdcFL2noUJ7r/5Ds2bqQpMdGmHltUln/R+sVhRt3QPgjSUHS81ITTsF
	FsEae1s/Z4dmfsKYQym2l6oF0meE=
X-Google-Smtp-Source: AGHT+IFU/0OTzluBQrIEQzKoLpAe1Xa8N0nm93Rhje05HGnRv6g58c1SdQ8ZROoTkpBtLe3Bk0ktFI+CG9vbyd6Fj/0=
X-Received: by 2002:a05:6a00:1307:b0:71e:c41:ebd6 with SMTP id
 d2e1a72fcca58-71e1db6e721mr1677027b3a.1.1728478820956; Wed, 09 Oct 2024
 06:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
 <CANiq72nr_X4JY=LUcj14jZfcPV5=Cn3QTucYGmBTz2QdA5=RdA@mail.gmail.com> <CAH5fLgiR552+ETb0HVe1n5KqxB1vXo3LCfsuq68FEbcGrk+FBg@mail.gmail.com>
In-Reply-To: <CAH5fLgiR552+ETb0HVe1n5KqxB1vXo3LCfsuq68FEbcGrk+FBg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 15:00:08 +0200
Message-ID: <CANiq72mo2pUHS0a6hY2OgaV6=1V_rT3fSw5WszqjsYzEB_La-g@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> That all sounds good to me. Feel free to make the suggested rewordings
> when you apply this. Otherwise I can send a v4 if you prefer.

No worries (but thanks!).

Cheers,
Miguel

