Return-Path: <linux-kbuild+bounces-4296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9B9AD3E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35EF285A14
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E761FEFC2;
	Wed, 23 Oct 2024 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3eT8NkT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98201FEFBA;
	Wed, 23 Oct 2024 18:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707523; cv=none; b=mt03BipOIqU6U9d4iKyN7MWujZ2eh9plLheVrVjBltwzlTjC2RrnkRm4cgjHBxv2kpzt1jCG5bRGsyyuYeiLtG0eUNFTE0WA3ZhopFzyPZXnQsuUPowjWLmDSQ1BChsraJ1Wj4N4egnt8muTCpFma5nllnRKjcN4e2stin2P/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707523; c=relaxed/simple;
	bh=bBkWm6b5FnrriFJ7mmupA76YK842HVi3CQmnB9tpUjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7yvhirXfrV6BezPi+42J/rGAQ3rXK3hY8dahAfIjmXAljTuAFtBzh200n3bRHt6McLcWfdvwT7YRteh89ri81qbmoFPHaFaG6gx2dPzASpjngkGGLlUfs3+BJ8PyeZBQDSGK/2QBoL0th0OrTSTZxzV5gh/NkgkLPv5UKGkazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3eT8NkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15E3C4CEC6;
	Wed, 23 Oct 2024 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707523;
	bh=bBkWm6b5FnrriFJ7mmupA76YK842HVi3CQmnB9tpUjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t3eT8NkTIrEOJpWU3e5lGyv0l4qeGjHpLUlya0aa89w2cCt9hoH+V/2OZFCHmcEn0
	 txaiHLMQry334Y52Teib3GBte3M2qmzObC97QBiKGwIpnWPZQuLblH6w9y4n6zxKXf
	 MZm9M610qHu063NIRlrgiiqMFJhXudnfd2RGlLq0WJCo5ABAg77TbSt+h7hJXScJ+R
	 cwpV3n5QR+ojhWyPQtD2uR2EhvcktgMuStfE8dkkxlf5k7hFXVTqAdOJp7UDSOgXlv
	 X694jbcKVCKGEgm+NtXJ6g0tuv3PrUgv2gpt0mavmOfAS8dNFD0wFnKQb9OB6jrIkV
	 bDFm6PM/egbsg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] kconfig: qconf: remove unnecessary mode check in ConfigItem::updateMenu()
Date: Thu, 24 Oct 2024 03:18:03 +0900
Message-ID: <20241023181823.138524-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The P_MENU entries ("menu" and "menuconfig") are never displayed in
symbolMode.

The condition, list->mode == symbolMode, is never met here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f59a9597f09b..6c92ef1e16ef 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -110,7 +110,7 @@ void ConfigItem::updateMenu(void)
 
 	if (prop) switch (prop->type) {
 	case P_MENU:
-		if (list->mode == singleMode || list->mode == symbolMode) {
+		if (list->mode == singleMode) {
 			/* a menuconfig entry is displayed differently
 			 * depending whether it's at the view root or a child.
 			 */
-- 
2.43.0


