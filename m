Return-Path: <linux-kbuild+bounces-1114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 497FD86F879
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25BD281070
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E904A15B7;
	Mon,  4 Mar 2024 02:18:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E03EDF
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518688; cv=none; b=YzJQ7V2h4lNWa2mTKxDRd7hKH3D/tHZOCw+/kdETeQ+56zRLxL8XuuQTtRD6RQiZHFRZlMNOtC5CaRUACjNySGGupd9D3IYTt45PWT9sZt6pvkknQjvuUHAVC9V59WJzaaVvseBLRYz9FembGVfTP2HDvR+foLlOk0wwVqUnFKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518688; c=relaxed/simple;
	bh=9r/GCE5TabIjWxrtUzKUpf7OCFGMfMN1KuvaGkFLZ6Y=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=CMZ6qmZB8gjcLyoa09idvOlx7CbD/AakNiRYhe5zSpbzJA51fZwXorLBxKsfwwqLQf/R7vJvYGHNHcUv9x/YgW2biq+DAkbiE3lpJ2pdZBQ1RzJr/Gt9QiR2/mrZ8QiWUe1aP+C/FmMs8eslE7T0B94KIZEEODNbWB4/IM6btwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242FfS6021852
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:15:47 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242FebC021851;
	Sun, 3 Mar 2024 18:15:40 -0800 (PST)
	(envelope-from ehem)
Message-Id: <ca98f586d81973fcc01826a8f2b1d5754f9c10e0.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 11:48:49 -0800
Subject: [WIP PATCH 07/30] build: modify uses of $(srctree) to assume trailing
 slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Include the instance of $(objtree) in include/uapi/Makefile while at it.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Kbuild\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 include/uapi/Kbuild | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/Kbuild b/include/uapi/Kbuild
index 4b8401173ef5..4d685badb829 100644
--- a/include/uapi/Kbuild
+++ b/include/uapi/Kbuild
@@ -8,7 +8,7 @@ no-export-headers += linux/kvm.h
 endif
 
 ifeq ($(wildcard $(srctree)arch/$(SRCARCH)/include/uapi/asm/kvm_para.h),)
-ifeq ($(wildcard $(objtree)/arch/$(SRCARCH)/include/generated/uapi/asm/kvm_para.h),)
+ifeq ($(wildcard $(objtree)arch/$(SRCARCH)/include/generated/uapi/asm/kvm_para.h),)
 no-export-headers += linux/kvm_para.h
 endif
 endif
-- 
2.39.2


