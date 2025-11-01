Return-Path: <linux-kbuild+bounces-9345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCAC2786F
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 06:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 34AAB4E3AE4
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 05:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1C7255F5E;
	Sat,  1 Nov 2025 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWMMSKsP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CF1E231E;
	Sat,  1 Nov 2025 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761974089; cv=none; b=NTEU/LaFvogxNzSyqOf87NJa3XXNCgLzHmyQW3WjLJgG6XhOuS5iVhP1J2lpdm2qPkVDotLb8LKa5aMpR30LLleqVYsTIsOExpV9rhwTSMhViWDk5fwSxJBdCuZI2fXyRN+cDoAYSMA1uen8x7sKddy0qM0QCAZmH9t26/Xy7Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761974089; c=relaxed/simple;
	bh=RXwe6S488IbxW1neMJAmvFf+Z0nWy+JzUQNS9oD7Olw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqinoxWaimVwlhunc7oSG9iUC7uuMPJpHN1kr4h/6K530ky1VHrkEeDyvWXqV5CaqCyvqhcCL/AfYEB0tzjWFurQybi7RkBAxN/t67YneIpRTOybxDPtCvSzs7VemVuOim/fbiM9Lh8DcF/ri64BNY24M86DHQ0SdJ1TX2772eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWMMSKsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69003C4CEF1;
	Sat,  1 Nov 2025 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761974087;
	bh=RXwe6S488IbxW1neMJAmvFf+Z0nWy+JzUQNS9oD7Olw=;
	h=Date:From:To:Cc:Subject:From;
	b=XWMMSKsPXPoeKIITfEwf9TAQc4Z44nu8dZHBU8yA6C7Y2m2iUQV8Wwv+st6W9qI7i
	 zRfRw++F0E/yfMjwlOSwZpzufxKWVtGWBnpWsUHA8k5W7RXTtSA9n2jMh/43E6mHDE
	 JsHosyfa2Zkh5OTFdJvrVKF+OfSp9cb+tqWOEMqXchs24lhZhG1xHP93ULqoiUK74N
	 2STqR6tHh1C1Mt1oUzlStR8XCbflunJbcM2+3Ly0yBAkKNjD6D+gwuvXyZsKhtoLNw
	 DyusWYp1QRfWezm3ctV8QzjNsFsOYTt31p6yPDYf1svH2js/ciNF3290GGQM6Yl7a/
	 MYi6GMuWrGyCQ==
Date: Sat, 1 Nov 2025 01:14:43 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 6.18 #2
Message-ID: <20251101051443.GA3427600@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull this second round of fixes for Kbuild for 6.18. The top two
changes have not been in -next but they seemed low risk enough to send
along without soak time. If there are any issues, please let me know.

Cheers,
Nathan

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-2

for you to fetch changes up to 43c2931a95e6b295bfe9e3b90dbe0f7596933e91:

  kconfig/nconf: Initialize the default locale at startup (2025-11-01 00:23:22 -0400)

----------------------------------------------------------------
Second round of Kbuild fixes for 6.19

- Formally adopt Kconfig in MAINTAINERS

- Fix install-extmod-build for more O= paths

- Align end of .modinfo to fix Authenticode calculation in EDK2

- Restore dynamic check for '-fsanitize=kernel-memory' in
  CONFIG_HAVE_KMSAN_COMPILER to ensure backend target has support for
  it

- Initialize locale in menuconfig and nconfig to fix UTF-8 terminals
  that may not support VT100 ACS by default like PuTTY

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Dimitri John Ledkov (1):
      kbuild: align modinfo section for Secureboot Authenticode EDK2 compat

Jakub Horký (2):
      kconfig/mconf: Initialize the default locale at startup
      kconfig/nconf: Initialize the default locale at startup

James Le Cuirot (1):
      kbuild: install-extmod-build: Fix when given dir outside the build dir

Nathan Chancellor (2):
      MAINTAINERS: Update Kconfig section
      KMSAN: Restore dynamic check for '-fsanitize=kernel-memory'

 MAINTAINERS                          | 5 ++++-
 include/asm-generic/vmlinux.lds.h    | 2 +-
 lib/Kconfig.kmsan                    | 2 +-
 scripts/kconfig/mconf.c              | 3 +++
 scripts/kconfig/nconf.c              | 3 +++
 scripts/package/install-extmod-build | 2 +-
 6 files changed, 13 insertions(+), 4 deletions(-)

