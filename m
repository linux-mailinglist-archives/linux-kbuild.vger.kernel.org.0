Return-Path: <linux-kbuild+bounces-9662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE0C69558
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 13:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 461AA4EEE96
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 12:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8018030C601;
	Tue, 18 Nov 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="SKeWdvoj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470D2459E5
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468250; cv=none; b=FoR1lDnSblQiAwPaGX6WlCWt19pCciTTniW6O+x9c/YJmKPKmY0Ygy0cgpxSayYmgMbYXLJGKK9wUh2vzH4UsToFwQtx59YzpZiPc2K0Gfd6kTYX04uSk+4ZImeqJMVB3qSE9lHC+V15oyFffge5jqJNibxuCOghPXVGk6dBf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468250; c=relaxed/simple;
	bh=FI1h5mQRX2iWFv5zjA4jlgBHWjbpK50RPjlYlY8VBso=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=dwUjSCe1uCwPz4PLUQmNPvgUIcVG4qYMCiOU1OQpaO6ce4sSTyFXIsLB/izilg54tVUg5DPdqhBWERbEA0/Nwc31bMcYmXF0qmv1EDM6FdSdHzgQaJa2wzz25Zd5OetObhZ5QCqXz3ikjjwrR1oANz5JlQfnF666tEU4X319mo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=SKeWdvoj; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=yA1z6/yzX06CrYPNUozJJh9ZoiURLo5ikElsnyrc8uU=; b=S
	KeWdvojIDZ9GnBUOh2L2GLCjWXTUovyDh2aZprrXCzXLADAKfJ2mz5PR31GBFQQ+YLU7dbwl+uBSj
	xawb3/I1mG5sn5GF/0Qj4UcPiSBQoygOrcvNQ316GvHF1l05+uGw1vrkubISIvk9UbNshQrSQFv+5
	BCE57WIVg6PGax+hCm9eZ8SoHCz92j2YAy8c0YfpXsc5sBcUv4DJ2GVP9McavTMv4bOkAdi9N71RV
	hE7SR7sz3bVLi3P28EYH12vct6mV2uJaGGsvsmcL4MHbDRLHiKPUuWAo6G68bRAr0RBhSqgovlLX8
	EDEszr7HDJQTpWoyaLP9AnlJVE2weGQIw==;
Date: Tue, 18 Nov 2025 13:17:35 +0100 (CET)
Message-Id: <20251118.131735.802732108462696577.rene@exactco.de>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] modpost: amend ppc symnames for -Os build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Building a size optimized ppc kernel, gcc emmits more symbols than
currently allowed listed in scripts/mod/modpost.c. Add to fix:

MODPOST Module.symvers
ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)

Signed-off-by: René Rebe <rene@exactco.de>

---
 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 47c8aa2a6939..133dfa16308a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 		/* Special register function linked on all modules during final link of .ko */
 		if (strstarts(symname, "_restgpr0_") ||
 		    strstarts(symname, "_savegpr0_") ||
+		    strstarts(symname, "_restgpr1_") ||
+		    strstarts(symname, "_savegpr1_") ||
+		    strstarts(symname, "_restfpr_") ||
+		    strstarts(symname, "_savefpr_") ||
 		    strstarts(symname, "_restvr_") ||
 		    strstarts(symname, "_savevr_") ||
 		    strcmp(symname, ".TOC.") == 0)
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

