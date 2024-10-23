Return-Path: <linux-kbuild+bounces-4287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7B9AD3D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5901C22003
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164F31D9A62;
	Wed, 23 Oct 2024 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUiP1NBF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04161D0943;
	Wed, 23 Oct 2024 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707512; cv=none; b=htTR7qk8nNdJBWwcy9fJRuUJtiSqaSk2gqVt/0J7GBYuNJp1YGcnSHJHXNz2Ca3U/pVAbGBa0dlEcMCNwVjGyGGw3BuxY6XeULVtKLvasub5AYPymrZF79BWj/lPcamuVMDAaHXnrM/TP6bBJfLMVXOLGNhCWHPc2mGygOQyeJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707512; c=relaxed/simple;
	bh=1Xw1GANyGX0qxoALffwPujd1Kewy0FeubsmLmM2gp28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc+LLfF77WFEnjhsM9fH6HCwLTyXc1T44utqzixHw7qnx5rq2JW3poe1qSF6r+tZvlCZFPkie6vzIlFZ546e5MX18SQz4uIct024+6oE9KaOhVoPOUKO5KgQyDyXFn5kAdyFqtR0X59nmJ/UWhVbUNS7o431+zMqE2Q3zRbZcTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUiP1NBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3342C4CEC6;
	Wed, 23 Oct 2024 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707511;
	bh=1Xw1GANyGX0qxoALffwPujd1Kewy0FeubsmLmM2gp28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUiP1NBFbrPZ+qQBL+DnidiI6bkbcvbaUb/SmyLRrowV+98mUorn7mOrgSXPz55J3
	 nGXSFe6ymf2eg0zzeJziqR25OmG7O7/V62aoWHh4quraVM+ZBP6MmtDuATzO+MXAF9
	 XT3jIYfoMqluehjGaKfpC80jw5MTH7Apz5Zcpl28f7mXV1FVx/mOfrNozeC5px8LqM
	 2KWO2I58I+M9+fm9oY2mCGwX7RuE/SzM6+jXbank0U9v4VdkQY1C8H5RRVyr0Pz9OH
	 cqczmSUBFfTxjQVE5AA33F0/bjI6dNYy4OfcZ/vEdMlcLiZ6y4Fm9Gh0ZZtj3CSlCY
	 jQSB7oSn//aLg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] kconfig: qconf: remove unnecessary lastWindowClosed() signal connection
Date: Thu, 24 Oct 2024 03:17:54 +0900
Message-ID: <20241023181823.138524-4-masahiroy@kernel.org>
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

The default value of the quitOnLastWindowClosed property is true.

Hence, the application implicitly quits when the last window is closed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 120090fa4ac9..49a3d0365c39 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1863,7 +1863,6 @@ int main(int ac, char** av)
 	v = new ConfigMainWindow();
 
 	//zconfdump(stdout);
-	configApp->connect(configApp, SIGNAL(lastWindowClosed()), SLOT(quit()));
 	configApp->connect(configApp, SIGNAL(aboutToQuit()), v, SLOT(saveSettings()));
 
 	v->show();
-- 
2.43.0


