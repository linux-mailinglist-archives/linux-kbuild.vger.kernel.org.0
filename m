Return-Path: <linux-kbuild+bounces-1780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D98BBFDA
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 10:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33FFD281C00
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 08:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7305EBA45;
	Sun,  5 May 2024 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwJRP0bR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0B1B67F;
	Sun,  5 May 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714898788; cv=none; b=SdTgAM+92Vm40J6HTXwv5Eqw3GnUguMVQIfHr2n3HuCQa8xWx5MiFGueH+jLLAeYe0dsrzTo7eT4pXXk8tyR4O5UlpOUCFPOE7lg4lfxVGcAIA9pLAi6ngiVg5uQDxwwEsdYbrtFchROkH5VDpUXwaLy8VuKaA5Es8TiFAAYsqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714898788; c=relaxed/simple;
	bh=5YmmNGfbg0xZ8zOB/za0EUDay16V2M1y+3r8YN9H4f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrIpBKrccuQpe/Kc44qpSdIgo88Jmxp9kaZolYApOcl6LrRSS0ckmU1Dt7l9Hw97Yy+h36BapRE1jBblkNFsH+ovOj5Q5Ib16L9WbdPDaS0H1KJ9azA70vF5uofLjo83WnztbqDy6XxAppmKoy/iMQDrMTm/EgDrfsY4icIO0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwJRP0bR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BEDC4DDE0;
	Sun,  5 May 2024 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714898787;
	bh=5YmmNGfbg0xZ8zOB/za0EUDay16V2M1y+3r8YN9H4f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BwJRP0bRdEaICL4NJXisJzKbVhgRNWWymzAnQ6MPkGzeNQspp6Bh+FZv+Z/Dexn91
	 nXoRSWnrkoRt71J5Gz+rS4YZDEgNJdpq4O64vj1wnHeERdqszl6n+Yy/lTj8KwSpKB
	 vxstLxi12N8paICUglEhZtUORvQ1EnE9BIlJkgXJUiC5g9sDbuxdQpTQTH+1zDVq1X
	 /0cdLp5fzFUMMxAWZmUncbi4aGZiAXqRgzx8RUor/Z22smhobi1IgNnmpyk3sBbSt7
	 UA4lU1Q6mwEj3MsfOY6nYY8sJp/smnXShlQymasNh92wcsb4CI4ayhzrPQDFsCpDLu
	 qIxlifWwKtSCA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518931f8d23so905672e87.3;
        Sun, 05 May 2024 01:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmYrpPYvlQ37BJ4ntk8NdbcR5ed9iKS+4vQMWCmUJlcqZY/JBSTvjL/+f+pm2c59DHkhe53hDBflrZFmztiTJMYRAUgXcIiQRFuSKKMIapV5bUZKvpgJn4jbTAx5tWhNlOMxBgwdnhYaz6
X-Gm-Message-State: AOJu0YztiOqUq55yF7lpt+EKWxmHG0ayx1WIdopBAnJ0CvsQd5wtr3m9
	F8jOl1W01uA7NIfwWnkOFcT09zR2B4IAviP6g0neHeY6IFr52FRNeFC542mj/4pZ8bjBwXj5hBn
	CqdpkSwCM0PUq1FMxxrDg2IRauPo=
X-Google-Smtp-Source: AGHT+IFgYJGMIyx/Nk7hWsAZya+78Uc/8M3cOFCqp3BcgOPyaz+ZfswbVsLbyE/uUi8RXwOdB9dLaZXTf4nuKCHQKXI=
X-Received: by 2002:a19:8c16:0:b0:51f:4a03:a053 with SMTP id
 o22-20020a198c16000000b0051f4a03a053mr4849843lfd.4.1714898786460; Sun, 05 May
 2024 01:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARXef6Myb_Gd4jyGfwujoBAjmjzLZBzgkm4T1KmfHP0MQ@mail.gmail.com>
 <ZjcRPelwZP34N42s@gmail.com> <ZjcSjk0mXYopAvVS@gmail.com> <ZjcaHRjZDdy/6/rn@gmail.com>
 <Zjc0sJWqfMWFD0/p@gmail.com>
In-Reply-To: <Zjc0sJWqfMWFD0/p@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 5 May 2024 17:45:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRjczOYLYRYS6OTHkMYe8rpHTP_MHzfLUd0r0bfBgJGg@mail.gmail.com>
Message-ID: <CAK7LNASRjczOYLYRYS6OTHkMYe8rpHTP_MHzfLUd0r0bfBgJGg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.9-rc1
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 4:26=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrote=
:
>
>
> * Ingo Molnar <mingo@kernel.org> wrote:
>
> >
> > * Ingo Molnar <mingo@kernel.org> wrote:
> >
> > >
> > > * Ingo Molnar <mingo@kernel.org> wrote:
> > >
> > > > Notes:
> > > >
> > > > - Yes, those weird 'file' and ': No such file or directory' strings=
 are
> > > >   pasted as-is. No idea what it's about, and the build log doesn't =
say.
> > >
> > > Forgot to mention that I also did a KBUILD_VERBOSE=3D2 build - which =
isn't
> > > more verbose for this particular failure:
> >
> > Another update - I reverted the 4 most recent commits to
> > scripts/package/debian/rules:
> >
> >  b8d18fee7aa2 Revert "kbuild: deb-pkg: show verbose log for direct pack=
age builds"
> >  82ac586caf3d Revert "kbuild: deb-pkg: make debian/rules quiet for 'mak=
e deb-pkg'"
> >  0b806eac90d6 Revert "kbuild: deb-pkg: build binary-arch in parallel"
> >  4b16391dc462 Revert "kbuild: deb-pkg: call more misc debhelper command=
s"
> >  f96beb84eff6 kbuild: deb-pkg: call more misc debhelper commands
> >  1d7bae8f8c85 kbuild: deb-pkg: build binary-arch in parallel
> >  caf400c8b68a kbuild: deb-pkg: make debian/rules quiet for 'make deb-pk=
g'
> >  cc3df32c9f3a kbuild: deb-pkg: show verbose log for direct package buil=
ds
> >
> > And this resolved the issue, the debs are built successfully:
>
> Update, the bad commit is:
>
>    1d7bae8f8c85 kbuild: deb-pkg: build binary-arch in parallel
>
> ... and reverting it solves the build bug.
>
> And my Make-fu is weak, I don't see what's wrong with the commit.
>
> Thanks,
>
>         Ingo


"make -j$(nproc) deb-pkg" works fine for me
on Ubuntu 23.10


If you provide the .config, I will test it on my machine.



--=20
Best Regards
Masahiro Yamada

