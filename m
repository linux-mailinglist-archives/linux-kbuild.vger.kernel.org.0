Return-Path: <linux-kbuild+bounces-9461-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB390C43788
	for <lists+linux-kbuild@lfdr.de>; Sun, 09 Nov 2025 03:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE6834E123B
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Nov 2025 02:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF3D1E834F;
	Sun,  9 Nov 2025 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgIZkOFk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997934D3B7;
	Sun,  9 Nov 2025 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762657002; cv=none; b=jaYqAICU+dVw2bjX/6+5jr9tC/sJ7laX3UezMRHh8mBuuoS6HwdHMc0OY4bgQud8pIuGuNVR23ZFpo7s5YTuYzWH7xE05vakQidwXvSDpF9ZRlH1SyZI849yutoBrrOzuY35P8GyeZc+lOuwo9GG+uBh0kD1XMB/qxb2xLV3LS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762657002; c=relaxed/simple;
	bh=yuTRVgvx8hP46TcQ0fDqdPtAcVUoYqV6yys7+fBzToI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gk3enA3CNtNBtcon8UytFz+hM/Pj5BPHay9UdxiZY/uGAb/vtTfEiz9GY5FRDftQiqQhztK/u8wG3KeHpDHX2eYzDvKy9dUI9Fgt4dPTDV1iwIgHzftaGCy615jDZsHmYeZxIa3zpqg2c5a1qzkqNV5P4Q9+BhicY0L2ekSu6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgIZkOFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F76C4CEF5;
	Sun,  9 Nov 2025 02:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762657001;
	bh=yuTRVgvx8hP46TcQ0fDqdPtAcVUoYqV6yys7+fBzToI=;
	h=Date:From:To:Cc:Subject:From;
	b=UgIZkOFko7dlbKEEZIxsF1szn91gmLLOSB1/XqutpxUkXIktzWuW78IdEHB3ercHz
	 s04zDOsqAPXGAPNjmu0JynvqPIp+LXD74s+RhW4trvtg9Ic8+RcFaxQ90MTXuZIKqc
	 ZGZogB7OpITVwoaTKvhiFSSX8KHhNaClNRHCmm6QK7I2Dk0hkP6M1qFijVPYvFGOWM
	 frR/WHGw+90+yKbBv12x0xoTohanaat6f2tLv/DAgNH0JCgrw786uTTk6fZd+vpepr
	 taMxTWy/Y46nSyvMX8HolEAnEcjVn5i+Gh9GDekEGFSsAiU0YM5lvclj6hGu4TYati
	 aWwvJp4du9C0A==
Date: Sat, 8 Nov 2025 19:56:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 6.18 #3
Message-ID: <20251109025637.GA2001503@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these three fixes for 6.18. The first change is a regression
fix for a change that came in the last kbuild pull request and the other
two are low risk changes to ultimately address build warnings. If there
are any issues, please let me know.

Cheers,
Nathan

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-3

for you to fetch changes up to 002621a4df3c166fab1427e8e502bc15acc26b13:

  kbuild: Let kernel-doc.py use PYTHON3 override (2025-11-08 19:42:22 -0700)

----------------------------------------------------------------
Third round of Kbuild fixes for 6.19

- Strip trailing padding bytes from modules.builtin.modinfo to fix error
  during modules_install with certain versions of kmod

- Drop unused static inline function warning in .c files with clang from
  W=1 to W=2

- Ensure kernel-doc.py invocations use the PYTHON3 make variable to
  ensure user's choice of Python interpreter is always respected

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Jean Delvare (1):
      kbuild: Let kernel-doc.py use PYTHON3 override

Nathan Chancellor (1):
      kbuild: Strip trailing padding bytes from modules.builtin.modinfo

Peter Zijlstra (1):
      compiler_types: Move unused static inline functions warning to W=2

 drivers/gpu/drm/Makefile       |  2 +-
 drivers/gpu/drm/i915/Makefile  |  2 +-
 include/drm/Makefile           |  2 +-
 include/linux/compiler_types.h |  5 ++---
 scripts/Makefile.build         |  2 +-
 scripts/Makefile.vmlinux       | 15 ++++++++++++++-
 6 files changed, 20 insertions(+), 8 deletions(-)

