Return-Path: <linux-kbuild+bounces-6808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87BAA5153
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1AF098436C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7973A1CDFCE;
	Wed, 30 Apr 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FF5aBWbH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5C13B5A9
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 16:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029772; cv=none; b=hWcc8PVKhpEDTIvtinPPPbk4+avc4OoG6pacwSi/p2s/RxWfeqpufFBDkamNjbeMssLv17qF7GkgEN50zpXm3IUEKUx6hwYvd38GC09AB0ZQrSYmpiwnEHyzoXQeWuB7nBRg5IUGgJ7R2gTxCmtGsjWfbAUWmpiifSWvKaoS6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029772; c=relaxed/simple;
	bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8Ne/FfG3ZzNBNOdZZSKQ2DTGMTgz5Mber/PvsfFMrh8+pvkR/RflnFRGNeWz3c96Uu0wr140QIlA4ZEnckbwYMWc4xN/cbCWVYP8Iv0uRQESSY4MqdjcuKQSkLYFtSqmw5e6ID3hhzQw4Zq1fZ4C0rdunUBPgJcSI49VAxP//E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FF5aBWbH; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad744811so800116d6.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746029768; x=1746634568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
        b=FF5aBWbHpB5b8y6JEZtRYRfUXR0XrubFWieb0RjsCqiPXkV/HovP8hYMtzwcEheXlm
         b5L0eZR3PbctAuJAAndpwstLQMJJ8vmXjsmqWcenoBOkvgKPwLPCR+t2I5U4lTVWgjys
         DgjSH+Y5KM+RYi2m48TsRoEiOOUYXkp1qGOcZxeD8basOXV1EhZnWCNuQoJVWyhJQKJz
         KSsjkTNF+7Zqcl9UjMf9DD805Tus7id/XtJ8rr//pejLevvP5Zt0lOSe6+qHqjXa/u3F
         +PgzjokIs4QpxdMFtC2X2cSeIQ/Rr3auV1CWwd1Ah1KXRG5Y3TeBBAV546WlpB4fZxMA
         oGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029768; x=1746634568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7I4v82gj5ha2wfX4LinxA1Yg1t64C5c1c7HVqM+iLw=;
        b=gy8GcutQapD7iamILacdLWL1G75hc7GIukpumxcaj9F2G9qCqluVSoDS0R+qTM3ATy
         o21jZxhATAxcKWhMPsiYgsKtXbrTeCOzCk7nPQcPSzyI6MI/9yJ9cHCYFKr1NpUIXa4/
         hJS0hFRWAWMs4QmI0o0JAuzgrCAazeDHnrtNyFpmVIQjjZLU9cbd/6PTA35fEOEbmZlX
         ehHQLhv/Zy28x94ncMsZnRGxQmygUn+CsWO9DV8veFWEWvmp/fz2rhiGa2L1Bcs8/8OW
         nJBbOT8x3c6Iii0p8Hwd9iLT4KL2XUavspXKU+zAOQpVJrGP3UtNgKjHqMQ8GExpHPnf
         QYIg==
X-Forwarded-Encrypted: i=1; AJvYcCUzv/+g7CiqR1gsfHs5XTkcO75m1LH1X5SB+FchO762rtNTaksC0o3nJHnPuy2juSht7degWfhflt10FPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRaDEllBjWMjwrzrn6Mjr5puKAhPoUb2OdTrWxqaEDS3Nrejcu
	DWuOIuFVsnsLryvil1DrIu83js5vgESXO+ZRQbafvgsolk2UI5zu/aiE5nByMGnqZEUp/zNefx0
	rEEXhUOdgGSd6kAIpif5ezvCL8mWtZbVZRNXz
X-Gm-Gg: ASbGnctHpWKo9LSSPYaz1GMzokcwxlVB2PCGWSoeoLofq/FvOIBdCPFQTHt/7Hhbdlr
	QOUybGgetGEOrMOEI92G7p6Iz93NqWskVuLm5HpLPGBm31hREe7+2FqFzDOuckoGnbDqNQ9hbX7
	F2TFIM75vniFHWqF65HqJAiTqEAfc12UB4Atok5mRCHj6uUATv0Gw=
X-Google-Smtp-Source: AGHT+IEjndaFBgLPklaVjaJmwIpe21xcoRJmCvEN8z9dGyswUD0gxgYhYsw0agRo8Eeel6INjc8vH0r0ZgmLyHZ3Knk=
X-Received: by 2002:ad4:5c62:0:b0:6f4:c8df:43d2 with SMTP id
 6a1803df08f44-6f4fcf75780mr63178966d6.35.1746029768272; Wed, 30 Apr 2025
 09:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
In-Reply-To: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 30 Apr 2025 18:15:31 +0200
X-Gm-Features: ATxdqUFTsrw87yiAkUoAh6if5K7wSAisaG3kMae-iYUZsldqIbdRSg1dOLfX6vw
Message-ID: <CAG_fn=VoGiRmeYZ=tN+e+R=6VU+piSkdzewwVGuVhfddSTzu3w@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Aleksandr Nogikh <nogikh@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM 'Alice Ryhl' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection.
>
> The coverage level is set to 3, as that is the level needed by trace-pc.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

