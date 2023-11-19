Return-Path: <linux-kbuild+bounces-76-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44267F0803
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 18:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BDD0280D79
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 17:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D291804F;
	Sun, 19 Nov 2023 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9k4pQWn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AA51804D
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 17:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEEBC433C8;
	Sun, 19 Nov 2023 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700413312;
	bh=ru86jZzUfXNFF9k5YMUWNK9FW+jss64vTxKOc0+mVJU=;
	h=From:Date:Subject:To:Cc:From;
	b=F9k4pQWn5qkoUreZ0Qs9CZ6ToeOcPPP2m/9V4uFFx27K5EpcBfULGYwkIreFl+0PZ
	 xhWULHTogo6igicxTSXY76dvNBDwVy4ZWU3daSJpaE0xmSbb05k7U/R4qREZdZsMt5
	 JduZ/SzSBrWHRRIqpAzaJlYz0vVGpgjiiCegW38ci5+jYF+ycCfdFD8zV+CDpKj+Pk
	 m1cvIVQBzLo7fMPmEfxcKJh47oh5oJp8RNAHUS6DQOoyxAhE6LU/ygJZXEaXl7116N
	 Vtps5kguZKQMDLALV9MHG1vWPpAb6bn0TS7rytOuEAsGcEpub/WVnmq/UMCGy539m6
	 IRsDf8O0pKkmg==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f055438492so2126965fac.3;
        Sun, 19 Nov 2023 09:01:52 -0800 (PST)
X-Gm-Message-State: AOJu0Yx9muHM9KRnXIQ3BHKqRJy/tTgBKuPb02u1lAjaKdkDUVhtc3tQ
	4BMmX2zck3VR/htatJxUYehv/k0/Y1j4nMuDNNs=
X-Google-Smtp-Source: AGHT+IHl601uArgv5Eno1o3AqcocHQg4PeA8sFAei7ec30ZfwnTo+FZre9CdLIKejN84VYTzsUJ7nrvvbms5NnvM7sw=
X-Received: by 2002:a05:6870:f696:b0:1f5:cf0e:ea04 with SMTP id
 el22-20020a056870f69600b001f5cf0eea04mr5395796oab.58.1700413311348; Sun, 19
 Nov 2023 09:01:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Nov 2023 02:01:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATS=c2K7Ttg+Sb6gEmfUkrMbTQ0c62niOFzayzRF-rOdw@mail.gmail.com>
Message-ID: <CAK7LNATS=c2K7Ttg+Sb6gEmfUkrMbTQ0c62niOFzayzRF-rOdw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.7-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,


Please pull Kbuild fixes for v6.7-rc2.
Thanks.





The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.7

for you to fetch changes up to ae1eff0349f2e908fc083630e8441ea6dc434dc0:

  kconfig: fix memory leak from range properties (2023-11-17 13:24:08 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.7

 - Fix section mismatch warning messages for riscv and loongarch

 - Remove CONFIG_IA64 left-over from linux/export-internal.h

 - Fix the location of the quotes for UIMAGE_NAME

 - Fix a memory leak bug in Kconfig

----------------------------------------------------------------
Lukas Bulwahn (1):
      linux/export: clean up the IA-64 KSYM_FUNC macro

Masahiro Yamada (2):
      modpost: fix section mismatch message for RELA
      kconfig: fix memory leak from range properties

Simon Glass (1):
      kbuild: Move the single quotes for image name

 include/linux/export-internal.h |  4 +---
 scripts/Makefile.lib            |  4 ++--
 scripts/kconfig/symbol.c        | 14 ++++++--------
 scripts/mod/modpost.c           |  6 ++++--
 4 files changed, 13 insertions(+), 15 deletions(-)



--
Best Regards
Masahiro Yamada

