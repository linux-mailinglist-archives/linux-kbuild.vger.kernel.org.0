Return-Path: <linux-kbuild+bounces-2290-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B57C91D2E3
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Jun 2024 18:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174CF1F211DE
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Jun 2024 16:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C737C15534E;
	Sun, 30 Jun 2024 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUxmNbaL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC7A152E06;
	Sun, 30 Jun 2024 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719766578; cv=none; b=OWsXnss+CmTLys+ffCKvKWvIng/qtlMiTlDdKbMef/Fox5h+f1laPwiTgPvPTHuQvc9v686zkjL0cTYgopP2rvkxFUAfxo0z1yyUldXpP1vz5Nl3IkGxruZX+P9aLOZV1NcNYNEU66Q1z6N4iP8+aTP35UEkRASl3IeLrCEkQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719766578; c=relaxed/simple;
	bh=6TayleKu/jY9AzaWuCv0G/29hB6I2HiTgAUwoze39WI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PqnRias6eJ0e7NbBwe7DxCqxVSNb94GVRd3KHA1uCIPcbAJvKT0x84HDUM28/TotCMAsSqRcT1G+A4iYO3+I5xRUS/tBhnYBQkqxl72PWoeWomAIth2OhLKpO4eUwFo4ekgCoxXyB5LaFP/GKBX6HCBz+/K1UJO4ZqxhS1tfyOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUxmNbaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9F4C2BD10;
	Sun, 30 Jun 2024 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719766578;
	bh=6TayleKu/jY9AzaWuCv0G/29hB6I2HiTgAUwoze39WI=;
	h=From:Date:Subject:To:Cc:From;
	b=uUxmNbaL0/ZzNGMaaV4Vz6EH/luHSkkmktMqvlDb0/xhTBlULetl7XTSiMaK9+Trb
	 Pf/Tk3fe/6eCLmhyTI5Z/GZT+vLAb8P1QjbRL6I287rGWPkEG5ihy0His/Z8//rZEk
	 OUKjtJd5oTnee5fRM1GJW9cdUg1Jy9X1ePzQN63WAB8W2LPB+YP5v/k9efQ757wAJV
	 2its/vKJai6cuIU1U7UsQkb0CW6yInSBqno7gmy5u6LMl5u2EcFoxLLzfo1y0Uz2MZ
	 spj33EWh4giWZOKytarPdazIz69KcDawdnY22OezixUxygtwwPNt/V6P0q0yzDV495
	 vlI5pAqE9N51g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso21665481fa.2;
        Sun, 30 Jun 2024 09:56:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1hP7vtfXaiKHU5kA6yy/GeyRC5ra0jZVf+DMZ8esY/LF/jQ+XuduPPAtXjKQHlzE2M6ToBRPFTBM9o3Vxpn1qhhK6OEtJHqhT3JVf
X-Gm-Message-State: AOJu0Yz/nTom88li2mFx6j6z0b2HOWIvger39ItIuIfI/DNGOLcP2X1P
	Fc3jFmYpK17a4io2X9iHEJ/VHYgFu7NzN6UggFi7IHUQUq8ESNGqBupJ5HEHetUtxyZIFKjpD7v
	Ymy6J3+QG8Td3MDoaVODS35MU5vg=
X-Google-Smtp-Source: AGHT+IGZ7H83/THJ6XGfXCQJ/mnhaTU7PrZSHGBMZcEsxyCwTaVDBlrHdoQlUIg5iao4P+9qXjIx6UbMLGEQI6KQEUw=
X-Received: by 2002:a2e:b52f:0:b0:2ec:5a85:66ec with SMTP id
 38308e7fff4ca-2ee5e6f53e0mr21423151fa.48.1719766576888; Sun, 30 Jun 2024
 09:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 1 Jul 2024 01:55:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT79u14memh31qEJJ4JsuXruqS1PRN9x9w2GPLBZbf5Kw@mail.gmail.com>
Message-ID: <CAK7LNAT79u14memh31qEJJ4JsuXruqS1PRN9x9w2GPLBZbf5Kw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.10-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull Kbuild fixes for v6.10-rc6.
Thanks.



The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.10-3

for you to fetch changes up to a11aaf6d0bb4282ce1989e388b13f8d87154ba75:

  kbuild: scripts/gdb: bring the "abspath" back (2024-06-27 04:20:32 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.10 (third)

 - Remove the executable bit from installed DTB files

 - Escape $ in subshell execution in the debian-orig target

 - Fix RPM builds with CONFIG_MODULES=n

 - Fix xconfig with the O= option

 - Fix scripts_gdb with the O= option

----------------------------------------------------------------
Dragan Simic (1):
      kbuild: Install dtb files as 0644 in Makefile.dtbinst

Joel Granados (1):
      kbuild: scripts/gdb: bring the "abspath" back

Mark-PK Tsai (1):
      kbuild: doc: Update default INSTALL_MOD_DIR from extra to updates

Masahiro Yamada (1):
      kbuild: rpm-pkg: fix build error with CONFIG_MODULES=n

Nicolas Schier (1):
      kbuild: Use $(obj)/%.cc to fix host C++ module builds

Thayne Harbaugh (1):
      kbuild: Fix build target deb-pkg: ln: failed to create hard link

 Documentation/kbuild/modules.rst | 8 ++++----
 scripts/Makefile.dtbinst         | 2 +-
 scripts/Makefile.host            | 2 +-
 scripts/Makefile.package         | 2 +-
 scripts/gdb/linux/Makefile       | 2 +-
 scripts/package/kernel.spec      | 8 +++-----
 6 files changed, 11 insertions(+), 13 deletions(-)


-- 
Best Regards
Masahiro Yamada

