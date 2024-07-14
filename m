Return-Path: <linux-kbuild+bounces-2515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A3930BA0
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 22:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C3811C212C6
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 20:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8705413C905;
	Sun, 14 Jul 2024 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvxxWaFP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60036136E37;
	Sun, 14 Jul 2024 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720989080; cv=none; b=R+tGereLDOHAi1BRwsPFdrrIAq+Y7UGqm4MgIQ8aH1wjRXA87f7l6nP2fXe9D0DPVtC/EmPPJ5UPXyiF0IzKbKaRylKW1ZMOV0selYLSZUkrWtoqbKEiIfPi7tdeuylBJPOWTFWn31T8sald92264uHqRR9YkydCRU3FZ4lFQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720989080; c=relaxed/simple;
	bh=2k4hf/sGLF1cHylKDpqGym+ntK/Xs/bZlBukQvol0C8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ouCPLyGWMQN/0BU3jH5oA8wfk7LvvUxO6+tExkoOpc919Utr08xiiiCh1aNs7sxm2RUFhvTTQIJLNDFIv+l8DKBBXT5fr2JVpJf/9XOC6vOwPDgOy1nkZOrXeSLkjMHCEm0t20TI2UcAGPbPI/6l7fESrEwH2whbu92DeSeVcMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvxxWaFP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0028FC116B1;
	Sun, 14 Jul 2024 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720989080;
	bh=2k4hf/sGLF1cHylKDpqGym+ntK/Xs/bZlBukQvol0C8=;
	h=From:Date:Subject:To:Cc:From;
	b=UvxxWaFPi48mI5N/cOtuU38Pl4kLYkPQFy4GwP/1GChop+oS36x5jQnVq/rc2ul65
	 qyVWVz+nliSZEfOjx0OZWAc0YyWffZ0ekjCzH2sId5RVL4iCuNwlSfMBzpiA41NHRa
	 W9dmDOePrXytEzSUQ/66a1+TRKHKdSN5J7gi+Do/1NfKvkfNbnxIGk9U9EHcyZ2i/A
	 1Wreq7F7ya2H5+HYriGQ38tkPuWU2LyPVfYpqunJgnDtLbzVsr+ernJLjpoAXEKp+G
	 9lYgHe3u0k3XCtVAxFuTqbyuPRPeXq2feGnczWJf5IEOf2DeBvxhYGMJ2seT+S6pv/
	 Y9N9a4z9POeTQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e991fb456so3550024e87.0;
        Sun, 14 Jul 2024 13:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvOq1AES54TIcf9LTP5MFIN8hawo1oPRtG0als5Hbj6RyRfPBSzyV8XFrKVLOQZ/Hs2Yaejj+ouYFVNdWf8jS/A+AhEeBh6ruItZ6/
X-Gm-Message-State: AOJu0YyC7kkPw5GmwuxMhYdzJg+qZu+PKF7Z3GSRRDobZTYMT7WJoAgc
	LkMOar9fhdgZGO2jX2Jpmrg5Q+lGw/mfNar0DljAH3h2NI8csBo4fSC0UoH+RgFQadmqnuCpcgy
	xX/mKcfEzqXEQPXpzIKCu/dCsnkc=
X-Google-Smtp-Source: AGHT+IGgHSBSD22fpNuDFu3XmHHBn/3K8YrSEV4XgO3etQVmJpGi7z0o2OKD9BT087fRBEhNO0M6W7fVvuFLTrWWJ98=
X-Received: by 2002:a05:6512:1304:b0:52c:d7d9:9ba4 with SMTP id
 2adb3069b0e04-52ecb8311a1mr2578889e87.31.1720989078714; Sun, 14 Jul 2024
 13:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 05:30:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARuKOCDqv-V_Y6moUmNVqBmApVJy6yZKosFOp8zW6Vt9w@mail.gmail.com>
Message-ID: <CAK7LNARuKOCDqv-V_Y6moUmNVqBmApVJy6yZKosFOp8zW6Vt9w@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.10(-rc8)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull Kbuild fixes for v6.10.
Thanks.




The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.10-4

for you to fetch changes up to 84679f04ceafd58d9b35f790203520b2930f1a03:

  fortify: fix warnings in fortify tests with KASAN (2024-07-15 04:53:49 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.10 (fourth)

 - Make scripts/ld-version.sh robust against the latest LLD

 - Fix warnings in rpm-pkg with device tree support

 - Fix warnings in fortify tests with KASAN

----------------------------------------------------------------
Jose Ignacio Tornos Martinez (1):
      kbuild: rpm-pkg: avoid the warnings with dtb's listed twice

Masahiro Yamada (1):
      fortify: fix warnings in fortify tests with KASAN

Nathan Chancellor (1):
      kbuild: Make ld-version.sh more robust against version string changes

 lib/Makefile                | 4 ++++
 scripts/ld-version.sh       | 8 +++++---
 scripts/package/kernel.spec | 1 -
 3 files changed, 9 insertions(+), 4 deletions(-)


-- 
Best Regards
Masahiro Yamada

