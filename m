Return-Path: <linux-kbuild+bounces-9096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA6BCFC44
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Oct 2025 21:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04C5A4EA4BD
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Oct 2025 19:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE8B284B42;
	Sat, 11 Oct 2025 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upoTlwYD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5284E20296C;
	Sat, 11 Oct 2025 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760211810; cv=none; b=mhDXv9jlcECq1LAGp7/oQ00ocLRfjSFryeCZAMHNIU36BkTbVs3U5B5hMP/J5f+XHZ2zPJoTGVCSV0l82UtIfayD8DjAFq3wOZmHgMDXxpgDh/Wp4Kng3sASXvqVdMDFVqqkPsPGkMKyLi7onf2XiMaVssXP32tUJsdjwyZslVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760211810; c=relaxed/simple;
	bh=nUg2lj2FDA74GnWLIi3HhN5FD/fRKPsazJJBetmYtkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZNDPtjzpkaT5pgGY/GQiI0R6oyGX9mN9+PLUek76jHe9Ko/fFmIXaFnV4XiVM1mh/pXlNNHRT16hxVSTad8wxvATGqKLgQZWOHhSKKgEbPW0sru6nkA+39DlT9nVigBxvz8UkKaiQ9I53yzFBj6eH95pmcRUHlvSRSi7jX9px0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upoTlwYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2813C4CEF4;
	Sat, 11 Oct 2025 19:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760211809;
	bh=nUg2lj2FDA74GnWLIi3HhN5FD/fRKPsazJJBetmYtkU=;
	h=Date:From:To:Cc:Subject:From;
	b=upoTlwYDl/xVDZb33Xpu+6RPmX+ZTXPtNWZttoDmL1HOYL55s7bZ+F67w4d9E1vJy
	 bRUTzow3ACykzMTIrd9bK+DDYl524PqLggVs9o0swdUjkCcdt6fEU+t7CfSAe56L2s
	 lTsqDeA+XEk9cOc8DgqawZBA9lGKHYnd4KHYNRXAJnlFfiQ4EmCYO8PrjRzCM5z9Rm
	 Z39sIgOcf2YlKwLyTocxY1wZKfObjGtXrOyU+KVvtk6TMIFlTZakuP3CImLApRkNU1
	 FslYjabWhazUQTtbFdnKg7a3ekhisfz8j8pqI/CFSV75SVkEmhCyrBWXoILPYudltZ
	 CAJWTqyYcLsig==
Date: Sat, 11 Oct 2025 12:43:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 6.18 #1
Message-ID: <20251011194325.GA1123518@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull the initial round of fixes for Kbuild for 6.18. Everything
but the final change has been in -next for a couple of cycles but I
wanted to record some last minute tags so it is recently rebased.

If there are any issues, please let me know.

Cheers,
Nathan

----------------------------------------------------------------

The following changes since commit 2ea77fca84f07849aa995271271340d262d0c2e9:

  modpost: Initialize builtin_modname to stop SIGSEGVs (2025-09-28 07:54:07 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-1

for you to fetch changes up to b0f2942a16017f88395d768afedd7373860968ce:

  kbuild: Use '--strip-unneeded-symbol' for removing module device table symbols (2025-10-10 14:50:35 -0700)

----------------------------------------------------------------
Kbuild fixes for 6.18 #1

- Fix UAPI types check in headers_check.pl

- Only enable -Werror for hostprogs with CONFIG_WERROR / W=e

- Ignore fsync() error when output of gen_init_cpio is a pipe

- Several little build fixes for recent modules.builtin.modinfo series

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Dmitry Safonov (1):
      gen_init_cpio: Ignore fsync() returning EINVAL on pipes

Geert Uytterhoeven (1):
      kbuild: uapi: Strip comments before size type check

Nathan Chancellor (6):
      scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e for hostprogs
      kbuild: Restore pattern to avoid stripping .rela.dyn from vmlinux
      kbuild: Add '.rel.*' strip pattern for vmlinux
      s390/vmlinux.lds.S: Move .vmlinux.info to end of allocatable sections
      Merge patch series "kbuild: Fixes for fallout from recent modules.builtin.modinfo series"
      kbuild: Use '--strip-unneeded-symbol' for removing module device table symbols

 arch/s390/kernel/vmlinux.lds.S | 44 +++++++++++++++++++++---------------------
 scripts/Makefile.extrawarn     |  8 +++++---
 scripts/Makefile.vmlinux       |  7 +++++--
 usr/gen_init_cpio.c            |  5 ++++-
 usr/include/headers_check.pl   |  2 ++
 5 files changed, 38 insertions(+), 28 deletions(-)

