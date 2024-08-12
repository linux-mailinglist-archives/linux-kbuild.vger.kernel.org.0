Return-Path: <linux-kbuild+bounces-2944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B5594EA66
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72791C21088
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C75316E88F;
	Mon, 12 Aug 2024 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfueE5jv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1489616E88C;
	Mon, 12 Aug 2024 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456914; cv=none; b=n4RtNO5oHKl5zKIKSfAW+ul+qVg7+xDW9Tk7BqpMCK4tUtE01iitleRtGqsKi1za4qI63ETsiWAbDvbiynHEoX/8tubIHUfNnMqk4eAhaPkJnHk3x1qWPGnPyYyDijvTiZh1BK7xq8rdU4mGCJzeI+y58CvsdnZ9s0rCATNRIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456914; c=relaxed/simple;
	bh=vjNm8OF7rvg7d4nhPjUY4XnXnvyk9aMR6MQiQTSIj2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0WtNNiZFCHGHhetn4veGdxRkk0kqDlqNTwTq5sw+75wKxL9BvPoN4amSR4SUc/bjCsqZMbat0F45XYIfaTkTDhz1bH0MkuBqVyNYTtE2IZBs/xHOE0+WiHC/NB/hV4YciNzqt/xpC4Ok5saaMkR7G3v4WTbTh11Nd74DEIEVHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfueE5jv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08646C32782;
	Mon, 12 Aug 2024 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723456913;
	bh=vjNm8OF7rvg7d4nhPjUY4XnXnvyk9aMR6MQiQTSIj2k=;
	h=From:To:Cc:Subject:Date:From;
	b=sfueE5jvuyDJY0dlcI2ugyfYrsMksJ7zOPYcCi/1oCCfcyt8aRVcYpNEkY7sXsHf4
	 +L6+aG0No/85GjCu5rjg9kk2oMmLK9JHZ33F01qD82VUHdoDBDmxzey2vIKkB8AWum
	 gpwQlk0StKWTWCq1UJk/cdryxMUjnMYpy2hOHpcmlYI4fWi1iPSip0eg9chI3b12EN
	 HyxIVrKYkb4UI/V+xGWqGq/GI+MH+KMoKXvxZOMCBr1uyt/hgshqU0gWRYJ6mkwxF9
	 zk2QBNzJ/h3/ZxeqOv2X0rEV8OMY4BBmXiRmwrB1UqAUtjL2W1BpzPapjJrGsR5cp0
	 2B6BMkn5jMRMQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] tinyconfig: remove unnecessary 'is not set' for choice blocks
Date: Mon, 12 Aug 2024 19:01:47 +0900
Message-ID: <20240812100148.2083203-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts the following commits:

 - 236dec051078 ("kconfig: tinyconfig: provide whole choice blocks to
   avoid warnings")
 - b0f269728ccd ("x86/config: Fix warning for 'make ARCH=x86_64
   tinyconfig'")

Since commit f79dc03fe68c ("kconfig: refactor choice value calculation"),
it is no longer necessary to disable the remaining options in choice
blocks.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/configs/tiny.config | 4 ----
 kernel/configs/tiny.config   | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/arch/x86/configs/tiny.config b/arch/x86/configs/tiny.config
index be3ee4294903..aabafa3faa6d 100644
--- a/arch/x86/configs/tiny.config
+++ b/arch/x86/configs/tiny.config
@@ -1,6 +1,2 @@
 CONFIG_NOHIGHMEM=y
-# CONFIG_HIGHMEM4G is not set
-# CONFIG_HIGHMEM64G is not set
-# CONFIG_UNWINDER_ORC is not set
 CONFIG_UNWINDER_GUESS=y
-# CONFIG_UNWINDER_FRAME_POINTER is not set
diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index 00009f7d0835..b753695c5a8f 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -1,10 +1,4 @@
-# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-# CONFIG_KERNEL_GZIP is not set
-# CONFIG_KERNEL_BZIP2 is not set
-# CONFIG_KERNEL_LZMA is not set
 CONFIG_KERNEL_XZ=y
-# CONFIG_KERNEL_LZO is not set
-# CONFIG_KERNEL_LZ4 is not set
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
-- 
2.43.0


