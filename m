Return-Path: <linux-kbuild+bounces-6195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41648A6436B
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 08:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 860107A2A67
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 07:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505F51C84B4;
	Mon, 17 Mar 2025 07:23:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF618C337;
	Mon, 17 Mar 2025 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742196211; cv=none; b=YQxNMi9hO1ELtOpK3qMp65ECUwJGqfviQxYK/2K3mHrxl5DjeOcjaCQy51h+OipiZT6vib12GzO37jF6JdvXXo5r4w4QmI5MMbm8YOb391CKLEBpdE3Yd3kqwh6XjkFn3qFDmnTCg9FYU2m7eAk8nwsbGTWnb3Le8w1vb25MJ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742196211; c=relaxed/simple;
	bh=yYUGnyQOlqvDx3W4g+T4v0whXOJRhkt0IaF8ipGAAYY=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=iHzfw4CdR1pXjS+InxFMg2nGh6hyrMzIy8cOejq13bDXYwsyiyucKIFixfy8rlZYB21EeFVcz53DSTAPurdqgYYD8X4hvE5Dw5977LJGD1hshgmH7tgYOoXy7/CKEL6IlEgmmaqBT/a5x/rnpm8CnFU3tHcRGy1gPSMHn4w4FAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGRK81d8Mz8R039;
	Mon, 17 Mar 2025 15:23:24 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 52H7Mttb022359;
	Mon, 17 Mar 2025 15:22:55 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 15:22:57 +0800 (CST)
Date: Mon, 17 Mar 2025 15:22:57 +0800 (CST)
X-Zmail-TransId: 2afa67d7cdd132a-f279c
X-Mailer: Zmail v1.0
Message-ID: <20250317152257605EN-VIC5_IyrowJu481BsZ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <linux-kernel@vger.kernel.org>
Cc: <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBrY29uZmlnOiBSZXBsYWNlIHN0cm5jcHkoKSB3aXRoIHN0cnNjcHkoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52H7Mttb022359
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7CDEC.000/4ZGRK81d8Mz8R039

From: FengWei <feng.wei8@zte.com.cn>

supplemented:
strncpy() is deprecated for NUL-terminated destination buffers. Use
strscpy() instead and remove the manual NUL-termination.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
 scripts/kconfig/confdata.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ac95661a1c9d..e547ce003f00 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -970,8 +970,7 @@ static int conf_touch_deps(void)
 	if (depfile_prefix_len + 1 > sizeof(depfile_path))
 		return -1;

-	strncpy(depfile_path, name, depfile_prefix_len);
-	depfile_path[depfile_prefix_len] = 0;
+	strscpy(depfile_path, name, depfile_prefix_len);

 	conf_read_simple(name, S_DEF_AUTO);

-- 
2.25.1

