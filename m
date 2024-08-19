Return-Path: <linux-kbuild+bounces-3093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D8956FD7
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC66AB28F08
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7846A187560;
	Mon, 19 Aug 2024 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IAJMv4XE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98BA16D4EA;
	Mon, 19 Aug 2024 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083484; cv=none; b=d1niIX1F+AWhpw/RAwjWyOBPuP4sEJscraTOuXR5ScM31qwaGGNl/Roh3XyCyGRfSdmJLmhSbcX8UrhaQ38o7nNCL4SxPQ6i+kyf74oYCa2HvCNwII0mWD2HbLVB1nMKjSdXLkedfG9NJYFwPMu3VRA7I4jEGcn/ZpM6uLlAAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083484; c=relaxed/simple;
	bh=j4nvRQqupybs8zsQ97VkdPp8rl05S+bMUkwomglK+gs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VZWCJr7uNCPcjJAgyoVZ3AWDhf69aWSlXP45Kr1XXWqt3s4i2wd/vMzhcKYNGEm7D0OJe7rbcrWU3gefy/y2P7GJOZ+2OehWZr947krWfeoZN76O9cfTs5hHPblFxi2MthfVJSYc4jjOUn0iQM7sxZ3AhA1pZIg7MWzaVU3Hmug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IAJMv4XE; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6vLe022408;
	Mon, 19 Aug 2024 16:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=Q
	FptFzk97EtGYovpo4SLZYT+QuG65DqlTOQxoV011pE=; b=IAJMv4XEMdI88g3ij
	71Oa6Go2x3swu55ml2VkBbTlLGMXsh8AFMAQpimicFDeKZxQr9HpYH5vyMu7dVuQ
	xBYYpIrtaOqccPuyfBQY4LPg9wcG6Jw/Vec+u70U/U2QTWPYck8J9VzqLMP+2aPJ
	UrHCzuFeLe4jbeWT33P7zjX/ER9knQiHhH0/QWN75LM7jzgc0eDJhbkoH+p6XR7t
	qKZnd0f/Lq8gPHYtBPDbkYTbX1y52gt66qhU4in40C1Z45KhwE7YV51LYXHzStpR
	xMWIH3CxGNp4fX4ZS1FEY5Gmp248+Hb9mOsDcc4RfiVKAoexupKKvoLGN4czG3ta
	4yMJg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3dk14x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHhO007843;
	Mon, 19 Aug 2024 16:04:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbb7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:23 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fet014254;
	Mon, 19 Aug 2024 16:04:22 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-10;
	Mon, 19 Aug 2024 16:04:22 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Morten Linderud <morten@linderud.pw>,
        Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
        Kees Cook <kees@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [RFC PATCH 09/11] kbuild: simplify commands in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:06 +0200
Message-Id: <20240819160309.2218114-10-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819160309.2218114-1-vegard.nossum@oracle.com>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190107
X-Proofpoint-ORIG-GUID: 2S5DyqFBWt4B_J4K_yjFpmQjqe900A57
X-Proofpoint-GUID: 2S5DyqFBWt4B_J4K_yjFpmQjqe900A57

- $filechk is used to check if a file is up to date.

- $cmd includes logic for echoing commands and deleting intermediate
  files on interrupt. Skip all of that in --dry-run mode and just execute
  the command.

- $cmd_and_savecmd executes the command and echoes it into .<target>.cmd.

- $if_changed_dep executes the command if any dependencies have changed.

- $cmd_and_fixdep executes the command and updates .<target>.cmd.

Skip all of that in --dry-run mode and just execute the command.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/Kbuild.include | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index ed8a7493524b2..a1ef3b1828bb3 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -94,6 +94,7 @@ kecho := $($(quiet)kecho)
 # - If no file exist it is created
 # - If the content differ the new file is used
 # - If they are equal no change, and no timestamp update
+ifndef dry_run
 define filechk
 	$(check-FORCE)
 	$(Q)set -e;						\
@@ -105,6 +106,14 @@ define filechk
 		mv -f $(tmp-target) $@;				\
 	fi
 endef
+else
+# simplify and write the output directly if we're just printing
+# the commands
+define filechk
+	mkdir -p $(dir $@)
+	{ $(filechk_$(1)); } > $@
+endef
+endif
 
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
@@ -149,8 +158,13 @@ delete-on-interrupt = \
 		$(foreach sig, HUP INT QUIT TERM PIPE, \
 			trap 'rm -f $@; trap - $(sig); kill -s $(sig) $$$$' $(sig);))
 
+ifndef dry_run
 # print and execute commands
 cmd = @$(if $(cmd_$(1)),set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
+else
+# just execute (...which will actually "just print" with make -n)
+cmd = @$(if $(cmd_$(1)),$(cmd_$(1)),)
+endif
 
 ###
 # if_changed      - execute command if any prerequisite is newer than
@@ -196,17 +210,30 @@ if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(if-changed-cond),$(cmd_and_savecmd),@:)
 
+ifndef dry_run
 cmd_and_savecmd =                                                            \
 	$(cmd);                                                              \
 	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd
+else
+cmd_and_savecmd = $(cmd)
+endif
 
+ifndef dry_run
 # Execute the command and also postprocess generated .d dependencies file.
 if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
+else
+# Just execute the command directly
+if_changed_dep = $(cmd)
+endif
 
+ifndef dry_run
 cmd_and_fixdep =                                                             \
 	$(cmd);                                                              \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
 	rm -f $(depfile)
+else
+cmd_and_fixdep = $(cmd)
+endif
 
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
-- 
2.34.1


