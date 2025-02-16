Return-Path: <linux-kbuild+bounces-5771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A14A375F7
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 17:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E6F27A41BC
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 16:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AEA19C556;
	Sun, 16 Feb 2025 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzIuAcvx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9D19C553;
	Sun, 16 Feb 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739724224; cv=none; b=lxxo9IKjHKCSC5Vk9/7BYtNPOmKderSts4gzN4OT67gP6+pRmPLUL235ah3zHXG7/GDPeoS0lUBPOF5DByrrK9u35tdYAD1gr4hQq4wGNrv9H2ayT1RUBvca24ef4EWijZvosYFbqZIm5BUu1a4ryWxSCPX6KT6859n+GMfdbGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739724224; c=relaxed/simple;
	bh=qmM5JnFO5fEclNMcfcLBUzwYQRlokmI+pHvjDEFXItk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mD4zFVWQSo1rvrx8fZnxRinNqCLFkDZ5DgfBeLA5LpxE7gWFJD/1ZI/SU9mex2a2n9z5076M//PF8QXtNWzca/FZs7p1HAxibRZ2yA1ffS78xGPeqLWVPRAA/2iU80XFqvebY4kIY9Cy4xxM/vWd32cQveaHXmY1GIjC2HGHP7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzIuAcvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E08C4CEDD;
	Sun, 16 Feb 2025 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739724221;
	bh=qmM5JnFO5fEclNMcfcLBUzwYQRlokmI+pHvjDEFXItk=;
	h=From:Date:Subject:To:Cc:From;
	b=CzIuAcvx1AeLape84eZ+fn1mbdzVuuppGlAW0LvD+hUXhGGx8JmeRdDnkiDOBIuqo
	 7GgqQsVv3J9JQMPh/htjEgs5VqJ7fepKiW+FFG0/bPxrYwVvj8QHRhr+nJqxsq+EN9
	 IrOrnwVgY/cjRgDt0OW5kfawBuG2tdegfJEc73i6hopUIP3bpie5FXUlH9qq8BHwNT
	 Gg7luZO99f/WM8FkcqTQhlTV7yItHniGDJUKypcktv/M81LHXJ9JYwIWbL88e1jgnd
	 gvGaipueE7JvU02F+ECMM6EWCrJjpUDTOmdigtpFitcWGLJixLH3A3hkUlAGoddQU5
	 lxCPzOOwjTYKg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54622e97753so32559e87.0;
        Sun, 16 Feb 2025 08:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmpF0Iuy1vMzAQxCPtdG12UKsO5bruAAgrx7wUDdsnnTPH47tdvRigJbg816yCh8u0bCpTEBkyA7eFJ94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylgb6Mf+hCFudynbcj4U8aF4KXJa8b43EiRQ1pCQ3VZMl9fODA
	LUJgOQ/N/irR4DmOU3Hxbwrfisr7nq/0ImpArHv5xu5pzH96yfKnKjDEmV8nRE7E8AxHOwXGhy6
	Or4MJo8FPpSVkJlpwKIJ9XmfE3NI=
X-Google-Smtp-Source: AGHT+IFMqZK9L64dKeunHskpD3P86Jc8yO4JC1sRXLT96hSn4Vm/qA2XoP8Q28H8EG0xMm33i6OP3Xk/YnGrWpE+RvY=
X-Received: by 2002:a05:6512:2356:b0:545:3035:f0bb with SMTP id
 2adb3069b0e04-5453035f1e6mr1973967e87.22.1739724220510; Sun, 16 Feb 2025
 08:43:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Feb 2025 01:43:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNw193tNyEd_2SmY4m-z7NYWd9k+GTEi8Ck0f5RtOm_A@mail.gmail.com>
X-Gm-Features: AWEUYZlDaLlvfIFJ6djexSaWI7TTWe0H4MpCo628rg7A5uWsu_w-_JvuYpQhaR4
Message-ID: <CAK7LNARNw193tNyEd_2SmY4m-z7NYWd9k+GTEi8Ck0f5RtOm_A@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.14-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull Kbuild fixes.
Thanks


The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3=
:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.14-2

for you to fetch changes up to b28fb1f2ef45eeef1cd2c23149b50d184d545a3e:

  modpost: Fix a few typos in a comment (2025-02-16 03:10:58 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.14 (2nd)

 - Fix annoying logs when building tools in parallel

 - Fix the Debian linux-headers package build again

 - Fix the target triple detection for userspace programs on Clang

----------------------------------------------------------------
Masahiro Yamada (2):
      tools: fix annoying "mkdir -p ..." logs when building tools in parall=
el
      kbuild: fix linux-headers package build when $(CC) cannot link usersp=
ace

Thomas Wei=C3=9Fschuh (1):
      kbuild: userprogs: fix bitsize and target detection on clang

Uwe Kleine-K=C3=B6nig (1):
      modpost: Fix a few typos in a comment

 Makefile                             | 13 ++++---------
 scripts/mod/modpost.c                |  4 ++--
 scripts/package/install-extmod-build |  4 ++--
 3 files changed, 8 insertions(+), 13 deletions(-)


--=20
Best Regards
Masahiro Yamada

