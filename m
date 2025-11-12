Return-Path: <linux-kbuild+bounces-9587-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE39C521F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 12:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C683A4434
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 11:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BF93128BD;
	Wed, 12 Nov 2025 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="DkAWK0og"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B635CBDC;
	Wed, 12 Nov 2025 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.217.248.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948075; cv=none; b=F2Ml//uypt9Lx6D2eRPwnYqYcqS2cbueRbcqbsUbw9IKJGIaAWbBktxvL/P79R173bCnAJxWH0ze+LRvA/q0KHzWJNUnBfqCyK9MRmLMzNSOATiV1YGxx+XX2GDOY0Pm7Tk/dE38LajWKtkPLfmLz4n9u97TKkumLQE7CwBg1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948075; c=relaxed/simple;
	bh=j2727zDvd9G/pRlFegMMtS5AtGImB4umCUDjqTbODNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWo3sr4GudmwAGzdfyA0Rlo86qqw/l9ragH0o2l5dv58BW3VdI44g9zVNp9G+s+UvOLEAny9ckF0Y8wW1fGUwi+MDGaGWL2efZCz6vZx9BUmmVgck3E+xMjQuKoVhERSzCX/ymo+KZS70Q32FwEYz2Uu2Vd9CWR/yZBJ0icCW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=DkAWK0og; arc=none smtp.client-ip=144.217.248.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 6F51F3E8C9;
	Wed, 12 Nov 2025 11:47:45 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 6C17C40085;
	Wed, 12 Nov 2025 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1762948063; bh=j2727zDvd9G/pRlFegMMtS5AtGImB4umCUDjqTbODNU=;
	h=From:To:Cc:Subject:Date:From;
	b=DkAWK0ogq1xpMsg6jqZHRmiOHpZwjHm7wlkdBz/e/gxwr1xppmzzl6tzpz6Y+tql2
	 /r+G48UteKG/L2FlHPIUyjjgcgGcYmkYRbdOnB5B3BPhD4qhKyXizWCP78pfM77ScP
	 34Vo+HmWJtfwvbev6P6aZAWNgmt2/f6v2dA7JlJQ=
Received: from avenger-XINGYAO-Series (unknown [223.104.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 65EE240C52;
	Wed, 12 Nov 2025 11:47:38 +0000 (UTC)
From: WangYuli <wangyuli@aosc.io>
To: kees@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>,
	WangYuli <wangyuli@aosc.io>
Subject: [PATCH] fortify: Ignore intermediate *.tmp files
Date: Wed, 12 Nov 2025 19:47:25 +0800
Message-ID: <20251112114725.287349-1-wangyuli@aosc.io>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 6C17C40085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[wangyl5933.chinaunicom.cn:server fail,wangyuli.aosc.io:server fail];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]

From: WangYuli <wangyl5933@chinaunicom.cn>

The test_fortify.sh script generates logs of build-time warnings
for string and memory functions. To ensure the final log file is
updated atomically, the script first writes its output to a temporary
file with a .log.tmp extension. Upon successful completion, this
temporary file is renamed to the final .log file.

If the build process is interrupted before this rename operation,
these *.log.tmp intermediate files will be left in the directory,
creating a risk of them being accidentally added to the git repository.

To prevent this from happening, add *.tmp to the .gitignore file to
explicitly ignore these temporary files.

Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyuli@aosc.io>
---
 lib/test_fortify/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/test_fortify/.gitignore b/lib/test_fortify/.gitignore
index c1ba37d14b50..8056bc75b442 100644
--- a/lib/test_fortify/.gitignore
+++ b/lib/test_fortify/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /*.log
+/*.tmp
-- 
2.51.0


