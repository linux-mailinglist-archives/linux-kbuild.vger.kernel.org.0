Return-Path: <linux-kbuild+bounces-8653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD94B3ADE8
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 00:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 841BA4E4C61
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9C0299A94;
	Thu, 28 Aug 2025 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tej/EBzO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055423D7EC;
	Thu, 28 Aug 2025 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421760; cv=none; b=d7MlRCSV3Q653Tj04d7L9V4GIalKFKYKxDctrXg3MfU3uUpDEdOE04OoEFlEFlBf1mg+erFR7lCcjErxHasaZK4qVrN3HVFMenZe4b7j2J1jKPgFZ+Z+yt8en2cMBPiJD/nmEE9vWy1D0kj1cKhO4zKCR59D0krkugjCL+54Eio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421760; c=relaxed/simple;
	bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0cvQEuB6oo5ioi1lsZv9M1I3YvBXHmvvsDDOMjLs3cpIKG7t5DQhasl6NI3xn2bVTV2XL/K2NAEZLAbwlAaAdI8LG0qsOhECzvAEyAFeSyFY1dFd9POG2F5IkX/qZ3Me8ATj9hOXIbilFznVMA8N50edUkG2hZoKrPimsqQ4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tej/EBzO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so254604a91.3;
        Thu, 28 Aug 2025 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421759; x=1757026559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=Tej/EBzOliqsk7nR42+XTTduX0oXuXi2rVB/Vqxv5GJvTOwxrrOSeDMUbcMzzu7FqB
         Xea/k2PZAZryLXQknK+lrN02xCT2k/nJlssnZNyTCe6TQNkktWxXvDqz3nqnBoxCD5fM
         c+fP23KeX2O17fDK0PdnmP5+hxjcKxAf8qXJMd4sOoBMK5v1VR6EZ33PrJd/i3I0oDKU
         YRa3JVW2SR6tK8P3MRAKmpOaQpzTkx5F/Yik+rDzP0ua9OG0WDMSpqqcgvCii+z2xRvR
         uer60VGTHNgxViCZyBts6BeS+vebsU/XEZqPMOPQo5Dn0zjwCWd8j6/anNMQHipf+jSJ
         m+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421759; x=1757026559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=XkhGuEm4mxpZAnr0370osWRCOsOa8Fim/81hfVSyyjJ0odAdwY1JKSk/orHC67epI2
         qQQktPBxTA7QASqgB+d3+b3bJayex5VQovWiknNko64/XmEB5C8+8744hbq+kCu7nogD
         31zaNvZlbclBsXBtIELvAsTeOdzIXVjGKwgJhurRfx3SKB9qJzA+SU6kVI1DyZnKLrND
         4nijooDjIwUW8+vgPIW4ZmNPSqDMy73pDrfFd3Nto4uc5VGEvVqdMtM0BkDezZiC8XE6
         Oi889OHsB2nNeCzOfKAFGV4UhHxyu3PiZ1SX7PR/6HP6SOBB5e5FpVfQWz30Kc+4E4TY
         2TVA==
X-Forwarded-Encrypted: i=1; AJvYcCV4bEhRau4r1r4A5mL4ip6jqPeKItcXiqSRU/dYcqtvBBCdw+lNF+ZBl2mWiUUusUuix8+U+bYTymc=@vger.kernel.org, AJvYcCVCj8jqhCrdDXbubiEka4NJ630YFemj38uQUiwg7JIf5LR8UMBY/Hafsg89kgyAseMWwQ46tvU/M+1JDZpZsQpL@vger.kernel.org, AJvYcCW5b7i6pu9JBoO9+GVcWvd4b7gd/dwBZ3VjKtjC16k8LvtR+qHKxIZy8LCwYGYLjtJ8agopnjfMpdaehCVJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9fuUnj88w8UQFQXUU63U5rP4FNh0mhfbzkwaQ69Yiv72bvLrc
	Sc1wCY7czGfKh7j9xPqmOfMJENUdR+VCxiCUBPHos8Y4q5NI2KEtb8UTmzsi/cSgh2EmVfB0+OX
	m/9BVRHvtZnep4nZ5ug66uZH0FZXpZuY=
X-Gm-Gg: ASbGncu06Kxnzf4A4SOXSHRvvSX/W1ZRXWRLbMZY7HDKG+tS7uIMATPeAj/s5w88K0e
	0yWhgv2Inc3X+xYhSyIG64FJg9G9qCtF8gBETMqXsSQ2u50XwSBYDDP2jCGiQzKNwzlcXPsCtR0
	0TDwL6rxEQ+Ou0XUk2IZhe6fb1HCHJ2F50QUkKALwW3/ER1MTrfqfyip1Zp2ZtFkD8cuLPDImoj
	4/pW/bNv2wr89l8S6ymUH11QcUZjZICX0tQr8q+oufKV4eEZd6h6B20jrxdjRpqrJ+k6AivXP3d
	Ga6wjQqD3W/+Vv5aqv8NhvhCQQ==
X-Google-Smtp-Source: AGHT+IGyhiVQPmqOT0rpkocxIF4+MoNVf9DAEsmChvxF7JPD+Cb6PcP1MNWLZ1lQ4jj5g+ohcbCqTNY4bA0OxcF+1AI=
X-Received: by 2002:a17:903:22c8:b0:246:a93c:aa0d with SMTP id
 d9443c01a7336-246a93cacc7mr149453825ad.11.1756421758714; Thu, 28 Aug 2025
 15:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
 <20250828201915.GA219815@ax162> <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
In-Reply-To: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:55:46 +0200
X-Gm-Features: Ac12FXxNeQ4YfImZMukInEZi5M8BoR7IH_90HG8_feBBu1eJLxGu0KIOUkXPLIY
Message-ID: <CANiq72=1XKdy6VrAPE7xH65nadFzmrBBJWsLw5tYmxNJqFbnYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@outflux.net>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:32=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Oh! Keep CFI_CLANG the visible option? Will the later rename work right? =
I'll give it a try.

Yeah -- whenever we want, we can move everything to the CFI one, and
hopefully many users that enabled it will not see the prompt since
they will already have the value there already.

Kconfig doesn't save the unset value in this case, so some users will
still see the prompt. Which I guess is good for the GCC users, since
for them it is a new possibility after all, that they should consider.

I didn't really test it thoroughly though. Caveat emptor and all that...

Cheers,
Miguel

