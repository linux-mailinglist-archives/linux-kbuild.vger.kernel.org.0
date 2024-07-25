Return-Path: <linux-kbuild+bounces-2669-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A993CB84
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 01:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B7A42821BD
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 23:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610CA146A7D;
	Thu, 25 Jul 2024 23:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZ0dS5o+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625114387B;
	Thu, 25 Jul 2024 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721951836; cv=none; b=PQg79PSRuUb5XVA5dL1nwcDYXvy2ibjAqhSfXZr0CWsM0ji6cRZt10QmOCiBZCJKp1sGW4MOBy+9MZvomLwGu3KAWMgeZN4IvH2YrYA0fMPcL7faNxjofwyHXo9aQgNtNdWAOz5c1QLukGio0MEJDvNocXyMs/GlMeSWctNz6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721951836; c=relaxed/simple;
	bh=7ZO8NY+MhR6rlisLZKfuIdLGQ9cl4ofCndl4wcFacHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuDNmvchR4kStzfEki6iyNrWK75XBQMP7+NZNIDWlsqId769EjZDJtSk0IX1xFMKMMXDKnR7UzRvVIHJYcNKd5+lCP40ZC3j1lyt6d0PhCrA64g2Eh51RuqBmpY8iZTRZctlGSi2WOpdQDgHtKJx60G5Y2PEa0JiHxT2Cq1Zydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZ0dS5o+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36844375001so831442f8f.0;
        Thu, 25 Jul 2024 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721951832; x=1722556632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi/pzfQRC02iIIyUSX4FZkWNmHAKRwkz4IYJvMytXBE=;
        b=lZ0dS5o+yJwoOxViamFwFCKcbzYqEpuuNO0NL98g2qM+k1pRWe03zKhd+Vxrz4fpyT
         ytOxDm6EFZWNjVjj++2cMCvOUfEagyOY7KDaBq9JtvKsPl7qlNZHlUqsUAMYNaBl5hzR
         uXTnlETpFKdg/Me2pXR/E2hevncP8sdoplxzZ8wyBe6++q6lUCHqLsdlmEeQKstFAoJA
         86ZmB6gxfh3InnKSD8Ae2QgaxpLpGNLGoZPAk+6JOzoLsYlpsqSuaCuWLf2XigJ7fZXA
         76eEbUZN08VueE0KaQ9n9KnsNTjA40d1/j6P6Rt5EYBiY6c7L04a2ztbxhpnGYky1Z8r
         A5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721951832; x=1722556632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi/pzfQRC02iIIyUSX4FZkWNmHAKRwkz4IYJvMytXBE=;
        b=ZZvLl9V43vlwyx3NiVQOvJjRthiEIz90sMSFWe/zWQGLj/R2oPJtDjDbnLM77/BXc+
         K+VgR9/+ZTRaVQdyoXD2dEzZ1ErTt/5J/qQgUwKjbzim2FvYCpkNOzZFHmd7kBIjAbPw
         Grq4TeQQOttr/PfWDY351UWjUfCQFEbWYlO7Xkput4i+IGvHuL8grn7RnyuwUZXQ+lcO
         IYetd7x4Vgu7jS38xzcpd1KQJOVp2BCjXt3jeKZGSiFsZ9kN09YPZMzSw/qZjFRhgkUg
         r74lUWt01OsWh7a34w/KG9cguUuT6q9zjX6N/hc/98QAwcEnqK4baVjOPeyenLXXI7Z0
         uiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu/OtRpPY3LuGEczLfky2V8u9TKvgAZzkvT0FzGz+7uOo9TETrUqsps3Jft3jY4RQHzbP0oUrwKxhI1dU4O6vtuUF1JcVA0By+M6ePONibOy0ZHDuq+vBvT1M37vUPPGK/mAy1+KZUcDjgO81MUFDQJhsgTGwiGnOvovSdqgNUimvrDdmtBFHjT3A=
X-Gm-Message-State: AOJu0YzmHciG2YGaD+CXN4015iOrqXb7WdmXJlg8rbquuPpWWRFenNEP
	h/CjdMRMpSNWyvF3X6aNTARxfAYYCsbSMsd2dFYjHfLV+ZyD8H0m9uv0xY7ZIbgkRx7CravErfy
	ht6N3GBeFxYTkRHdhU2JOctCSaO8=
X-Google-Smtp-Source: AGHT+IHEiEFy2jtQABp1d1D/wmBs9P94Ex6cZf4lZuU+kycE288rckbaIZIu3a7sf4AvrClqQxuG7J4mtIPtRTn5ujg=
X-Received: by 2002:a5d:5043:0:b0:368:4e86:14cc with SMTP id
 ffacd0b85a97d-36b319da8e3mr3167018f8f.10.1721951832106; Thu, 25 Jul 2024
 16:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com> <20240725232126.1996981-3-mmaurer@google.com>
In-Reply-To: <20240725232126.1996981-3-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 26 Jul 2024 01:57:01 +0200
Message-ID: <CA+fCnZdwRcdOig0u-D0vnFz937hRufTQOpCqGiMeo5B+-1iRVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: Enable KASAN support
To: Matthew Maurer <mmaurer@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 1:21=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
> set properly.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Hi Matthew,

>  CFLAGS_KASAN_MINIMAL :=3D -fsanitize=3Dkernel-address
> +RUSTFLAGS_KASAN_MINIMAL :=3D -Zsanitizer=3Dkernel-address -Zsanitizer-re=
cover=3Dkernel-address

If I recall correctly, the reason we need CFLAGS_KASAN_MINIMAL is
because older compilers don't support some of the additional options.
With Rust, this shouldn't be needed, as it requires a modern compiler
that does support all needed options. E.g., for CONFIG_KASAN_SW_TAGS,
we also don't have the MINIMAL thing for the same reason. (Possibly,
we also already don't need this for GENERIC KASAN, as the GCC version
requirement was raised a few times since KASAN was introduced.)

>         # Now add all the compiler specific options that are valid standa=
lone
>         CFLAGS_KASAN :=3D $(CFLAGS_KASAN_SHADOW) \
>          $(call cc-param,asan-globals=3D1) \
>          $(call cc-param,asan-instrumentation-with-call-threshold=3D$(cal=
l_threshold)) \
>          $(call cc-param,asan-instrument-allocas=3D1)
> +       ifdef CONFIG_RUST
> +               RUSTFLAGS_KASAN :=3D $(RUSTFLAGS_KASAN_SHADOW) \
> +                $(call rustc-param,asan-globals=3D1) \
> +                $(call rustc-param,asan-instrumentation-with-call-thresh=
old=3D$(call_threshold)) \
> +                $(call rustc-param,asan-instrument-allocas=3D1)

I'm wondering if there's a way to avoid duplicating all options for
Rust. Perhaps, some kind of macro?

Thanks!

