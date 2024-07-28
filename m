Return-Path: <linux-kbuild+bounces-2699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3593E8F6
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 21:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1AAD1F2151D
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 19:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D354BD8;
	Sun, 28 Jul 2024 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfSLpVfl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370912AD29;
	Sun, 28 Jul 2024 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722193348; cv=none; b=Qz8jXQCV9lExmhr7wXe6Tn25Lbeih29LZn7RhxT5dYBvqhs9wv0Ei7IGSNp32LUKB2YSWeWN9DDANGSE9Zkpi29GbfmOpN18QvWoM0bmBszG1zOlX+30kJKpek5kZJalH73NJ4W91/ZLujddV/pjuLA0oAHDCl7h7pTolTe8iQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722193348; c=relaxed/simple;
	bh=jraGcb/y+eh34BRuZ6I8inLVF3tNfDxKC+d8OD/SH/o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=flL9udenBNfGzW475C8uhS09e7thABFobg5kKCKDziYrAcNnTi739+k3F68QrabwhXac+pFyPQrDdov3t+QwMVMTXa8c8bUIxg0/vVjZYAHJch95Op5vcUQzcZW1MlcY28tc/yjFK6jZu++kkAmR/rkPFyhn3b+6CGVJaazvMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfSLpVfl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F76C4AF0C;
	Sun, 28 Jul 2024 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722193347;
	bh=jraGcb/y+eh34BRuZ6I8inLVF3tNfDxKC+d8OD/SH/o=;
	h=From:Date:Subject:To:Cc:From;
	b=kfSLpVflRwP1u2yIXTvDephGrWbb+cEbcoRwbX1E+AGAtxtz3lEgXySg9NlMfwFVe
	 4C+96VYo/lO+g4dKYWfcKYGm2wEPXNexd4yZNKFpQ4vC7mZOn/FrbLu7Qc6A+4mV7m
	 ZLAY6/DsfkNKCmpHMMHZoTV25DlWzjeZUppnhiOgaM6uc3OzFdLKeF19WJk9HZxgzf
	 6V28y6E2gvzQjX6QokIT4kR7kGSX8ngrGE9dTkmYhOwIDM+Y3Gw9myOYvMuC8gi8Ts
	 IDhQrvmtQTjEmhG0VM5ReO4z0i7DJAPJNP9pP5IckTUpKw/bwCEmDp/XgPRuk07cYA
	 WdDvBwWIqeeMg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so4362842e87.1;
        Sun, 28 Jul 2024 12:02:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlw4UG6qDPIZXWw/eqoXY9GJLNuERmJVakhVsKcaYwWVgtI5TFfMUl0ebc7Lhz9eU92g+vRRp9BLKnWWTcRNrcivkkJl65zHdpLIyx
X-Gm-Message-State: AOJu0YwMQNP0C6uMQU764RBskZ87R4xFgIVvRMtPWSg/OmoaDM36qf6w
	UmEiNl7O+5i4y+JrY/SUH089KvuVqlimzWMQQJAeIXcbieEBrCnLVbz2DZA0gvr5w5jzOpXWKHq
	Aoy/txhBnzqe/DbYFdxjQuZnwC64=
X-Google-Smtp-Source: AGHT+IEhXb6TKwB9xBnDwqhWkAYiKfnRIqRt4sqrpBI4sHFkytc6o6lyruZO7H/lqomi2fxMJutVyIDpK7a2JkX7Nys=
X-Received: by 2002:a05:6512:251f:b0:52c:86de:cb61 with SMTP id
 2adb3069b0e04-5309b25a2femr4432860e87.10.1722193346229; Sun, 28 Jul 2024
 12:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 Jul 2024 04:01:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQa+SNKqYtvqQT+QPcH8NW2sD+JxOShNzZrfRzRWRUXtg@mail.gmail.com>
Message-ID: <CAK7LNAQa+SNKqYtvqQT+QPcH8NW2sD+JxOShNzZrfRzRWRUXtg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,


Please pull Kbuild fixes for v6.11-rc1.
Thanks.


The following changes since commit 5ad7ff8738b8bd238ca899df08badb1f61bcc39e:

  Merge tag 'f2fs-for-6.11-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs (2024-07-23
15:21:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.11

for you to fetch changes up to 3415b10a03945b0da4a635e146750dfe5ce0f448:

  kbuild: Fix '-S -c' in x86 stack protector scripts (2024-07-29 03:47:00 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.11

 - Fix RPM package build error caused by an incorrect locale setup

 - Mark modules.weakdep as ghost in RPM package

 - Fix the odd combination of -S and -c in stack protector scripts, which
   is an error with the latest Clang

----------------------------------------------------------------
Jose Ignacio Tornos Martinez (1):
      kbuild: rpm-pkg: ghost modules.weakdep file

Nathan Chancellor (1):
      kbuild: Fix '-S -c' in x86 stack protector scripts

Petr Vorel (1):
      kbuild: rpm-pkg: Fix C locale setup

 scripts/gcc-x86_32-has-stack-protector.sh | 2 +-
 scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
 scripts/package/kernel.spec               | 2 +-
 scripts/package/mkspec                    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)


-- 
Best Regards
Masahiro Yamada

