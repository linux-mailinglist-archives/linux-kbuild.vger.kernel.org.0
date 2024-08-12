Return-Path: <linux-kbuild+bounces-2945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8994EC15
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 13:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02D711C21105
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 11:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64710178374;
	Mon, 12 Aug 2024 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGnbADwP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCC0178372;
	Mon, 12 Aug 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463429; cv=none; b=cFZlwWinV/TyxX5wvj3REJdbVylqwGqhlhP/N9+pvZvKnVeejPBLGfJDgiVut0Fger5Yh7BP8Eh9BQv3aD0qtK3Ce/lLJ071a0InKw4lPR4gcxjBwUTfwtrPlVcg/OtqRPfyampmU3HFvAWudXX9GbEpvWpGTJpRKOWw6Yoxvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463429; c=relaxed/simple;
	bh=OQWIwP9PhXAySimWeo7mKueNK2l0AjWu9fXY62Xe7kE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DnsWN9zGPWU3pXBz6M2hYVuBJyXCIz3vtWKITZ+i36dtDH3reL1iuV3ltoZSPcu3L6EiViyXaRKQli/9UTH4Gob+afx3X5i8lI6YT6UcqApXYurEZx0BLjMN+zejwmW3XNz+toLbLT4/cNid1CXamivVFeDnfjufF+iGS6E17iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGnbADwP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E11C32782;
	Mon, 12 Aug 2024 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723463428;
	bh=OQWIwP9PhXAySimWeo7mKueNK2l0AjWu9fXY62Xe7kE=;
	h=From:To:Cc:Subject:Date:From;
	b=rGnbADwPUkeV3UN3bFXFF3s8qVL/upNiwAH42lmSrKKoF1z1lP0DxYvUbYvfMaOM+
	 ik53hQtCgfOfNmLOVoZeL+QuaD19tr3WCYFghs8YUTi8hGSWNRBb2+8p6xMHU+RPfu
	 xR15eUXU0MWVpR2ChaHBSl89sGfwDc9eRugnaZLysoCuO5fbn9b1FdDI14pR6Q7RFW
	 MpoaCTn/7uIqM00n3bmTOD3Nvro0yrioj41iALes7difeIQbJWdf5Z23TPs0XQ9WQq
	 KQEqJQQ0cFoAbblmgOQewMYTMLGWNykdROzuIbgxU2USwEPSI2wU1weu+cIWxHq2RA
	 MqT5RSozOwwaw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] kconfig: remove dummy assignments to cur_{filename,lineno}
Date: Mon, 12 Aug 2024 20:49:45 +0900
Message-ID: <20240812115023.2101419-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ca4c74ba306e ("kconfig: remove P_CHOICE property"),
menu_finalize() no longer calls menu_add_symbol(). No function
references cur_filename or cur_lineno after yyparse().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 61900feb4254..e03731184840 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -530,14 +530,6 @@ void conf_parse(const char *name)
 		yydebug = 1;
 	yyparse();
 
-	/*
-	 * FIXME:
-	 * cur_filename and cur_lineno are used even after yyparse();
-	 * menu_finalize() calls menu_add_symbol(). This should be fixed.
-	 */
-	cur_filename = "<none>";
-	cur_lineno = 0;
-
 	str_printf(&autoconf_cmd,
 		   "\n"
 		   "$(autoconfig): $(deps_config)\n"
-- 
2.43.0


