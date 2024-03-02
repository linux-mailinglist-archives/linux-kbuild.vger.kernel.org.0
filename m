Return-Path: <linux-kbuild+bounces-1128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59C86F899
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8112DB20AB9
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A8C1FAA;
	Mon,  4 Mar 2024 02:37:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92E38D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519832; cv=none; b=Iz6UAGx/Dj0G9jVsXvmju+xfElcVUniDu5IEHkFdwNG+VCW0wihdKuXOuBLYTQqp/ukyeF3iErxOOjWNJ/VwR/cDrs7Qqb5AYa1lbA0B/oP4DqD2Xbo8QjwNrQq5ZTAeufEivu7PLVEWqL1uMOLyQX/Hn99uYyKN6Hm8VS58Fek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519832; c=relaxed/simple;
	bh=WRyOSFy0go59gBwZ37D0NyxxWYEmX4Jwk3P79nRz4Qc=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=pFX+SXxiibVthgs2PPXqCugtBHj+O3/tLpuPkNag2XZ5yk5XTqVUgNB3jjKLlEXOn+ZoKEU9M7a+bk8GVnszxIOLhAsty3padPC52k46cmglvGpKQEusLmkQVSAgr+tb5UQjyq0JJ2bp46OsOw0M8SGcjobTA/ywzXuU+DN3p64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242W5Wh021982
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:32:10 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242W45G021981;
	Sun, 3 Mar 2024 18:32:04 -0800 (PST)
	(envelope-from ehem)
Message-Id: <90c316089a2e1c92800973aee3415dde4afce27c.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 16:32:06 -0800
Subject: [WIP PATCH 17/30] build/scripts: generate_initcall_order.pl: modify
 use of ${srctree} for trailing slash
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
 scripts/generate_initcall_order.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_initcall_order.pl b/scripts/generate_initcall_order.pl
index 1a88d3f1b913..d925580ee567 100755
--- a/scripts/generate_initcall_order.pl
+++ b/scripts/generate_initcall_order.pl
@@ -12,7 +12,7 @@ use IO::Select;
 use POSIX ":sys_wait_h";
 
 my $nm = $ENV{'NM'} || die "$0: ERROR: NM not set?";
-my $objtree = $ENV{'objtree'} || '.';
+my $objtree = $ENV{'objtree'} || '';
 
 ## currently active child processes
 my $jobs = {};		# child process pid -> file handle
@@ -203,7 +203,7 @@ sub process_files {
 		} else {
 			# in the child process
 			STDOUT->autoflush(1);
-			find_initcalls($index, "$objtree/$file");
+			find_initcalls($index, "$objtree$file");
 			exit;
 		}
 
-- 
2.39.2


