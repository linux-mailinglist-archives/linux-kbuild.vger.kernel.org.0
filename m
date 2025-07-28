Return-Path: <linux-kbuild+bounces-8311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BFB1D3CB
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 09:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88E364E2F1C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 07:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3099F244684;
	Thu,  7 Aug 2025 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PJbnv4sm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA524728E;
	Thu,  7 Aug 2025 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754553467; cv=none; b=D3rSekwLnqSFCNQdrIGqWGXx/VzC+hImZCEk0mrepwOAqnyaFi+769/cGL6Mkkw6nRPiSTAw37e5dqoaOGOf4WNdCkHWVrSKuQQJLCN0aNYI9WLhTUwd+Vu/FCaPUC4d5GqK2MKMW14GP5So5+zpBNGaZUnZGZUfvghh1zpPb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754553467; c=relaxed/simple;
	bh=hSSHrpk6OlaUFAzYkoIXhJXy/1FzAkvk94awYHEFuy0=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=ScE5/OmZRFdRhp1x4XZEICkmBk2L3DLytk4H9FMcCCb+mGRJKoIMMwLAsAyUN3qHNItCAUQfTHLTr1Zh251pErpAo7URq1SBjlnAi6OZznKjJct++wlq8wuEcMR2YML4UU5fNNqZmwfV240zsnwZGHrHBBKJm6oF4QqZt93EGlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PJbnv4sm; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1754553153; bh=0D6buf/C7rlkREImPG3vkrDyYeGbb3A1RxVj/fZ5R80=;
	h=Date:From:To:Cc:Subject;
	b=PJbnv4smMpjFW81BLpWA7hdkkVe9G4MoRxzetSJ+wN4eOIU2HS5FwdrDSiMGSBXOj
	 WUoF/CSXhHKlsdimuqO9v3/CW7Uh7cIZdE9DvivEbELM+qO2vBEIWADWpqk7zEEV3P
	 ekRgCJ91GRglIJJC3lXYsxDrRbTsk4EBPxtxk+IU=
Received: from localhost.localdomain ([120.197.14.100])
	by newxmesmtplogicsvrszc13-1.qq.com (NewEsmtp) with SMTP
	id B8C2B4A2; Thu, 07 Aug 2025 15:46:12 +0800
X-QQ-mid: xmsmtpt1754552772twppzovpz
Message-ID: <tencent_6FE857803A1AAB21B71853A2E89626ABA407@qq.com>
X-QQ-XMAILINFO: MZ7OTbK+3aE5Y5nw5+P7moRJeD9fdBDZEJXXeCBc2GAQeLEvxyCilYozMWLa4E
	 k2wR+sMawdwNyNa0Rtn1Jz1u1p8MQoHW0MEUo2/u62KMotoIr5tYZ27m91Giyt1+j0X9sLWpcAU7
	 kCTQtPx4NDQXusU4gNNOTJRBViAr2DjnwZ8V7xxrUj+BJg4NWSFkQ+oFM554dDGc+YaxjWuFfOaO
	 lckQ5M2AV/PHa/5oHZeb2s7nEGbnZsrhBjLBA3XVn9Qq47xAH1jdTlhehQASx5TLSB/K5diVqN+a
	 QsATAWLPLbbRHyRMjG4zFu8oCTfRG3t3sdozZ3L3huC3dBCowiiMnwM+tgBPpQXB8pXP6ZujCaeX
	 gZvPuKiHC1E63AA6Z4SI2lj5TRnMFSmbC0Okh7cLbZPvJkHAD3InjFLoYkor2cNBaTO0MFAj2D+K
	 msmo5bA0hld965hV6Y5rAPhLyDMZBtKulLQYDlGl9bLj9WY921MLkYQAQkfwjEpkkCLOYRQ/De5n
	 x9VtITZlPTd6iBk/VuonIYMPp7VIZCw4HULK2h6WmLNX34Rf54dHs/HrKlSMIfwG2j7bbCQBQZa6
	 sn1lJwRrxPI3hfOInSeD9ZdQM3Zg6IMFolSXgIqzzbSFI5esc2PSJwFRRPuIoCGvWUMuCCRj8c2K
	 F74yZ5YH6PGVe3zz1IU0eZo4TSSXLg5H2h8OK0w66qxy64f+EEf5iGajYUHZ7+qDldkzccWakrFW
	 V+7YZkyutetNViXrT+mevMUIsXjQZMyDzE6S3eqK1/Ql0TMQWbP98J1K4G3S718FW50QB5a5dSZC
	 F2ZAf2TfwyFNG3Ywq/3wqBa2iGy+GOhXblLhb3ac4vUIdT9Ss1McDJOyJKDo9unT0ygRw/fCjV99
	 7Pw02hElUWoK86IXhJMbH5Ks9dv1zSxSzB0UPh17Y92zY9A7aVDYgBGYG+tuTqE9cKxdh4GM98fk
	 V7rUdQ3CN2qqDyz2eIZT3f1oMdMvcw7Wh1Ky/rbEzQ3bQAG2YMVvCtWzNqsHGWQrkSBHj7hn2QXZ
	 tL9Kky+w==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Date: Tue, 29 Jul 2025 00:19:46 +0800
From: Haoran lee <470658536@qq.com>
To: masahiroy@kernel.org
Cc: nathan@kernel.org, nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/mod/modpost: For CentOS 7/old binutils compatibility
X-OQ-MSGID: <aIejIpoTV5xUFEOr@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From fcf92a8a85884b383872fb435fef008fc794c3bb Mon Sep 17 00:00:00 2001
From: houranled <leegit@163.com>
Date: Mon, 28 Jul 2025 23:54:57 +0800
Subject: [PATCH] CentOS 7 / old binutils compatibility

Signed-off-by: Haoran Lee <470658536@qq.com>
---
 scripts/mod/modpost.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5ca7c268294e..216647e2f301 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -30,6 +30,32 @@
 
 #define MODULE_NS_PREFIX "module:"
 
+/* CentOS 7 / old binutils compatibility */
+#ifndef R_ARM_MOVW_ABS_NC
+#define R_ARM_MOVW_ABS_NC       43
+#endif
+#ifndef R_ARM_MOVT_ABS
+#define R_ARM_MOVT_ABS          44
+#endif
+#ifndef R_ARM_THM_MOVW_ABS_NC
+#define R_ARM_THM_MOVW_ABS_NC   47
+#endif
+#ifndef R_ARM_THM_MOVT_ABS
+#define R_ARM_THM_MOVT_ABS      48
+#endif
+#ifndef R_ARM_CALL
+#define R_ARM_CALL              28
+#endif
+#ifndef R_ARM_JUMP24
+#define R_ARM_JUMP24            29
+#endif
+#ifndef R_ARM_THM_JUMP19
+#define R_ARM_THM_JUMP19        51
+#endif
+#ifndef R_ARM_THM_JUMP24
+#define R_ARM_THM_JUMP24        30
+#endif
+
 static bool module_enabled;
 /* Are we using CONFIG_MODVERSIONS? */
 static bool modversions;
-- 
2.43.0


