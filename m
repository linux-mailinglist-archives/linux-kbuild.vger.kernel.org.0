Return-Path: <linux-kbuild+bounces-1125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DDC86F896
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E441F213E9
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D025633;
	Mon,  4 Mar 2024 02:33:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC238D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519621; cv=none; b=FXtvSPDwXNV9O5qdVNf9gOTU9EhEIQItKPUa4lXJnagylaextsZ8sAbxqYj4EEGWnITtXXdz6TwqISLYq/b1Xjyrzpycp3P7BCXAfmJF3dMliTxZKt2ogiZxtshF2HJ6xWWmbf1sfPkJoS7jiobQ2ac2Z8Mpsja9rfiF1bm73Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519621; c=relaxed/simple;
	bh=/IaRIBYn/hDGttuI2a/bEHqRFr2qzrbn2h8z/4nt+9o=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=HHG8y1OaGTULrq+/cBv0gP9ir4+K6eorGm6XFPJT9k+p4oOY5Y24bGyszC2Vf80mJsvS1iSAkusi/x4Z/qNibP/kNTq21hwXDau+v9XI6DD+N9DNlt5+D7EsdfgUgv69gBR8aCsGneeMgiteRIM5d9lYkcGPgyooacIiHesI04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242RAG1021936
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:27:16 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242RAT2021935;
	Sun, 3 Mar 2024 18:27:10 -0800 (PST)
	(envelope-from ehem)
Message-Id: <fb1251528787d6bfa297f58a25c2ae7626335649.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 17:08:28 -0800
Subject: [WIP PATCH 14/30] build/scripts: link-vmlinux.sh: modify use of
 ${objtree} for trailing slash
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
With this, the new approach is pretty well functioning.
---
 scripts/link-vmlinux.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 7862a8101747..d98a1494655a 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -87,7 +87,7 @@ vmlinux_link()
 		ldlibs=
 	fi
 
-	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
+	ldflags="${ldflags} ${wl}--script=${objtree}${KBUILD_LDS}"
 
 	# The kallsyms linking does not need debug symbols included.
 	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
@@ -193,12 +193,12 @@ kallsyms_step()
 mksysmap()
 {
 	info NM ${2}
-	${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2} ${3}
+	${CONFIG_SHELL} "${srctree}scripts/mksysmap" ${1} ${2} ${3}
 }
 
 sorttable()
 {
-	${objtree}/scripts/sorttable ${1}
+	${objtree}scripts/sorttable ${1}
 }
 
 # Delete output files in case of error
@@ -222,7 +222,7 @@ if [ "$1" = "clean" ]; then
 	exit 0
 fi
 
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
+${MAKE} -f "${srctree}scripts/Makefile.build" obj=init init/version-timestamp.o
 
 btf_vmlinux_bin_o=""
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
@@ -266,8 +266,8 @@ if is_enabled CONFIG_KALLSYMS; then
 	kallsyms_step 2
 
 	# step 3
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
-	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
+	size1=$(${CONFIG_SHELL} "${srctree}scripts/file-size.sh" ${kallsymso_prev})
+	size2=$(${CONFIG_SHELL} "${srctree}scripts/file-size.sh" ${kallsymso})
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		kallsyms_step 3
-- 
2.39.2


