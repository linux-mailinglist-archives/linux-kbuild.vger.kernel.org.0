Return-Path: <linux-kbuild+bounces-9579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031FC4FA31
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 20:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE926189D60D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 19:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05885369973;
	Tue, 11 Nov 2025 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOWsf+Wy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362BB359717
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890320; cv=none; b=pTnSYT6pRtuSePg1Ntt8B6TlLnmSuIrnysNz7jfugJ0KMhHp4T7YFPSuxQgxip6QmbvoMV3+U2pYArHGXiL2eDEs4t3XKtpeDegUTmDYNmGCx94LDqa69PeEjqNyNaK5zxjpV9YTt4LTQg587jeZZTxQ5nosvVkybZzkEZfPL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890320; c=relaxed/simple;
	bh=Sg7FhLFPHYhYHz0dhqTZ1MP6Nbu0jdxwfOGdyNc5gt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFWQhuU1NoYUZH4NgWCxI2PVm17rtaqVgjF/u7zTIGodHMTLOet9jvcaMcsRYuyRn8gtQa4i0dDBovo2T0EUCJJbkLy8wcmX30RJzyYKni9HkpxW6eS3K+CiEq98X9vpxz7aKp7jMTjlalCdzcj4uWLdsDbOV91oOw/dnwDGpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOWsf+Wy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297d6c0fe27so63965ad.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 11:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762890318; x=1763495118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg7FhLFPHYhYHz0dhqTZ1MP6Nbu0jdxwfOGdyNc5gt0=;
        b=eOWsf+WyXEw/eSF9CmjV7HIDweZC0asEzb85mqYKzz9wg9h3Fdpm+mS73vV/5Ri0q4
         t8upNUavqVuqv1KuNaDwbNcMTtBmEav4/wRRVAiTOGmNkbKa7JYB8Sr3/GutmNH1zy2b
         sifoMj72Cs8fBjjrfh0B1yIsNwfW1QhayBnLG5uGcBynT17eVAjrj9w8qJgEMGmXwmvS
         KNqDLm1LQdTW45V+nMxQyCR6IuZZ5AEvh72qA2Km/jLtdUtLXA8HsON+YTh7klrydLoW
         gbXlNtwgbm0lWwyAwSzuYEffId7REO1vPMVZZsuaHTmVcPh642HqHwn1o3As6AL1BJIl
         cDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762890318; x=1763495118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sg7FhLFPHYhYHz0dhqTZ1MP6Nbu0jdxwfOGdyNc5gt0=;
        b=YTwH/83yKGanjYCMHGZ4L37ak7PK4FTRWr7zQzPwkZUZz1m5WjpnET3bTxWEwkfGOD
         p03gEIybAPVuPmQQCICyLb3DBS1becaUQej4P4UxGFoeTZBWGonDN+9wk2gjYcKUkRiH
         J57l1J4nFItRDvtjK1ZgKo900HS4jaTclEJbo5eCw87lsZYY2B5P7NZfrnWcvor/AOQe
         UhosZNhEQMEhU8zxGki2NcDoBi2/vxXE4vSnZoeoqZeNJ04XY2+D84nprblD+Um2Wy26
         wLAhH5aWPXyktLE9wjo0RXXBxSuTGWoscFt8SycID6a/CepVBx2wT6rg+/vKREmh+41d
         3igw==
X-Forwarded-Encrypted: i=1; AJvYcCVN1gGd86ZfSCDi2blTcu/ewW5IJ2M33OGtgiI1rp4jt1d+M9i58Rw01MPhjnJ6p/B1mK+f/i/JOxLt5Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgw/QDoGHxg9o9LMpgG+GYiE5yJe3jVFv/8TF4V3CxiaQYdNzx
	QEB2iL4PJXPCgQvs2mVXg4rJekYX9NfcwcMJprEzGOy5K/HKo87N3CC3Mnoy/9EKI7pMIL1eoSW
	sRPaZVJqgLFxq6T9iGP7/O+A9kEMHFqM=
X-Gm-Gg: ASbGnctIDB1OAGz8XYcLbvydwUAgcVyGXGG1JtKkyWxqzzgzn3JesDfjI2QTdTmP/DM
	Z8ZQH1rRtF87LQbryz7hjp1uEE/udh6wmT9YAkQReV7yWYLrUu5iNcIHf8qU1NO7aOa1qasoHz+
	WogAebOf97AHwrwNeKQwiN57Do9tqSW+5wJxFJf6e7oT9EoSkzfkitCWUzm+QpYYqoI4/Tjpyyj
	H2gfTuD8o24LDIdDGpD9KQI5dO51srzgDutg7fdU27L0HIIXEy3/x+owpDTMN8tJkaeDBXqrr2c
	B25oCCswHVc7VMIrLV3vbF2J9uSavCBszU91b0htrLr3YyN3by6eltILbmiZ6muFi1dye5J/34r
	TuGc=
X-Google-Smtp-Source: AGHT+IE5zjw8D+my40d60Ix41uKXNSt7HOnLAKKhJi0H3LCnV5CTo+qFPBfkXgqbqQK8w6cViFfsGq4E6L6246te+k0=
X-Received: by 2002:a17:902:db0a:b0:295:70b1:edd6 with SMTP id
 d9443c01a7336-2984ed884e3mr3098505ad.3.1762890318029; Tue, 11 Nov 2025
 11:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
 <CA+icZUVcHfLru9SRfhNGToiRmyOY+fLw-ASEvQakZYfU1Kxq4g@mail.gmail.com>
In-Reply-To: <CA+icZUVcHfLru9SRfhNGToiRmyOY+fLw-ASEvQakZYfU1Kxq4g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 20:45:06 +0100
X-Gm-Features: AWmQ_bkZOKXuOXoFqnluk99fIIrWIqE98EcoUgehQR7XEFroNIarOWjMBHltciY
Message-ID: <CANiq72mS2SFfMsMgVvmR7dgBpYq6O23Gx9fQmDWuaqrz5sVNYw@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: sedat.dilek@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 4:25=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> I switched over to gendwarfksyms in the very early testing days.
> Faster builds. DWARFv5 fan.
>
> And was using v5 of Sami's patchset against Linux v6.12 as it cleanly app=
lied.
>
> Last week, I jumped over to Linux v6.17.6 and the next testing will be
> Linux v6.18-rc5+ (upcoming next LTS kernel-version).
>
> I will try this patch - might be you will get a Tested-by.

Sound good -- I have applied it to start getting testing, but if you
have a tag in the next day or so, I can add it.

Thanks!

Cheers,
Miguel

