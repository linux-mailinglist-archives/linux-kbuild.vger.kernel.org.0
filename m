Return-Path: <linux-kbuild+bounces-1135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6300186F8AB
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178C71F21426
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593DC17C9;
	Mon,  4 Mar 2024 02:48:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811715B7
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520486; cv=none; b=D8NqEKoMGphQb6/WsafLcr7MVyGPraCXVgWaKKnXYuZvrxVbk2qi3KR6yBBg8aMs8Dv7fZfADwkmmJD2j3IzUY19FS2nTM/hM4e6zT6FLcS6vkr8nuoqtVy/Gi2c7Ds9gbJ/VwU1JEZ42W77Sj+YF+kxm+MEblS/Y5reYNThkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520486; c=relaxed/simple;
	bh=Su5g0IpXrm4Dgj+t6xUQYHTfMqgnqFGxtcrm3XAMPU8=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=Ol3BNX+bjketVn1oS8xMI3r5dU32/PQnceKAyqJPVnx0yGq4Q91qcOJKhEPCQCyVAc1r8b6YKd8tM63XpHqItCRAQrItKu4D/He8xN0jE84tosqsqnaVbMCkzJ2mENyBX+xtkgqqLbPTsZsV72kk2cYavtUyfKcmmCL4/U1+/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242hVaZ022070
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:43:37 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242hVj6022069;
	Sun, 3 Mar 2024 18:43:31 -0800 (PST)
	(envelope-from ehem)
Message-Id: <b2d3f5f9ae5831c2c180f7a00b3f6e6b91ae870a.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 18:02:28 -0800
Subject: [WIP PATCH 24/30] scripts/generate_rust_analyzer.py: modify use of
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
This one needs checking.  I'm less confident with Python and I'm less
than 100% confident what f"{srctre}..." does.
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fc52bc41d3e7..43e7b74cad4c 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -77,7 +77,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         [],
         is_proc_macro=True,
     )
-    crates[-1]["proc_macro_dylib_path"] = f"{objtree}/rust/libmacros.so"
+    crates[-1]["proc_macro_dylib_path"] = f"{objtree}rust/libmacros.so"
 
     append_crate(
         "build_error",
-- 
2.39.2


