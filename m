Return-Path: <linux-kbuild+bounces-1133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651986F8A2
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 023D32812DE
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA0819A;
	Mon,  4 Mar 2024 02:42:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAA3D6D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520172; cv=none; b=cYFaeRZSVlPYVu/tZLGdkLdxxizPx1SjjOkS9MHNSguy6Y1Rntj8hIADbPn1mlZBgK2fB9msrOoERac+2BcEJ8k4P8viMpjbqFEHBwROF7o5hY5iOzlHlaGxDOgy0bjgj63iCrtwMPDSy931hEMPdxvn7eIW/CI3CATykoJ90NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520172; c=relaxed/simple;
	bh=dtyOn492huKvbUeAvuyp6787D3pq67/5E2NJlF5zhoY=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=gDidq00r1msNOFe3Zj/7N4CeHYzPK5Ig8L4HFLsm+Lf0uyaBbgaKGsS6HpITpHFgzYosv3rwaxViqu66A/jxdOB9lYPnz5UeAHBZWNUqldJCCYUlM5GQoduCfuESCB2eIIvD4S2+T48tZkDUPdYymin2nFhkz3u6eqdxJoCQQMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242eF0k022055
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:40:21 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242eFFU022054;
	Sun, 3 Mar 2024 18:40:15 -0800 (PST)
	(envelope-from ehem)
Message-Id: <84b27a21c2201636ad1ed800fd7b63b8ca46f8ae.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 17:46:41 -0800
Subject: [WIP PATCH 22/30] scripts/nsdeps: modify use of ${srctree} to assume
 trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Once converted this script needs to match what the Makefiles have.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 scripts/nsdeps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsdeps b/scripts/nsdeps
index f1718cc0d700..76400843a932 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -27,7 +27,7 @@ fi
 
 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
-		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=$1 $2
+		${srctree}scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=$1 $2
 }
 
 generate_deps() {
-- 
2.39.2


