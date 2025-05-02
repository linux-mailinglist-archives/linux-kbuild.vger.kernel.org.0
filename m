Return-Path: <linux-kbuild+bounces-6853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36632AA686A
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 03:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2A311B6775A
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B96143748;
	Fri,  2 May 2025 01:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AhZwUoiH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE17E105
	for <linux-kbuild@vger.kernel.org>; Fri,  2 May 2025 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149721; cv=none; b=C1h7kDEs3j+l3zHVFADsNxBINZQFE7WPmcSAPr7MUiHesCftk7j+o+9f727VjVDlL24zk5FCY0ZGQ44+YzqUgvKLLdYVlGwwphsO/t+BWMu4q3vUHzF0omFOn1qb/g34+jkBuKIFnVUfHmqnt3iKOcARKB28fYIHnuHem4S9B7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149721; c=relaxed/simple;
	bh=0As8xmw9EhCI8l9UThvyG5mZVKiCmUiyNh+yysJrxBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxHup0ofRXXXcu6IpqsEyfusx/gD3888g1nwdhEs1Rkltt1OaSuXL52x3YEj/4ng5LIT1o089ebQ6MiuvH7OYntU4r/AGP/mRhp4P6yMP+B9XN/3u03Wf2Ss2RE7mbCS4l0xYvTgeszYV+/H17lcKhurt4boIHuC+wBZ5+jDiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AhZwUoiH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso2187160a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2025 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746149717; x=1746754517; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97MRcwlNgiaSiCPIOhEJ8niynAiuZuA+VUyMszsZ0b0=;
        b=AhZwUoiHOLN8377pyApNgOv4cJfVTg3bznoX+gvO7koPQrapAblFY8nhylMNRuBD20
         F0pmAG7WYLQdRAQUnZEqUZoA0IVQK7DQmNpTfuVdlJpkxo+3CZMPNiqcadiiDLalzqU+
         O2ADNQCzvPM0WkGxC4qtQWDKqnMEI8+Y0agSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746149717; x=1746754517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97MRcwlNgiaSiCPIOhEJ8niynAiuZuA+VUyMszsZ0b0=;
        b=NVSRq3Po08EoryWefWs3uljApbZi0vXG/OMGPnOsQJsBjUzEKDIZhq/yh2obirGXWL
         v0y9mk/+QrxFwxVF8MeEpoHg28jo9sLo99uQ3/Hqnpjo4MPZlbp7hhx5lQE/riLeFsuZ
         h69fcGYUrUguz68oR3GdDziCSeV3KwRCLXvOUUOuzRyHtC3MKIMbsIa8zwWCb+JPmKAd
         ACtS0YjfC2qgbYGu6r6H1l+WbFnqBtJtGO0tKqqLppmsmQHYeQqM8L9fYaVdZKb0/TST
         j4X61xSrEc0man8g/vjBw7aSH08QquXPAwj7/SUqkAboSO8G7uR/2YNKkTjv1q725X2u
         sn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXf7XfbVuACLyBTFt/aLLrcbjGqjvJkRYmkeckfqOHzLgWGvXkx0vr7s+Fhe9KIAJ8hLSuehxAwNZzjYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0E5miI7TZoSm4UhwZWYsMPLvxWXoib9IFDJCfE8Ctu2PejrZg
	4yeCBIwQU8rFGQPrHkSl/ZLR1cTmsPXYKPHEePUjjMAv6qF+xC6rBzIsmvY7FiHxOAsX5NMjFB6
	cIJ8=
X-Gm-Gg: ASbGnctIF6Sd6l4JYqgjENipuRTsEgTUCdpxLgLLV8uDWitJXMk4IL1cskLUwghlutU
	7Cep3SmqgZgjg9xkLEIgsl7O0PBuOf803pQn86jILI86DDZ9ps0WjOEDyPSfZC6zrmt9gLLtto1
	t5sK/X09Wxj9pLU9n6AQBu6X26x5ruw9ww9DAc9SkyCMFY9BENvwBoM4gxuWH9ZX/tttpICnPbs
	aBSgEjKBy5TJgG+lwslk4XhVma42IXLbdOjC0xzoZ9wrtw/VVV7ek5Z/HsUHKDhvCTOoczon2Ik
	/fp1kPNX5wXmaVs/O5UCakiCDjGdeTK1Sx8Ex1JHIqit0PCC56XvDqykXGR+3VmrvA7cJZ/aK9m
	LFT0JxOMdgAjQ8sg=
X-Google-Smtp-Source: AGHT+IF9fKv1BAMydPBvMDK9CXHEUllmzF+Iz5br3wpSW2FQqWDILRjzsTlk+kfyrMsCNVYJb4BLOg==
X-Received: by 2002:a05:6402:2744:b0:5f6:c5e3:fa8e with SMTP id 4fb4d7f45d1cf-5fa77fde9b4mr625844a12.6.1746149716844;
        Thu, 01 May 2025 18:35:16 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c5729sm423549a12.17.2025.05.01.18.35.14
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 18:35:15 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso2295525a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2025 18:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrlbbjHU6xP3R8te2u/Ui8UqZPtDapf2cN9EU9dysa5utwTY3wYhrU2ez9+Vy59KZhIdF4aw1l08afOfE=@vger.kernel.org
X-Received: by 2002:a05:6402:3806:b0:5f4:35c4:a935 with SMTP id
 4fb4d7f45d1cf-5fa788ade3emr571279a12.21.1746149713941; Thu, 01 May 2025
 18:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com> <20250502012449.GA1744689@ax162>
In-Reply-To: <20250502012449.GA1744689@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 18:34:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif4eOpn3YaUXMKUhSrF1t-2ABasBiBRXR2Mxm059yXqQ@mail.gmail.com>
X-Gm-Features: ATxdqUH6AO9B4IM6TzOpfLne5kIG1EGNzVEfwRIWeNnmYRyNorzVe6ZE38sDwtI
Message-ID: <CAHk-=wif4eOpn3YaUXMKUhSrF1t-2ABasBiBRXR2Mxm059yXqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 18:24, Nathan Chancellor <nathan@kernel.org> wrote:
>
> but '= {0}' appears to work: https://godbolt.org/z/x7eae5vex
>
> If using that instead upsets sparse still, then I can just abandon this
> change and update the other patch to disable -Wdefault-const-init-unsafe
> altogether (

The "= { 0 }" form makes sparse unhappy for a different reason:

       void *a = { 0 };

makes sparse (correctly) complain about the use of '0' for 'NULL'.

    warning: Using plain integer as NULL pointer

and gcc has also finally adopted that warning for braindamage:

    warning: zero as null pointer constant [-Wzero-as-null-pointer-constant]

although it's not on by default (and apparently we've never enabled it
for the kernel - although we really should).

sparse has complained about this since day one, because I personally
find the "plain 0 as NULL" to be a complete BS mistake in the language
(that came from avoiding a keyword, not from some "design" reason),
and while it took C++ people three decades to figure that out, in the
end they did indeed figure it out.

In case anybody wonders why '0' is so broken for NULL, think stdarg.

But also think "Christ people, it's fundamental type safety!!%^%!!"

           Linus

