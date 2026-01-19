Return-Path: <linux-kbuild+bounces-10681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD54D3A7D2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB91830060EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D09359F99;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCTpfTKx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2824B22CBF1;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=coiayLhncQJ7AM0cS83hHgzf/zleYcCCJyatAz74Ho7rx0blfI04KUuliOkHqU44pGgTOB/9gJ2z0BMWRDd987EGiMFtSFjkP9cnQi/S919knKg0xrHrhQdoGbKN3aud3Mdhb5rlAGsLUvGJCM9tgBUHFHyMK6CNWUcp/2y/aNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=EvzMyaM5H9x2cdY7aG4hx2yahivm2IErGiiDZ+0Gw88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sInetzQ4mpbPHYRGxjZXGXgM3nFwJS+nWmx7cKGFUvYvVU1NJlU/r6l6bSHM2zxOHp0GFfNa7MCQvz+WilVvWFOPwRtfTAwYd+v9WmqPvaJfy8Qd7rpNfpaSD+7GYMR+D+BqW9DwBiKW6UOMhh64pQp1cf4ykL56PTRBWsYA1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCTpfTKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE43EC2BC86;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=EvzMyaM5H9x2cdY7aG4hx2yahivm2IErGiiDZ+0Gw88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hCTpfTKxH0DGzVRPmdKdiK5e/RfGOYHTECK5WOOWL7r9JIR7CEADDA+mTwhjfo2p2
	 pkMaHVsA9T1mBYb0zjSsgr7OEn3ZLUn++4ro1UfgJxPEgRz1LEV4enYmrU+MmWkb7a
	 FN7oVaNa45pBk4dOpJ/v/7SxVX6ujn+7ZjhmXM+/Vhl2AI9eQdNNPZInJODieYedYq
	 rmnleEskBEZ6EyG5EGb0Og7vOvSDI1LQQH++QXKMNTL1yEqDzcImoeFPGQP3iuaHu8
	 2xGBctAFKc0tRFdCoaQ4KImKPoERLLr2uyPQdyqJOFKPlHur/ot9rXTpizNyGbqyBb
	 K7EKm8trcFpug==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001Zjd-41eG;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 8/9] docs: kdoc: improve description of MsgFormatter
Date: Mon, 19 Jan 2026 13:05:03 +0100
Message-ID: <94269990e2d665bec08a1b6f4d28d84939cb9d83.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The description there is quite vague. Make it clearer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index 902397804e80..aed09f9a54dd 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -182,7 +182,10 @@ return 0 if there are issues at kernel-doc markups;
 """
 
 class MsgFormatter(logging.Formatter):
-    """Helper class to format warnings in a similar way to kernel-doc.pl."""
+    """
+    Helper class to capitalize errors and warnings, the same way
+    the venerable (now retired) kernel-doc.pl used to do.
+    """
 
     def format(self, record):
         record.levelname = record.levelname.capitalize()
-- 
2.52.0


