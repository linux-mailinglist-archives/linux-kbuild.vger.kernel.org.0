Return-Path: <linux-kbuild+bounces-6956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0FAAB293
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 06:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F4126188C271
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 04:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D242936BA5F;
	Tue,  6 May 2025 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2/XiBUd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778B36BA30;
	Mon,  5 May 2025 22:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485799; cv=none; b=udpD6/p/iEj0k6VAsI2N3v2mxx+4GvQAsNm8JPRsm5mgZnb5JMLhLM7uErmgryTcBnOm6CMW57mQHh2G5Mu3Wbh6eaY2RdM2E36dUf02mDxhevEDLRc5tMh7CwxS185DmcEJXasQTONaqox1HGrWD6OXy8vTDSBkBo9k6XEnFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485799; c=relaxed/simple;
	bh=JCdTVHeAiF0SMN4hqWeIRsGnSNa8+AKoDVxqQWbHrto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f+1fbrmhqzDAb6hMtBlGNMRQES1xjk3tNmzsX3cbLLfLj4cYFRFWf1qFB2HImtD9FdXpXGznPlTuJfhW/1HUJPnqIrRsa4ok0VM9QhV0gzFiEmeleKzQH/vhtPLvlQlzNbPiOq0F/iD+qt4CkXuOihpkFe8f4nepmYZT0tIVHXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2/XiBUd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0B9C4CEE4;
	Mon,  5 May 2025 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485799;
	bh=JCdTVHeAiF0SMN4hqWeIRsGnSNa8+AKoDVxqQWbHrto=;
	h=From:To:Cc:Subject:Date:From;
	b=j2/XiBUdvdi0HNLkKt5p/rtdeM7tK/7f6LbZGUJmErItlsQ+8NxM8COpF+KqVSJKP
	 dlv11sl81EuykE0EwnfnKjyLbME1HhNUmqEucbiJT3KXMc6ZCJ2JhzS+ADsNlLgha+
	 cnQIOofE9yMqtTU7XQFoB3l9EDDr/LeKC5VaI+P8VjtfVIUrLOJaSiZcYGB+NiX20l
	 iBYofWnSjXqMXSPZBhDXdNUkBYuhFafYkTKkfoOhPCfKAQ0RhGO8Zx74lTVI3tO3eU
	 SDQOPbTrx4rKbh4+d6pNX35qTEbP9P93dQ/ring9ldZqQQLXLNU9HCkqyon2BgoAJU
	 CMBDITGgySTog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 001/294] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 18:51:41 -0400
Message-Id: <20250505225634.2688578-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 0b7952471c18f..79c09b378be81 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -112,8 +112,8 @@ INITFILE=$1
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


