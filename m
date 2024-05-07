Return-Path: <linux-kbuild+bounces-1799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B95108BDFDC
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 12:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9F301C2193B
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 10:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532BE1514CE;
	Tue,  7 May 2024 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HV1QSW45"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284ED14F118;
	Tue,  7 May 2024 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715078313; cv=none; b=G/5dIToqFLTsXmSfCxU4tih7IY0F31ut6NE3Q25KvqO0lzj5rcv32vUtHWVMa3PCyixEbAqjRE49VadPTG9lrqFV/fP2OB9ZOw9sg4izDJBi3LKWuobfQgMF/vpKYY9qIwgEJ9M9/jAiL2yv3nuQQFSwGVjWPbGNSygThYVY2ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715078313; c=relaxed/simple;
	bh=vYIhtx5//lOdos3hdS0Nwm4Qqd6eR4mkO0PXsZgMCrI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sEf0iH1D2tf9dBeudIbLlNB+sTyHpsNfrAr2EfZMiqmyeZYDWajOadpyZau7g5XePs4cYdGdaRH84x+kquIl6TCIwxxnl7HJ9xuZisBpMKSTLhuy4K82viY1zUlCcAHnqvb/3ourS7Dv2ndjJwMmZ/W0ZmzWuThEzOxEsBGKuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HV1QSW45; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE52AC4AF66;
	Tue,  7 May 2024 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715078312;
	bh=vYIhtx5//lOdos3hdS0Nwm4Qqd6eR4mkO0PXsZgMCrI=;
	h=From:To:Cc:Subject:Date:From;
	b=HV1QSW45LiJ/gqfbd+PpuHXIezMDosOU8+SJ68cvnUQq8qFnqT9UYplJqfGr3L3oj
	 k9VSFqPNM8gWrEO+Wddf8gIizS/UfAdKwOy3TKSERSiRDef4gYp7s6NLzqvjAZtnHz
	 Rntq9k+HYiBZFlgV76obegc5ahgGN3L7kyTenLf0Y6d3q7ZGf/HJOKi245L9xLUsRG
	 OOV2cZ2uCVy/G0HgVvrAxmmHThNzgSJA6j+2YLMdHO4hb4WputgZQiwF14eTR62Bxc
	 3TFn2CKmBGQ4SO2ijGSpkfUZ1IyEGwxfeYGakDM10C5nW9zqXMse4c/CWcLm+UKmN/
	 eLTqyfvb5lPVg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] kconfig: m/nconf: remove dead code to display children of choice members
Date: Tue,  7 May 2024 19:37:54 +0900
Message-Id: <20240507103756.1401996-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code previously displayed child symbols of the selected choice
member.

Since commit 7e3465f63a0a ("kconfig: do not reparent the menu inside
a choice block"), choice members never have child symbols, therefore
this is dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/mconf.c | 5 -----
 scripts/kconfig/nconf.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index c0969097447d..b33335eba460 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -551,11 +551,6 @@ static void build_conf(struct menu *menu)
 			if (def_menu) {
 				item_add_str(" (%s)", menu_get_prompt(def_menu));
 				item_add_str("  --->");
-				if (def_menu->list) {
-					indent += 2;
-					build_conf(def_menu);
-					indent -= 2;
-				}
 			}
 			return;
 		}
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 9d22b0f3197b..b5b3232f592a 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -857,11 +857,6 @@ static void build_conf(struct menu *menu)
 				item_add_str(" (%s)",
 					menu_get_prompt(def_menu));
 				item_add_str("  --->");
-				if (def_menu->list) {
-					indent += 2;
-					build_conf(def_menu);
-					indent -= 2;
-				}
 			}
 			return;
 		}
-- 
2.40.1


