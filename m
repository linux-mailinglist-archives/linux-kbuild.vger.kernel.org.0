Return-Path: <linux-kbuild+bounces-1124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954686F895
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9E7D2810D4
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254E2633;
	Mon,  4 Mar 2024 02:32:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A738D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519521; cv=none; b=M+PFWUfLdppdxWdDYIjzoI4C3laK7HMblf/KLYH+I/YVf6gWvVRMoU2wZe4qYOjB2KkB3DdbJelRG91geFWN+4uo7Sl7dpnfAIXNBqiPMnI63XLq+Zxy3lXpDXv0IIqSHws6k4nmTN/VnyVWjQNRBsoAbbvHxq1RmTg5eQbUcy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519521; c=relaxed/simple;
	bh=I19raxbmS6mydc5YLxv5TIYlPQHjE2R1vu2PSJCi/G4=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=JMwh6I28cdquUUC3IGBgIn4PtyrrjGjjjuMONNsExG6gEOyFI3u2c7rWBZVxWRUDNjFMRrBc+UmrGTJRLa8o74WmWz3mQYcSNhkY3LQZkvy4h8MgYWX0dUEmnz3M0gGXIeU+cZuedd0NIcQ4z3p3yWxQd6TjT7vCjsrD9oZ0iqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242UROT021975
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:30:33 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242UPnm021974;
	Sun, 3 Mar 2024 18:30:25 -0800 (PST)
	(envelope-from ehem)
Message-Id: <e01aea1a01b9a269bb973384ead21a0d2f6b8065.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 15:26:47 -0800
Subject: [WIP PATCH 16/30] scripts/dtc: dtx_diff: include trailing slash in
 ${srctree} variable
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

If run under debugging this looks slightly nicer.  The net effect is
basically null though.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
I'm unsure whether this is ever used directly on the command-line.
There might be a need to compensate for direct invocation, but I'm
unsure of the approach to choose for that.
---
 scripts/dtc/dtx_diff | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index f2bbde4bba86..e06778527751 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -139,10 +139,10 @@ compile_to_dts() {
 			echo "  >>\$ARCH<< is: >>${ARCH}<<"                  >&2
 		fi
 
-		if [ ! -d ${srctree}/arch/${ARCH} ] ; then
+		if [ ! -d ${srctree}arch/${ARCH} ] ; then
 			hint_given=1
 			echo ""                                              >&2
-			echo "  ${srctree}/arch/${ARCH}/ does not exist"     >&2
+			echo "  ${srctree}arch/${ARCH}/ does not exist"      >&2
 			echo "  Is \$ARCH='${ARCH}' correct?"                >&2
 			echo "  Possible fix: use '-s' option"               >&2
 
@@ -247,10 +247,6 @@ while [ $# -gt 0 ] ; do
 
 done
 
-if [ "${srctree}" = "" ] ; then
-	srctree="."
-fi
-
 if [ "${dtx_file_2}" != "" ]; then
 	cmd_diff=1
 fi
@@ -272,7 +268,7 @@ fi
 # -----  prefer dtc from linux kernel, allow fallback to dtc in $PATH
 
 if [ "${KBUILD_OUTPUT:0:2}" = ".." ] ; then
-	__KBUILD_OUTPUT="${srctree}/${KBUILD_OUTPUT}"
+	__KBUILD_OUTPUT="${srctree}${KBUILD_OUTPUT}"
 elif [ "${KBUILD_OUTPUT}" = "" ] ; then
 	__KBUILD_OUTPUT="."
 else
@@ -337,12 +333,12 @@ fi
 
 cpp_flags="\
 	-nostdinc                                  \
-	-I${srctree}/scripts/dtc/include-prefixes  \
+	-I${srctree}scripts/dtc/include-prefixes  \
 	-undef -D__DTS__"
 
 DTC="\
 	${DTC}                                     \
-	-i ${srctree}/scripts/dtc/include-prefixes \
+	-i ${srctree}scripts/dtc/include-prefixes \
 	-O dts -qq -f ${dtc_sort} ${annotate} -o -"
 
 
-- 
2.39.2


