Return-Path: <linux-kbuild+bounces-6958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760EAAB5ED
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 07:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2A333A131C
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 05:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EE029B8C8;
	Tue,  6 May 2025 00:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvAPqnuF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE02F37EA72;
	Mon,  5 May 2025 23:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487317; cv=none; b=JmV+q33VyJJaMxjGPJBYgKZLFAwPmDykjOt5Vk3pELBqNQNl4g6hzcnwV2c/p5616bGen0rAge20viWMXfsh/rxjA/vzY7s8+JHi9fJxrbbGpqDy0eBdViwkcx15QG7eZXz9njOamTkQB1xW2Rurr60h6Tv0RseZttn4OMgT7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487317; c=relaxed/simple;
	bh=D7yTrFE188wv1sO2UwjIZZtfQPAmYQjWziJlrOLJbv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q2NgCI6kJOArkEqwuyGZ9BzGt8e7vKmQAPBz/EpFgXonZEwNQBxKkvoCfHmVUOOUlArOUrkTwcT1FlAPefyNZXCizS/jphWJU5iL0GroAgkYn76YvBPWSHHVEd4//fmBrMMhst2u5d8kLguNqE+47Y+bTKZnYbvRosTBwNcKLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvAPqnuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE31C4CEE4;
	Mon,  5 May 2025 23:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487316;
	bh=D7yTrFE188wv1sO2UwjIZZtfQPAmYQjWziJlrOLJbv8=;
	h=From:To:Cc:Subject:Date:From;
	b=hvAPqnuFE2IaBSPX0HQH1FbKNmuDPHas5hitzGTv2jpFYTwkppVnA5oakg7/yLIIj
	 vUqGoXTtkRZrwMxU0edC8VuyIuDkg0eftsOLE8MdaKFP9i8D5Hegu2fgYztflrADKF
	 dkFbCR3IRhgSBpOWWNcCczPJehqIeWPCef9w+jc8D22bdrqJpx9Xr6g3dc6jDCLjXh
	 Q5/JgJ0lvyXzjJJCevv2s/Nt2Ir1msiHo5LjDMv+Aq/sf+o0iqC3QSmL1Def/GhWoP
	 dFNBMEbOrZvqXxGljfeNm8NK4T3neALNeAESY1dYYuTjREVSSPn1E0yT/uX6eVVPCw
	 3GqXfkJ4t3ZUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/79] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 19:20:33 -0400
Message-Id: <20250505232151.2698893-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
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


