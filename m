Return-Path: <linux-kbuild+bounces-10588-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A02D20E24
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 19:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9238D3078DB1
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 18:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C8633970C;
	Wed, 14 Jan 2026 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubvvefNh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B233891F;
	Wed, 14 Jan 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416441; cv=none; b=C77TdLm91UMuDlvDdl8n591unsV9qS1eCYiHxhpEZ7APNOmDE6I+cJzH2i2IMVVqXpJcKmH2BXCzPdxzkK1kTRnUzynab37/ub+R3nQ/GsyIPWvI9EhH3pUAAQGlXsW2OQSKY8CG5wET/3UgHGSh9N/kYFk97URjTjOjQpOo/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416441; c=relaxed/simple;
	bh=YLF+4BcUQJTP3iEEWTP8D42sBjB8VT3elX2rEJCus4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1z5SrzdQlxO04aGpi0EoULYx8iNycytsezQ5ur4nUmV2MgFZXdDSR5ZY+03SDidKg9h4Sx9qgOyCyNiQM3Z8rReISpWmSxro3X9a8EwzOEqh1zrulbAWoIT8Tl1SUjlBFDXsVzvZ9KhndodAhdANvMsxh5EpkHtejAH3laIENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubvvefNh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E34C4CEF7;
	Wed, 14 Jan 2026 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768416440;
	bh=YLF+4BcUQJTP3iEEWTP8D42sBjB8VT3elX2rEJCus4Q=;
	h=From:To:Cc:Subject:Date:From;
	b=ubvvefNh1715tWh6Ra9/OfnRdMnFq8sqp6Ds31O7IynYU2kzuWdf6eiszbsiO5j/U
	 nZKGhPPqqZ2jl5naF8DrkIoukyi4SYJDdgzJH6dlLLZwsWCO8VnsIGnID9lRjWLZc1
	 MLxPq+7+dL5olITILne5sQn5zRSmTeR825os6/cfUxCoqDp9rXZ6y5lOcO1quAYejK
	 8KpFScKeUM18XQW8t6e0yvOmsLr5d8cU1uR6k7n8FX8ck0O51MAb6lxLx+iL34YZrx
	 I7fIZFp1tZyMeut/LxrrclNM8JkMUrQr2+BDWzKxtl84Q5CyaBNLtnf7WEAlhSOSl5
	 lAUeoR2MeS7Ow==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Fix unnecessary rebuilding DT base+overlay targets
Date: Wed, 14 Jan 2026 12:46:39 -0600
Message-ID: <20260114184640.3043083-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5d0cac427d42 ("kbuild: Support directory targets for building
DTBs") causes base+overlay targets to be rebuilt every time. The problem
is due to the added check on $(MAKECMDGOALS) which now testing again
doesn't even seem to be needed. Revert that portion of the commit.

Fixes: 5d0cac427d42 ("kbuild: Support directory targets for building DTBs")
Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 scripts/Makefile.dtbs | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index f5d51b8c2eeb..b2d85b9a4a7a 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -23,10 +23,7 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
-dtb-targets := %.dtb %.dtbo dtbs dtbs_check
-ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(filter $(dtb-targets),$(MAKECMDGOALS)),)
 always-y        += $(dtb-y)
-endif
 
 targets         += $(real-dtb-y)
 
-- 
2.51.0


