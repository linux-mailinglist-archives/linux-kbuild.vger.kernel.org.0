Return-Path: <linux-kbuild+bounces-7122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4DAB7CE4
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 May 2025 07:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65E141B65592
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 May 2025 05:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA6F244679;
	Thu, 15 May 2025 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq7oSFMJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C81F76A5;
	Thu, 15 May 2025 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286104; cv=none; b=lWARCmlcsKFwcrWOMZ17FjfQ85esLo8YMhAg4e7NlcZtCEZbVbXgjw2hskRLg+hebi0MrYZrl+D6oEE/XPgXT0aw8ALlLfHKD60OVfiuyV65le6yJ4PuKj1H5vOW1qtrTtAza1/MKUE/g+jdm/0XhtUpj3LJZ0AUsUCj8LbFCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286104; c=relaxed/simple;
	bh=5quPDZLRFjcNPqqzS24oX9XnH0WvFmarr2c80Q87cts=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qqSx/UY5GAiBm2CNAjz9lMBHj91OLMJFRYOccpRxB9rjcD89oAH8ajlFGldvgFIwc29H2njTVJ4IOoEbMIou6efonbDc+bagNT8/NSkxuaKSnUb+O2pzmbsUW02hDY0ckwk3WS2VsoHByXe7ZDwtkdJgWKX4w0f2HUP+eX4vrrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq7oSFMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72F2C4CEE7;
	Thu, 15 May 2025 05:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747286103;
	bh=5quPDZLRFjcNPqqzS24oX9XnH0WvFmarr2c80Q87cts=;
	h=From:Date:Subject:To:Cc:From;
	b=Aq7oSFMJOGMhULmvMfgBaGBgWPo8mOxz63bRIPjUCdBR2D1QzN88J0q3LmwcMGiZ8
	 /Pg9CJuLhByCHRds1yCkQSN6lvaEaPbyNFbe1nweyzqS50SJom0NoMjPCBUXFi6H4p
	 3txniRjSDjTIsxkkLTPpmVQcmyg9WzK9r3Uu3Kj3MWjYWrYeA61TCAU0anlyazQZmN
	 k4EufOrxM9XW8yU/AwgXO3NaIYncOnSVWC2v6J4zAI822wxCf4eB5ZKhNXhghPm+no
	 V1keS9/byHa9zhcJhteJ1H0EXcs3kKNeuC6P4+/gP/6ufEuuxLbbbq/3L7oijU2+IQ
	 qzxM5cKsoBkHw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-326c1f3655eso4651011fa.1;
        Wed, 14 May 2025 22:15:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhHgiY9yNw6GFkLd4rFrqTfwBE4LF51B3elpna+j7E7ewdnXE4NkkF29+tgXqMlbh/Qfc7EbAHkDpquPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YySaushT4veOqr9oRKFY+du2kNVotzEL25VEahD86AgIG6KOB6H
	BBa3aEGTeEin3MZMlmBHln4pHfr3JLnfuCtDIinZXQCQRH3Qi2pyhqiI9TBD6+eWYaiJuzcQ/k7
	eSbfkWnKL6yc/AGq5ENvX52qxj10=
X-Google-Smtp-Source: AGHT+IES1YEFu2FmFdTy8giE8yO6mxguW2QIbPQ+zmM605jl4KGIGuXSVYI+ZISxxcHVtOYp5ZdpdGmFjeXCezAO7H4=
X-Received: by 2002:a2e:bc05:0:b0:309:1fee:378d with SMTP id
 38308e7fff4ca-327fabffbacmr4108641fa.19.1747286102623; Wed, 14 May 2025
 22:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 15 May 2025 14:14:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
X-Gm-Features: AX0GCFsVWAlFc78NCzefbym3f3XYHOMbrgX-CSSxcc6sTaFkIB71yPk8BxAGX-I
Message-ID: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.15-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull some Kbuild fixes.

Thank you.





The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3=
:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.15

for you to fetch changes up to e0cd396d899805d56df91b989f8efad3a36df0da:

  kbuild: fix typos "module.builtin" to "modules.builtin" (2025-05-12
15:04:52 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.15

 - Add proper pahole version dependency to CONFIG_GENDWARFKSYMS to avoid
   module loading errors

 - Fix UAPI header tests for the OpenRISC architecture

 - Add dependency on the libdw package in Debian and RPM packages

 - Disable -Wdefault-const-init-unsafe warnings on Clang

 - Make "make clean ARCH=3Dum" also clean the arch/x86/ directory

 - Revert the use of -fmacro-prefix-map=3D, which causes issues with
   debugger usability

----------------------------------------------------------------
Masahiro Yamada (4):
      um: let 'make clean' properly clean underlying SUBARCH as well
      init: remove unused CONFIG_CC_CAN_LINK_STATIC
      kbuild: fix dependency on sorttable
      kbuild: fix typos "module.builtin" to "modules.builtin"

Nathan Chancellor (1):
      kbuild: Disable -Wdefault-const-init-unsafe

Randy Dunlap (1):
      usr/include: openrisc: don't HDRTEST bpf_perf_event.h

Sami Tolvanen (1):
      kbuild: Require pahole <v1.28 or >v1.29 with GENDWARFKSYMS on X86

Thomas Wei=C3=9Fschuh (2):
      Revert "kbuild: make all file references relative to source root"
      Revert "kbuild, rust: use -fremap-path-prefix to make paths relative"

WangYuli (2):
      kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
      kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to BuildRequires

 Documentation/kbuild/reproducible-builds.rst | 17 +++++++++++++++++
 Makefile                                     |  3 +--
 arch/um/Makefile                             |  1 +
 init/Kconfig                                 |  5 -----
 kernel/module/Kconfig                        |  5 +++++
 scripts/Makefile.extrawarn                   | 12 ++++++++++++
 scripts/Makefile.vmlinux                     |  4 ++--
 scripts/Makefile.vmlinux_o                   |  4 ++--
 scripts/package/kernel.spec                  |  1 +
 scripts/package/mkdebian                     |  2 +-
 usr/include/Makefile                         |  4 ++++
 11 files changed, 46 insertions(+), 12 deletions(-)


--=20
Best Regards
Masahiro Yamada

