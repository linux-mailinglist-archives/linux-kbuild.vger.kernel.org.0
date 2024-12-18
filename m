Return-Path: <linux-kbuild+bounces-5170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AB9F6343
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 11:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 769437A6145
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 10:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C9319993B;
	Wed, 18 Dec 2024 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUXTZ5Os"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8319924E;
	Wed, 18 Dec 2024 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518242; cv=none; b=XplAx+Df+DZKhx9gWYYMoxrNaNDpOTdtvFLMSAn/LrPUhdSOJwX+7GeKd+R4OmFhkzM9nEPfA/iBJFgYHMxp3tuXYmW9QfUAn1JaBdFEzYr47mUxjW+fkq+7pEoG8tuqRIpaIFuDvTaQrLCWFFhP2TzPOhhoYr6aHhJ8a2v68d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518242; c=relaxed/simple;
	bh=AjUu6VWPpBTc1hTsoOVKDhr3G4FHPsKqOD/7bHQl3zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nwh6X/irRQn3zeNWfg+SIdvjIN8uvcJokR+AM4EW/9FA5hSXsn0kzn+DhT6BFsFeSq7u1B/K76GER9uoO8HpN+IPfCyJQywgLeFj0ZcyAvBGczBMSnzFbJFyr+shA6SNu61gn3+02wppkI66Y1Jq9DGnq1zbQV22UUmkitVOXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUXTZ5Os; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166C8C4CECE;
	Wed, 18 Dec 2024 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734518242;
	bh=AjUu6VWPpBTc1hTsoOVKDhr3G4FHPsKqOD/7bHQl3zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUXTZ5OsTu2EppDOsOppM5Bvk8EOgpcBPUFYc8a+zo0OujaEUBRYXmvlDUC0RYslh
	 RM0spyOT6BjS+EZ2IT9RylpqPNWgHDtDqcZnCBfIq0wwvrFBMrok0SvYnYhI8w2AtR
	 iVslySn4ri8rpjrBb8bt8ZOlnohZaM/OU9kqM92IL5NYjuC4jkl6SGdNiD6ZEUSKeY
	 pS84GCcqhMuZkl76lSdQdEBCt4elqG2KHoazjAzGxDupBkp2V3bLJXF5kYRjbJu5sS
	 OYX/LWgjEzgwY4NeTbazBehw8qA2yk/mQ4Q3yt3uV6XYynlJUJAG4PvWgSnkYNxOC3
	 muByy56d9xkCw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/4] kheaders: avoid unnecessary process forks of grep
Date: Wed, 18 Dec 2024 19:37:06 +0900
Message-ID: <20241218103716.137489-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218103716.137489-1-masahiroy@kernel.org>
References: <20241218103716.137489-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude include/generated/{utsversion.h,autoconf.h} by using the -path
option to reduce the cost of forking new processes.

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/gen_kheaders.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index a0e3fbf4afa4..c2eba1a0d772 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -48,9 +48,9 @@ all_dirs="$all_dirs $dir_list"
 # check include/generated/autoconf.h explicitly.
 #
 # Ignore them for md5 calculation to avoid pointless regeneration.
-headers_md5="$(find $all_dirs -name "*.h"			|
-		grep -v "include/generated/utsversion.h"	|
-		grep -v "include/generated/autoconf.h"	|
+headers_md5="$(find $all_dirs -name "*.h" -a			\
+		! -path include/generated/utsversion.h -a	\
+		! -path include/generated/autoconf.h		|
 		xargs ls -l | md5sum | cut -d ' ' -f1)"
 
 # Any changes to this script will also cause a rebuild of the archive.
-- 
2.43.0


