Return-Path: <linux-kbuild+bounces-3159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8C95BE11
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 20:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E401C235C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 18:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE84D12FB1B;
	Thu, 22 Aug 2024 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXhk7Rhh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8973514;
	Thu, 22 Aug 2024 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724350606; cv=none; b=KT3P6fUkQo0ZxQVHA6vSZRC+NvmMAXOoWK+6HLifRi849ayu++MtdWajBJyE9R4yVz5WFCE3cEEeFDFJwcREFGZt766+aUPEcq0K0ePFtBsjHq5gZ86o7JorQCVagiW1kQOQAnqlnHx6EBjN1udc8wMf7JuM0miaNPuoNSJUDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724350606; c=relaxed/simple;
	bh=sOfxd46WO7U7N9DBUnZ4f41t5HJqpb3HZtZgn4ugtUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hhcV2R1CbnDl62zgmAg6EAObizCc1NL5fkRn7VscFK/0w/S3lSYsk0nJt1zpE/FAny8YIzflWAY1CsWvaAS2CFrMTqj7PinzuRiq/QbrLC7bYeLgM+U8TD3DpZllB1TqPnLLkzpPIciCqumD/Sqo/TfPYQ8VRFXu1ouE6/McWLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXhk7Rhh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58829C32782;
	Thu, 22 Aug 2024 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724350606;
	bh=sOfxd46WO7U7N9DBUnZ4f41t5HJqpb3HZtZgn4ugtUU=;
	h=From:Date:Subject:To:Cc:From;
	b=bXhk7Rhh3TukDnqjfC73MKlquG4k87ProjOj5FUMkKMn0N2Dv/8URHldrFlhkylGF
	 syqIGkQoi6xAxYqpOLKRh/rLkXo3tyKuYB80PlPMd7flKIS3zIL8RFVr88Dj9paARf
	 QWSgnNsFtbEptSf9D8UGZw1mPsV569UDdm80Mqvwj2HgDp29XJYGKvjUcZjsXgAWle
	 M5HJY77Kwq9y+lsEL+5xuCYuUqRV9Zqx1L5AusYA5ur/UI9E3mOghg1lhqBjFyr05y
	 8wMjcsRiexJNwroe46HTWMJBBMQde8bXKg5ToHL2cJwL9Ts30qzbbfoc5IGCuth+BH
	 JKZtNJggN+GWA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so11228931fa.1;
        Thu, 22 Aug 2024 11:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjOOvoUfPemJf/XdIGCuSK/QrJF+mVv0/2fORte0Bn1i9kO34Sfj4pPxx5bRqrwlWPvJvyXfBb46VYnr4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wYlwvyIKIdfRcbBnmNIJunWTjyRQkYAvsWKB4qx1gxFcGDc+
	c+tB+SXIf/DJlxJNFNcpxHUM/oEhGta1QeKl+YcN8uadGPOO7dTU8Nqe2UXW88z8Fbyz7icNzBC
	BUewK0rSVJZ2yQRBnaq0vJ1mCDwU=
X-Google-Smtp-Source: AGHT+IGrONMzhlvwK93Qtis27nBm4jkOhhg+q1m/50JAP/hDM4TkX/iuamwIapHAD5oLjUP+IAQGld+nvPoeL6z1Mk0=
X-Received: by 2002:a2e:4a11:0:b0:2f3:f828:efe7 with SMTP id
 38308e7fff4ca-2f405d9161emr17898791fa.16.1724350605042; Thu, 22 Aug 2024
 11:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 23 Aug 2024 03:16:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQX2tTZNnUD519Y1Kx5YxtnHy8WHPUB+L9K7ji_8nT89Q@mail.gmail.com>
Message-ID: <CAK7LNAQX2tTZNnUD519Y1Kx5YxtnHy8WHPUB+L9K7ji_8nT89Q@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.11-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,


Please pull Kbuild fixes for v6.11-rc5.
Thanks.



The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.11-2

for you to fetch changes up to 8fb4ac1cee88a57e7a56faba49b408a41a4af4db:

  kbuild: fix typos "prequisites" to "prerequisites" (2024-08-23 02:41:02 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.11 (2nd)

 - Eliminate the fdtoverlay command duplication in scripts/Makefile.lib

 - Fix 'make compile_commands.json' for external modules

 - Ensure scripts/kconfig/merge_config.sh handles missing newlines

 - Fix some build errors on macOS

----------------------------------------------------------------
Alexandre Courbot (1):
      Makefile: add $(srctree) to dependency of compile_commands.json target

Anders Roxell (1):
      scripts: kconfig: merge_config: config files: add a trailing newline

Javier Carrasco (1):
      Documentation/llvm: turn make command for ccache into code block

Masahiro Yamada (4):
      kbuild: clean up code duplication in cmd_fdtoverlay
      treewide: remove unnecessary <linux/version.h> inclusion
      kbuild: avoid scripts/kallsyms parsing /dev/null
      kbuild: fix typos "prequisites" to "prerequisites"

 Documentation/kbuild/llvm.rst                         |  2 +-
 Makefile                                              |  2 +-
 drivers/accessibility/speakup/genmap.c                |  1 -
 drivers/accessibility/speakup/makemapdata.c           |  1 -
 drivers/staging/media/atomisp/include/linux/atomisp.h |  1 -
 samples/trace_events/trace_custom_sched.c             |  1 -
 scripts/Makefile.build                                |  2 +-
 scripts/Makefile.lib                                  | 28
++++++++++------------------
 scripts/Makefile.modfinal                             |  2 +-
 scripts/Makefile.vmlinux                              |  2 +-
 scripts/Makefile.vmlinux_o                            |  2 +-
 scripts/kconfig/merge_config.sh                       |  2 ++
 scripts/link-vmlinux.sh                               |  3 ++-
 sound/soc/codecs/cs42l42.c                            |  1 -
 14 files changed, 20 insertions(+), 30 deletions(-)


-- 
Best Regards
Masahiro Yamada

