Return-Path: <linux-kbuild+bounces-1136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2C86F8B0
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D4F01C20C07
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E46C19A;
	Mon,  4 Mar 2024 02:50:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989DE6FA9
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520610; cv=none; b=mmbXmgX3SwIH4xDBq0G4f0ebE3tARm6UGaU5CqXZmWhZWqb7NAmF3dOzY/ArWJLPTShULKSzIejyb91qqRhvN2X28AGJzKZjBSvX6u+85U4I1F2A8A+pD/aLhnUA7Vj+w9Z9AU5HMJAJajW0FA726as9tl4NRjgmE2kKWb1oORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520610; c=relaxed/simple;
	bh=IyJ8hyPpfUH9AMRmbCRgOK2sukwg8CsfORMNeKZu+pw=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=oh4OaE1vpRD8jPxtHsOuxeRtz3jjTByx5JijII6d/gsi/sWCd+GDKF1F0j92532m/G61KlUJ9xpT+wx5QiracoDgzLc9B6/y5EbwzdNyh9T8NCOVf/XzQ76unkht3Cp/t1FB+P7KZL+yZ4OFGW5zUjoGM32mUmMpxNjUT7itOk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242klOq022103
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:46:52 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242kkpV022102;
	Sun, 3 Mar 2024 18:46:46 -0800 (PST)
	(envelope-from ehem)
Message-Id: <0e536548359cb5e8b97431c5c981ce567e20a9e1.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 26/30] build: change $(*tree) to empty for current
 directory
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
X-Spam-Level: *
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

Split out to highlight the actual changes.  This would break things if
done in the first commit, so do this as the final step.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ef6d00addeed..74ebdd08647a 100644
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
@@ -262,7 +262,7 @@ ifneq ($(KBUILD_ABS_SRCTREE),)
 srctree := $(abs_srctree)/
 endif
 
-objtree		:= ./
+objtree		:=
 VPATH		:= $(srctree).
 
 export building_out_of_srctree srctree objtree VPATH
-- 
2.39.2


