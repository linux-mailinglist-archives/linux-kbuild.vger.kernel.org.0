Return-Path: <linux-kbuild+bounces-10967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OqNEEyc6gGnj4wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10967-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 06:46:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A792C85D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 06:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DC7F300119C
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Feb 2026 05:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DA32561A2;
	Mon,  2 Feb 2026 05:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuQ9G9Yk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE992A1BA
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Feb 2026 05:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770011167; cv=none; b=ES6XDNsw2hcyCwpxzTRF005JcYmrF+Mp1rLnczn1ICOT5dXd1y51iyTZii/5xZZWDgHn9FOfN4m/nql6sfzeyNrxsHNnSkhPtsohveD9JB3MsB933CAmet9T3hcdmAmcPsWJOXwuK/iT2zjK3GsKyjXnSxsODvr7JY1QAxeK05k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770011167; c=relaxed/simple;
	bh=4RJSIb0c89NAdmtQF4LoeC5eBBo9ChN1HM+iK6iIZyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+Vtfuvcd54LwnONz0XVb1NfRrEX9e4tt9bOnr5gcT95/XqhJGevCoP/0jUGW2QZNGpRWKcSXj5C1jE0TLK0lEupaWQ+M9Rg+yAb3T7RCcbqVq9T+kPSwLtCAxWTWXsXhhOeykDBorEW8lD6wdgfEiyagdzSoJXv9HQtEu+cRgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuQ9G9Yk; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-79496f0ea3fso31818927b3.0
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Feb 2026 21:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770011165; x=1770615965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCCP/ea044K0NXITTs+yvYCZqkozvyzp469jieDUrRw=;
        b=HuQ9G9YkUcyiWMubk9nzivHHhWS+nh606zpZg2rX3nFBsSZokqHEl8MVgDC2cQfkma
         lBo9+/taHKqNgbkRsYgafWH9YwC4Z6peEPJYwe7RUFiXTZ60Bcf0fQU3FAq6W4dW5YJH
         Mw786knxxR9rCATC7BDJkcB9KyWXCAB1F2jHeNCj21dCBEJNv262iZnIOuFEhNGDfC+n
         qyS0j5y071WxjPAwzKV+nqZKK6cjYX9T0f2YNhDuKhmjqHYSBqthceLnMXIhpwuShDSG
         xR2YoBpTL18DArsCTy2Ucdp5HrjXnJeGvjDcBaTxIyfj26Km5LCEDyy0Am8RcFsx9QeV
         eV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770011165; x=1770615965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCCP/ea044K0NXITTs+yvYCZqkozvyzp469jieDUrRw=;
        b=Zm7u3SRPsitBPN8FAS0rnGR0YwrO+x2zfi4AnRmBCkQuX1FvFyVxCji4Qnoa5J3S7r
         U8aJgESv64x1MRLxvz8cuyqFZ3Lulm7G2J3qDyZlY37u54/05jkbEe4hXZkAv848X2dk
         Roz6UJ7v22Tj1BBURqKKSl2z2yTBTUDQvm9vZ4kI278b5fPLqawIJGahalJROqR4zMk9
         2nXqhXrhx4Z4WOtHSfdieSU4N4HT6qQ8yu6ZPPueDY5brwGtCgcJD7xC+MBhCF8LwU4n
         BSMbo3u+iiT+OAmq1hu2Sh/SXoxqrAJxY4T6DMA6f1/FkyzSr9JnShb/KaYc1j8zPhXp
         VnuA==
X-Gm-Message-State: AOJu0YwipAckAK8R/95BdpbeGuL7bH0UJ15a/F2DWC0A7JL8gghy3yJ6
	aC6sIdtCVG9084MPLCCJ8gzCOy86ELR7NS5XjuxlsUHI92BwJiA3U3N0yqBINPSjMooiFA==
X-Gm-Gg: AZuq6aJGqH/0KTW+T7ffkYM/SBM9HifNUwF2Y6hWa7kGKP/bOxSm2xUypzHqhEGHAJD
	edPVcNVqqYgXw5Un3W4DTidh373z+pNJgvfqDMqeULAzaXhZCtPLTTVgwLe6iSRREAhs1TY+am4
	3UxbLlg1r5yfDh1+HNyr1tFagZSGMRXvjWtGgWcMSU0InsOMdwG6F2ohkf2EWIzN+QBxnmK4WUn
	5bEmwAoROTKRykQqyroIfZ6Ug9LAnFlZhpEKXv0g2pU6SuHHwcsus6TNm5pTkQogv+6byIwzcW4
	nuLWWoo+t8gckA6J1t0b5sSHO7smzuJx5o9WwXwAvm/GPrBUqCum9cj2oF/n2mR243Qk5WIJvpA
	HaoTGwx0YGuBjYDkiydbm5If7VaS5OucYDAuz+Maod3aSbj2P47mrHXr1HGij8EVFE7m8Tcb4OZ
	4mv3WhPvkB2e1NnPS4GsGxzcCR7f/+orELCSobvQ==
X-Received: by 2002:a05:690c:9a03:b0:793:b660:fbf7 with SMTP id 00721157ae682-7949de65169mr75081327b3.9.1770011165299;
        Sun, 01 Feb 2026 21:46:05 -0800 (PST)
Received: from localhost.localdomain ([189.35.236.219])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794828aab8csm76106017b3.26.2026.02.01.21.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 21:46:04 -0800 (PST)
From: Diego Viola <diego.viola@gmail.com>
To: nathan@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diego Viola <diego.viola@gmail.com>
Subject: [PATCH] streamline_config.pl: remove superfluous exclamation mark
Date: Mon,  2 Feb 2026 02:45:41 -0300
Message-ID: <20260202054541.17399-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-10967-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diegoviola@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A792C85D1
X-Rspamd-Action: no action

In order to make the output cleaner and more consistent with other
scripts.

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 8e23faab5d22..8677d1ca06a7 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -415,7 +415,7 @@ foreach my $module (keys(%modules)) {
 	}
     } else {
 	# Most likely, someone has a custom (binary?) module loaded.
-	print STDERR "$module config not found!!\n";
+	print STDERR "$module config not found!\n";
     }
 }
 
-- 
2.52.0


