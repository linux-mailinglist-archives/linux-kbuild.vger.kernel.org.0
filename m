Return-Path: <linux-kbuild+bounces-2899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39194AF6C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 20:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39654283E23
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFCE14037F;
	Wed,  7 Aug 2024 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg9F27sz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910314036D;
	Wed,  7 Aug 2024 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054317; cv=none; b=MGfwtAhtCvFl3WCfDcu5+21F82dI52A3bOrH5T+/NJad6P3DrA17wuhG2VFqqOSXfwDqWL0N1VCBqPF3Ik1J/3KflVPT7DeoCjqjmxHLEkSZUc86PuQdR+j4ViamWGNSQ8fcfMvMA32ju4gAFng1desL1lo2kUKBaO8QTMPScpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054317; c=relaxed/simple;
	bh=96wjoGW21I8Cg5lH0Ff3fLQg3ZQtnW6hb0JJMNljYjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7NL4PovDrUbMp6zwZe3AiGnZiJe2u2lXkY70EqQcp74YRt4ncOTpxsA1a3qtVh8WVhgDxR5A4YhuaIYgwPblb9GoEAtS1bJBx08G3allZ7KOlix+nZifCSWsFTMqqzc3MwMB6DEpowGxyWoAns3i478SE0aZBeqGEZPOGK4vkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg9F27sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2525DC32781;
	Wed,  7 Aug 2024 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723054316;
	bh=96wjoGW21I8Cg5lH0Ff3fLQg3ZQtnW6hb0JJMNljYjM=;
	h=From:To:Cc:Subject:Date:From;
	b=hg9F27szhPTs+yeNknu4o+S1ZwJ7Je/zIopUBShA7n/qsY1gyuWgiblV4t7a0g37G
	 95M5ACvr9MoHFX5pbIr/pTYSveWO4t30eF5KLCZtHiBbDTMAaYOwyz5yWsN3/rooVt
	 OeS6gK8bXv60JVj0vuavtDLhhVI150XDih/MstNPBPXXHgchNmHrUD7ndiLu0mgxC6
	 2g5HRtdB6w3OfgqYdLpzrqZo9atz7FrmKJG0PqVxAdRIemEndGhqi83D9J4eHuk/zk
	 1JdftKf9tv771EMce6BikfophBXYTia8ei4cwO4uDs9kkkcVg85ytHNMOMvX4J4/JE
	 naZPk2pwkRNcQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: avoid scripts/kallsyms parsing /dev/null
Date: Thu,  8 Aug 2024 03:03:00 +0900
Message-ID: <20240807181148.660157-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On macOS, getline() sets ENOTTY to errno if it is requested to read
from /dev/null.

If this is worth fixing, I would rather pass an empty file to
scripts/kallsyms instead of adding the ugly #ifdef __APPLE__.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Reported-by: Daniel Gomez <da.gomez@samsung.com>
Closes: https://lore.kernel.org/all/20240807-macos-build-support-v1-12-4cd1ded85694@samsung.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f7b2503cdba9..41c68ae3415d 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -219,7 +219,8 @@ kallsymso=
 strip_debug=
 
 if is_enabled CONFIG_KALLSYMS; then
-	kallsyms /dev/null .tmp_vmlinux0.kallsyms
+	truncate -s0 .tmp_vmlinux.kallsyms0.syms
+	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
 fi
 
 if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
-- 
2.43.0


