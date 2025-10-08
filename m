Return-Path: <linux-kbuild+bounces-9052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA940BC6CF8
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 00:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E8A634D4F3
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 22:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963F8247295;
	Wed,  8 Oct 2025 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KO6HrilE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473384039;
	Wed,  8 Oct 2025 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759963623; cv=none; b=hEL6gKp/3bKzPl8nhi32xfhqIsTOG9ajsm1w+ErfEi4o8PuQfwNY1t4rdu097CP5fdjYvSWWq4IwglsllG1AEL+SQEuHvu2Odp4KfpXNGdHdXQVl1veBF+qapmqroLyYFUSWbxDTt2uFigEGD/4WjiZd7/X0Ho/xzB9TYvczYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759963623; c=relaxed/simple;
	bh=vy0cdTjBCP17fnaUtam7ndt5AAkcVL5PvEI4IC1UcA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RzaC0WGW6OMAA04bcvM4EKzuqfNf2njD4IIXoL/nCnNAfSNgUHhBW+78Ng0TVS5LwZW0GiLDZUQ5MyK2PLo2OukQtbgcaj3qyDvGDvFrL3kYicULKAj1kcP+SpzXk1l48IyWqnnoEztBZO//QDuPSC+lw5UYTSsvszvFAueTvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KO6HrilE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3DAC4CEE7;
	Wed,  8 Oct 2025 22:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759963623;
	bh=vy0cdTjBCP17fnaUtam7ndt5AAkcVL5PvEI4IC1UcA8=;
	h=From:Subject:Date:To:Cc:From;
	b=KO6HrilErsxh11FruCjdBhaLifunJhKM1uD3q622E9iAFsp+YvXTiBkQuJXT4TK9G
	 OZKzhd2e5k2Hza804aygqnXmhO8QmTcEVNH9PUXtRmrRE0kFMrvjtXF4ipgDv1KN6E
	 vLBljLljtB5EPtkJ89YZoLS6Qu+uHBsGu5X9/6++V/OpySr3bi665KTTDgV9kPQeDh
	 6+n/EjKjFc1JbGID+r80lkKCUuhxD0lfuzsj0JLdhjwUJ0rpnZmRWGTEd/qg1KoM9p
	 Jxur4YGCk5AwD+p2qzrorimK7kPZrrWXlNl0qQQq3TPmkxQWOcPXIa5SfL7hzxylnb
	 zFNXM6i+kCMuw==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] kbuild: Fixes for fallout from recent
 modules.builtin.modinfo series
Date: Wed, 08 Oct 2025 15:46:43 -0700
Message-Id: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPp5mgC/x2N0QrCMBAEf6XcswdJJWD9FemD9jb1qCblDkUo/
 XejjwM7Oxs5TOF07jYyvNW1lgbx0NF0v5YZrNKY+tCnGMKJl9tLH8JZP/ysoiVXNswG/5nOQ8I
 xS0xRMFE7WQ1t+g9cxn3/ArMY+PhwAAAA
X-Change-ID: 20251008-kbuild-fix-modinfo-regressions-95e3fd151dec
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=nathan@kernel.org;
 h=from:subject:message-id; bh=vy0cdTjBCP17fnaUtam7ndt5AAkcVL5PvEI4IC1UcA8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnPXj52OX67+ZFJ/fK1mUlm8zdwSsZPVZi2+vitt27da
 z/ol4nv6yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATObuJ4X+Q/b7T6lpOAhKL
 X1oFxi90vbrBt/+Wef3/Cxt2hPyvj1zL8FdYYwGr6Yewet4KtaxJ2gwlx2wmBc6oqJC4prV/nlV
 dEwcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This is a series to address some problems that were exposed by the
recent modules.builtin.modinfo series that landed in commit c7d3dd9163e6
("Merge patch series "Add generated modalias to
modules.builtin.modinfo"").

The third patch is not directly related to the aforementioned series, as
the warning it fixes happens prior to the series but commit 8d18ef04f940
("s390: vmlinux.lds.S: Reorder sections") from the series creates
conflicts in this area, so I included it here.

I plan to send at least the first two patches to Linus by Saturday for
-rc1 but I will take the third with an Ack.

---
Nathan Chancellor (3):
      kbuild: Restore pattern to avoid stripping .rela.dyn from vmlinux
      kbuild: Add '.rel.*' strip pattern for vmlinux
      s390/vmlinux.lds.S: Move .vmlinux.info to end of allocatable sections

 arch/s390/kernel/vmlinux.lds.S | 44 +++++++++++++++++++++---------------------
 scripts/Makefile.vmlinux       |  5 ++++-
 2 files changed, 26 insertions(+), 23 deletions(-)
---
base-commit: 38492c5743f8b7213ca86f0cd72ea625af35d5ef
change-id: 20251008-kbuild-fix-modinfo-regressions-95e3fd151dec

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


