Return-Path: <linux-kbuild+bounces-4311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594929AE3D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 13:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D164D1F23485
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 11:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69F21CF295;
	Thu, 24 Oct 2024 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoAH7Hfv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58F1C7608;
	Thu, 24 Oct 2024 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769365; cv=none; b=K7vCZctJUqwd8o7uHZpZ5UYDZxolwOec9xRW89MbHOvxtTkF3Rxd2+m1nhxIkh4XobAEBB+8auZ42pdExvfyariL3FWoN8eESPbwxwfnOQBIxfFulNO9N2gc/mlujn1MCPcHSziwzG2aNy/rACqRdbFOAnypBK0QBz3LbXRZ1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769365; c=relaxed/simple;
	bh=09iyS3Am2CLKoJ4+v/D5NvsoJELuY/8hYHzxnEmA0Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPtkQi83uPswzCvKKwO+WPsC7pmBWrVrk3It8py6RGz21h4KkfQppkptROf5AbOmLBo8ffoYii8EvaPSOFaukxOTFXPLFwzoVe3ZvvZMUdF+A3DKdxBrMu1XXNULqJ2cVckdT/6YI1FVd/EOowFlae9d0x44p5k7P49csLrirQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoAH7Hfv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2634C4CEE6;
	Thu, 24 Oct 2024 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729769365;
	bh=09iyS3Am2CLKoJ4+v/D5NvsoJELuY/8hYHzxnEmA0Fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IoAH7HfvLqroBP9/+GNu2yaEvjAIbfCll1CA9SAzRL6PWJCDhOddmGs7QQP6wMsZ5
	 ++yQab8Jfy8gJntNL8aG7BBshBFT2yOkwfbl7G3X1MhQCDdHozjnJSH/eMkAUaJSM5
	 xWWQuXXIq4n47+hUC8f7MsKzUNcOa9wxs2l30rnbQSKJUJPG3YeCmJS/MlCUuVjWDA
	 08aqekJYidwK19ECQZ7jBLtt53IqKKpcH95i5owAwHGXA3c0p1TTOOfxEnFAovzHzH
	 BP5xAA35piN0Di9GDVEy3jfzFDCtu3y/pMap9cChMFc/iHpEDxnVaVpvMGuHFUNn5d
	 EYwECGNvCtRbA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539fe02c386so1915641e87.0;
        Thu, 24 Oct 2024 04:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZJbuLm2r0m5HwBqLum3VO2Pj1TUvsMSr5aFlXzGmF2yMYEm67FwiSG70ZNPFaL9aOJdU1vLGFKtWY9S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJTYd338AFw06I11GcJLmYRScCvCSa2zJnb9aKKLJfpqfgWwR
	LB+l8E32rKp3GEj0Lxrn2kJvl9RWl5qXvsVswZiEGfLc0q5zg2T/Lz/mobfHeeFtKTN6hsJHrFk
	dq9ebD3wiOZmnpxG+bRqQ4//JN7g=
X-Google-Smtp-Source: AGHT+IHInXnw87oUmuOp8ImHlL5G45Tec3f2pd4+fnGxG6ua2EZkgEDjuvSQSAt1L5qPFC9/ktN+bw4RyyJTrhP9nBM=
X-Received: by 2002:a05:6512:3051:b0:53a:38:7b70 with SMTP id
 2adb3069b0e04-53b236da75amr611772e87.8.1729769363570; Thu, 24 Oct 2024
 04:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <8441512.T7Z3S40VBb@devpool47.emlix.com>
 <CAK7LNASdLT-KQA7+Vn+Y2ZJeropcR-sjmv8p2=DCgzCyQdJAEw@mail.gmail.com>
In-Reply-To: <CAK7LNASdLT-KQA7+Vn+Y2ZJeropcR-sjmv8p2=DCgzCyQdJAEw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 20:28:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDULT=1CcVSEx=CCXwZfTizy3c1sM7Y16SHs=2p7-QjA@mail.gmail.com>
Message-ID: <CAK7LNATDULT=1CcVSEx=CCXwZfTizy3c1sM7Y16SHs=2p7-QjA@mail.gmail.com>
Subject: Re: [PATCH 4/7] kconfig: qconf: use QCommandLineParser
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 1:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Oct 23, 2024 at 3:33=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wro=
te:
> >
> > This has a much nicer output without manual processing. It also adds wi=
ndow
> > management options from Qt for free.
> >
> > Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> > ---
>
> The help message looks as follows:
>
>
> $ ./scripts/kconfig/qconf --help
> QSocketNotifier: Can only be used with threads started with QThread
> Usage: ./scripts/kconfig/qconf [options] Kconfig
>
> Options:
>   -s          silent
>   -h, --help  Displays help on commandline options.
>   --help-all  Displays help including Qt specific options.
>
> Arguments:
>   file        config file to open


"config file" is a bit confusing.  (it sounds like ".config").

The positional argument specifies the top-level Kconfig.

I added this to the help of scripts/kconfig/conf:

https://lore.kernel.org/linux-kbuild/20241024112548.1438155-1-masahiroy@ker=
nel.org/T/#u






Best Regards

Masahiro Yamada

