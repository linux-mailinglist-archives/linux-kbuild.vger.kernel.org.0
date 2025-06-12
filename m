Return-Path: <linux-kbuild+bounces-7480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA277AD76DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 17:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA363BC184
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7EF298999;
	Thu, 12 Jun 2025 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V10LlDub"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957DB1A265E;
	Thu, 12 Jun 2025 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742785; cv=none; b=PtfCBOKM/vsyq0AHQrIXrhpjVcgFDv28aLBLdT44itnWtLjYfj4FktM2vak4C2gdK3Aho/rgTsQU01O0+3/x7i8SwcaNTJo1BOanoZoAjScXfuXSKAc368ME1mQSw/xRQHgXnu+l8UhqK0FbIDjHWq9QYXVrMvzawPfjaKGKeUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742785; c=relaxed/simple;
	bh=kql/68pdZM78tfHESpUFtGAG253otQkry8EKhBsHpQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFhESgFB0rrG4MPq/+ll5u+zMd5jQjwaCFFgofOlxwa4kXGKggK65//a+9YyxSE4dltIsFtN+KhfQuhkRnBMRXp6GpPJmV1/si2wkpwdF7Ppb6m4vYXqBxsLv2H/fBAm2D/Dg4Ufpc+faXQrUm2obrzG/h4V06JNl8nZIg7vNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V10LlDub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183CAC4CEEA;
	Thu, 12 Jun 2025 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742785;
	bh=kql/68pdZM78tfHESpUFtGAG253otQkry8EKhBsHpQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V10LlDub+VHqlA5ixOqtYjEnEMX0oLZoITvIBMJKwrUTQBiOnGJJIkfHy9d7WXD+u
	 57JrjqMBuhe6az73OLfIvzzWL04vXyC0vhxmcjri86AA+pBZdrct3yE9Sdv9doT4Ba
	 stDpdJS1V8W9EKceuG4g8pPbSKFnScf8W0RZpqpKtBGXJ0oYRIs9mBh66vQaOkA5XT
	 OzkBwU1yEhMfxdaPWGhiBI8cupBC79gQq6dKOHMJwPi3WzGD83Qz74V83r3WHSosmP
	 87qeQbY/Cl987QkI8XzbFzjfUctOnQyPlbEGYHx8kCOVsYkItH3IYBDTCFuorLZRF6
	 GDjf05tupfbxg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1059483e87.0;
        Thu, 12 Jun 2025 08:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTnRuGJlIwHt4SGr5zCYR1pQuuHkAKvPH7OL/zDCm2AgKDouG/7de96CVzvnGNAne8Q9qec99JXDBmTALp@vger.kernel.org, AJvYcCWT3G2k6m3+E50QKdy9uOpskvUbhWJ2f9R+MWUP0qZvPOkp+uvLPhF2f0QcQHv02Cx5K6YNyLnA1qG/kHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69eDiHpjXJczvnOyOAhBBdHyhxRUY78guebg3JqYrpEvyVmDe
	ENGfaCg4kghIHoJSbA1n5zLozcc+PJC30hoonvYOaOtd2IlFzvdY5SlgrPbgYUAqZv7EemnIlgX
	EbqPoMXcWVJwE55bvmyJI7BX+pRe+U44=
X-Google-Smtp-Source: AGHT+IFCn4cy8C3+uiWTpUl/bd4P8YsEsu+4izukKFuLL6PKg/Lb5ciTZY8OYnsP8L0vp4VZAkEInbX/v51sLL36k8M=
X-Received: by 2002:a05:6512:4025:b0:553:2f50:5dff with SMTP id
 2adb3069b0e04-553a5599d7fmr1294722e87.17.1749742783743; Thu, 12 Jun 2025
 08:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com> <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
 <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com> <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
 <38a08452-4db2-43e0-afdc-b7d696da5454@app.fastmail.com>
