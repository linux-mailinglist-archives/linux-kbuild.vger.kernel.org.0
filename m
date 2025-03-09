Return-Path: <linux-kbuild+bounces-6030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA29A58734
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Mar 2025 19:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E098D3AA9FB
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Mar 2025 18:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FB22080FD;
	Sun,  9 Mar 2025 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPUzuF1S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A9A202C4C;
	Sun,  9 Mar 2025 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741544545; cv=none; b=VvXYnuaZLs7YauFUhWb1z+xfYDgrjkx9iBLEqeaW7qiCleL+1DQ4goYTaL1jBMIGznqVXICP1Z4o+7643gJuIBi1Efry25MN0os1owYujUa/xFIxaKROjppemJJN48zbl8eggrxc5JQLf8oWmX4ctJuKd+z5S3bVMhF5aCNDb7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741544545; c=relaxed/simple;
	bh=wcP5KO4+VzV0/SeYWzHt3Pf1DrvN5gRsbUpIO4k0GxU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OF+49OFSQJTDBLAaoTnFS9JNyYF1CFcU4KEmbkGKkMkmVhfgaMNkpSIsYGYphoNp+AeB6fIFvVotJ1nwvYjhSs3awdQBzzohYtDpMUdP9ZwL5I7B79cAkGgQrYBvePxF60r8RIY0t/jkT8eEVCwmLzgMf042a9sWn2JQuAYDpKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPUzuF1S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62571C4CEE3;
	Sun,  9 Mar 2025 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741544545;
	bh=wcP5KO4+VzV0/SeYWzHt3Pf1DrvN5gRsbUpIO4k0GxU=;
	h=From:Date:Subject:To:Cc:From;
	b=fPUzuF1SvaBQTeX6C8kaUfqT+Zy3LraEZjQPOGCEsUlNYvLyCrwQndGXvBonO7sWJ
	 pfPPEWSOYSKWdJqEKTIOXdZq2yRzbkuXKU9xdGZ+eqiQCxAFJyncZhZBzoh4/bUztP
	 E77fJq3/UGwvGiW5/03VJdrRavsqSavB/hklFc/gOPRFRP3KOpPweJg3hkQHEjaesV
	 h3mK57Gv1rybPeaqstyisvoPQ+H+pYPsO9qrbXd2osTaWsn2PBaEcdDQVTlPN2qwZW
	 EcdkWFKHCGkN8l2/ZjQWJ6lbGy+Dv0WY6pKoGoFNKMFliPQ6Fx05ZzhavHo2vKqG/W
	 PdtVCvYefnIjQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bae572157so34688971fa.3;
        Sun, 09 Mar 2025 11:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDlMheNGK3PI7i2CUXfUoeskomO3+mdwGux5y+Z+HKSrsajb80cZ9LygCXL9pVu3RV1mQ2/UqXLbh/ZQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwLEvm+YjEVS5w3XLX0QelZ6y4XkDTNJ4kvq4jX5GgEjfn3+T
	gfZFmaz/lSad7c0t61NdhSJHWu7mulnQHfgCk6c21fmgd8evs4V38ZqFuzBBVIVmH8tGFGlxGiG
	ZX/s29do4nlUJ7dHo5iazek/hdjQ=
X-Google-Smtp-Source: AGHT+IEXrCq2WtENGN/OcHMabpQAyHkggawYVP+uyydLBO0DY1JmeUEEKXa8BL/KrikGKYtTTO9les3lXctQPbtGCqQ=
X-Received: by 2002:a2e:bc12:0:b0:30c:5c6:91cd with SMTP id
 38308e7fff4ca-30c05c6945dmr15015761fa.13.1741544544064; Sun, 09 Mar 2025
 11:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Mar 2025 03:21:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_En5ooXYfjWEZVbwBcymDaEwGs8ug6w4-82pGa4+VpA@mail.gmail.com>
X-Gm-Features: AQ5f1JoqTeZGaa_HfFFw1MGF7rTyheFmzd0qofjVhL_s0eBHEUw0ySbry96uxCo
Message-ID: <CAK7LNAS_En5ooXYfjWEZVbwBcymDaEwGs8ug6w4-82pGa4+VpA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.14-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull Kbuild fixes.
Thanks



The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6=
:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.14-3

for you to fetch changes up to b5e3956535466187657563b754ba0f1da8626c7f:

  kbuild: install-extmod-build: Fix build when specifying
KBUILD_OUTPUT (2025-03-06 20:32:30 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.14 (3rd)

 - Use the specified $(LD) when building userprogs with Clang

 - Pass the correct target triple when compile-testing UAPI headers
   with Clang

 - Fix pacman-pkg build error with KBUILD_OUTPUT

----------------------------------------------------------------
Arnd Bergmann (1):
      kbuild: hdrcheck: fix cross build with clang

Inochi Amaoto (1):
      kbuild: install-extmod-build: Fix build when specifying KBUILD_OUTPUT

Satoru Takeuchi (1):
      docs: Kconfig: fix defconfig description

Thomas Wei=C3=9Fschuh (1):
      kbuild: userprogs: use correct lld when linking through clang

 Documentation/admin-guide/README.rst | 2 +-
 Makefile                             | 5 +++++
 scripts/package/install-extmod-build | 2 +-
 usr/include/Makefile                 | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)


--=20
Best Regards
Masahiro Yamada

