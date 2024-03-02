Return-Path: <linux-kbuild+bounces-1126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A5E86F897
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6E11B209BA
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A454738D;
	Mon,  4 Mar 2024 02:34:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471D818
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519648; cv=none; b=tyWiK3urUxsH23LyADPZpPk6fKstj3+ti7yeTFbk7gAeDXwAo8tTzojLHYZJxC1fuX5ekVkM1j0NQzCBjTMBrcZayc8NHgWPU24k22Kq/kiGc5KXSyicDSHsvU4iD6jG+GjtQFBXaNdzICLnG8CdpOgSfCfvF5/+7mng2XC4534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519648; c=relaxed/simple;
	bh=2sn9EZi53zMlKPUXPXYI1DWkDLPRC9UWGEh0y2Gx7zs=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=W3Lj2PPnV38lMwsTHJC/fTvx4V2WAAgK/gSnFZ3Y07/8gjcfruKWqRLRhzj6C2zrwGjUbFM+XkKGzqXlclwGTCXO4nhrZRexQmRUp7aphBZtampW1UERpRaJAS8vWTZmv8/j+iH19hA7w7jhL7+xK7viDce2rGFOpB4bgDNJA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242SmHm021962
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:28:54 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242Smx1021961;
	Sun, 3 Mar 2024 18:28:48 -0800 (PST)
	(envelope-from ehem)
Message-Id: <d9dcd7eed4ae12719a3ae0924617fe37e7f8a726.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 16:29:44 -0800
Subject: [WIP PATCH 15/30] build/scripts: install.sh: modify use of ${srctree}
 for trailing slash
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
 scripts/install.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install.sh b/scripts/install.sh
index 9bb0fb44f04a..beda9b808cb9 100755
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -23,8 +23,8 @@ done
 # User/arch may have a custom install script
 for file in "${HOME}/bin/${INSTALLKERNEL}"		\
 	    "/sbin/${INSTALLKERNEL}"			\
-	    "${srctree}/arch/${SRCARCH}/install.sh"	\
-	    "${srctree}/arch/${SRCARCH}/boot/install.sh"
+	    "${srctree}arch/${SRCARCH}/install.sh"	\
+	    "${srctree}arch/${SRCARCH}/boot/install.sh"
 do
 	if [ ! -x "${file}" ]; then
 		continue
-- 
2.39.2


