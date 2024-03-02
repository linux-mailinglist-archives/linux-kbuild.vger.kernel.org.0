Return-Path: <linux-kbuild+bounces-1132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A086F8A1
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95EA2813C2
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23E217C9;
	Mon,  4 Mar 2024 02:42:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445B38D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520163; cv=none; b=avr+hAkf7h6GJa+XsaEhENoweMhoOcCRUsViC2F89iEa2G+RIAHAjDoDa8w7m2gtmXRkPl90slGM+VCg2OKRj6AfIgCgEd7+Mm9XwPwiIxMw7ZLqmZSIkJ+dUHbkLYde9VQRtpGXsVeCMXhZHAhNVPcLRUz9CPoUCdi/EBeAQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520163; c=relaxed/simple;
	bh=gLHO/4GgNBCr1PjzZJXytIRylBiPburVmOVApr8j2Sk=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=VBNCqTs9lSc77sJ6bsqfJZLYdL4OpCONe69cgwLj/rPVgH3L3bO5bsHJJ+Awhkq0jBE2R8vOdi17/ORHnXc3E3RnG/9vk0c+7pSv2Kf1bteSPyz0kri9nBvuJYZcsktXsDxbUFxK6T4mwy5LV8i8FpIV3j9I3qoK094X3Xpx2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242frlo022062
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:41:59 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242frZj022061;
	Sun, 3 Mar 2024 18:41:53 -0800 (PST)
	(envelope-from ehem)
Message-Id: <515716ab3ff387e1498fbbed6a019afb7ba420dc.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 17:47:10 -0800
Subject: [WIP PATCH 23/30] build/scripts: makelst: modify suggested use of
 ${srctree} for trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

This is purely a comment, but keep this synchronized with what
everything else expects.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 scripts/makelst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/makelst b/scripts/makelst
index e432af073a65..e9af9ac2a511 100755
--- a/scripts/makelst
+++ b/scripts/makelst
@@ -5,7 +5,7 @@
 # Requires the following lines in makefile:
 #%.lst: %.c
 #	$(CC) $(c_flags) -g -c -o $*.o $< &&
-#	$(srctree)/scripts/makelst $*.o System.map $(OBJDUMP) > $@
+#	$(srctree)scripts/makelst $*.o System.map $(OBJDUMP) > $@
 #
 # Copyright (C) 2000 IBM Corporation
 # Author(s): DJ Barrow (djbarrow@de.ibm.com,barrow_dj@yahoo.com)
-- 
2.39.2


