Return-Path: <linux-kbuild+bounces-5226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 982CB9FA0D9
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 15:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B101418866D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 14:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB491F2C5F;
	Sat, 21 Dec 2024 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gagAyZqA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B021F2387;
	Sat, 21 Dec 2024 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734790123; cv=none; b=NztWProgX/MQ4iS298/kjUWY2AXLIEvUlUylrii1f3n3aml5ve+sTwkCHVAkw5+qqfPogz0U2Rcy/cT+uGDFCLPSiuMDFzVRYpwZygKtDaMUtduKVdNjJNghDYQTKOcX4OQyNibkFILlVe6SJ3kxPtJ/gd25S+UUyS9AApxQfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734790123; c=relaxed/simple;
	bh=GyXtwhFFKPVC2gyHuBqVOWZqCMmwnQ1EoX2saHcNVyQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NmBlhh7ZJ9fwuMW3o7M5sw50inmxAZv3S3T3tFRbxKpd5VLyew0RV9vnEmbnGAsU5n9ni6zDT0E2XTW6TT4Xy5GGe98PZEpRbWKYnKE11h4H42yjEW8YTG/g5DJMMnRX0K4IbhVf//K0rzdoz8YoBSymFproemelF6qPeun45iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gagAyZqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EDEC4CECE;
	Sat, 21 Dec 2024 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734790122;
	bh=GyXtwhFFKPVC2gyHuBqVOWZqCMmwnQ1EoX2saHcNVyQ=;
	h=From:Date:Subject:To:Cc:From;
	b=gagAyZqAqnyKdN/Hpqw7mGiNcL/S1BdT2DgfPrTYYKCYU8USvXfyMgHG0jOLvMbD7
	 /WJOolVbTTPmCbHe/14X/eibdtDu4PgvgxrK9GUsKgOZa85+rge1lDFsv7MLQh/I2v
	 23r/s6xL5RjcK0bZ8I6G6M9eVqa/qKfnWbitocQ0Y0iltJYSVh0yaoq7cYNmmT0obi
	 IOz5S3jcpbT7jZofQeksQw/nXW8j5M0jf4YjhfOYMUVS9AU1EYm2REzA7L4Mz4f8Zq
	 ad2EytujmtdXaQCkrlhuJLgUfdluGvN3k7a3f4KaqkRyVKbV1lelVCS8OH1yuhsTUF
	 njIfrfBWFPOdg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401be44b58so2860736e87.0;
        Sat, 21 Dec 2024 06:08:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJqIq8bmP26w6CGw3Pm2et/laDqa89t4WpsvlddJjUZMD6ghIRyTbFbMdbSZuls3uX8Z4yTsSHx/eQF7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/85dzcuuuuESpkhtWPXRZq45cKRxjomT64f/w4k77VABrAPei
	INYeuu27TSF4delKbvFeWlK1zzzpeJp++OESkK70K6bw1oRpyIf3LOZsS5vZOzuRMvyTvnTia+i
	McAfLQO1Vpg4xzF5j6nIAdrQkS44=
X-Google-Smtp-Source: AGHT+IEMVhmKkuLR7uJ+IKTOAc9A5JeKDj+nTQXqPWmLSMgn9W2gyH2Pp2bLmMcuM1Ovced7aaMfhoA+wW4iofxdfHc=
X-Received: by 2002:a05:6512:10d2:b0:53e:39e6:a1c5 with SMTP id
 2adb3069b0e04-54229562a91mr2413897e87.41.1734790121189; Sat, 21 Dec 2024
 06:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2024 23:08:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_Mm0cCxU-TUqkuW67Wif1nPb+nnBfoLgTRwHnvCf3-Q@mail.gmail.com>
Message-ID: <CAK7LNAQ_Mm0cCxU-TUqkuW67Wif1nPb+nnBfoLgTRwHnvCf3-Q@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.13-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull some Kbuild fixes.
Thank you.



The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.13-2

for you to fetch changes up to 9435dc77a33fa20afec7cd35ceaae5f7f42dbbe2:

  modpost: distinguish same module paths from different dump files
(2024-12-21 12:42:10 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.13 (2nd)

 - Remove stale code in usr/include/headers_check.pl

 - Fix issues in the user-mode-linux Debian package

 - Fix false-positive "export twice" errors in modpost

----------------------------------------------------------------
Geert Uytterhoeven (1):
      kbuild: Drop support for include/asm-<arch> in headers_check.pl

Masahiro Yamada (2):
      kbuild: deb-pkg: add debarch for ARCH=um
      modpost: distinguish same module paths from different dump files

Nicolas Schier (1):
      kbuild: deb-pkg: Do not install maint scripts for arch 'um'

 scripts/mod/modpost.c        | 17 +++++++++--------
 scripts/mod/modpost.h        |  3 ++-
 scripts/package/builddeb     |  6 ++++++
 scripts/package/mkdebian     |  7 +++++++
 usr/include/Makefile         |  2 +-
 usr/include/headers_check.pl |  9 ++-------
 6 files changed, 27 insertions(+), 17 deletions(-)


-- 
Best Regards
Masahiro Yamada

