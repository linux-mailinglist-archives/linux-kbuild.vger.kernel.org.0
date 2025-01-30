Return-Path: <linux-kbuild+bounces-5569-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B783A228EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 07:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B451669B7
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 06:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B3A1494CC;
	Thu, 30 Jan 2025 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTEK8HWU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08A148832
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738219138; cv=none; b=ZsdH+aRCBu3Avu1Gl9ZXR8SjLaHshP59Y++nlgGk0HQ4a75TsK9loe5fzeCmv2uBr+gcOrl2S2fvuRvT324X+XGIDXK/uSKYcppP0Vy0S4UqA8ahtrop0/knCX5EzpZ61EpPaVpSGWL3YMXJGr8eYpCWPIzROUn8365SHKPWNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738219138; c=relaxed/simple;
	bh=nLeALQbAkOTDaPhrCicqflozbPAPYp6bd+KFb0DBUtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+8W7/ciR47C1IGjBJyxbF763uGekvART3foQKRNXAzoI9xPI43sNI1l02esYqFPW5x2kw2GIWeKGFTpKrZy77dY6Ge+J0xuTvjl/uA1JkVdN5spTU7JFtyrS8ei6HXqZMzXgxum12O61DVUQf2f7trcN7u5XdetV6+BNNO7GvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTEK8HWU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62449C4CEE0
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 06:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738219137;
	bh=nLeALQbAkOTDaPhrCicqflozbPAPYp6bd+KFb0DBUtM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HTEK8HWU0JluPphoDNmSjtXAvuugk+D8/9+S1MIcOAEFhjnWQwzYFy4WneLXE4TIn
	 NdWOIGPo3OvlWsSn/SAM2PrJQmoJ+biEqJzSOcPgBydU51HsBWzkoaE7bUNHIdU0LO
	 pM7ZO7gKpA0lgm1qhFlNQxcdtVuYcXIz+B6ZanoWjA07KQS4drYaLWlJZecEg4B0lT
	 dG3GWufUBWEUTlYD3r5NKgDup67J7Ng3hLzskHehItixUR8Y48FdVPDuT/yKN1zL+o
	 gKMoKOEX/DRvLYpHYUTV9WhkFi7xglpVbMj4r/mNiZSheuN23H1Ah7SCHkpqd3kb4p
	 +Er2y9vyEG6uw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c52000fso359680e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jan 2025 22:38:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0HX5FVKNu7ZV8oF7kUVJCAmGDtwnxXiZ8F34ywUwEHpfY9t5JPCwToh4laHHIuadFB3Ni8cpbwFQX3S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YztOX5MGfvyfRhc1AriTP1/92S9x9QWiFjqkenisMFbAP56EvEC
	XRmyTcVlTss4XWUc4VarQ8Bmz4Xn+H/5Tbsk0+pEmxL7KZhOoc1RLk/qrMaphZUzCWowC0+IAIH
	xX4P8vJPViaieeAvgt4akibN719Y=
X-Google-Smtp-Source: AGHT+IEus8rD1SUMbPDgFzNYV4Fd2np6+a+6bs2jr8ZJq/d+Wd8fy3pOavwzhLQqHrC8uH4/TtHdgMz3MjdccAb91BI=
X-Received: by 2002:ac2:46ef:0:b0:543:c3d9:418d with SMTP id
 2adb3069b0e04-543e4be9663mr1758495e87.22.1738219135988; Wed, 29 Jan 2025
 22:38:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123110951.370759-2-u.kleine-koenig@baylibre.com> <Z5JlTd-qCif4a5W2@smile.fi.intel.com>
In-Reply-To: <Z5JlTd-qCif4a5W2@smile.fi.intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 Jan 2025 15:38:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQP8jkak1WkNc_Rh9_tH69GAqoi=jEJiSX6Y78HQ44s5A@mail.gmail.com>
X-Gm-Features: AWEUYZlqV-v1hSV3z8P-9H0H_XIqqUPk42uldKE2aADnjiFpvQA1d8Ino69wSH0
Message-ID: <CAK7LNAQP8jkak1WkNc_Rh9_tH69GAqoi=jEJiSX6Y78HQ44s5A@mail.gmail.com>
Subject: Re: [PATCH] modpost: Warn about unused module namespace imports
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 12:50=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jan 23, 2025 at 12:09:50PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > Symbols can be exported in namespaces and to make use of such symbols,
> > the namespace has to be explicitly imported. Importing a namespace
> > without actually using one of its symbols is likely a mistake.
> >
> > There are a few offenders for an x86_64 allmodconfig build, so the
> > warning is (for now) only enabled for W=3D1 builds.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >
> > one of the offenders is drivers/pwm/pwm-raspberrypi-poe.c (
> >
> >       WARNING: modpost: module pwm-raspberrypi-poe imports namespace PW=
M, but doesn't use it.
> >
> > ). The issue there is that on x86_64 CONFIG_RASPBERRYPI_FIRMWARE is
> > always disabled and so devm_rpi_firmware_get() returns always NULL whic=
h
> > makes raspberrypi_pwm_probe return an error before the pwm functions ar=
e
> > used. So the compiler optimizes out all references to pwm functions and
> > the warning triggers. I didn't look into the other problems to check if
> > these are similar half-false positives.
> >
> > Still I think this is a useful check?
>
> This will require to add a number of ugly ifdeffery to the kernel code li=
ke
>
> MODULE_FOO();
> #if ...
> MODULE_IMPORT_NS();
> #endif
>
> I am definitely not okay with that.


+1




--=20
Best Regards
Masahiro Yamada

