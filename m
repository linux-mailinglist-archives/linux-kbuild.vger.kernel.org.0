Return-Path: <linux-kbuild+bounces-1111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81886F862
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AAC6B20CC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5C1A31;
	Mon,  4 Mar 2024 02:07:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1317C8
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518067; cv=none; b=XGMJROnRa33ohvcifIn0y0SzqLevn1VYJVseTvPawCAJeuQxkJspcD6cCzxJn0L0HkEfuWW1bAk1XuqBuDuJv6p3Iokdlx4toVBuP0whSxJKQBy5bOal+EwbFDBDtTl7u5MjwTazTy+m4j/J5iLuNsVNJSYelvAFg8B3HidLOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518067; c=relaxed/simple;
	bh=wMWQkqUdfC0yI0MQI1J3ZDaFVj+qTh/wgfyJJ8gv+Io=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=N9db+K3iI/jIZhgwREIn9PqipOMYWCVl0uFGbfdddCuCVS/C1Q9vW5/nVN1/PWxh7KPqjcqYnmTx9MVECoduLrnzDbdD8xjfhWshXufO4IBKK6w77wI9hQcx4g6Q/IeUjzvyEj7hrRlneYVD7fxAJTV4k/RNkJI+q5kDM1BmU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42427T3O021796
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:07:35 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 42427SrM021795;
	Sun, 3 Mar 2024 18:07:28 -0800 (PST)
	(envelope-from ehem)
Message-Id: <560cdde84d8bf9373db7a3d948d739d56f41e6e2.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 15:50:39 -0800
Subject: [WIP PATCH 02/30] scripts/coccicheck: modify to handle ${srctree}
 with trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

These portions of the script would break if ${srctree} had a trailing
slash.  Since such a change is hoped for, ensure this script can handle
this situation.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
An intermediate since for some versions need to handle both methods.
---
 scripts/coccicheck | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index e52cb43fede6..0395b6f943d4 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -210,7 +210,7 @@ coccinelle () {
 
     if [ $VERBOSE -ne 0 -a $ONLINE -eq 0 ] ; then
 
-	FILE=${COCCI#$srctree/}
+	FILE=${COCCI#${srctree%/}/}
 
 	echo "Processing `basename $COCCI`"
 	echo "with option(s) \"$OPT\""
-- 
2.39.2


