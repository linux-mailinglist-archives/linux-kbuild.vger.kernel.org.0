Return-Path: <linux-kbuild+bounces-6194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF10CA642D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 08:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57E91885C9B
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 07:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D121CC58;
	Mon, 17 Mar 2025 07:07:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982821CC41;
	Mon, 17 Mar 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742195228; cv=none; b=WUW6/fS4BXNBJP+rBDwr+EiGIUszDVlx4WH2z0v8Bsq/2HCA3CEOFT9CbR9AFIgzxd8Fhg1pv3gqavwCzks+5Y0hQVru7kkO4Io/L1W22DrPUFXfZdPQ6KnaY7VTHILvCcjeOcRVgFYajiJyq1XlV+T66w0Khiwv++8qyHfgqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742195228; c=relaxed/simple;
	bh=KM68BWihJ2TFBEXSfBoh4sThIqKiTgIgVICp7pgX6WQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=DJV3rUCNEzblccvFaEuIwKpEI0M0QA/BIf7VkWP9FDzFhsgzPM2psnjKy+2vLml0WX6cvGfiyvVmR5ch1urNxY1PkDC83WArarJ5Eynm5uS3wGR4vWuPn+FNKuV89Ug1JTQrtTiqyNtRtm4OUzcWlFkFxowRP1ONQkI1vznFLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZGQyD4NFlz501g9;
	Mon, 17 Mar 2025 15:07:00 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 52H76c78059675;
	Mon, 17 Mar 2025 15:06:38 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 15:06:41 +0800 (CST)
Date: Mon, 17 Mar 2025 15:06:41 +0800 (CST)
X-Zmail-TransId: 2afc67d7ca01270-cd707
X-Mailer: Zmail v1.0
Message-ID: <20250317150641362EJeegz3uSr3jw0hqok9Mm@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <masahiroy@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBrY29uZmlnOiBSZXBsYWNlIGRlcHJlY2F0ZWQgc3RybmNweSgpIHdpdGggc3Ryc2NweSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52H76c78059675
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7CA14.003/4ZGQyD4NFlz501g9

From: FengWei <feng.wei8@zte.com.cn>

strncpy() is deprecated for NUL-terminated destination buffers. Use
strscpy() instead and remove the manual NUL-termination.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
 scripts/kconfig/confdata.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ac95661a1c9d..712ed0602292 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -99,8 +99,7 @@ static int make_parent_dir(const char *path)
 	char tmp[PATH_MAX + 1];
 	char *p;

-	strncpy(tmp, path, sizeof(tmp));
-	tmp[sizeof(tmp) - 1] = 0;
+	strscpy(tmp, path, sizeof(tmp));

 	/* Remove the base name. Just return if nothing is left */
 	p = strrchr(tmp, '/');
-- 
2.25.1

