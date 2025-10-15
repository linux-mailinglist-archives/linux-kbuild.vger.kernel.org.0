Return-Path: <linux-kbuild+bounces-9155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D3BDC5C8
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 05:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3816B19A068C
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 03:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F8A2BDC05;
	Wed, 15 Oct 2025 03:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKXT4ETs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701A251793
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 03:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760499531; cv=none; b=LAr9D+j/PU34heH2DWAmHxuaVyfz9u0B4sGqDGYZfBzxxFlbyae5t1LoqN6a851zVmz5fr6vjX0cSOwqUYSoYy9HFZYe8PVPqRZqWBcDoFjgHWGFsOfKqIWuvxY7F7xNYTTnYWzXUlTf1qlcI0yXkEw02EvF/XLDKfJ5Fom9eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760499531; c=relaxed/simple;
	bh=4wJt+gpoa406fX3ntwa3yiMH3j+kDH0t4mBuoWTLNIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOXOSK64/CN3hzCOFK1vK0XXZKU8Qk1uwkRLJntVtEOv4c3va7iUESsKorDwnWWuL1+LIcpM8hQJHWbMY4Noe/wcY/t63yRS9wwjL9jiiYUdKq+7GTOZQyIibCIG5IN/5ijTC2C8rTJR8DDvEhdzmJFQ4UoiyV7ndFmlWIYEsPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKXT4ETs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so4957892f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760499528; x=1761104328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCkYlbRToLYdFFXJcENf2IQzzKVCQ6jcGYcB48CaRYU=;
        b=TKXT4ETsVo/AnWDGN4gTHQoOmppjqK6jJd4IbaqB3jQzKkng1GPFVuKYPjsEzs3izu
         f0g5GIRJRP09dg6PR2fH3SNPT2DpHHy5Oe+nQoqOE8FAQskbp7pxyyv2EHA6UaQkb9ca
         spBheRW0BDBunLF0LE020VRKogvx1KHqZBfAG00///Ne4f082Pn63JAiRqc0eeRjZbix
         Um3noxtz2cqwbUFZSJtB6XuYstLt3dLPznqBFGSQJeMhNflbnb5e1uCYQqoZU4h5ueNQ
         gq3daAy0kg4VLyj/wqeOCoITTleNisoliE8ZnsQ09tMFPMJIsN13fvSWQfAii3BwgVYt
         gWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760499528; x=1761104328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCkYlbRToLYdFFXJcENf2IQzzKVCQ6jcGYcB48CaRYU=;
        b=HEV1Qyf3aAvHQ9O7c1ZPKmruwLIsjAw24l5MC5EcHp2heoYJm1TOGV8XII/aTGs+pp
         TXTSO8U3EBfvLyDsS7sEErQlrWJksBYFhLfVNE+FnobPJCvbiRNIaEhp/tvGznY+37w9
         jkD+iUJsiZsGG6GPCN9bT8u6snTlTJ83NKfMZTWQgs5FN/0s3Cvp9Ajo5FALjB7czn/7
         MXziuwMKm6Mo18R7W1OW/6ramo88JnOUDweXUdHAxKoKB6to4sl3ywCU5i7Nsc8UPb5/
         67LcvV3o7OKZVVhIwwz7E5qgguX9uZnWwezal4mg6bVUjUznl++GRyIJUuxJGRo/rCaH
         gOjw==
X-Forwarded-Encrypted: i=1; AJvYcCVdrdxyyAxYnsRFhIdO/62Wk2j9Iq0d5rIy87Nfw8oKufVslFIRk0RhCFItxgbzkzL3SQNWaWmHm0FV1rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23RiaB2EszNLN0VzKTfNAc6O4DUEpn/ECobHYWZgujnnpl79m
	vqgwmpJ/9UZATyLcCbrv/OCkAyDMXjr5Ty5kPlCa/TR4k4Ucv3yWuNmqpM8h2gDSBZ9gOtchRAW
	w3PtcRBNcFloDKFA2WfEiA0gkcOCkLn0yaYj6xTtA
X-Gm-Gg: ASbGncvppo8dm4gdlnxGl1ERFFyJbQejw5CNEs5enmmuSF7BIY097//tBNy/RVn+L26
	TZec5mWuOugAb4a6gJ+6sB3rf5ipbhUIJo8MEdNxiB9FuYJy4eoywERCORmM3j3f3N6bhTDs0kj
	kBr1ojDr5hCR2zzkBmfE3oEXXB/2+gcNE/G/zKLpHPKfd6pURvP++vnLTbDYZKto7+MOyzjrgz8
	4SBKKibR2LBm0/0Be5iG2YM9oC4gysgiERwcfiSjRE=
X-Google-Smtp-Source: AGHT+IEXqrUaXr8DHCM+aI/npfJJzTlagvjXjvafVzIGuFHFtOvaU6LGphM/lgPuvpr67IHJYligctKwRWzsmwrMOL8=
X-Received: by 2002:a05:6000:3111:b0:425:825d:15d1 with SMTP id
 ffacd0b85a97d-4266e8db601mr19071351f8f.44.1760499527730; Tue, 14 Oct 2025
 20:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191156.3836703-1-xur@google.com> <20251014191156.3836703-5-xur@google.com>
In-Reply-To: <20251014191156.3836703-5-xur@google.com>
From: Han Shen <shenhan@google.com>
Date: Tue, 14 Oct 2025 20:38:34 -0700
X-Gm-Features: AS18NWAAoTZwilsHeALUNIPooAM-rlbEq_tGr0S8vEjTAZ0hT02nDM65-kCnNvQ
Message-ID: <CACkGtrgWRJw2+KX_=Xww773ovYkjq-Bf4Sygo=Hgn86TM7VjLA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: Add config to assert profile accuracy for
 aggressive optimization
To: xur@google.com
Cc: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Yabin Cui <yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've verified patches 1-4, with the following configuration on X86_64 syste=
ms:

1. autofdo without profile (nothinlto)
2. autofdo with profile (nothinlto)
3. propeller only (noautofdo no thinlto) annotated
4. propeller only optimized (noautofdo nothinlto)

All the kernels boot up successfully.

Thanks,
Han



On Tue, Oct 14, 2025 at 12:12=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> Adds a build config to AutoFDO to assert that the generated profile
> accurately represents the intended workload. This enables Clang to
> perform more aggressive optimizations.
>
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  arch/Kconfig             | 11 +++++++++++
>  scripts/Makefile.autofdo |  3 +++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index ebe08b9186adc..6fdc676cb0fe4 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -886,6 +886,17 @@ config AUTOFDO_CLANG
>
>           If unsure, say N.
>
> +config AUTOFDO_PROFILE_ACCURATE
> +       bool "Assert AutoFDO profile is accurate (EXPERIMENTAL)"
> +       depends on AUTOFDO_CLANG
> +       help
> +         This option asserts that the AutoFDO profile (specified
> +         in CLANG_AUTOFDO_PROFILE) is collected from a representative
> +         workload, allowing the Clang compiler to perform more
> +         aggressive optimizations.
> +
> +         If unsure, say N.
> +
>  config ARCH_SUPPORTS_PROPELLER_CLANG
>         bool
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 5bcfcef273745..36abeae2accdc 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -11,6 +11,9 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +ifdef CONFIG_AUTOFDO_PROFILE_ACCURATE
> +  CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-accurate
> +endif
>  endif
>
>  ifdef CONFIG_LTO_CLANG_THIN
> --
> 2.51.0.788.g6d19910ace-goog
>


--
Han Shen |  Software Engineer |  shenhan@google.com |  Sunnyvale California

