Return-Path: <linux-kbuild+bounces-5688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86AA2DF79
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Feb 2025 18:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0788E18848F1
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Feb 2025 17:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0951DFD85;
	Sun,  9 Feb 2025 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRqIYaNF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F281119A;
	Sun,  9 Feb 2025 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739122793; cv=none; b=PSB6rjvGGYfnrkoEoz2MD6lVpyWXpV7idJkAcxb2ARkEPY7SsrgO5Da9tSMev9tjzC5SARNToNmflHtL/4QPHDz4ZiXLaQgtVW/6kXHmVS5SWnU5Yd8mLo9jTmfk6H80YiuOUwdbDjnO4XgxnJoFNZlgm9PnwLwtPrVEEL4as9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739122793; c=relaxed/simple;
	bh=Mr0mW+XyvyDAiCtQmwOqFdRzpUPsd8QoVankQ7tsCkQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UqCX7VYq5pQ97AoTOUR7YjsYvAaWLt1JwSM6F4YaQOO9HWwL2w+RzYp7k0CUQU1C7XdofnWtWmx+GowSXhk+XGsiSg9hLZvyfiBcLi75CEMo4+KK2lvXaAXRmrYqO8b2wUJ9fH21HqPqQdyeZjZvPvMwuPOIoXxqeLzDzB60fLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRqIYaNF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0723BC4CEDD;
	Sun,  9 Feb 2025 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739122793;
	bh=Mr0mW+XyvyDAiCtQmwOqFdRzpUPsd8QoVankQ7tsCkQ=;
	h=From:Date:Subject:To:Cc:From;
	b=rRqIYaNF4tCyqk9QU+Evm0/Fj88CDSiM23qLHUVUyfwmLqV4ekxkSbs3reIOySDcB
	 rcJGwYNAuDQ74UGvezAT5jqrNPSG4FCea51jgXJuo10I5rDmLMfpFimuFPY6pbDLk7
	 7TroCe9hznzXR2fV/NbWymezzO41CMt9z55kBZNwzTV4eFTKVaIDuY1aC2Vgecl+t8
	 qXLOfdvpX+/b9c4NhmXyv7lIkiHaxG1wPFkSreSN906m8v+06m0oi2rcAeR0FTeo/2
	 xJM+gEXh6F1SGQ/XkyqxLfuxoZMQYMYSc4Ozmk1CxnlpTj9Red910nNGsOoSz2PAs9
	 g2Gq6z2r+Gr+g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54504a6955aso1170603e87.2;
        Sun, 09 Feb 2025 09:39:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjlFddP0yzkdTCKRPaTo4qYnS2oYteB3P9MkhL7GqjuLmuWbvbhUboMccWoARsRokFRB79jTYNjYh1g2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnbxFxFuUO5TDJ6Rs+PrPv7g4fQkzuZwfzYWlBEeg80kg77U/
	sM4nLmXr1Nb6dF+ZuiyAnxFWkIyryVmPRBbzpjZvWAVoRNWqlba6fFNISx5IdYiuB8+yXzWnkDe
	N/sESEdMCAtgBeZtA0oxQwC8rrwo=
X-Google-Smtp-Source: AGHT+IFXV60GBS2RKhI69wQbrVhDxTXAM9gREpXtJWAbOnlJJhOfQ900pPcc/xBswE1kqCBi6yACKzZBn28BkY11SuI=
X-Received: by 2002:a05:6512:3a84:b0:545:76e:31a with SMTP id
 2adb3069b0e04-545076e0d5emr1192387e87.11.1739122791672; Sun, 09 Feb 2025
 09:39:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Feb 2025 02:39:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3rgsNCN2hUs_s3H9wZeBPaLPwZgMH3ShLuLUKMjjihQ@mail.gmail.com>
X-Gm-Features: AWEUYZkbxRW_10sInvoI3pO2-9PROQ4LV_tPltlsXEuB6gGSo9ESnBP6SBnMAM8
Message-ID: <CAK7LNAR3rgsNCN2hUs_s3H9wZeBPaLPwZgMH3ShLuLUKMjjihQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.14-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull Kbuild fixes.
Thanks


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.14

for you to fetch changes up to f354fc88a72ae83dacd68370f6fa040e5733bcfe:

  kbuild: install-extmod-build: add missing quotation marks for CC
variable (2025-02-08 03:37:57 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.14

 - Suppress false-positive -Wformat-{overflow,truncation}-non-kprintf
   warnings regardless of the W= option

 - Avoid CONFIG_TRIM_UNUSED_KSYMS dropping symbols passed to symbol_get()

 - Fix a build regression of the Debian linux-headers package

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: keep symbols for symbol_get() even with CONFIG_TRIM_UNUSED_KSYMS

Nathan Chancellor (1):
      scripts/Makefile.extrawarn: Do not show clang's non-kprintf
warnings at W=1

Oleh Zadorozhnyi (1):
      kbuild: fix misspelling in scripts/Makefile.lib

WangYuli (1):
      kbuild: install-extmod-build: add missing quotation marks for CC variable

 include/asm-generic/vmlinux.lds.h    |  1 +
 include/linux/module.h               |  5 ++++-
 scripts/Makefile.extrawarn           | 10 +++++-----
 scripts/Makefile.lib                 |  2 +-
 scripts/mod/modpost.c                | 35 +++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.h                |  6 ++++++
 scripts/module.lds.S                 |  1 +
 scripts/package/install-extmod-build |  2 +-
 8 files changed, 54 insertions(+), 8 deletions(-)


-- 
Best Regards
Masahiro Yamada

