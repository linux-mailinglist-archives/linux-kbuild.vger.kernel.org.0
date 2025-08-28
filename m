Return-Path: <linux-kbuild+bounces-8640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA27B39C4F
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 14:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F8B466095
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 12:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F6317B425;
	Thu, 28 Aug 2025 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNgl824L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13530F936
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Aug 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382937; cv=none; b=SMX4ejjtfzy5RJ/T48PiAAEESb6SHIdGuMRjJpQhF7PAcqeXmUQr43rH5N4Ue0CLvbOjjJHWUsFWeWU8yMzMkD7R7GR/63wWwRp44xXsD9ReYfwcha0w8mIe+z1rf6NJg2UsaFEhWFBBcIAARJqRTbrwcGqibaivat3CAiPNPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382937; c=relaxed/simple;
	bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P218KRu6YfkHNlbz7KMUDZbIsERlAy7vJaZa0Qush/Dhfjsndbo7N/rGhrvRO1sUdjek2Zn4M6xWpN2kMX2NQQ/dxPsFiMV7O2A1tM90raLpaNOd6vapgfM1Ze20NKa80hxWTQZBlPc0isPs5ITXLkAZz/SwqhAejr30RU+U6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNgl824L; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f48d61ea2so1158499e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Aug 2025 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756382933; x=1756987733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=oNgl824L+fC2moaJSL5/4UkdvCTWCcmZGxmMXiFhw15Nk4MO1i+znJi5GoZmPkjPdH
         vV+qsgN4MHSjVwuL05hPonCM+KCuc3ltbN+pE0w3GTgSyAbUEipqSGvqelFmc4lmI5WK
         gqxPx1T+vhr1w4hYkPiMIJ441sO3Fryo/L8pmtvDSBUbqIEcNRO72GZqtLzbuWMeKjMY
         yOabpuU2TqX7Bi31pvfjDby/oCTRGhVnKhITNdAylRHg7IGLa1oknJAvglS5yZbMz8e4
         i/z1vNqo6asC05PbHeW4Hi2209ndvK4hBH+S8lI3JA1vTbXV44oJe4r9G6T0tw73dQDh
         qfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382933; x=1756987733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=qzeVCijuzogK8dvscwCJ1+GLTaonafCUWgLA/4vsF9GANvslJz6eLg+9FPkPBk4t6p
         aq2sgodfHx38rxqf9b5ZjmWbKSrZACrlYxRpNlEs6BYeVRRbivX/dxuZvOOAXj96uWdI
         hvelzkWTqFvQ1q0hI9mE9fNc+uYMRAFOU7DE4FgIqOfJUjhdvNwa9hEp8+CgsETQPtl6
         iPauroGufwEH0Fi7xsf2au6xut2Tb32KGsxBYquIC7Gfh6+hTPPDKx5Y3DYrZY0jiBXs
         Ix4I0323tcuGKfQt1f/B/wqUdjJ/6BXIxcvM+HLuIFXE4QcysD9Q6hVrLmv4fVh6v/1v
         whfg==
X-Forwarded-Encrypted: i=1; AJvYcCVJsH1vzu939OM82P9nCpzEQKkBGVkGjpk3qlGrK32x+NcDNeOFeB1KCl8HH3COT3A0EGFx9zEFzuirCyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDywoqFFsAsZ950M+i908Q81LOBhs035wbvTSsYsm5VZ4P39eo
	XVzHfsVif+IExVrnreQH578LNWeH1QXNSnEdm8h0KXPIpX9lbqEDDnuP23zp5ICgaSHO9gWoDO8
	RGv4ycgS/0jZj2fvz23DUmYtB/WHbl1sl17Q9jpsgng==
X-Gm-Gg: ASbGncvbK6FmE4+COp0LpWcygWC9tSGJDb5mBVp/ioukRgc6HaWD++cVYR+4RPFYWPK
	Xqs4VSKdpdpX/YDDtH8H95JZ9axXQp2/qIefjvrGWgUWMwkvXQnB+MnsTXYJL5nbyEKOSEtW72J
	ukmZgp+knx9WxRh8Zc7Hyc63fK3GX5vKvsHj1woffilPuMsIcbcHMQo/w9y2sX6ckzEl0jlwQik
	U5bjyNnXKlundQJ6A==
X-Google-Smtp-Source: AGHT+IFg3M1giQrPALPiOG52C1JhN5PlRo7Xbw3xLek1Xu/lN9fGos88k4kc0ylKwurf0xKqLRcKUK5Mrc5xQ4s7/mM=
X-Received: by 2002:a05:6512:6509:b0:55f:53bd:b137 with SMTP id
 2adb3069b0e04-55f53bdb50bmr2129835e87.31.1756382933088; Thu, 28 Aug 2025
 05:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 14:08:42 +0200
X-Gm-Features: Ac12FXys7kn8v1WW0NYPHPp9t-_9fYAtRAX-1QlGxBAnqlbjxr2PgRu8yVVv_Ow
Message-ID: <CACRpkdYnM98n3JLBwVnVD3BRf4qrg4g9aBDqL_2Qb_cao6f5yA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 4:26=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees@outflux.net>
>
> The kernel's CFI implementation uses the KCFI ABI specifically, and is
> not strictly tied to a particular compiler. In preparation for GCC
> supporting KCFI[1], rename CONFIG_CFI_CLANG to CONFIG_CFI (along with
> associated options).
>
> Link: https://lore.kernel.org/linux-hardening/20250821064202.work.893-kee=
s@kernel.org [1]
> Signed-off-by: Kees Cook <kees@outflux.net>
> ---
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Puranjay Mohan <puranjay@kernel.org>

Yeah that was not a good neutral name to begin with.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I don't know about all that fuzz with providing the old symbol.
Seems complex. Folks anyway have to go over their config
symbols with every new kernel. But if people insist. I'm fine
either way.

Yours,
Linus Walleij

