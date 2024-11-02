Return-Path: <linux-kbuild+bounces-4465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CC59B9DD6
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 09:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 603541F21F11
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 08:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572FC156677;
	Sat,  2 Nov 2024 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1E6LhoQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E32B9A4;
	Sat,  2 Nov 2024 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730534819; cv=none; b=WJYmS5D/GHWYSl0AbN7FxdkrSz8klUCIM9aS75lKyAev7cbkwdKxX30IGcvJ56Y2CXBbrwmdsKLvqxRnfJeLj4HAk44ECXqyGH00duE17DGkCksweQu3D09Liv8Nz5uOwmTmU/Ev1FEP/oR2YTgAkJcttKOKrnGSzcyDR7JJnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730534819; c=relaxed/simple;
	bh=EQSWD7lvEpQpbs2qoliMb65fhqZz0rznKwHKh5bu/aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYh/Jk+gkjrKGFRuZ0yS40KVo8pRrgk46XMM6CyZ8m8bhLHQTHGkNyrCgCjal7ykEf4DD/YZQOqmEz9leKrOH2RvcOXwvmVxn5oJC5gAuS35vLjfN989CX5OCm+VSb1JFWTBPtUiFlfAHIOdoEeKTuejZJdyV5vOjy3O1QAZOkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1E6LhoQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33BCC4CED5;
	Sat,  2 Nov 2024 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730534818;
	bh=EQSWD7lvEpQpbs2qoliMb65fhqZz0rznKwHKh5bu/aI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S1E6LhoQHzSJTvuGfNN9Rl7g23H8Jt1+uPqd1Gkogk4EBSBgPV0u2DV9s4tfWTPa9
	 J2EE3r1wpvSJf+ydKtE70T9Me2hfgZZymWhegDo+u5L+rCm7HCWNaE3fC2VsZbc3UJ
	 5DqsjMB55lzmyvuZeFHHYGj4o35bAXKtn8PUnsUobGTFXke4Jj1nM5YrQnTk9/dO1v
	 DuVZwje6rOdt6R10i3VujReOIt/HeU4jPaPppIFWHJjwjX4opMAEn7nkNeiz47kafQ
	 pnH46cIahM3SFu489pu49KAPkGbQh0zMkNLGTmFfuq+aErxoXidQ6g2pFQQzY+/gaa
	 S3tJCTVl/TwDw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so18618361fa.1;
        Sat, 02 Nov 2024 01:06:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI9278pMZaGP3/K6XzM0I3rc7aGH8Ty7c3KR47vj5HFGUFdbBDHhWf52TOem07bBpGeCB3ULhF23bPGQ==@vger.kernel.org, AJvYcCWcVxXSHQtFbRbQH9e+uyvD+qaYqscWBlOTlK1GA1ULcttd4fRDDxeZpTUiEXJHjmnFkNvjWv0A00hNBpXR@vger.kernel.org, AJvYcCWpexsS650yT81H1xTQ3N7zThuT2FkIQWdAtmsXn0kPsgJzV91pcf/B5SB0OyTHHR/FSqZrLpfybzJot86C@vger.kernel.org, AJvYcCX1CPxSz8go+ILh3kiaz0q/mW7TMIhBNM8Zr/MxAQwC8lYXPadcoUDTHq6Gsm9vS5MLpeoak91LJfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqF6gFQXeqpgKWElb9riAZrpUFZk8ot0lWVnbMTNE57Y7sUPUS
	lMqQIFz6Kn3y6et10TY+h7sA8gaMbPMtlP331TZCq8vfbVRVwky7a5TO8dZNbUjkRVqyViAzoik
	z9pTzgvlMoOnMJijrRZAyBus1POM=
X-Google-Smtp-Source: AGHT+IH6q5K9/EJNsgxEJPWWk35nqde3J7zA5O8Ap/dpF8tEbWkRkE9xz+WKM92SMTQn+tvXWer2w/ywIL/kTxAvlR8=
X-Received: by 2002:a05:651c:210f:b0:2fb:5038:3eb4 with SMTP id
 38308e7fff4ca-2fcbe078dbcmr130312911fa.29.1730534817303; Sat, 02 Nov 2024
 01:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com> <20241029-sparc-cflags-v3-2-b28745a6bd71@protonmail.com>
In-Reply-To: <20241029-sparc-cflags-v3-2-b28745a6bd71@protonmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Nov 2024 17:06:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrn8xQnCYX7aRqGqh+yVvyg4FLS0qJU07k5qjYHbSCFA@mail.gmail.com>
Message-ID: <CAK7LNARrn8xQnCYX7aRqGqh+yVvyg4FLS0qJU07k5qjYHbSCFA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
To: koachan@protonmail.com
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 11:49=E2=80=AFPM Koakuma via B4 Relay
<devnull+koachan.protonmail.com@kernel.org> wrote:
>
> From: Koakuma <koachan@protonmail.com>
>
> clang only supports building 64-bit kernel, so we use the
> sparc64-linux-gnu target.
>
> See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFw=
dB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=
=3D@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b
>
> Signed-off-by: Koakuma <koachan@protonmail.com>


Acked-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada

