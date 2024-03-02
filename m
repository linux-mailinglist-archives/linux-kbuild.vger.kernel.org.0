Return-Path: <linux-kbuild+bounces-1130-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A735486F89B
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C593B20A85
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D99717C9;
	Mon,  4 Mar 2024 02:37:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865EF38D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519855; cv=none; b=KohDx+zILmv06MSHb1DCYZf1ss20CeyBGxwSvmJCH+ej7Rcb9NYFp6krPeJmdYDFAMTiO2NR2SZmYzOvwZFXQQIGkb+YTPZMVcOrnW3D0pDS+tD6AeQk9o0OZ9ph1wWKGPyq8sDh03ZMC9X4xnw77rwbEvS48IT84iVs6xi7StI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519855; c=relaxed/simple;
	bh=fahXwbP+fBi8gEFB2/Kq3hjpJjy3+rt+ZmKXm32UicQ=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=qwW25sd/Xw1fJo0JV3O1//z4ET4oAA84r/a9E+1EuJtThUsyikI3Q1OSnQaD8Wea3vYIwDM7994g4HjZK9V6s50JIAm2Nl8CTc6HW7ZDsR9zxU8VmUnWzLo6Jth8u5Y2p5JLVxmMNnFp8hd1aQ4B5NEedeiBOt/qJKLXZqYE0+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242Xg6Z022000
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:33:48 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242XgsL021999;
	Sun, 3 Mar 2024 18:33:42 -0800 (PST)
	(envelope-from ehem)
Message-Id: <a773e24967ef57ada833a6983b8801c4717cee46.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 16:33:23 -0800
Subject: [WIP PATCH 18/30] build/scripts: streamline_config.pl: modify use of
 ${srctree} for trailing slash
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
 scripts/kconfig/streamline_config.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index d51cd7ac15d2..8e30b8458739 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -354,8 +354,8 @@ my $linfile;
 
 if (defined($lsmod_file)) {
     if ( ! -f $lsmod_file) {
-	if ( -f $ENV{'objtree'}."/".$lsmod_file) {
-	    $lsmod_file = $ENV{'objtree'}."/".$lsmod_file;
+	if ( -f $ENV{'objtree'}.$lsmod_file) {
+	    $lsmod_file = $ENV{'objtree'}.$lsmod_file;
 	} else {
 		die "$lsmod_file not found";
 	}
-- 
2.39.2