In-Reply-To: <38a08452-4db2-43e0-afdc-b7d696da5454@app.fastmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 Jun 2025 00:39:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzWWrQQb3C5hXQ91GED6-7A3eG8WzeFDvcqQeA15hZrA@mail.gmail.com>
X-Gm-Features: AX0GCFuubVFMo5O9hAdzt9MUjZOnvHvlasTNzdZAHWJ9mz6H1COFBdQ9RnKyH9A
Message-ID: <CAK7LNARzWWrQQb3C5hXQ91GED6-7A3eG8WzeFDvcqQeA15hZrA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
To: Arnd Bergmann <arnd@arndb.de>
Cc: Heiko Carstens <hca@linux.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 5:01=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Jun 12, 2025, at 03:42, Masahiro Yamada wrote:
> > On Wed, Jun 11, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >> On Wed, Jun 11, 2025, at 15:32, Masahiro Yamada wrote:
> >> > On Wed, Jun 11, 2025 at 4:55=E2=80=AFPM Heiko Carstens <hca@linux.ib=
m.com> wrote:
> >> I think this makes sense in general, but the output here is
> >> excessive if it leads to users no longer wanting to enable W=3D1.
> >>
> >> There are other warnings that I think should be enabled at the
> >> W=3D1 level (e.g. -Wformat-security) and eventually by default,
> >> but that are still too noisy at that level.
> >>
> >> My own cutoff would be at a few hundred warnings in allmodconfig
> >> builds if there is an effort to reduce it further, but it seems
> >> that this one is still at a few thousand, which does not seem ok.
> >
> > Then, what to do?  Downgrade to W=3D2?
> >
> > I think nobody cares about W=3D2 builds,
>
> I think the first step would be mass-cleanup patches to get
> the initial numbers down. A lot of this can be scripted.
>
> > and the problem of all C files including <linux/export.h>
> > would remain forever.
>
> I'm missing a bit of background here, and I don't see this
> explained in the 5b20755b7780 ("init: move THIS_MODULE
> from <linux/export.h> to <linux/init.h>") changelog text
> either

I explained in 5b20755b7780 and also in the comment lines
in scripts/misc-check.


<linux/module.h> is included by modular (i.e. tristate) code,
which is symbol _consumers_.

<linux/export.h> is included by symbol _providers_.

These are independent, or in other words, orthogonal.

Therefore, there is no reason for <linux/module.h>
to include <linux/export.h>.

It is standard to split consumers and providers,
since they are included by different files.
See <linux/clk.h> vs <linux/clk-providers.h> as another example.





> What is the purpose of cleaning the linux/export.h inclusions,
> and what makes this one more important than others?
> I obviously understand that indirect header inclusions are
> a giant mess and that any such cleanup helps, but linux/export.h
> seems particularly small compared to many others. It was
> originally introduced so a lot of files would no longer have
> to pull in linux/module.h if they only care about using
> EXPORT_SYMBOL() and THIS_MODULE, so linux/module.h could
> eventually become private to kernel/module/*.c.

I believe <linux/module.h> will remain, as modules must
define MODULE_LICENSE().


> Is this something you are trying to continue, or are you
> doing something else here?
>
> FWIW, I compared the preprocessed sizes of linux/export.h
> (~2000) and linux/module.h (~120,000), and it seems that almost
> none of those are needed by most of the files including
> linux/module.h. The one part that is commonly required is
> MODULE_{INFO,AUTHOR,LICENSE,DESCRIPTION}, so maybe there would
> be a chance to clean this up at the same time if you are
> planning some large-scale reshuffling of #include statements
> around export.h.
>
>      Arnd

Split <linux/module.h> into public and private is good,
but it is beyond the scope of this work.

Regardless of the file size, if a file does not need to
include <linux/export.h>, the open syscall can be avoided.
80 % of *.c files do not need to include it.



--=20
Best Regards
Masahiro Yamada

