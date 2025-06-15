Return-Path: <linux-kbuild+bounces-7504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41790ADA278
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 17:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C913B1937
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 15:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC4227A112;
	Sun, 15 Jun 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMWoIjqc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0726AA91;
	Sun, 15 Jun 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750003163; cv=none; b=MeqXUvGYNj9edojI46gH/Vewzx/5uW+KU4OZmAFTxW5IqHuq+WXRi1LLW2R7h4P35NRVLAd2kfcQX6FczNYBNaNjU7BtzNvFvCAuc/kDys9wGhdNy6Q+ihSK89JeR0wHQeEOjl5GSkcxtOm6l/rHyYmkuSkR4eSCRI/VDNgSQGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750003163; c=relaxed/simple;
	bh=t0iXAB5xb7IBtP8bqakYR/yVx7YmRMHYxqrTGRJ0bnA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BKAievhOUxbLHll4BD/k//9OIyZlEhM3FK6l01SGaZ/QFmJcuUXhnwbJdmdvm1oG9ZCUFBAWcMjDBvWFq8tz9+LEn75cJPTGLymxipXEAUAHD1Dpxa675TcaqFF3mq/wCGggSwVbsakjKE6oby9qQCzNeSR7evujBUqJdp1ZveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMWoIjqc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182D5C4CEF1;
	Sun, 15 Jun 2025 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750003163;
	bh=t0iXAB5xb7IBtP8bqakYR/yVx7YmRMHYxqrTGRJ0bnA=;
	h=From:Date:Subject:To:Cc:From;
	b=RMWoIjqcvYE9gOknMd+oh4M9hQ0+AQVAVdzw5VJy0CcB4r90WAHp8DgKzkuudGkSX
	 im+L536U6JB2V7yxdW2G5IyGn4uHVWFyhIjVDvwfs8WYyCcLid7r/vSrWzhVuDKqd+
	 reOOUoU4Y7aD7KXBqn1bfOjxVHNETzG8D1+GbYKClqSC84V1SCW41IfaOszbaV5svn
	 qNYSl250ruIFTv2nsxmmwGnmfOBpVIhBs/pKLtedv9SzVidigk0dHU5+ogHjr6G4QQ
	 Tp+ZHaNG23De1YexkV8Lhn9gQOGeQqXbLba33XjIivui9o7iwU59bTJxt56+4xxJwn
	 O8aNVxBbnov1w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b165c80cso2315693e87.2;
        Sun, 15 Jun 2025 08:59:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVk5zW9Ps0maJ2ciRlfnY1NNhMP5mLvtx3s5ufHemobgMm2+7Z4CQJJoWbgDPUyTKZCjBoldkHnDIhrqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHE7IyUQfD+BKDpVKdnYrkZ59MXW1I4DiDb1316hA5Jlp3/98/
	NudwWL+hjAbNB0KrAcUX8w2k86dgfPo19giRSSfns0B+O6vtLr1hYzhJvwkWIQaqhnxpBLYWEu4
	E2cOwyDoiQX3aaGz2kZ63pvvGYuN6fsM=
X-Google-Smtp-Source: AGHT+IELWeXDR08vyPDL/UUXtYNtRHUiFtLAUdVChWh0gWwBGrLJ0jbYqhemJb6giNhJe3FKJr4tsQrIuPkWwVZDVtQ=
X-Received: by 2002:a19:ca08:0:b0:553:a272:4d1f with SMTP id
 2adb3069b0e04-553b6f3894dmr952337e87.49.1750003161781; Sun, 15 Jun 2025
 08:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 16 Jun 2025 00:58:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvzJzxEqTP6XkhcEYdJA3SdTMzjB8u6Qt9QzJ6nTTVpQ@mail.gmail.com>
X-Gm-Features: AX0GCFt22Czwq8a2Rpbly6AZd0IhIpGX5HaX5StVpIADaXhIE9gfUL9RWgSGHhI
Message-ID: <CAK7LNAQvzJzxEqTP6XkhcEYdJA3SdTMzjB8u6Qt9QzJ6nTTVpQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.16-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull some Kbuild fixes.

Thank you.



The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.16

for you to fetch changes up to 2f6b47b295518c3ba16fabb1dddbe6a319899acb:

  gendwarfksyms: Fix structure type overrides (2025-06-16 00:49:48 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.16

 - Move warnings about linux/export.h from W=1 to W=2

 - Fix structure type overrides in gendwarfksyms

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: move warnings about linux/export.h from W=1 to W=2

Sami Tolvanen (1):
      gendwarfksyms: Fix structure type overrides

 Makefile                              |  3 ---
 scripts/gendwarfksyms/gendwarfksyms.h | 14 ++------------
 scripts/gendwarfksyms/types.c         | 65
+++++++++++++++++++----------------------------------------------
 scripts/misc-check                    | 15 ++++++++++++---
 4 files changed, 33 insertions(+), 64 deletions(-)


-- 
Best Regards
Masahiro Yamada

