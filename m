Return-Path: <linux-kbuild+bounces-1134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3986F8AA
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7E4DB20A38
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DF715B7;
	Mon,  4 Mar 2024 02:47:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB133CE
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520478; cv=none; b=W2k7cHGRqcvGuh4QglRg83aT2R66Q+/vRykPMn96jIRlFr7mCRnRbNzVyoi05fsvG0HH/aXsbOBy+fg9mtipiUoM/QlfDgQklLq/x2tys4fo1Wvrjbv9RuVab1ZhbjOwuSr+li0JImYk30fNAwC6iR+UCwnCsRnvK0HT3PsJGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520478; c=relaxed/simple;
	bh=PTd8K4FFOvTBpIPDrrBxCB1FOvyN77hcvc15zjuVEfA=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=g/DtmruxuiktB2oaOc1TcHhiVlALaZMFbr5yP9tIh40huWtfGRsY8bIr5Cok0mY/thZEE82iKPXffRGOTdSCXwgrbRnVI3hvQZBaWvzt1PUxfz6IUbA4IHWaIcHhz9xZ0Z1Q6v8EFUiqxm5DofNbeBXM+peJKMG3eqGkwPL+2us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242j9vV022091
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:45:15 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242j9o0022090;
	Sun, 3 Mar 2024 18:45:09 -0800 (PST)
	(envelope-from ehem)
Message-Id: <8cc3f479d76cadf32a80cc4320f59f0c86ba4424.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 15:50:39 -0800
Subject: [WIP PATCH 25/30] scripts/coccicheck: modify to handle ${srctree}
 with trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

With the modifcation now done, remove compatibility with ${srctree} not
having the trailing slash.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 scripts/coccicheck | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 0395b6f943d4..099ca7c7603b 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -81,7 +81,7 @@ command results in a shift count error.'
 else
     ONLINE=0
     if [ "$KBUILD_EXTMOD" = "" ] ; then
-        OPTIONS="--dir $srctree $COCCIINCLUDE"
+        OPTIONS="--dir ${srctree}. $COCCIINCLUDE"
     else
         OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
     fi
@@ -210,7 +210,7 @@ coccinelle () {
 
     if [ $VERBOSE -ne 0 -a $ONLINE -eq 0 ] ; then
 
-	FILE=${COCCI#${srctree%/}/}
+	FILE=${COCCI#$srctree}
 
 	echo "Processing `basename $COCCI`"
 	echo "with option(s) \"$OPT\""
@@ -273,7 +273,7 @@ else
 fi
 
 if [ "$COCCI" = "" ] ; then
-    for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
+    for f in `find ${srctree}scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
 	coccinelle $f
     done
 else
-- 
2.39.2


