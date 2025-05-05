Return-Path: <linux-kbuild+bounces-6952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E63AAA83B
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 02:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148611B64A49
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 00:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2B7349B7E;
	Mon,  5 May 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuJT/nec"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72472349B77;
	Mon,  5 May 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484767; cv=none; b=iAF5uI01XMOF6hALxAXRwe1FfEAI/7m5A/YsEFSTZYuDuhsVXjZRyCzBTn5vJy+A0Xc2RwjC//kjyjC4e6fOosLz1QXwar2BQnwdwWPI/kSbaKhe+tB0As8ZsKKdPTmF8qb5wUdnSClKCAtwRcdVRoP/E/E1bgcGUPWBbL8DJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484767; c=relaxed/simple;
	bh=JCdTVHeAiF0SMN4hqWeIRsGnSNa8+AKoDVxqQWbHrto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AMu00qd6DONrOunZU2pqefMropf/vSXnPi7ZI00PER/Yad2ZuLC4Y+v+IIGA1c8KsiZV7s6U8hrsAbI6ViSonmu6SME4zeBw2seA4ETZ9QNaj3fj26zVWy9Z7eDtn+B1jrO5h6n81LsSbx3U3I3sHSab6rKMPKS/EHYNd8fuTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuJT/nec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB3BC4CEE4;
	Mon,  5 May 2025 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484766;
	bh=JCdTVHeAiF0SMN4hqWeIRsGnSNa8+AKoDVxqQWbHrto=;
	h=From:To:Cc:Subject:Date:From;
	b=IuJT/necH5KzaBxc0GwYhsFnRZ/fHKnzhVBa1ZQMB+YXspnmslQzvBIR5v99dUT1o
	 r3w3aoBh687E/G8Ed30qgk08mHrB08Zdw32eeQDE8yg/mp/QrAqMmB4Bu/G2Jig+TS
	 2qDDpjMLZdBc3V0jkEWm0dFgdbhco9rdVw9juzpNaW4efTb5pZTGRSJgMzW9XleFkG
	 9WqcH8YdeSWLRBmuUoQJNn17797BGpTSN593IhiyOYoH3zd0sKKtXjT+a2KiqYfmyl
	 E9/oHJmc8CHh7R4kYR0q4YDK61a0Sf3jagbzJ+2o6QlfwAT0ulj/MSUn2CHphxeFYt
	 1CSdpnF7KZWlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 001/486] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 18:31:17 -0400
Message-Id: <20250505223922.2682012-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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


