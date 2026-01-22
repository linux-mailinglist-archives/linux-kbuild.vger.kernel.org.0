Return-Path: <linux-kbuild+bounces-10826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGYJJXGZcmnBmwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10826-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 22:41:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C42BE6DDE4
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 22:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF2D63003BD1
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 21:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D81A3B4C99;
	Thu, 22 Jan 2026 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuyuFeLQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A533DEEC
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117863; cv=none; b=pdUlhxb6rPkXw2OyP0WrZhA4wTvSCjLVOcQZ5+s9kN23Xb0Xm9sFBQtjHSg1e5ho9Gksf1grYsgDZ52SfoFaFANJDuIC0D2u2GHf9lqzqopJm/su3jOqAk52jDupX1zmq947ww+vvHxnnsr4ZpDaKV0HKDEtOIqqvizJklEMAsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117863; c=relaxed/simple;
	bh=fLTdLGpxuMVcl+CnLuR11M/GDOl3+DTIo4Z4TeES6nY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tu3Zm1WXf1awjqspYVEd6vsCHGZP426/PM7Re67F2BIIDr0Vbr0YadF+Ibm0c4n63dUfS/wPTXvUbj8pAFEbRk+yqnJShZb0kEj1ScpYFmqM3f3WkO0Xon3lqWy5aUuR4DzbnwLe6D57LNQ4yIz0pTu+VbrekrhahFtmPgO3s7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuyuFeLQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a94c6d4fso7263885ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769117853; x=1769722653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VAdamMJze9wFaykc+RxocQglt5n399XEQI+Upov/H48=;
        b=JuyuFeLQImrhy+ZlVksEEnX3YlFay9CZE2hKDULXAzRBPiAd8Rvq+rvjEOa1lARQ9L
         br8AZqQNysd3llockFap68N/3k2PXt84tEDE6JISrfZTsY3V0c4cwzM6NqFjZPQup5ij
         KleqeQs3ZvvtioLRPnHpf9WN0UCN/sowRCv6mdyWnA0hqe1y1tc01faKkzTH8nd4BUQ0
         drzP7W3cAxTUvmUbCCtyKeE9w0vTBtX8i4nITtIedTS+dRpU0R4l0zB70J1dtRuuln/D
         z17PzSeQfn+9ujnLCMBk5PKVnYLigbvAf34cqXAwrMXdKW/9mOwy5T1wYDD2tJm9fBsv
         8zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117853; x=1769722653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAdamMJze9wFaykc+RxocQglt5n399XEQI+Upov/H48=;
        b=oe/azJiPDtts2bd+WsTZrCdrhEVWzEqzpizUcd96j7188e/aCkXJoOer3bHgrJx/mz
         q1MNG9nyW9Mqi9vnxnP3cC8z/o8sSrnDG8rs8ructSgTY5tjZKmwn0RMTA0zvPKJ0J0k
         7BPUxKEUIU+sqOrylJRNGaywgY2GMFZ4rwmkgga5lWI8OzGM1POiTINwJZNK38a3ovNt
         NPp12JRAcOnuexyK1M3X8Nz+XXd5caWBjRdSk10AzRmS/WCeiGyNdfeDFcRvAXbd9Zcg
         JS5Nko8M1y6n3y8AoEwTFUf0eV7lVB/FbcqkMUtBvkHLK1YREErAEUOkhCYN5pDti3dk
         Bfkg==
X-Forwarded-Encrypted: i=1; AJvYcCWAaGc9eZutSbTtDp7TLaFnKINYcqTogVY8spgNQoJuxSCSirXfnrFSblSRguJQJehXmqkd3nfqfhPELMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJi2aWK6GVfZXXBlnNzM/5EmnRdIYGgulJz4lQY/VgnpJn58pR
	MX7x6euV+kRg5kb8l1UafAysGmoU6xL1lxSv4wH1xg+N3FJm7FZHsOhF
X-Gm-Gg: AZuq6aL2NPBsSCikaL7f4flvPPTg1n3TuyV4k6sSasNhjuQuRZ4B5KKupV5dBcn/xEr
	THTflw0AGQf1qWLxL0Dte0AYj4WvotCJISS40Rj7QT1T0mh70bjVne7z9MBfrKQRQfSDpjUwBmR
	cAvZNz0ZdWImtr2luhC8J+0YYK9vSN7XigOD/k4QIyllZ1qjup4zLW2CW+LT/Jd4buEOdZqqY+B
	n6dm0gwqd6bXed4UwG2uOi9TJzMvfEoiZ6qzgI2Lot3qN4ctCL4BCgI7Nvapll70Q/S49hYDPI+
	O5TZKOMZrmlP8pYEX96wK6p8cjXIoyASAnIWdo/e0oEqAFTM1s1tTDHHaFotr1BrCMpickFey/z
	9T8LjF7Bcsk2IS5KNyoWIyVSdJvX8qE0NbrH07h+EY183P4WIlzUr5o20PaMKxiiRFa5hOB30hV
	YvLyK2M1Bct46TmpedYLB0dkSZGguDDWkqNMS4CuaJK1txm0lIxvncJWvQRp9l/MP3/z0xAZOgX
	4BOC9pOwPeGAcyl3+yFVpauqZaorfKVB52eYEkpmA==
X-Received: by 2002:a17:903:247:b0:2a7:73cc:6aa9 with SMTP id d9443c01a7336-2a7fe571fafmr7126285ad.16.1769117853478;
        Thu, 22 Jan 2026 13:37:33 -0800 (PST)
Received: from arch.localdomain ([2401:4900:ad2f:b6fa:8cb2:5884:b62f:4e7e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm1530355ad.46.2026.01.22.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 13:37:33 -0800 (PST)
From: krishgulati7@gmail.com
To: reach.krishgulati@gmail.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add custom extraversion to Makefile
Date: Fri, 23 Jan 2026 03:07:23 +0530
Message-ID: <20260122213728.18600-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10826-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishgulati7@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C42BE6DDE4
X-Rspamd-Action: no action

From: Krish Gulati <krishgulati7@gmail.com>

Update the EXTRAVERSION field in the top-level Makefile
to identify this custom kernel build.
This is a requirement for the Basic Kernel Skills
task of the LFX Mentorship application.

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d208066bcbb6..32df45e55685 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 18
 SUBLEVEL = 0
-EXTRAVERSION = -rc7
+EXTRAVERSION = -krish-mentorship-application-task2
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0


