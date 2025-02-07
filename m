Return-Path: <linux-kbuild+bounces-5668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EFA2CBD2
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 19:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D317161159
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635621E0B77;
	Fri,  7 Feb 2025 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4rlCoh/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6711E0B67;
	Fri,  7 Feb 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953793; cv=none; b=Wea1LSPTnHqjP67PasoEyqEYoANHH4e0pVgy8SpBE4ZOEyQsH5sAf9WGEYxpyw7hmRTEGVt1t2WltnytPYrRpwbxGt51fbdigQM/ay7nZUAwPZ0rC20hA8dvHpfm+c9aaGUjmW9nlLO/h+hRc9Sr7Y4d1Z/uDy/dLS6pRLtTiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953793; c=relaxed/simple;
	bh=uQ3hGuuf3OdVGwEjm4mb3pArFZK2tH7SsHoP0wcX/YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUeezEEowPTmWr/wyrrBOMYdNxPNgoF1V2cHvtbMVKePE9VQGEKzdEKTezWZSI95BvR+1WrXl9YXGWmfqoXuPQf3xtYmaIR6z3N/PpkDXgfsCckMHFVag8vYwOWlBYq+AMRx7bggK2bm0eF2YUTVUMIsFfUMOHyu3B0tI47X5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4rlCoh/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECB1C4CEE2;
	Fri,  7 Feb 2025 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953792;
	bh=uQ3hGuuf3OdVGwEjm4mb3pArFZK2tH7SsHoP0wcX/YA=;
	h=From:To:Cc:Subject:Date:From;
	b=Y4rlCoh/aFPXcw6HrYxD9G2WKbjQ9jgl5HJ4Dj3c9mJsQyV9CifBmE8gXCABtIzGI
	 Nd3auIDwraIPlN3kdFPZWv96yrT+mM0V+o4hvorodpKGyZKN33loCxIIBDsfrL6f15
	 o1MzmcyYMBJH8OHygyNvrDBZTnFVPtuVCTikACqTtMKyBUkzZHhfTaZPurLm+Fd3Q8
	 fKcH2FdJzioer/rILpjUuQyjyZpLc7tclo9Nm7wkXExK0B5Bp/BKUfO0bEVp9KEpew
	 kPmTEy+r+0RvsWdvg+o9Vku4HbhspfrSM83H+yACU3kPdg872bgwjjN/ZtDFcqwTHs
	 qPR370nT2IE6w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove unnecessary cast in sym_get_string()
Date: Sat,  8 Feb 2025 03:42:48 +0900
Message-ID: <20250207184251.497856-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The explicit casting from (char *) to (const char *) is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7beb59dec5a0..d57f8cbba291 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -879,7 +879,7 @@ const char *sym_get_string_value(struct symbol *sym)
 	default:
 		;
 	}
-	return (const char *)sym->curr.val;
+	return sym->curr.val;
 }
 
 bool sym_is_changeable(const struct symbol *sym)
-- 
2.43.0


