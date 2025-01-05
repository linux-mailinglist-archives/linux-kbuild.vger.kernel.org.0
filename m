Return-Path: <linux-kbuild+bounces-5374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F6A019E4
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 16:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF3E618834C3
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 15:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179BB154BFC;
	Sun,  5 Jan 2025 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWERAvc6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157215573D;
	Sun,  5 Jan 2025 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736089289; cv=none; b=OeAox09TUlgiYu8v/ldkde1ze+bJRnhKV571vIL49QVc91c2tqN0tu567xI/Ykr4HetzbU+JcuRVy6ATZW6jNP2Acyt7EA10qk0gOto9hhhfokREHSycQk57FiSE3OvQwhg9MKo6OIkMOTNaPhv0q8wOL381OB/GHlRGQSXO2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736089289; c=relaxed/simple;
	bh=xRD9x89Vk8p0tQFcx7eVi/Oqul9bUM/WnYJqpCYf2lw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nS15VSuac3li41xBL8KZge4wBOBNSiNNtHzOXSeNmxiG9hgRX/FApGCKgjB1jkAvuhkGbKZMfIfXRGDREBpmhn+NTRrw9Np1ZMS7bqwjyJgnDycRdz9+PomuOSVM2sz8371jUf1I/5neFIUhYcMuFyR6OYZKiKQ96nrsjABNkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWERAvc6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A99C4CED0;
	Sun,  5 Jan 2025 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736089289;
	bh=xRD9x89Vk8p0tQFcx7eVi/Oqul9bUM/WnYJqpCYf2lw=;
	h=From:Date:Subject:To:From;
	b=rWERAvc6TEftDHw8gQPEn7+RyPCAmsIlG1oCc0NJ79kaBy+Mu9rgqqxu985VmfZAo
	 Rs06sD4WYzyM/sZRl0Vnch8mMWuwJUWHkbcJJF5DoSd5OTmQNCGPuSg9RqhdUDRcvV
	 if/YF+wffgQTz5HOnqxFt6fMk1XkuB8ZvvCV3LMaTr4cGiarQg+6YGtmCFggoigo+N
	 ZPxoBmFP3uOtdKICeP8VHJE5AWCeoGXrsOUbiSRbbZ+f9XGAeDvS6gfZr3aYSgGPO+
	 6au28eMu837kA95zfudLDfhXL3V6bbndtD+9fOesjaFkdFWKpbDb3pGsQpOo9uu54/
	 /62uKtU+tqiZg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401be44b58so14531981e87.0;
        Sun, 05 Jan 2025 07:01:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6NKkBySxjR/HA8fvf21cAXee0D8VJUq1CrPTTDgLqDy5dZTa6D/Stzx2sV8wdX1ApAar8uBd6h1EXCTw=@vger.kernel.org, AJvYcCUh2V72HweGUAppESXD6dsRzu4Jh4vstfo9zbQc9NAkrj0JiWPgvkNXmaOVcgxf6OGAg2H6i6DCwdpYcCuS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyucy+Ys8iCowFf7MtUt18sQErBd8MCL4oyXndiJ6vQE47XwLbb
	eNMkhEFx2DbmCNVWnWvyac0mqVO/6Yjmh5uMDSR3REU76o1/qUq8C4d9DBZ7kj/aBegvXlUZ4wm
	pyP73aModSc0+zQGBkq20+3GFXVI=
X-Google-Smtp-Source: AGHT+IGdknyUW5J3sW1T6vRdGStcNUE3LOUuvlL8gzTmdR+gHRwu/F0BvKEaA7VRkKyjN3/cgYCMwVDxd+VPoNnpKoE=
X-Received: by 2002:a05:6512:3e1e:b0:540:1d6c:f1bf with SMTP id
 2adb3069b0e04-542295254a0mr15802733e87.11.1736089286852; Sun, 05 Jan 2025
 07:01:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 Jan 2025 00:00:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQe5cn_Jnr++a4Dg0Qhrxc88dvwTji1Z-JbYimE3xD39A@mail.gmail.com>
Message-ID: <CAK7LNAQe5cn_Jnr++a4Dg0Qhrxc88dvwTji1Z-JbYimE3xD39A@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.13-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull some Kbuild fixes.
Thank you.


The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b=
:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.13-3

for you to fetch changes up to 385443057f475e775fe1c66e77d4be9727f40973:

  kbuild: pacman-pkg: provide versioned linux-api-headers package
(2025-01-05 23:19:17 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.13 (3rd)

 - Fix escaping of '$' in scripts/mksysmap

 - Fix a modpost crash observed with the latest binutils

 - Fix 'provides' in the linux-api-headers pacman package

----------------------------------------------------------------
Masahiro Yamada (3):
      modpost: fix the missed iteration for the max bit in do_input()
      modpost: refactor do_vmbus_entry()
      modpost: work around unaligned data access error

Mostafa Saleh (1):
      scripts/mksysmap: Fix escape chars '$'

Thomas Wei=C3=9Fschuh (1):
      kbuild: pacman-pkg: provide versioned linux-api-headers package

 scripts/mksysmap         |  4 ++--
 scripts/mod/file2alias.c | 36 +++++++++++++++++-------------------
 scripts/mod/modpost.c    | 24 ++++++++++++------------
 scripts/mod/modpost.h    | 14 ++++++++++++++
 scripts/package/PKGBUILD |  2 +-
 5 files changed, 46 insertions(+), 34 deletions(-)

--=20
Best Regards
Masahiro Yamada

