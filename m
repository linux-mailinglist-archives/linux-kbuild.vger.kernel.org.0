Return-Path: <linux-kbuild+bounces-10824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH1jEjmUcmksmQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10824-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 22:18:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E646DA7C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 22:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88FBF30180B4
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F58E3370F4;
	Thu, 22 Jan 2026 21:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeYJp/63"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27C3BE499
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769116717; cv=none; b=gvb+r8u15EOGLPDnXm3OQZ8KQYO3IudHzAWdGXHgnx/a8Y+yhuMrOI/xJrd4zUcPeUXC432fmY9FZOa4WO4UV4xZGKpAhEUueSbkLhBWIDvd4s3APAbrZqeSvTN5Alz/2kLcigaIAktzD919JJa8R71xMrAn/6tWyxw5tZ3lrTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769116717; c=relaxed/simple;
	bh=ri+f734N+LMTEBLLE6PxMfS3bJzuFpRt5lmOKXnXyiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOPLnB6X4c9/7IAHu2SnZSQhVbTav5+KCCZDeNjWqeHqWeL1XtTxLMTRg5u0/lQdWxwsjp/I6p/mVZ1PSB1XpcO3IX9EOWkBSOX1jNkiBu13ucqiqIuZmtigxKp1ah6Cva8U8rB9cRb5Ko8g7rmztk/AGTG4Gl3zrMlPIHo98l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeYJp/63; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c61342a69b9so544803a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 13:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769116708; x=1769721508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4fZTSCAveiRDrTItnX/UkkSd0Zh9ul2e9kLoTXPQ4g=;
        b=QeYJp/63PoIttc75pFxTMmkJyR+xH06bIKWPjzhiWz6Ct5b2tBG95QtTG2Abl9Eh4s
         MSjCN81v4Xm9Uh6V8yrgPuvTnUZw6HrfZiNpSbiQT8tEqhZtHNwdipKmvN+jD+g+WZu1
         ULzVXtjsom1hSEJe46iIDuUSG7JkDibKNf83LAC2r3BcgokHWnGh5onMC5rrS1POh3hm
         YHo6r5fLwja+ynM9TL6HwX1LkaZ/uQhiUkSxEDcks8tE/reSxMGQiqjxDNes/MVEnMeM
         p3wxpFsNwbyakT+Kwp5I+KRU0yVNL15i3MxBSZkwBqvBez9lfidkfBuAv3JgYXF1kK05
         ExCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769116708; x=1769721508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4fZTSCAveiRDrTItnX/UkkSd0Zh9ul2e9kLoTXPQ4g=;
        b=X7+EhkW00Ix1C7dVD1gcWnBaY/UDfJ+OUrppbr4jIGoRJl7tDCjrrFZC+Du6PResOz
         VUPxyXYKmfDQIVVk7H0qRWKpsoF/+TMgM8wRtUNYt7M4X+Ginr1l0chTMni5ia+91Ept
         ETpxSDfi8LhIfi/udfV7eMIjiL1ZbZrJ0AcZA6pIKudR3nXtBuDdbldUFgScGj6cmiTn
         FvjZpQd62A5FcSf6+4kEnBbU6irMMmRPmzPBb4JhG+n7iok3sCVSImRNQ3aTt+NCBal2
         d2ZweF2v9MPx4qgoYG1sJYFJ9bBxqNZivUPBe6Ni3t6yYDZfmn4wql56QOk3JKdbk6CC
         MhOg==
X-Forwarded-Encrypted: i=1; AJvYcCXjTZC/bvCMOSGu0Vs96E91zmJt0zpyi6Vp593EB6/nkO5/1Q3YkSfM+FjLeT8MIWR3ouoq68dkLt3Uv8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3Q7CqaFP8hE04+MFWOhU1Wz1Geqfz9JMguJS9aRnYvk+eNNP
	hczVmYeX139CbxENaDFysoIwTrmhe7n2v1r6EXEP7A967zLYHOpz2+4mm17mFQ==
X-Gm-Gg: AZuq6aK01f7ywdlCBgz1x9pk+oXTRb7la7xP8rxMwqKKgDUCK/Z4VlR0shXpA9lHWkh
	R3b6fLSuP/hg7xRt2nD/p8RpMVUTRIMH0iXLeOD/BjOnom6BsBBlryd9/xYn9SCqQqM4AMSe6nt
	QWNX/TNJ6JTSaLn5z1ZDLnSuDWJ4Whliidj3iBaxrXZ1RWSvHHTg39r85/jceGmSofmkvOI0TFY
	K1r17/RBiotZdUNzdYhYCeAbijqJ2np92i8hW2WfVXKYRS1GsB8ql479179D39lhDyfSwKqE5ts
	6ab+ANfU0uF1wekTTSSRC9CTx0A886pyWj7NjYOXCAEs/ASKfL9HNm7dcmqiIMh5jiI7R8InU8C
	8FtwUUJlk2uXzWJZkzYRJvflCujgXAjxjQLULib29RMp8sz7o6VhISD05B8n1M4QdMOQfIub+Jg
	NDA0OjCDNTNFRlMUY7bAVemQCWXd7bM8ahbemhW0xj7WtrxVv+K2Oynw9olPwUSWcIr4ZX+7ZIV
	wuKdBQ4qMPHOAiyORObeaAWRdtgJyGs1lLUAYognA==
X-Received: by 2002:a17:903:8c8:b0:295:560a:e499 with SMTP id d9443c01a7336-2a7fe43ed49mr6175795ad.5.1769116707581;
        Thu, 22 Jan 2026 13:18:27 -0800 (PST)
Received: from arch.localdomain ([2401:4900:ad2f:b6fa:8cb2:5884:b62f:4e7e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa703sm1464205ad.16.2026.01.22.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 13:18:27 -0800 (PST)
From: krishgulati7@gmail.com
To: reach.krishgulati@gmail.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: fusion1110 <krishgulati7@gmail.com>
Subject: [PATCH] kbuild: add custom extraversion to Makefile
Date: Fri, 23 Jan 2026 02:48:03 +0530
Message-ID: <20260122211816.9257-1-krishgulati7@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-10824-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishgulati7@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C8E646DA7C
X-Rspamd-Action: no action

From: fusion1110 <krishgulati7@gmail.com>

Signed-off-by: fusion1110 <krishgulati7@gmail.com>
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


