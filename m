Return-Path: <linux-kbuild+bounces-5807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1DA38B0D
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 19:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51CE2170873
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 18:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2D922B5A3;
	Mon, 17 Feb 2025 18:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFL62sY7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7D17DE2D;
	Mon, 17 Feb 2025 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739815641; cv=none; b=OxFtX2FzmEJdcqaOgLkFpYH9K2qtOL8Y6PBo7qw0Qw013q3tZ8Wg9JOic8bgwl1e0vmTWCa1Lco9ugDY1ooQZ1hTwx/U3QqznngirTXaLHo3wgyVOjkGDsJgsEm1fdqc/nsPFmI97KKDyQuch+OLeX/CnYSvgXrtG44VQhWcj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739815641; c=relaxed/simple;
	bh=jNbkbQgyN9p6wmiXECxbEDooxhQxvwmXxm/5M1lcUdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=li0mErE/l4wSmDepG9A4Lh4Q1Q6+lZJOWAJ8r0iJW+8MTX9VeabcD4U2MjvAkjwcBP+Jd9CjVlb0iUlbQ47kFYcVFTHHQ42VbN6+OJnGtRmhWu0YnQwHJK61Nov46MRbCE4xmB3kb0CXybXEzAoaZqWxVG/DmgfKM/xmXZrhMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFL62sY7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc0ab102e2so1061324a91.1;
        Mon, 17 Feb 2025 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739815638; x=1740420438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNbkbQgyN9p6wmiXECxbEDooxhQxvwmXxm/5M1lcUdY=;
        b=ZFL62sY7ooit4p7N+bEF3FSV7VCCGTzW/zYRb711eizaCP+VajJFy6cTZSsLsvmXDY
         fEseWSqYeC1FJ/lqtQQHNMSvUQ76jICX0EFFSNGuIP1RGtOXGwmA2tIXU35F/wufs+cQ
         iUAIB2dI550004zS7N1iIJYoMkQ+TqWRG/meV55CRhsLYlJhC9dBUAJOZuOUbUVy98DA
         /bIHZB4YMmZX+gAg4PhSIbQFSpEoM8ylEnZs3nilv2z+E2XdnD9nBJLXVDMyzrGw3qy9
         Qn3GK3u9/vMSni5c+N8cVaOvH6AaDdXVf7X92I0X6PZXonch0lqDc1q1f1nOV8WD6vBs
         26Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739815638; x=1740420438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNbkbQgyN9p6wmiXECxbEDooxhQxvwmXxm/5M1lcUdY=;
        b=qDb/0nCr7TbSyJZzUFQGKUhRwMWs6OZ2RtYXdTcWVUsPVsmmXk9oce2Lzp4t6NQPDC
         RGgG4NzCqeTRuGtyuNVX0Y5xJdcNPqrTA9HUMMRntlRJaiX8qgrdj7Ma7GVK2wSvlFyC
         L49J5ZNNo/UhmSVYH5E6Saqpf5+3m7pNwb/Om6Ry5PeJ6EijG1fOm0zev6yzqHvA4ItJ
         n5UrUKaTeVOg3SxorFglowDpaJCu2SzW5QGISbx+IMybTmRjJnQYdjmJk5v8KAj5YDaZ
         Bf4iqcGg9fQh7iLRFGQO3J2pJdh6X+RxAFFiyvxyVTef7p6JixH+jhZprZbjuW8//j2n
         NzFA==
X-Forwarded-Encrypted: i=1; AJvYcCURM/YdoenY/AdEVKwI00UsabVT/r6ZW2LvjFm827R1ZQ5bGXaTtafL9gHbFgbx2KB3dNh2V086jaPCuQQ=@vger.kernel.org, AJvYcCUxOoPWfbbJ7vLh0bYNVbFmC2NKqg5p90gNd+u/YAtnWMHX7tIUtNKnlfen7/oRgLz2IXJ0qx5eItdZD0LOI2k=@vger.kernel.org, AJvYcCWRELuq0M4KEXMlQKc4asB3ql02+egXN6N/iCnK1ErKyyK3jnvIkHa/ylJqiuUmbia8NSVcKDcudqnBVGU/@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjMm/ssjv/Y9XyAlyEwWAt+GQ9IhYIVNrcWTyIn0G9c0pcq7N
	soGTzrK37vXEiZfZ6TFmStzVtkzxV5xdZT5V0XtJhq584+B/EqlsKAGtrpdvQqtOEO26K2ob3pC
	juWZShuV2r0dPw3Yukz7ZZGZqpHg=
X-Gm-Gg: ASbGncsUPfTbcjxdLj/uRavsrr3UsmCZBNe4T76MKKzbleK+kRQM0p7VdD/xbehvOij
	XwCeDKNGKfd072lKgQmceCHwZitCVzmA+SPENd7TLMH3HM9g8v0rlAVcdnIIchupVMs2lj9/J
X-Google-Smtp-Source: AGHT+IGPfaM4CjtvNt+6ENhZ89pBtXp973gZc0Wei5OtOunt4SljfXggcfufBMvvS2uVItRFMbPkG8/KBFd0PXM2qdA=
X-Received: by 2002:a17:90b:1e05:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2fc407909c6mr6384938a91.0.1739815637758; Mon, 17 Feb 2025
 10:07:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250216213827.3752586-1-benno.lossin@proton.me> <20250216213827.3752586-2-benno.lossin@proton.me>
In-Reply-To: <20250216213827.3752586-2-benno.lossin@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Feb 2025 19:07:04 +0100
X-Gm-Features: AWEUYZnbpsfDS7WwJYbRnxqcBmd4ydrbxCtodLqMmz_46ELmEpvkblvuPWcl8QU
Message-ID: <CANiq72kwME8D2P5C2mbwmTpxekR8u_kdW6GDVz8WERi_NvRZYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: enable `too-long-first-doc-paragraph` clippy lint
To: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 10:38=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> Introduced in Rust 1.82.0 [1], this lint ensures that the first line of

We will need to ignore unknown lints so that it does not warn on older
compilers.

We should probably do it conditionally instead -- it requires some
rework to do it for everything, but we can easily do it for kernel code.

I can tweak it and put this patch into my warning rework series -- I
had to send the v2 of that anyway. Sounds good?

Thanks!

Cheers,
Miguel

