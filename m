Return-Path: <linux-kbuild+bounces-1801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B328BDFE2
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 12:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDEF289410
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 10:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA78152191;
	Tue,  7 May 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzr7eURA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5815218C;
	Tue,  7 May 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715078315; cv=none; b=mK/J2ED+YDaTSC2gJ5uvoj6XOd0aRqQODq+fv4fkPK0I/Pwcz18c7n0TU3iYe2VrcZklgrAjZVvlCIOE2VCHye97pY2w2CSsVpdOjJ+DZnXnfM42G+AT6DMb0WcEY9CuEnlH/tn2xWb5ZfMvfQNqB7ReuoHAFONwOnaNOtxDD58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715078315; c=relaxed/simple;
	bh=fO4AOiqirq5leBzGVUM/FBhvC5TCNr4gtWamEvUwY6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDnRCIXA7fnTdF+AGHD4vaYRiufZoNLCvWecQKBJl2/CWHwM3NN0yjeGDCx8NGHQqXV2L/gZObD5IZEGGJpnhx15vgGafjVTPTWHFv3KM94cK+2k8kA4+LHKGmnADluD+qfqkfKMEi2smp3hXs06d3bqneZLai3MPWOBTChbOF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzr7eURA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBB2C3277B;
	Tue,  7 May 2024 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715078315;
	bh=fO4AOiqirq5leBzGVUM/FBhvC5TCNr4gtWamEvUwY6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hzr7eURASJuKTpSyFnJYXMva1FcDRG0qw+Ui5n/i8KqsXG4jItcccE6xB9xMFB4Qg
	 MUMz3FXY8m+HPTwVND44/oh+REqCon0fqQC+asEYUKkCnqDUpbefmFFHZkOsQbbeax
	 TAZVY/KyoVwKwMHJABnso6uoO/Jh4ur6HVSottKAeKec2NCdzKHYkvdd4kt3ZhuE8L
	 c2kl/i9zlJcB6CgL32YsZu1LWlzvKJOlQz+KtCvzTg0CABhSQiuCO/IIayqS4lHvB+
	 QCVHBI9t7L6NrP7xyXatTlLPHd15KZd5QD1APAyVC3IKNYimkBLaE1I27ttOmMZK4f
	 iBE0lt4ES+iQA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kconfig: m/nconf: merge two item_add_str() calls
Date: Tue,  7 May 2024 19:37:56 +0900
Message-Id: <20240507103756.1401996-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507103756.1401996-1-masahiroy@kernel.org>
References: <20240507103756.1401996-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just trivial cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/mconf.c | 6 ++----
 scripts/kconfig/nconf.c | 7 ++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 64bf373f7921..33929b0b5ca8 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -541,10 +541,8 @@ static void build_conf(struct menu *menu)
 
 		item_add_str("%*c%s", indent + 1, ' ', menu_get_prompt(menu));
 		if (val == yes) {
-			if (def_menu) {
-				item_add_str(" (%s)", menu_get_prompt(def_menu));
-				item_add_str("  --->");
-			}
+			if (def_menu)
+				item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
 			return;
 		}
 	} else {
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 715e156fdbb1..a9ef2ced7d7a 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -845,11 +845,8 @@ static void build_conf(struct menu *menu)
 		item_add_str("%*c%s", indent + 1,
 				' ', menu_get_prompt(menu));
 		if (val == yes) {
-			if (def_menu) {
-				item_add_str(" (%s)",
-					menu_get_prompt(def_menu));
-				item_add_str("  --->");
-			}
+			if (def_menu)
+				item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
 			return;
 		}
 	} else {
-- 
2.40.1


