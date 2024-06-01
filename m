Return-Path: <linux-kbuild+bounces-1966-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBA8D7114
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B1A28265F
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 16:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA971509A2;
	Sat,  1 Jun 2024 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ofc+jrSU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229F01E502;
	Sat,  1 Jun 2024 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717259079; cv=none; b=D9a+cXkcr8+X6DktJipUbyJrWGnA2YZi7xpVkzteZ19dSTUcE0KMYkCI1M6GH1Izm+AqIkoC+1/Z6uRREcv1hJdo1AimxQc6FDEcA+wdVubd2MVoBNQjc8G42WUjOClM25q0LlMF8fVwzw/ZMvKikOnW8NN3iG0m+Rw/4uR3Xfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717259079; c=relaxed/simple;
	bh=0D8b6ZvCacsn9JWTlw2CWV25czsPhitRq9spdELcHe8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZvcfsHqYrDhnQ0phfeKmS4C0K/z35a7KWqON6EBG17sbgu+ANOtUwZvH6cyDIr0fuCxjP1VbRzSDvaJyFPnpw7sBkaLpjk+yv6OEQtT1pGOTT2Z6Xmr3zmqsW0vbsrPGdTkgGGie8yBGKAcgQxuskvjAllkxMXiSIBVOSM5xduw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ofc+jrSU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93FBC3277B;
	Sat,  1 Jun 2024 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717259078;
	bh=0D8b6ZvCacsn9JWTlw2CWV25czsPhitRq9spdELcHe8=;
	h=From:Date:Subject:To:Cc:From;
	b=Ofc+jrSUcXrpbmJdtaKMITbAiM9wsz9GmD9r/nfKDcQ0jGVt9T7gpTkYhGlbdtZMu
	 EPRHPrCZh9nH2o+PPNmbHEk1S9R+qyD2JcX63dOdDWfE3TXBPaCTN3jGKCx2Zuio3F
	 j3sIvDp+CUwKcOV2GHfZKFjZADAmamh4eT8H69pbqnLYFq2FhykGGn6FV3UVVVcglB
	 uX1fDAUhwKbWTGVCwMHG+P7wxWYuh0IxIyljqEAu/30krkaCEeRJlkaUGCFT2h89KS
	 iKISYbn11KlsuCkhXEfVCDCJAdaHNV2GuEbzhs+b3FydycLmmyCqyvQwZzUtyDgxeI
	 1KVkN3SOBcJ4w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so38010711fa.0;
        Sat, 01 Jun 2024 09:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXD2YsIsbHhAmiEKOZrWTLODeX4z1TnsWAd92oNc9QcB+qohjuQLaHbNOCbK1GVXaW2nBUbOIjp2/hvBNSaktkxIIDilGjf4luQcOKn
X-Gm-Message-State: AOJu0YyPMaIgoQf46FiMv5XubBGX5vjTnYpnPcAyDG04HwqA48R/WS24
	+tW5gdSiqftQrhGVwxvhn7Fu4LWrU/bSutfRKA23LdcHNAavSnYuIFhhU+ECGmxsAEnCRzd9lXz
	IikYARuLJXSnTt8yEPQ8zzAq9g8s=
X-Google-Smtp-Source: AGHT+IGijqwnA9He65L5aUHDfPwmA/FJrV1F6SG2uzkRjHFrLh8CwTdn2tuteRqGw9QrqPZKYxuqduptyKbmL5TXHi4=
X-Received: by 2002:a2e:9c0f:0:b0:2ea:8370:8a86 with SMTP id
 38308e7fff4ca-2ea950c923fmr33978651fa.10.1717259077380; Sat, 01 Jun 2024
 09:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 2 Jun 2024 01:24:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNATB7Gkq-rDeGy0VyZhEa1M8cMYQmUSQTQOLCGtJYUzD7g@mail.gmail.com>
Message-ID: <CAK7LNATB7Gkq-rDeGy0VyZhEa1M8cMYQmUSQTQOLCGtJYUzD7g@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.10-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,


Please pull Kbuild fixes for v6.10-rc2.
Thanks.




The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.10

for you to fetch changes up to 1b1c9f0fd3fb70adf1f3b0aec58ab037d6e595d0:

  dt-bindings: kbuild: Fix dt_binding_check on unconfigured build
(2024-05-30 01:15:58 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.10

 - Fix a Kconfig bug regarding comparisons to 'm' or 'n'

 - Replace missed $(srctree)/$(src)

 - Fix unneeded kallsyms step 3

 - Remove incorrect "compatible" properties from image nodes in image.fit

 - Improve gen_kheaders.sh

 - Fix 'make dt_binding_check'

 - Clean up unnecessary code

----------------------------------------------------------------
Chen-Yu Tsai (1):
      scripts/make_fit: Drop fdt image entry compatible string

Douglas Anderson (1):
      kbuild: scripts/gdb: Replace missed $(srctree)/$(src) w/ $(src)

Masahiro Yamada (7):
      kconfig: remove unused expr_is_no()
      kconfig: fix comparison to constant symbols, 'm', 'n'
      kconfig: remove redundant check in expr_join_or()
      kbuild: avoid unneeded kallsyms step 3
      kbuild: change scripts/mksysmap into sed script
      kbuild: fix short log for AS in link-vmlinux.sh
      kbuild: remove a stale comment about cleaning in link-vmlinux.sh

Matthias Maennich (1):
      kheaders: explicitly define file modes for archived headers

Miguel Ojeda (1):
      kheaders: use `command -v` to test for existence of `cpio`

Rob Herring (Arm) (1):
      dt-bindings: kbuild: Fix dt_binding_check on unconfigured build

 kernel/gen_kheaders.sh     |  9 +++++++--
 scripts/dtc/Makefile       |  2 +-
 scripts/gdb/linux/Makefile |  2 +-
 scripts/kconfig/expr.c     |  2 +-
 scripts/kconfig/expr.h     |  5 -----
 scripts/kconfig/symbol.c   |  6 ++++--
 scripts/link-vmlinux.sh    |  9 ++++-----
 scripts/make_fit.py        |  3 +--
 scripts/mksysmap           | 28 ++++++----------------------
 9 files changed, 25 insertions(+), 41 deletions(-)



-- 
Best Regards
Masahiro Yamada

