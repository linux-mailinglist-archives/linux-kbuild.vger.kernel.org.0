Return-Path: <linux-kbuild+bounces-9271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD029C032C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 21:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEA3B4E93A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 19:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C21734B673;
	Thu, 23 Oct 2025 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZunOBhgW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7A26FDB2;
	Thu, 23 Oct 2025 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247529; cv=none; b=O6KelR8EH7MxgEacXv8kXJsO5bU/gRcRDVr7gJCvSDwqjvoreip37miXHCBYN8JVvhTX8QWFBRSQ29Jltp6ORf4RNVYiFbcCnrvSL+h+vcgK8g3zwlMQz7GjByP9sEWMmoVmLXckwS5mJZiKpbhtcs2octr34C01InLaIUB8efY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247529; c=relaxed/simple;
	bh=SxeCPtVXN96k6/3jzE911HEut+z3rMSWiGO603OzLjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l/4Aymj5PDq/znkKlIuwirEjECP6iDEYLjjjhY3UFgticDqxCd2IgEh0Q4b4ah2odCDbRuN/JGWWfvdEKhqO/Tzj17nq+U0ofwVpW32lkK7W29FFHqFs2gpEavT6smN8UIM0bzAko2E2Jc7NHA7btfJZUXc+EVsoPVqf7nUoGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZunOBhgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10CFC4CEE7;
	Thu, 23 Oct 2025 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761247528;
	bh=SxeCPtVXN96k6/3jzE911HEut+z3rMSWiGO603OzLjA=;
	h=From:Date:Subject:To:Cc:From;
	b=ZunOBhgWZ0/bddAkC1/4GNqm3ECAnmtss60tAWR96YTikMyGs0dM6M5ZS52Y6xnKS
	 4uP+vSRxeSIfC6DzfcQ3OgcKMl+Ox2QnajJ9NaBUgh2WZHY5pNRwtOUKloYZsT0edA
	 7ZRf0YdokMqpf/CMI5s0ZQW/NdlC/eHdjRlYhVSGtB4tW3w+Y8Vh94aTM0LsfsUJ7i
	 HRhwCoMVCnODyEtlL7QTN+8ZyTkkU6fA0R1DN9n8SMVMrBPpNVHpWlLWJNQd+whXkx
	 wtTWlut84+wDzxCQdRzrPUqxBetf4VXre1YUg6wR6boWS2EojTjp8HEQjD/Hb5oudb
	 Z988pDo6QPXIw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 23 Oct 2025 21:25:20 +0200
Subject: [PATCH] MAINTAINERS: Update Kconfig section
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
X-B4-Tracking: v=1; b=H4sIAB+B+mgC/x3MTQqAIBBA4avIrBsopYKuEi38GWuILLQikO6et
 HiLb/MyJIpMCQaRIdLNifdQ0FQC7KLDTMiuGGQt26aWCq/D6ZNwtXvwPOOmOZwligldp3rqtTH
 SOyiDI5Ln55+P0/t+FCIS1GwAAAA=
X-Change-ID: 20251023-update-kconfig-maintainers-d637e7abb2fd
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=nathan@kernel.org;
 h=from:subject:message-id; bh=SxeCPtVXN96k6/3jzE911HEut+z3rMSWiGO603OzLjA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBm/GtWdLJ+9klv9fZ/wy5KiyBzGOd+cGHL8p4gVzN6+j
 YGlMTSmo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwk4SXDPyXJyL+sK94uSHdh
 ++U05+RRz/cCC8WZfjBM2ar/YdGUubcZGV61rb9TNee3WUbrKrYl4XoPrbOFb8c+23W77fny1Bn
 bVnAAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Masahiro Yamada stepped down as Kbuild and Kconfig maintainer in
commit 8d6841d5cb20 ("MAINTAINERS: hand over Kbuild maintenance"),
leaving Kconfig officially orphaned and handing Kbuild over to Nicolas
and myself. Since then, there have been a few simple patches to Kconfig
that have ended up on the linux-kbuild mailing list without clear
direction on who will take them, as they are not really sent to anybody
officially, although the list is obviously watched by the Kbuild
maintainers.

Make Nicolas and I official maintainers of Kconfig in "Odd Fixes"
status, similiar to Kbuild, so that the subsystem has clear points of
contact for contributors, even if significant contributions may not be
accepted.

Additionally, add the Kbuild tree to this section.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
We are going to de facto maintain this so we might as well make it
official :) I will take this via kbuild-fixes at some point.
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..1471e1bf1510 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13415,9 +13415,12 @@ F:	mm/kasan/
 F:	scripts/Makefile.kasan
 
 KCONFIG
+M:	Nathan Chancellor <nathan@kernel.org>
+M:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
-S:	Orphan
+S:	Odd Fixes
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
 F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251023-update-kconfig-maintainers-d637e7abb2fd

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


