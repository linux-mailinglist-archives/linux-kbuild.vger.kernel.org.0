Return-Path: <linux-kbuild+bounces-3945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CD9951A6
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 16:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23C71F25E1B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 14:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9B71E1C2E;
	Tue,  8 Oct 2024 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4PR7V1s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E89F1E00A6;
	Tue,  8 Oct 2024 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397516; cv=none; b=NA51tdlHjh8UbsfoPpGD9n6qoNOgqE5jMewn+I3xwmMew1qtDf187iKS1W8Fciu7ORdy9OQd2J+No/Jnl0Zwunt/qvCp/MQ6JgpUKTsqril8Qxlf2Vf2rYFl6ta2+XDqkXUtj4YHHMdXaygZ79moUHK0tZvw5TuVf3+zYOmWhAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397516; c=relaxed/simple;
	bh=4STEqdYYHzlOOzlquJynpCruAUk64g6t2knQIGSZXm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhoY89hSpHAKgNW1fK/+7eMI2+PK3qg95OelPhTn4uUlfeBGzN4qStnrt+8tp+fL1sXHd0jKEmtjDhCWSSBY8gD2gKyqUu5BPjx/zXdzXUrTsJ6tLs1ZacA0lvMTmgR/o8RdTwxa42JHr/oD7ZmUb9ZYXC6q8Jr8nTUHih1X7v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4PR7V1s; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71df23e0ffaso458893b3a.3;
        Tue, 08 Oct 2024 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728397514; x=1729002314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc5hto251I8BGlFglrpuO2SzJcbAncIqP7pSZlWjuY4=;
        b=i4PR7V1sY0gFa5hBfkBXJ2kLqyOvbkVs6dV74GNNrDkXYMWMYxHjoz7EMSHEdNco+z
         x2B3ateoNv7m8qn2e/vBL3YFE/Tr0tIA8K6x46i1XAjGETE8w4uHxHpc0vqDtkPk5mo6
         uVqouYW7F7oaAC6Q9AlKDpP1IJqQyP3N1n3j5yYRrM78vT/z/FL2Y8H4XioZVJkx7/TM
         WRrTOratx8iPuLqwnIZg4nc4g4UpOo+19tH4XG2gEWnX+AgydyM0llyeklh+90GP+hzA
         PSInXyXn7j7st84F1kSFwcpt8RBu+rS3cLhE4e9mWQudTTuxyrIyNKJ3uVw83F9PEjJg
         U6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397514; x=1729002314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc5hto251I8BGlFglrpuO2SzJcbAncIqP7pSZlWjuY4=;
        b=JkPZyzWWTGSxElEAMgdDmSD/Cumnh4RhLKxos9XnybrfhpRXtEQ0LKXV8FjwJR0DOH
         RFYQnHxShLpyjjxFUURI9vTyZbG4zWV0XQ+hRx2MEo6xZpPD6/Qcz/eQA+b/CV0mekzG
         eN5AhNHRo0JmNpq9zIUvdJCRuuUA2mF2qsOx6geKjhxxPj1AvEeeWCtDR+BPNYLz69gi
         T3TdKSiaSqmLEabLGp8ek6xlj6Qm2mRpRydudHkONPqJEHLCiQw1TfiSzqaZiE9L3RP6
         gzsQw7o6NQyfATJn+3+ETedSkdlTVzShMPKrTUAp7vIkm+vvKKOR2LxI4BUarZeUTWd+
         8nBA==
X-Forwarded-Encrypted: i=1; AJvYcCUOjx1KC+ObnkpbLVcklaa3ovBwYBc85+fW7mGPeAzsJqYpQiM/ArC0iKU3AUwCGtIEUVxGM+nEL9PLGyH86y8=@vger.kernel.org, AJvYcCUSoLs4u2BuncdqS8d7AGrp2BsT8jI4k/F/BpVEpSViQpBx8CmFdCt5SkQdgXAWOqf0xXVd/mWwdq3TjyMN@vger.kernel.org, AJvYcCUVASQpVO8jWPhg16pR+zIpi6xGn0UKOUPTblpTHDD2OcwiN+7oYeCbNW7ck5YUDGzirstKHKWVr/3Yxuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysAI5xSXUHU9e2GaZLr8dFoZZ5Ys73urrllvosu8o5oqUUIERE
	pBqYtttDcCpi/my00Zw8pMxa4kMNo+0BHYwXfANTGOgHvH2umQsjQLcWoGd6c12ux5Vzb4OgkCz
	HrjHM5aSgjl+gPwSzW0JSHo0Zp/8=
X-Google-Smtp-Source: AGHT+IHTlD2Pu5eTgPDKY+KvivoG2mvhEF6kV+SK5/ToNQFdOPshkDI+mD7vyG5fQLDOdDDdQ3TOxs4evy3VxU6tGAw=
X-Received: by 2002:a05:6a00:ace:b0:70b:705f:dda7 with SMTP id
 d2e1a72fcca58-71de243f079mr9999986b3a.4.1728397514070; Tue, 08 Oct 2024
 07:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
In-Reply-To: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Oct 2024 16:25:00 +0200
Message-ID: <CANiq72k-Z88A+Bk6q4M5dnVW74L7u85Bqdo0ptSdvVaD6BR3_A@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: add RUSTC_BOOTSTRAP to rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 3:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> When using unstable features with the Rust compiler, you must either use
> a nightly compiler release or set the RUSTC_BOOTSTRAP environment
> variable. Otherwise, the compiler will emit a compiler error. This
> environment variable is missing when rustc-option is executed, so add
> the environment variable.

Yeah, `$(shell ...` does not pass the environment, so we need it.

> This change is necessary to avoid two kinds of problems:
>
> 1. When using rustc-option to test whether a -Z flag is available, the
>    check will always fail, even if the flag is available.
> 2. If KBUILD_RUSTFLAGS happens to contain any -Z flags from the
>    environment, even if unrelated to the flag being tested, then all
>    invocations of rustc-option everywhere will fail.
>
> I was not actually able to trigger the second kind of problem with the
> makefiles that exist today, but it seems like it could easily start
> being a problem due to complicated interactions between changes. It is
> better to fix this now so it doesn't surprise us later.
>
> I added the flag under try-run as this seemed like the easiest way to
> make sure that the fix applies to all variations of rustc-option,
> including new ones added in the future.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I think we need an `export` there.

I am also rechecking this, and I didn't get a reply from:

    https://lore.kernel.org/rust-for-linux/CANiq72mv5E0PvZRW5eAEvqvqj74PH01=
hcRhLWTouB4z32jTeSA@mail.gmail.com/

And I forgot about it, which is my mistake too -- I still think we
need it (and we should not use `-o` either together with it, I think).

I can take a look...

Cheers,
Miguel

