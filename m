Return-Path: <linux-kbuild+bounces-6955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A01AAAFC0
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 05:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DBAB16FDD9
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 03:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC86C300A2C;
	Mon,  5 May 2025 23:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5IEoz/d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146F3AA15B;
	Mon,  5 May 2025 23:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487102; cv=none; b=FRGgflkam7SReT7WWq2HU3IRpGlazMt2vr57gZRarK1SmiplyoMtbcLyP9bgBK2JUlo2w8G+QGMDhUgDxvpQngiX4g38PB9vGFIoNFO4PQRXwdFtw1lAMkSI/5CNIgL7m1Q8/TxwR1k+delm8+eBjkLETC5nKMKJdoL/x83PMDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487102; c=relaxed/simple;
	bh=D7yTrFE188wv1sO2UwjIZZtfQPAmYQjWziJlrOLJbv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y6OcoAHX/aq9GU25roqCTtQqJWXvttyJC4IceNXFlRJ9Aold/Av8vfp6tNrA1mDafVIPy2qk5gStferBu93ruh+0YPYb4yO7zZqWdpsDJGHcW9yPwFrCttg4i4u4JtWnq34vXL9FRQk5VWQAIrN8hDP1vOTl/Q8NnPiQPWXbuco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5IEoz/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD86C4CEE4;
	Mon,  5 May 2025 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487101;
	bh=D7yTrFE188wv1sO2UwjIZZtfQPAmYQjWziJlrOLJbv8=;
	h=From:To:Cc:Subject:Date:From;
	b=d5IEoz/dKUdE6YumbVaQSCpi8ok0eiUJeMczX6EZ3b5k9rDiziozV8ANrLEJGF/5J
	 v/r/t2O6/AqFcJ+Mt74t6MFyD3PBJOdoM0n726szHeXT45FmCugrKpcFQZmtuG1vlX
	 nLDrz/N1aeRcHYtU7yqy72l3xzJ96rescpG2UTnVjJD2i48IRI/5ViM3UpvZgjOidF
	 IRyr17QMx1PGDjYH8IpYnmAfeTGQiTVBaYPpCf0HjKo3UOIOApHrhXmSbfgqiZqhKL
	 /trSk0SZ+F4ODIe2ADX2JFKM9XrRpJkaW2YUJExczDI4MhVpDjMrxBRg37gNtq/IVc
	 xSg+Rz+zj0YgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 001/114] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 19:16:24 -0400
Message-Id: <20250505231817.2697367-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Daniel Gomez <da.gomez@samsung.com>

[ Upstream commit a26fe287eed112b4e21e854f173c8918a6a8596d ]

The scripts/kconfig/merge_config.sh script requires an existing
$INITFILE (or the $1 argument) as a base file for merging Kconfig
fragments. However, an empty $INITFILE can serve as an initial starting
point, later referenced by the KCONFIG_ALLCONFIG Makefile variable
if -m is not used. This variable can point to any configuration file
containing preset config symbols (the merged output) as stated in
Documentation/kbuild/kconfig.rst. When -m is used $INITFILE will
contain just the merge output requiring the user to run make (i.e.
KCONFIG_ALLCONFIG=<$INITFILE> make <allnoconfig/alldefconfig> or make
olddefconfig).

Instead of failing when `$INITFILE` is missing, create an empty file and
use it as the starting point for merges.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/merge_config.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d7d5c58b8b6aa..557f37f481fdf 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -98,8 +98,8 @@ INITFILE=$1
 shift;
 
 if [ ! -r "$INITFILE" ]; then
-	echo "The base file '$INITFILE' does not exist.  Exit." >&2
-	exit 1
+	echo "The base file '$INITFILE' does not exist. Creating one..." >&2
+	touch "$INITFILE"
 fi
 
 MERGE_LIST=$*
-- 
2.39.5


