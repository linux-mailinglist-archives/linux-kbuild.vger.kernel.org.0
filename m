Return-Path: <linux-kbuild+bounces-13910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id adIKI+bbQ2qPkQoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13910-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 17:08:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4E6E5BCF
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 17:08:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OrUhSPjj;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13910-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13910-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D6830DD1AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 15:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111FA3446AD;
	Tue, 30 Jun 2026 15:04:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C97292B2E
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2026 15:04:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831876; cv=none; b=X2hW0ZDh3NydlEQKrDk2yOXPGvi+1v5UnXmRfEI1W1dJZ4dZTdpNoZQEQI3hsmF1Nx6WJtG+zBSyCefOt9TtiXdA1Lb/xZ3vWZFAWNhO5GYk3HI5vRYXDn1MXsPLZcSbWVz0s+svIGvcjI4+tCFmylIl7vZ6wNyJiK0nF9GH0mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831876; c=relaxed/simple;
	bh=cSJD5b/p3sPsByjBc77plVvz5/S0gs+HbMMAZxeyb6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C6EZGbfGyoOh7oQHTqacKU0v0/T+raa85frcmG1sbkaG/hIXwcdVrK7uVsVqTddpvCn+dLbbCzgEaGs8VYnmzY/ZCVbq5eQaBYYDOQDFdD6Wq8N/iAl/xWYQLgqGlrEKyG/tfnOXQtvEA+zuDgUHnsN51Ew5dEG/ZXhOWDTFvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrUhSPjj; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84783bce476so2057249b3a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2026 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831874; x=1783436674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nK20wLm1j97AgT0LcDlhjf6j/HgeMKwZdoCs2vgfKCU=;
        b=OrUhSPjjKWyyUWMT8BbwBTINo+pYIApUkqZ2ffxGEpRM7xDtOXj7t+a55ZDA1a8Llb
         X2mzNvjjjAVQ9HN1ZGTx/qbASSEJJJqVfpRCPEzl0OPhTHSQzwFVQhpK6j+enxj49qr+
         S58x/8YnRF+PSo3ZoHLrYsFMyc+fUr/738IaY7zF4ttNSMetUNL3aSRbCbsuWANCXgLh
         x/yJtPo+u6KkhB1ZOawXTnO8Llqcmh3KEfnBYJ5qQK/ZGuwtJor3bpc/ymRKHStFJ+F5
         VavIv1p8fYzC568jxK15L2BcLPQHCQ3lONLcafl47w5YJYnog7JFC8nF1RPrqnolOL4o
         BjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831874; x=1783436674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK20wLm1j97AgT0LcDlhjf6j/HgeMKwZdoCs2vgfKCU=;
        b=VCwG+73AapGtZ3h2RZFA23U0gUXJMPNKPUbAXjfv7KDPesRZCTYmpSmsQ4bhfNWYf1
         CS68ob0qsRIeg1tS5W3qVBdyrwobIWPjwng8GiuZ7wZ/ctFu1oQbWSByPHGzeKNexR5k
         rA+g6V/ypA8bfD73jZGLKx9ucUJCkqX+0WuSY7ZzTsokFRYegRvBzWmjjEeACN5xUyhS
         COoELK/o7VoZ3E8a2oTm0qi27yWVtFgrH7OZyRwUe/WjTjrpQhntyqfjXOjCHn3E+tof
         ATKENRzeQaIyGxIqlT8582gSavaXqEkDwGfKCaLWND334U5mGoHEZQGXZ3ppRnoOjiJE
         dWpA==
X-Gm-Message-State: AOJu0Yz62b58p8w++Jp9GbbR1yiwCEhOgiPvRs8+BuAll57JZCe7p4Fl
	P0pFsI7cKJcV4BTwro7gpNWvNPXJmRZrHG1CsrB7md0a3mSyg314k7WXfBU8zQXp
X-Gm-Gg: AfdE7cl+ej0jNsAXXpXk2PpRdj0OYNdx15aFyCbA21T4HzoBo7rjgjJWOf/CFkctB+z
	ilkpJzGrPm85fwOk3ZRGdgjFmXs1ee/ZCH3DLSg4ZETBjPwVJW8yiDunvuAPeKfvhkmRr4LWEwG
	uu4P/x2B/GROfPm0rc0IkVruAORTeDLwT1ajOrlzKTHdQW6btXcpMat+XEk6ReCooq1EFXZ1x6x
	I8EKls4UDLO4BJqgeExD8CceOZusDLdzLbZEJ+wcUM7t9M94SerLmYs7IiClTcG9JwZaR47GdzT
	+l0RGlhLjmrOU1z97UUKA+BAIXTLusILUxLtMEiOZxL0S0q+Y1KFrj8bKxcufV/n18NBsHdZZ5I
	eWBoAUohx1At6H8hj7JU7jfpHPdAtZkkROsDWSnKDBYX9QxFU0GQSKERKP5eSCr6AqoKsjFVplB
	aVw0o8lkR+2UtyfKo/5Uu9jHxCkhabnw==
X-Received: by 2002:a05:6a00:94fb:b0:841:dca1:8b69 with SMTP id d2e1a72fcca58-847add70ed8mr970895b3a.5.1782831873871;
        Tue, 30 Jun 2026 08:04:33 -0700 (PDT)
Received: from victus-15.tail2d4da1.ts.net ([220.78.36.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a033a079sm2210316b3a.43.2026.06.30.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:33 -0700 (PDT)
From: "Joy H.J. Lee" <rkr0k0r@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	"Joy H.J. Lee" <rkr0k0r@gmail.com>
Subject: [PATCH] tools/compiler: match glibc 2.42 definition of __attribute_const__
Date: Tue, 30 Jun 2026 23:58:40 +0900
Message-ID: <20260630145840.2717960-1-rkr0k0r@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13910-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER(0.00)[rkr0k0r@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:masahiroy@kernel.org,m:nathan@kernel.org,m:rkr0k0r@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rkr0k0r@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E4E6E5BCF

glibc 2.42 added __attribute_const__ to sys/cdefs.h:

    # define __attribute_const__ __attribute__ ((__const__))

GCC 15 warns when a macro is redefined to a different replacement list
(-Wbuiltin-macro-redefined). Since host tool Makefiles (resolve_btfids,
objtool) pass -Werror, this conflict becomes fatal when building with
glibc 2.42 and GCC 15.

Per C11 §6.10.3, identical replacement lists are accepted silently.
Match the glibc definition exactly, including the space before "((", so
the redefinition is accepted without warning.

Signed-off-by: Joy H.J. Lee <rkr0k0r@gmail.com>
---
 tools/include/linux/compiler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
index f40bd2b04..f2f54b038 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -119,7 +119,7 @@
 #define __read_mostly
 
 #ifndef __attribute_const__
-# define __attribute_const__
+# define __attribute_const__ __attribute__ ((__const__))
 #endif
 
 #ifndef __maybe_unused
-- 
2.53.0


