Return-Path: <linux-kbuild+bounces-4201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A059A50FB
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2024 23:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC63282C4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2024 21:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C62519046E;
	Sat, 19 Oct 2024 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xk8J4gQa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814A155747
	for <linux-kbuild@vger.kernel.org>; Sat, 19 Oct 2024 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729372716; cv=none; b=AVFjzUI8jaK2cVMuU8e+r25j8NlPxKCIQSm7WEadhyE98csygRSkBEwpo21f/GDcnlEaIyTvVEg8K0y30/PLzxbNi83QN/vguQAaNo2EhLYVVF987/KNhXTvzjy9SLI1be1eUB23Xtgd6NIhqiOnc3g7TmrtU5kGl2ktmxnnqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729372716; c=relaxed/simple;
	bh=0prThLFD3++yV3C1XGGIGpsYyfarZ4u1m3O9IKC794g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8zP3g2HZofOBitLj1s93xBplXGrOB3VF3uhv4PA7wV6HR3x05xiZwP5AwlBbDgpjQvhQ4XZ7+lQAaulJzqA2NsAYI9/Z9Oead96qJddsX7lF0AmxS3dJ5sUniyz4BmjzILInGbeK5NsUBl2uVV/wwjIHwouggxHbr4droIBV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xk8J4gQa; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729372711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UBFbKB4AzIx7FdNHFpWUEGetjQWa2gnDK7ldJlMg82Y=;
	b=Xk8J4gQa1Uh8iy1gM7/3qA1nhWdY11a36tMYKEvBhM5xEQv3Xod8UYz/FjICHcKnFztjLL
	DoJ3/pUJU4w201zmbUSzWblTvqhdjwcqtzVmw3xtjUgkMBnilEuMANtqywfnyN8FLn3iLy
	CtuJALGoePjhFQK9cEOGvvHJYv7AaBc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: nconf: Fix typo in function comment
Date: Sat, 19 Oct 2024 23:17:47 +0200
Message-ID: <20241019211747.110140-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/handles/handled/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 scripts/kconfig/nconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 063b4f7ccbdb..c0b2dabf6c89 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -467,7 +467,7 @@ static void handle_f9(int *key, struct menu *current_item)
 	return;
 }
 
-/* return != 0 to indicate the key was handles */
+/* return != 0 to indicate the key was handled */
 static int process_special_keys(int *key, struct menu *menu)
 {
 	int i;
-- 
2.47.0


