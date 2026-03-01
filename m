Return-Path: <linux-kbuild+bounces-11493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBA0KQbPo2mMNwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-11493-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 06:30:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C51CE910
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 06:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15B813014409
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Mar 2026 05:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEAC1662E7;
	Sun,  1 Mar 2026 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILI2a3+Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB9150997
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Mar 2026 05:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772343043; cv=none; b=rs1kTurbyEnW2NVjIvcCimYLKH/UNH/uZGlpx0G228mwOMh/53E2hIKOJhsLeGmJLD9zGffwjZd3URl5yayoc3829JoieOQXEMOtl7d7cR3oMiDN+oLu15YCq4M+uEP3t/05eEfc4oR/38Q1tdgWuzNpzatJ31nS8kZqR7ks1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772343043; c=relaxed/simple;
	bh=dq3QrScFzEiNuvFUoruuOOgE0AVxEBmjasRRXurv3s4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tsiuvG72FnjJnTPTSjlOlbXS7HtyqbiYvNXo096rzSqjaH4laSSs5rfHgyI9B9dqDv6caOXAUTtCxbW2ApikS28yRBJVOH5LCP6pspTEwA4Ph7yeykfxKqtPcWwaME5vIa67rE0P68tEQzTxtH0yqkUxgMSuyf/vL3bIYfly7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILI2a3+Q; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748095963so1436467b3a.2
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Feb 2026 21:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772343042; x=1772947842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gphs6okg7ep3NbC+1/P/oiofsq+k/MlUJDmvkEjtKJE=;
        b=ILI2a3+Qi1kzJY6UlEt4QbWps+vFTEqoPJwBnMeMqTQdMDMp+VhV/HMq68ykLWoky7
         WbSa4Ahk9Vw3RNVA+mv4smbfxgBGzGpAzAWSQxYd8bJBimFzj/lnNJXeL6zt3flD352V
         pUPKRvSkMReQfAd+QIsHV1Wkg1qmB4uLV2b+nF6CaFDrjNIaAAv1vmRfSANfCwGSEFPO
         03VkdXK1coSyYgDQihNvIJwTZr8w09Adw4T5k7Kvwt/Z4/OKdHaJyv8sIAc4yp8t8kZ4
         QZcfT98IrmwMVLncLY57kuT9snk6a0NmM9bNhHNGmt9a+wZrVXpDl/83KWDx/MgPt7GH
         91vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772343042; x=1772947842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gphs6okg7ep3NbC+1/P/oiofsq+k/MlUJDmvkEjtKJE=;
        b=cJwoCc1T337Ltv5ByAWcp6WOVsIU3AE7Cb0d6BGl8XCjSqjLIuNzLkZ4LRF58Cls7f
         fmSmmixzd/7uDftvRV8gcnFeYE9tBdKMg4lG5ZlMJ4cjz3OtFGMN2z0aRm07xdxrpoqW
         bfgko4x4SRnLkgG1WriQzNAHqxR0JN0sMvJ4sqFwIYsoC5e277eNgO8jVBHvPBIGyg2U
         /60W5opv3Gr9kstQweKThRJ+qsrL0ovTxT7Yk075oPhK4JaHeeXBvp4/ab2bLI3+8iYL
         d1jhe2oi8VGAqG9pTe55AR49adiPMbGmFS0CcAqdOVKQ1x+/TgAhKkryJwcAG94XeVwx
         Orug==
X-Gm-Message-State: AOJu0YwZp++yEKI9uNsEeLDQxAeYRF9oyYqzMpaHupvc3cxUy8jJZb5I
	AI/1ji3n98+C1OAycT9nE2N/TNvb3q6gp8trDl3Tnqz+MBSNz52Sw4IWNnD2IfFO
X-Gm-Gg: ATEYQzw0pbkFu+Rx72gsIUSeOi16fl7LTwpGfBG21xHYwNFZLsr/gM+4J1FS8lbgDIh
	Mfagre/0P3nnAwyhLac9mVfS75XMM7GBB+87HQGoepf8pLNU/NVzBsls0Gcv+5FAE/Qs+j4dWQ9
	kzq4D4Jc+lPYp7QLlTx5qTWWZTAfo3eiixRDYKHj3sbqODYiEHOc4mG8mrMxHx8kiotzpBz34YC
	8yPN9FCh+v1kw99zmJFlCvs8bHjLOMEv+OD5L9oKo8Ty9PlCeeWUFhovvRru5eqCqscJQikDYVq
	AiOXPqYbhiWHNIs88y/imGjYrsi6x9kJY+G9J/ob/jjaKfx4jxfIF2wahviuO6P9MzC1aaztWNt
	wvgom7PqiwLN9Ue5kurdX4luq3xNITNkwOtWsXWR0TtdD8BAJhg11csne7MtkPIg+245azsWCBm
	rm8EnSk9hRmUth5c8eEl5GcRsFLIuTt5d1LZU=
X-Received: by 2002:a05:6a00:189f:b0:823:3fc7:4c84 with SMTP id d2e1a72fcca58-8274d7b86aamr9068957b3a.0.1772343041521;
        Sat, 28 Feb 2026 21:30:41 -0800 (PST)
Received: from localhost.localdomain ([36.112.120.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff372fsm9584583b3a.31.2026.02.28.21.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 21:30:41 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	rdunlap@infradead.org,
	masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <micro6947@gmail.com>
Subject: [PATCH v2] kconfig: fix potential NULL pointer dereference in conf_askvalue()
Date: Sun,  1 Mar 2026 05:30:35 +0000
Message-Id: <20260301053035.1950087-1-micro6947@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11493-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 253C51CE910
X-Rspamd-Action: no action

In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
can be NULL. While current call sites ensure that 'def' is valid,
calling printf("%s\n", def) is technically undefined behavior and could
lead to a segmentation fault on certain libc implementations if the
function were called with a NULL pointer in the future.

Improve the robustness of conf_askvalue() by providing an empty string
as a fallback.

Additionally, remove the redundant re-initialization of the 'line'
buffer inside the !sym_is_changeable(sym) block, as it is already
properly initialized at the function entry.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Xingjing Deng <micro6947@gmail.com>
---

v2:
- Change commit message and use fewer characters in modify.
- Link to v1: https://lore.kernel.org/all/20260225072246.3475275-1-micro6947@gmail.com/

 scripts/kconfig/conf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index a7b44cd8a..0d32183c5 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	line[1] = 0;
 
 	if (!sym_is_changeable(sym)) {
-		printf("%s\n", def);
-		line[0] = '\n';
-		line[1] = 0;
+		printf("%s\n", def :? "");
 		return 0;
 	}
 
@@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	case oldconfig:
 	case syncconfig:
 		if (sym_has_value(sym)) {
-			printf("%s\n", def);
+			printf("%s\n", def :? "");
 			return 0;
 		}
 		/* fall through */
-- 
2.25.1


