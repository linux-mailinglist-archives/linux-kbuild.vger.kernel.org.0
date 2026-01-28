Return-Path: <linux-kbuild+bounces-10917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJd5AoiveWnnyQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10917-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:41:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A29D7E2
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE163013A7B
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 06:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187AE32D0D3;
	Wed, 28 Jan 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cakA8ApY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E02C1598
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Jan 2026 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582427; cv=none; b=ETCiGjutt8J6t12mdAc2rFLa0TEFULEN8azMVFFOq6Bq73NQJlUCjIyhZHdEUcxrj19BatarXjE97umLPRcJ5Laaa4UieG1hs6zvEzOPVf/NXCV8SEl3iuHOMaXXhSOroYC/6bjKrpwV2grjhB1+g/mmxu+nlRq7QfwGx11ikxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582427; c=relaxed/simple;
	bh=Tglq3tG4MOUPWXg3JW/lM9LBxx8ouLfyNog7EDt2TXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a1d/YzBfFQeySOZbegKEZZCcw1muZzYTdQSyKpBbz4PwH89SGNjdlG/jBm/1d3wr7ACvyptcSIsNz4lSkWCaMmTl4wCyFWzDlAal0b/giWs1lwuGhOTUCrpRziYEzGJuALaKlHsRZMMlb9zxm7JrBmpLcl1FcxsTRBalS+m2Osg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cakA8ApY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0fe77d141so37733395ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 22:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769582425; x=1770187225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5wdqCTW75VpAVckiHMv4ri6S7nk1WSn+fLTVSHewpE=;
        b=cakA8ApYh9njHyotxBW0JP1QlaGpZtK/gHRgbU9AXXQadwZzr/jfikJXO1eKq9uEGt
         yHiPnVrRYNHg1fAc/jF8zyCShGzLK1DMb/MJGlIOB24cQGMSDV8YE7j8xC85KuhLbETE
         Y9CfvKTRBE/hHpPlsBgAixSBf7JM5iWpglxWVTbDuZHWu+DuL1oi8bQHqHCDVoMx2+Yl
         sOacNSHDFpOoTywFNO6htvVFavHKdnubaP7100hJriLfkXiUMCkdlf3ikOQ16OC3z2qa
         ZDBn1yRBFAxqHiC+Qb+PbAX55Uly8ONOIXC6uI4HjZavDop/cI1S50wWkbNNXoVK7jGS
         HexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769582425; x=1770187225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5wdqCTW75VpAVckiHMv4ri6S7nk1WSn+fLTVSHewpE=;
        b=pipHv8IaWMI9ZtUiEiNWsh4y1tV+BLmxfTOn1142RSIsF0LLSlMC4Q1dm3zf8CQIsA
         BhvTVjStJW6ScrUzOtXcwu/qsl4slP9QIXOUysxUO4SVNz7pUO73HFwtD1QTsIR6QPWv
         786a01Hdp8HQQMRVw61GTA0saUPIj4hRZ0ItE/TNPgDmOcs99Nbv3OcN/l7IR/9LiyMk
         OHa5ChrcLfHOaXg9XCqrh78dUe8ye21kahsIce8SXjb8QZ9CoYRDNicjE/iJYcPFA0FM
         SySJzadSpZComhe5OmseltedZ/p6AcSacxWrHuKnG7jTnzCoyzzWIbqHgW0bgJ0plSIV
         x+IA==
X-Forwarded-Encrypted: i=1; AJvYcCXNPyJRHqA1srHAAL2aHgDtQTDIrRFE7iXwhfLZASvuJZkuzStGQTY4LqQOA6vN9vKOaxxeaTy+r5HgI6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrFKf8aVwL+BMAZ9ZT7eiH+UVMp5/zWKTz6JFdErGUOqNXxmV6
	HKQSkLLygW4iSTzLOxneoEIrYMhDMqE8IswAO6ALXKEqpZpylxwP+Vut
X-Gm-Gg: AZuq6aI+KUld7h2o/TtuswKi0OuvPiW9yy7MlXBhczz8OGsnkrGfMi8ngHy83y255dn
	/vTLnIJPTsRg8+nVsdUM1WKOQUzX8LBLsIsHw0ew3tqdctS5ekCs8ikvLjzhM5V3o6PsBW0hgz/
	k3a478iQqtMi+RFUYrdyTh4gwA9aYpZaioMibK0mH7s+fpbwTXYCgpGgXuJ2y3H8VZj/briRX3i
	6cHHG1EelMnR5cPuYZhYOjLet+Uzldgx0KBicKLjS73qYsRB2YSeOLJMw5Ftu+pAO4vtFvdxkOC
	UbprKJjthROaDOGI6G/8Z73l8Nh/FRkc5pYmOQtM6jqmk7FqzF244TFOIe2hDmp3WSQSpctoh9E
	Rb7MI+mI1ucvVQlPbnrZRvAZXG0/qNFQfrkM2jAe2eDJCQmslFuKd2/DhLAUV6hv/i13mlZMRNb
	8inD/+EINOV3q6/NRMKZYrNTqkY6W+0wPT
X-Received: by 2002:a17:903:38c5:b0:295:195:23b6 with SMTP id d9443c01a7336-2a870e02d3emr46828755ad.55.1769582425218;
        Tue, 27 Jan 2026 22:40:25 -0800 (PST)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3deasm12253015ad.57.2026.01.27.22.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:40:24 -0800 (PST)
From: Rahul Joshi <rj5547884@gmail.com>
To: a7247017124@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org
Cc: Rahul Joshi <rj5547884@gmail.com>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Add an extra version field
Date: Wed, 28 Jan 2026 12:09:59 +0530
Message-Id: <20260128063959.3443361-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10917-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rj5547884@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 548A29D7E2
X-Rspamd-Action: no action

Renamed extra revision field to build and test
kernel.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f715786d..63930d842b19 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -rc6-rahul-joshi
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.34.1


