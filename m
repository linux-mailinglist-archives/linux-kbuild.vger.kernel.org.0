Return-Path: <linux-kbuild+bounces-1979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06388D8702
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 18:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05EE31C216B8
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 16:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AD312E1DE;
	Mon,  3 Jun 2024 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk6Nxb3i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD35107A8;
	Mon,  3 Jun 2024 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717431548; cv=none; b=lCiBYpRS2hsIBnSNI/HazBgenvI8qhqmwtXXEE+d5RTFW2A21rTIbU7qRxegiBVm0MCJ/rWQ3w36BWyiywPO/2ULDOihEaYYFP4J9CgLz7IU7fK/03TyGWu98IEkHVYpQMhqF3A1Ogb7+PcjyT+stAIXTYrl2+lpJOW/IObdcOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717431548; c=relaxed/simple;
	bh=rCDgZFugmfdl8JpNwxw2V086UDNUHBiB/yyVx8v0kvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ovXvTLLsWegW2j3c/Sk+ARmguf7GWpTAwnoKqsZLROJ+kTdnchTcVeMRZNEjl8wRmBPep//WvPBy3rdkj3wiPEtMQldcBEoT8Thp0vVeaO/+xzyrAmEw8K5FTF8dSyHpmAHMFX4q5st1MBDzGsPoNq1pl1yJ7Nmn3pRNZZOqubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk6Nxb3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7EAC2BD10;
	Mon,  3 Jun 2024 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717431548;
	bh=rCDgZFugmfdl8JpNwxw2V086UDNUHBiB/yyVx8v0kvM=;
	h=From:To:Cc:Subject:Date:From;
	b=bk6Nxb3i2C9bdiVrE92F5KbHsit6E7cAKg86Za7FsoWM4kQ+eITjnwqud7dMv88cv
	 00yelPuW47PuGbdFxNwU69SabjZGHOWIytOg/yVFu0QFb1FV9C/6785WmrmWAUwK2Y
	 yFY+pri7KibdUt7Tf/QCooW4eSq3K+EfVpEJH3Pdx4R5VdTVOZLW0quA6egt4hChF2
	 S2BztdXc9aRgIEZtJ4Z01s03hYxk3rH9OwSYZOxibvPXZITLiUFE/kes7lyLTo57AC
	 P53GNTPNzDQJ8QvisSvt78klU3dzqcq1MQFFsmENBjl/E1G3vGc3F8Bl0Uwri1tI5f
	 K6FR7qOtryVXQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] kconfig: doc: fix a typo in the note about 'imply'
Date: Tue,  4 Jun 2024 01:19:02 +0900
Message-Id: <20240603161904.1663388-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sentence does not make sense due to a typo. Fix it.

Fixes: def2fbffe62c ("kconfig: allow symbols implied by y to become m")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 555c2f839969..86be5b857cc4 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -184,7 +184,7 @@ applicable everywhere (see syntax).
   ability to hook into a secondary subsystem while allowing the user to
   configure that subsystem out without also having to unset these drivers.
 
-  Note: If the combination of FOO=y and BAR=m causes a link error,
+  Note: If the combination of FOO=y and BAZ=m causes a link error,
   you can guard the function call with IS_REACHABLE()::
 
 	foo_init()
-- 
2.40.1


