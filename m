Return-Path: <linux-kbuild+bounces-9450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30271C42502
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 03:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B16884EE595
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 02:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833172BE7A6;
	Sat,  8 Nov 2025 02:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4Pz1O8f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B428C5B1
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569447; cv=none; b=Dy6TOCui3B/ov4Je2a0LJ709vsBJXWoxJdajBGt5zXepQTSkXcdlrQhDeg7r6TjP3GYafsZMrGdfmYYAPSNS+BcSYivmQkr39CGQFqQfrMWcJdgDPdSr12ks2L6DkyEFlGMjayNJNcATan1AL5hb+73tj1UtNyRMKsWx2ZdbnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569447; c=relaxed/simple;
	bh=pZs543aQJXGBiZv1p3fT4nEMYNcLibbhNgR3xp64diA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZafAlbImp7ggpCGHZeZHUdNnGBHzaKNMd+5MOM6MMg+TWwnY2cIR6+4BZGXPONFeOx1MOVshC3njm7G6n3/wOda1pdoBr26DfnQvFafpVVkJ9fx6KovOK/j/S0WYIlI9t7yHTz0goFqmvQ2dcTdd1BjAfIezSIuryItfo5+rblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4Pz1O8f; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297ec8a6418so78685ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 18:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569445; x=1763174245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZs543aQJXGBiZv1p3fT4nEMYNcLibbhNgR3xp64diA=;
        b=D4Pz1O8fBgxVfdLn0kGOEPXb0Nmg76AgpJ/stxFpJ6/vKMwRMy+tyE6VHmRef8yl5a
         J8sC7qAT32BKsKL2K+sbGtrDuSBnfDyI+7SfLKNmzGRO1uevSAXTYuv26lKUoFrw8U+Y
         B2iSh3SbPRyQIzoTfh5Aufl4OIfIF+RhjQYQT4e6cxaOWLx++qhEZNySZlLeQCZLhZTr
         JlJy7lOhCEQfh97v3Fv6CRy8JV/mXtkpggFW37TBz99luVoUGN6om9GQHH+RO930XbnQ
         R1Qp/PmzrTRGrjz9+oDbKhBd0qSgwkzT7MHKilazuxuiRpEcpB6Nti0nr3KLk1Y+q/5D
         o6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569445; x=1763174245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZs543aQJXGBiZv1p3fT4nEMYNcLibbhNgR3xp64diA=;
        b=AT24VG3N6gpuGJOtjjDa1udtBn8i7DoTVZZJTRhUEEHBNwNu1Xabzl/K2UJchp6TlJ
         tJp6IANlHQXbMypF6B6QbzThu27g9GaL2QT7KYP+q7B8HpEkOcvaG8Gzze3WoEfB/5qb
         R/NVTz/nBoYwprKNmhvQo/ai2r9z8iPC7TtzQMglulEjIsLmJ/T9U5czcKkZ8WMjmC2W
         abyTNIkQ1gOd8nz0hVaFHcDGQ4RrMU9t7hVBAqKZ3EAW1tjt3+MHX5Za69WybBVP2DZI
         4b06W14g2j24133xWSyO9LYbbn+/aI/RGWTwR5eXxJYqjwb8sNG3mLsmXpf18vMtK9Rc
         BAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUJIrja19HNFTOw9A/b0be59XMgmjAZz9dBeQd4H9uHJADDJU0KcKMVHc8/yUO3sIhaTamNAtEJFlTRKmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVw81llnLb6Ke0ccCttFvQZ6fOeX2hAv0s8awzZcZNf3PLDrEt
	hnMys/nxOtFN4mEm+TKo/vVKrS74t6tAOpkAcP5wFkGNDmHrEtpCO0iORn50+Qa6DSkgriX13sk
	YN2c7i8xxBX/JFJEVF0WERG9rbNiPSR4=
X-Gm-Gg: ASbGnctJ8aftD13ocxJWdVBVqr0gtWjNu7pI2CglE6HaO9sbapvYPhccKnRsvwr/su7
	gnpRaEmDYioywSk/UwkGarzi1DbCpZnH9XLanUbB520X9NauyZV9hd7NUzurmkSk+BRrRQSu9Ec
	1mNP+uLa3g1fm5exKk8ypvjXXGAZsSxVkkFhaN9bxxmnHtmCDBkeJCbh0iaeEvOE3+FDVdCvM4L
	k5gtKH4/UwtNrCT84f4oFeelRuXdYY/ds3iQNqIM3t/69+RjLM1sPI4MK0z4XT41qa2u9OYqtg4
	fKGnyDfQItioA5XjJhu4vOwPRX8LrXt6R9I9Qyt5w1m7nGPSYJr+m+Z+jet2R0c9Pj2BNFveem0
	F97NmTqxDKHZx0w==
X-Google-Smtp-Source: AGHT+IEovvjVicfDdGQT2CYmrDOWKJSfWNjNZjATvixUw1CuI60OG2r2rmWY0cQTlJoWG3OL54m2HoMu3xt+gxb8f9U=
X-Received: by 2002:a17:902:c409:b0:295:3262:c695 with SMTP id
 d9443c01a7336-297e5646bd4mr8325045ad.3.1762569445056; Fri, 07 Nov 2025
 18:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108014246.689509-1-ojeda@kernel.org> <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
In-Reply-To: <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 03:37:12 +0100
X-Gm-Features: AWmQ_bkkl97L4KdKe3MLMAG94NJvyqaB6LbDFgvfVIDBf_nqC8JcMtGIqLcDcT4
Message-ID: <CANiq72kWWe_w-0088SiGvKFrh49P9wRcPxQvkSoU=SOpSrHbKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: skip gendwarfksyms in `bindings.o` for Rust
 >= 1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:30=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> With `#[no_mangle]` may be more reliable and it also gives an actual
> exported symbol.

Or `#[used]` to keep it mangled since we don't care.

Cheers,
Miguel

