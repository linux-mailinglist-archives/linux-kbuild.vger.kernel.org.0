Return-Path: <linux-kbuild+bounces-4292-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4269AD3E2
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B65ACB23CA5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C521F9439;
	Wed, 23 Oct 2024 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rg0J4DB6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF71E8822;
	Wed, 23 Oct 2024 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707519; cv=none; b=tfel8KjcWjMYqnrgHMjGd0EEpoR5BDjo2mSrg52SlsQ9DumiFjYBV84I8uRRm7qfLf2WA+p6MJYLW7ztynVIUjh8mDPyHS7YoqZi2zHc8qhB6qymxZjkK6g9t81ybFcvmVvOVFr+RYB+BFPpIEhqjLLTwS4hR/ffs3MX1aq+qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707519; c=relaxed/simple;
	bh=6jH1pGp9KLXa8qr/56f45ENyIc/rPq0yIj5+AxK0D1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3Oc8ZD9wQuQ+K6+k2/1LWvI14XcXvlhTb46YOo/Vzq2qrEk+IsSSN97Q2gKRsX+5xgsMveuu+6czll30vejDUedAxLTuBO2sNtH+uu/mpuSVIBIlq9iAMJZymu5cE8+eU17x0xHZenENnirYWw1jQI8QGShrBZjbuWSeIBgm2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rg0J4DB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5BEC4CEC6;
	Wed, 23 Oct 2024 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707519;
	bh=6jH1pGp9KLXa8qr/56f45ENyIc/rPq0yIj5+AxK0D1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rg0J4DB6oADSAKAb8nEUz14U//mb/GWfkkFGoCD3/NkQRc0CfW0t5Spk5bRVsvr7U
	 TkMAnimUKry0b98wekLK45vm74X/OLPWEFZbl2R9h6Rr8R8DLzuZ3yN8/dAaUD3EWh
	 yX3SBH/a8KepDpvtxlq1UK8qsnk2h5XCg5mt814YXXla9zB3IebnWWmGh6uVIM1RMB
	 RHznZhvZUZiB2Xm7yWwuWX4Ir0tL3MnymOmhPdm65p2dbDrDwpzJmPmGxW8AEK/URa
	 JjWfFCuNqc8RKF3iJvUDfuVPCnikko50gLbv5CDyzKN8QO1gRi94LZpAwx/tA0y7w8
	 WYBBXQyUAnW1A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] kconfig: qconf: remove redundant check in goBack()
Date: Thu, 24 Oct 2024 03:17:59 +0900
Message-ID: <20241023181823.138524-9-masahiroy@kernel.org>
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

The same check is performed in the configList->setParentMenu() call.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 1948cda048d2..acbc4331ebc5 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1616,9 +1616,6 @@ void ConfigMainWindow::listFocusChanged(void)
 
 void ConfigMainWindow::goBack(void)
 {
-	if (configList->rootEntry == &rootmenu)
-		return;
-
 	configList->setParentMenu();
 }
 
-- 
2.43.0


