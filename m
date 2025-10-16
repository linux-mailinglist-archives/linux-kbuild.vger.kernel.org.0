Return-Path: <linux-kbuild+bounces-9194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7753BE1A9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 08:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A60234F1802
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 06:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F6414F125;
	Thu, 16 Oct 2025 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AYBBIvEg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A2253F1A
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Oct 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594947; cv=none; b=T+mS7rCM+qkk7veb9LoOdRbQYaQYo0KfdUwoKLcX/cBiymF2LgrNQ+7nxBGhNukUUTMKfQ2lESETwgqE+UiAXCIVQMamQhH25xDt5HDqfb7eT/q7ON7Ze2FeE4+L1Moz/bEPt3Mn/1LX411yTRK6F4/InLe5A56mLw0ySNCEehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594947; c=relaxed/simple;
	bh=U6+MOhPz4vHfdpkZC2kX9s+OJEg++/O3iEMJbd2l2Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clChiB6AcOuvOnF+kC0h6BagAr0LrYZdLRPoBlTV+hWHv9csG/ERVd6RnMLLDvwjCgv8P9okjnDm8NMn5vbA2NJCYz+aMRxWUWZh+iBmCp0oTGSOHb7xBspJHHY/LxgwQaAaczmaW8hHHWrgDsmWxUOPiVKwmWr7Q3n7Ps6ycsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AYBBIvEg; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760594941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sYhoYXLiQUB8SrAY1XoLO3mtUtnTL7DCjkkjAj0nR8g=;
	b=AYBBIvEgJNEYhdvKCR1WlxA6iogoWnFHirY2YA4i+UP/queJ3YpsNa4gEe7BvweYw/c2PU
	X6KA8wlkj1P2NMww7j+jqgLlGIpgPfytK/ZNqEGE36FvBSxje4/1oK9AOpzcL/yoounTn9
	td9RgWjHeTtedJfz50w5Ioqomvk16zc=
From: Gang Yan <gang.yan@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	David Disseldorp <ddiss@suse.de>,
	linux-kbuild@vger.kernel.org
Cc: Gang Yan <yangang@kylinos.cn>
Subject: [PATCH] kbuild: doc: describe the error caused by pre-epoch timestamp
Date: Thu, 16 Oct 2025 14:08:55 +0800
Message-ID: <20251016060856.982288-1-gang.yan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Gang Yan <yangang@kylinos.cn>

This patch documents the compilation error that occurs with a pre-epoch
KBUILD_BUILD_TIMESTAMP. By providing an example command and the resulting
error, it helps users identify and avoid this issue.

Suggested-by: David Disseldorp <ddiss@suse.de>
Signed-off-by: Gang Yan <yangang@kylinos.cn>
---
 Documentation/kbuild/kbuild.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 3388a10f2dcc..1ffc782d2061 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -331,6 +331,15 @@ UTS_VERSION definition (uname -v in the running kernel). The value has to
 be a string that can be passed to date -d. The default value
 is the output of the date command at one point during build.
 
+However, when the date command retrieves a timestamp that falls into
+pre-epoch times (i.e., dates before the Unix epoch, January 1, 1970),
+the kernel will raise an error during the compilation of initramfs. E.g.::
+
+    $ KBUILD_BUILD_TIMESTAMP="Sat Jan 1 00:00:00 UTC 0000" make
+    ...
+    ERROR: Timestamp out of range for cpio format'
+    ...
+
 KBUILD_BUILD_USER, KBUILD_BUILD_HOST
 ------------------------------------
 These two variables allow to override the user@host string displayed during
-- 
2.43.0


