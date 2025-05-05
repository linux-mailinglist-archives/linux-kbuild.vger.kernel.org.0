Return-Path: <linux-kbuild+bounces-6954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE7AAAB83
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 03:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D8B27B0F0E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 01:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60803B2F6A;
	Mon,  5 May 2025 23:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etzu8Nb5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A463396EC3;
	Mon,  5 May 2025 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486390; cv=none; b=ljbq1RUCCbjK4IJedF9v3IefT7B3uTsx56d9uwr1ukTcRg3P1rz8maahznT7xdx6xOFmJ0murIps7tQ4jIcBoAh6jb5gnGVsZuhog7XYddIuhINR6zURJwM4woFamUvyoEHLS2GWTHjycWUMBq9dllmk6ohZaOwkxvSIVGy7V1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486390; c=relaxed/simple;
	bh=50o+LJ1eACnewrVR5dFUb4W6VBBY1lGHoNCIrnReK/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CjxvYluohZ9d0I2foRWXJdH6OhYJuXxb0MGWQMMXj6+ML2A4jSDs7iCbRPc7v4uP5blq6fOydtZoLjV/BIqDPEp/S8dVckV+9hqqsBGRCE7M8nwjr0SsV9vMC4vVaUxT2bf57JFtSrZbpkgdnX2asLw/+joKrXRq/Ki3KedJ1QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etzu8Nb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E45BC4CEE4;
	Mon,  5 May 2025 23:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486389;
	bh=50o+LJ1eACnewrVR5dFUb4W6VBBY1lGHoNCIrnReK/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=etzu8Nb5n5pRod/wQsEZ/Y133g9HODWtIR6F0NaLyto6SFRvfpazv+ACVnbdEG7cP
	 57hQnMWZYU7fqJ6wF02UUdsky0IcZ6Zagrcve0/TqoovD7ja2SlIwIEQcNW1IostK7
	 RI3llLdXGjuZ02ZSCGbZxpyAJP6MPu6+Ox4ls709FGOove9AU0n8W1lWWQZ6GjYVwN
	 JR74XlO44HOfgYp+FUSKY887UaAoSQXHc02z+LQiYvjoUtCYlUf7jITj2dhFmlF4Io
	 XqO+8lMQsShIbJr+9g52IsOs4shBQdYs39eOWR8di2ktRPVwjMpmlYi26ebTEZsxTy
	 EGCvdGPSceeGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 001/212] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 19:02:53 -0400
Message-Id: <20250505230624.2692522-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index 72da3b8d6f307..151f9938abaa7 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -105,8 +105,8 @@ INITFILE=$1
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


