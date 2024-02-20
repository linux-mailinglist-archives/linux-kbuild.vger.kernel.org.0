Return-Path: <linux-kbuild+bounces-1030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D485ECDC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 00:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9911B22526
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 23:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F86212AAC2;
	Wed, 21 Feb 2024 23:24:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A737A35
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 23:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708557864; cv=none; b=lH21a2J2X2TwndOYea0gxibK9wa0P/WDQ9DUAB8J/MdZdMT9eNwHPNZPdOLTmIlik8vOtz5l85eqw1bbBGOACUfWI6dBlQVVZN67SHokzCwI8uPvzqEaY8o3iV9fsJnYtgs8zBGyWtxhvmnbhj0liNYFo/wXcvxp03R7ER78Y24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708557864; c=relaxed/simple;
	bh=b9hFj2LFCfX8y74VxcYrNu/sUD2ncThRizOrIEQfbI0=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=NoH3vekJ3e/PDzyk+q/MGyHvPtZTHgiZ19plXeD7dXaEayhjUDQQ2JEM2iev2I43Bhh/IpdNdFLhvgQSFapkuoHiBRJEmttzRD7sLaP3mozlZIpvQpJzINdYSLqyQ0FFqqA/sZfxXAvoPcwBcpik+GCxzif+wpL4Az0X9D7htuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drgnwing.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drgnwing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 41LNHmer041168
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 21 Feb 2024 18:17:54 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 41LNHl3C041167;
	Wed, 21 Feb 2024 15:17:47 -0800 (PST)
	(envelope-from ehem)
Message-Id: <93f26945aa19bc9f6226d8660fabc91d568fa83e.1708478592.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1708478591.git.ehem+linux@m5p.com>
References: <cover.1708478591.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+raspberrypi@drgnwing.com>
Date: Tue, 20 Feb 2024 09:13:37 -0800
Subject: [PATCH RFC 3/3] build: change $(srctree) to empty for current directory
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Split out to highlight the actual changes.  This would break things if
done in the first commit, so do this as the final step.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3eef5c56f863..edb5d3fceb30 100644
--- a/Makefile
+++ b/Makefile
@@ -246,7 +246,7 @@ else # need-sub-make
 
 ifeq ($(abs_srctree),$(abs_objtree))
         # building in the source tree
-        srctree := ./
+        srctree :=
 	building_out_of_srctree :=
 else
         ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
-- 
2.39.2


