Return-Path: <linux-kbuild+bounces-9424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F3C37B7A
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 21:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E527D188E65B
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 20:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33204314B90;
	Wed,  5 Nov 2025 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdpAEQ98"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E02FDC42;
	Wed,  5 Nov 2025 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762374453; cv=none; b=p2Apr27gW5AaB6Cepk7aYC3dfA9bBdkWKGfJMO+CSTBNlgiTHmFavb8oXqOQDKJ/mzaVTrbqVMyN2QZtrFDDmQDI7edui+8NkX7msoH7bPPIj/EPnhmHek6FSU09a8V7tU7wel3a6JwpOJxXzxoa8+SKADZehEQcZGa3r5EOHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762374453; c=relaxed/simple;
	bh=+l6IMtV7/7/5N+iAY6v6JhQRf86QBpHaxsx2k2YAs7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uCr34J77BOFSKnr6tWJpD2Mp08Skj5Cau4oFReZ9S2P9S0hUY1k2OCe1RcC3Fz6xzCbT7CbTs6WWoI8nxT5k3ZRtbJTogAHeVsMBLbkvkkl0bnbkVRVBulx9lfSCk2/JPrmSyBS9sudYbyVNZ6Ir9cC/P5MFYm8iYx2Lx3H4GBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdpAEQ98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223D2C116B1;
	Wed,  5 Nov 2025 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762374452;
	bh=+l6IMtV7/7/5N+iAY6v6JhQRf86QBpHaxsx2k2YAs7U=;
	h=From:Date:Subject:To:Cc:From;
	b=KdpAEQ98h1E2wEudFML8dqvBrQn4Hn6uZ5kH4hBPb6erq9lY4ttzKZTXk5oeLYPuk
	 VeR6XRsPL/YibjSpbdkB+k7l97i0Jqxswbu0+sPtxpk0HJRE6GX+dECsH7A/06+IYA
	 OxabSL/xCEtqf5CN81Hsirc+NdqpMEIzETxNS502G2zrOqwmryQ7GHozM2AX30nGkP
	 fb6xFzsBGT0RXGpL8ymr7raqq7cigG3jb96MzyRkFNwOF8dMozYK5FCJxt7kFLQohG
	 IVMpUahuFqHPEvrAmS0+DVvEEobqOJ+tWnmMLanwJNUwG4OwuynbtxYoJgY77i1qvH
	 q43nUUiVp21Ag==
From: Nicolas Schier <nsc@kernel.org>
Date: Wed, 05 Nov 2025 21:26:02 +0100
Subject: [PATCH] scripts: headers_install.sh: Remove two outdated config
 leak ignore entries
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-update-headers-install-config-leak-ignore-list-v1-1-40be3eed68cb@kernel.org>
X-B4-Tracking: v=1; b=H4sIANmyC2kC/x3NQQqDMBBG4avIrDuQCCL0KqWLqfkTh4ZEMrYI4
 t0buvw2751kaAqj+3BSw1dNa+nwt4GWVUoCa+im0Y2T927izxZkB6+QgGasxXbJmZdaoibOkDd
 rKrWBs9rODjJ77+f4gqMe3RqiHv/h43ldP/XpvFSAAAAA
X-Change-ID: 20251105-update-headers-install-config-leak-ignore-list-0ea71117fbe0
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762374361; l=1089;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=+l6IMtV7/7/5N+iAY6v6JhQRf86QBpHaxsx2k2YAs7U=;
 b=Zin6VMinayHDUup+1jD1wgVx8JV98kqQzTUIP9mLwk/IOsnEADQJapUIGV6n+BTXd9xoWeEbM
 3b5usq+k2YKCRL8PsjE5jwR/vS+NcQEl22EJeRvqRw3hCsWTc8Pz+qD
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

Remove config leak ignore entries for arch/arc/include/uapi/asm/page.h
as they have been removed in commit d3e5bab923d3 ("arch: simplify
architecture specific page size configuration").

Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/headers_install.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 4c20c62c4faf..0e4e939efc94 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,8 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
-arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
 arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
 arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251105-update-headers-install-config-leak-ignore-list-0ea71117fbe0

Best regards,
-- 
Nicolas


