Return-Path: <linux-kbuild+bounces-9775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9DEC7E0E2
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 13:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D6DC3ABE5A
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 12:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A4B212B0A;
	Sun, 23 Nov 2025 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="YB7CtJNW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6285C4A
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763900008; cv=none; b=VZbYeaBSastCL/XfnlbFIo6fAOgxlDB1VMDtIW14ZMqQdAPE4ofgHqVMYh1mFkYHTm7WDeuvVD+uhtB4KRvUfNm2NjLXBdPf4zQNJ0fkgQYj8ntWhx9Pv99BA0GZs8OHenAlAbrFEKpKa2yechCLs4Z9R8SHreRomiByHRx+/nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763900008; c=relaxed/simple;
	bh=5WG8KBD3Q82U/cxr5fe+5KqRtlODZ5JthX9P0agTWuA=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=S3QrJeoInKA83W6SLH8CvuVGuR6T6HLINujE8GC4HETNdM5A2Vop7TVOn6+WUrsMe9mzQE1OmCP3GvIjoSmJU2NBaePm+03c7MCaEjiu9+6lAPNuCC0Pz5WK4ACOu0pc0tV97SBkooaHa6/O02rtGds+OFdSpH+93dNqX/S03xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=YB7CtJNW; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=FiByvmPj4vskMAitEF2oyus7EhqWwE7+LOIfdmKxcgM=; b=Y
	B7CtJNWX7Y5fdrO7Yf1Z8jmhNSOrbagvits5hHavY/HU6bNJLAeoX7WqzqMx0JQh/RcWMj97W7zSj
	ro5bNXzM9+MYOfIpNCrCJqgURkwsMg5+9dtXZ+Pv7opq+vTSd1sbdmVMeKNU5UGYi8vBriDlyYZoH
	E0ROQK5QWNAxJ+YYM0rxLecsAxCcM4SvPwczYE37WSSJLYZAaEvtcKLUjlZfmpBmesZs3p+nnlWiQ
	7e26SslRYZ121zcM1YU2VFGSOQZgrvlcnIzHp1m/GRfV0lrTrA/UUhhyTYubAvq73hRUPAwxXiRUX
	PEcPX/4ha4KT6HCMlSIN3bjvqn2tVv5RA==;
Date: Sun, 23 Nov 2025 13:13:30 +0100 (CET)
Message-Id: <20251123.131330.407910684435629198.rene@exactco.de>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os build
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

Building a size optimized ppc64 kernel (-Os), gcc emits more FP
save/restore symbols, that the linker generates on demand into the
.sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
too. They are needed for the amdgpu in-kernel floating point support.

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
V2: description
Theoretically for -stable, but no previous commit that broke it.
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

