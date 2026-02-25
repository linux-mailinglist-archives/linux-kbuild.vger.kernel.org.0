Return-Path: <linux-kbuild+bounces-11417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG3OEaylnmmrWgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11417-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 08:33:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C992F1937D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 08:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2652630F59F1
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 07:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B641530F7F2;
	Wed, 25 Feb 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiM9ygcj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724D30CDA9
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004175; cv=none; b=mSRlYCmqe0r8hiW+D6bsD7qF2qyqpyYdutOtcC5QUBLCGBNq9SzGsk9Wx4+44WeJLG5Vdov2vLGj1kmf9Jv7bTl42rKeZOTsW0izkFd8ehSUiWN2+i0NzILgwUH2ShNLSx47ZAvAuukVMU7TC9JoMb2SwM5Ej38dOSGqYfBR1Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004175; c=relaxed/simple;
	bh=X/IXiyccJs1o9xKGWY/iVQdYZO8ls27/C1h6x6Rz2KM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=swWQgU0id695XUdWdfc4kSQPbvqhJDrJh1/L7DVV2hFN9u/pNmpFLrmhO5pgZz5MI9D+TMOtmFeGtDB+Pm0SbEzqkCK6OWOV264rzO8zDqkqSeYETI4RwHZ9XmHukH65kDj4ADKf4p3M4vH8W65wixXkYBplk7+07W3ATswUoNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiM9ygcj; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3493951a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 23:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772004173; x=1772608973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWrnilPr1m52c4Isr7cnQJTn94su2Q7nWgp5N+j4Rr8=;
        b=jiM9ygcj5zKkkabZb9Xytb4oseGBA0LQ3prRxYMWGWh0OF7WzMJ0xBdGa0dXZ5Evxu
         sV/Dhdzq1rXQQBl83KhcWQNFpwSml3KV5L21qmduEpB+6p5ZYV5yAJpM1sqk32LxbcvO
         R9KqlCFkdDunJ0dTQ5SMBhERf2VX43aJS3VF+wR90dgTcnqOCTToI5HljEecROU4gSOR
         uDaIMRbgyxdtb/bCS7VDzST03EwC5whRakjoL4Mkva0VMCpCPDN/wGoTcjR3YxMfWfT4
         eMVeNEI665E5XTQl/3lJqCoYmsJFbk6uZkC1dcMNvexuvlO/GiLNM00OXZhprjOvYwKG
         xVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004173; x=1772608973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWrnilPr1m52c4Isr7cnQJTn94su2Q7nWgp5N+j4Rr8=;
        b=iuVOdJnGAxq6wiqV8C66x8SR+bTWnTni5zi0pDBvxJXi73FOX9mqcyUDI6D64FMslT
         +Fd5JkGLeg+chLYmAOYe4iEEF3S4IkkuJYsESqBIs7dUUOXCHcAXTdCt8r9ZxiyDEVvr
         4Hot3HQ51GXopu860wb5iRMIATHnK9LBQAkMj7rIy2iM2iffTIm/uDHi5Vdkq5bs1FX8
         PkshoPoptd6ExlpRH4rSBUB/liuVr37ZPSrwy34HAC0Tau9hoXoNzB42nhIdUhQ6kUXo
         DxHtTKZ9ibWfDcq1CabL9cCXra4rSsLDXkv+HfZ3KAlgQAtI1AAqdM5knluz1jFQbCdd
         Eqew==
X-Gm-Message-State: AOJu0Yycq7P9/qPZxPN1JP7nwRGKGmS0hWsv3/nUoU2yGstfZhFcViko
	KCjTXMMRotFzBybcHCwFO6J8TYVVm2kXBWccIkZ8cbMghvCnrdk4D45moMJ91NSu
X-Gm-Gg: ATEYQzxr37aMUxcKP2C9nKxC6k96s47b0SF1Tn0KKKqIlVFSE2Z/OIpboe46TWJCjNL
	XrLPNM33kAs8NSU3kAwsVNqTGQ7gMiRuC9SUWrVdXaWDPz+kJeXucKt91aQHMDSCjIcNQauChIN
	lILk/AMgvQnzzaRDhyM8i1ISe07KLRJHVWFpStbbDFQe5MsZBiR5onUCYzHqgCxAvXfVu3WwFE2
	FZaQQNMmanf7pDyCedOb5KQklBI2NsTvM5iOb/LdfSB56zgCSe2rVRPlc0twkfv8YCwK6wkuvfp
	m08/CFfhnpd2zhRUBtK2IBRkrErlQU9XkL4jxpt6UkbAXyemmMze+M2OnBaXLdypoFU8rCzqKLN
	q+V90pAJ1BmSAPXVJl7tbJsCbN3NFFNEAJMrpuHjp29kEvi0Wt99bFyLLXQ//ZVONSo0qxlTqR6
	FU3ncqHWG4jqJSjAKsf/GSlEV9en6fjruHSUH1
X-Received: by 2002:a17:90b:5288:b0:354:bf10:e6a4 with SMTP id 98e67ed59e1d1-358ae7f9067mr14495681a91.9.1772004172753;
        Tue, 24 Feb 2026 23:22:52 -0800 (PST)
Received: from localhost.localdomain ([111.202.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359130719a3sm347889a91.8.2026.02.24.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:52 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	rdunlap@infradead.org,
	masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <micro6947@gmail.com>
Subject: [PATCH] kconfig: fix potential NULL pointer dereference in conf_askvalue
Date: Wed, 25 Feb 2026 07:22:46 +0000
Message-Id: <20260225072246.3475275-1-micro6947@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11417-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C992F1937D7
X-Rspamd-Action: no action

In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
can be NULL. When the symbol is not changeable, the code calls
printf("%s\n", def), which leads to a segmentation fault on certain
systems/libc implementations when passing a NULL pointer to %s.

This patch adds a check to ensure 'def' is not NULL before printing.
Additionally, it removes the redundant re-initialization of the 'line'
buffer inside the !sym_is_changeable(sym) block, as it is already
initialized at the beginning of the function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Xingjing Deng <micro6947@gmail.com>
---
 scripts/kconfig/conf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index a7b44cd8a..2771bc84e 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	line[1] = 0;
 
 	if (!sym_is_changeable(sym)) {
-		printf("%s\n", def);
-		line[0] = '\n';
-		line[1] = 0;
+		printf("%s\n", def ? def : "");
 		return 0;
 	}
 
@@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	case oldconfig:
 	case syncconfig:
 		if (sym_has_value(sym)) {
-			printf("%s\n", def);
+			printf("%s\n", def ? def : "");
 			return 0;
 		}
 		/* fall through */
-- 
2.25.1


