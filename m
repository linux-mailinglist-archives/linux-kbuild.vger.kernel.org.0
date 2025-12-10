Return-Path: <linux-kbuild+bounces-10041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2808CB22D1
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 08:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDDDD3069549
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 07:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7682B231858;
	Wed, 10 Dec 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqw8AVqZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5122A1D4;
	Wed, 10 Dec 2025 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765351040; cv=none; b=fz6gvnzJujrGAl8Hvrwvg1l4+LmdG1+BrT5i/1QazlZ3fuyZ78ktv2FcWHGzxFh08UE+Frr36RUOomJvkXRp1lzEyYRAv3LQWAPZLR7Io5q+lNOHJ+3SbW0p5ICzBbevoV3jSpc70miZbGKiRI/IGY4qV7mOmotA+IY2GN8jES4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765351040; c=relaxed/simple;
	bh=eMiRLuXBhClK2+tci3p2R5z1acpw2/WKR5xG9n6i/3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8WX+/pQBcT6Mr7X91BbAHuJEVMPidaqFE6JVBC3gkw+vK7WjoFleR0IqS9rZQSlEMCA+c+skH1aU0iZC5Hy6Yq3AS80TAhZJnBwIP2XSuWI5mr64LJZ/7XWtevlIFNcW6hHF3t95/7ykjNA8TRVwEEn43xRFSA/+2J0x3wDziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqw8AVqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91283C4CEF1;
	Wed, 10 Dec 2025 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765351039;
	bh=eMiRLuXBhClK2+tci3p2R5z1acpw2/WKR5xG9n6i/3w=;
	h=Date:From:To:Cc:Subject:From;
	b=Vqw8AVqZrd72rACWo81wJo9AcjrvM1AIFsgUS0LcIfFsYYLPkpP9sYEkD/n3zRC9P
	 ZSXSTL13PDPpJhH/B2p9md2JdiWERSA1xw7rTw8eJN862nPF7i/eyXwsLR4Ula+/Q1
	 j6ZNbyteSCNe/LuKpGkpTWw0jQmB33YcXN34Gglm2IQNFA6sWbOJah7yIt/7gxF8wR
	 UMRz15dFrorq3QIICNsYJ3xbJENDHt5M0K1yCzxsV1m4WnN6+A+ZCmDX2vfgfBST19
	 hd0nvuwxDcGq/TuvY+6Z8XV8AXZxBPyoL/cF8/As4J1qqDeJXxBMftRthIaAtAqAla
	 nHjh4HkUNoaPA==
Date: Wed, 10 Dec 2025 16:17:15 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild for 6.19 #2
Message-ID: <20251210071715.GA1138940@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this single Kbuild change for 6.19. This really should have
gone into 6.18 since it has been in kbuild-fixes for almost a month but
I was sick over the Thanksgiving break and I wanted to make sure I did
not step on Nicolas's toes for 6.19.

Cheers,
Nathan

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-2

for you to fetch changes up to 4ab2ee307983548b29ddaab0ecaef82d526cf4c9:

  kbuild: install-extmod-build: Properly fix CC expansion when ccache is used (2025-11-11 22:31:34 -0700)

----------------------------------------------------------------
Second round of Kbuild updates for 6.19

- Fix install-extmod-build when ccache is used via CC

----------------------------------------------------------------
Abel Vesa (1):
      kbuild: install-extmod-build: Properly fix CC expansion when ccache is used

 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

