Return-Path: <linux-kbuild+bounces-11933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HjmJEputWlz0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11933-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:18:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F628D782
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 798BD303930C
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 14:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF7A379EFF;
	Sat, 14 Mar 2026 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqLirCrh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7B379987;
	Sat, 14 Mar 2026 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497913; cv=none; b=AlzaOhKdlmb5Vev+7zVyiEA1AGiVqa7D5QpMcVgS8Eb3R+7KIq7CncHTTy1RSaaoAw2WEj8SEYUpyOs0RE3Hw1FTthuGMxMr+Pb3PkGGDxaJ4QeMKU7gZAnj1TPZ69MTknYFwEkRgzDYmDhLJeJtjDGjZufRx7Hc55+AaHCNwAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497913; c=relaxed/simple;
	bh=R7Eoxjt0rpoDjuA01JdtLx3RDGIy8zj4SJQms4s/xVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLSosXCRpozf/xzmHbxNrhCfDDZxYWda4ne4frPUaPK/NT4PeTQTgD/Tp66HSJnt7Zmx3GXpOIXgJ5nAI5N7TBdfdXFqrG9zBhGBrYow62SkIRe1mWEB3BkxNrjEEgrbsL1ZFSRiRkjQJV8panJ4J60AqEt5w7xUM+oWsJXobuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqLirCrh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D70C19424;
	Sat, 14 Mar 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773497913;
	bh=R7Eoxjt0rpoDjuA01JdtLx3RDGIy8zj4SJQms4s/xVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hqLirCrhe5uvArb44+ijjOke8NkRc2pTnsYtEtQvLC6fSqq9/ekuzZgwQzL4DM30m
	 ITP5r0Gj88Q5PaDf4iBEU8NUd9jhg9KYxJ35jZutddLbTre6mMVqJ5f6Rw6xVbqC8y
	 BeahEq09FyRzD+QKK1JF49NDGsxHO9cf0pvXqbwsPbmL3ADcShuVELr81nlm92Y+x8
	 sNd/p6rwmGZJ2sTi+yUt/zsGQrmuJAS+tjkl9PmllO6MJ5yqlyaZSMXi3lgfC4lOQK
	 qGK+g9NR2RXk5s0FuaVwQ44j6QICYzIcphNg28z8qQMSiGUgNdKUEuZzBAJ30b9ms8
	 h/um7kXP1ZRhQ==
From: Sasha Levin <sashal@kernel.org>
To: oberpar@linux.ibm.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 3/4] gcov: add MC/DC condition coverage support
Date: Sat, 14 Mar 2026 10:17:48 -0400
Message-ID: <20260314141749.3382679-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260314141749.3382679-1-sashal@kernel.org>
References: <20260314141749.3382679-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11933-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4E0F628D782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add CONFIG_GCOV_CONDITION_COVERAGE option to enable GCC's MC/DC
condition coverage instrumentation (-fcondition-coverage). MC/DC is
required by safety standards such as DO-178C and ISO 26262.

Add -fcondition-coverage and -Wno-error=coverage-too-many-conditions
to CFLAGS_GCOV when enabled. Both flags are gated on the config option
to avoid Clang warnings about unknown options.

Also add -fcondition-coverage to CFLAGS_REMOVE in the x86 UML vDSO
Makefile to prevent instrumentation of userspace vDSO code.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile                  |  3 +++
 arch/x86/um/vdso/Makefile |  4 ++--
 kernel/gcov/Kconfig       | 15 +++++++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2b15f0b4a0cb5..5b0657cd3e534 100644
--- a/Makefile
+++ b/Makefile
@@ -807,6 +807,9 @@ CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
 ifdef CONFIG_CC_IS_GCC
 CFLAGS_GCOV	+= -fno-tree-loop-im
 endif
+ifdef CONFIG_GCOV_CONDITION_COVERAGE
+CFLAGS_GCOV	+= -fcondition-coverage -Wno-error=coverage-too-many-conditions
+endif
 export CFLAGS_GCOV
 
 # The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index 8a7c8b37cb6eb..3c8909f96a4c0 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -44,8 +44,8 @@ $(vobjs): KBUILD_CFLAGS += $(CFL)
 #
 # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
 #
-CFLAGS_REMOVE_vdso-note.o = -pg -fprofile-arcs -ftest-coverage
-CFLAGS_REMOVE_um_vdso.o = -pg -fprofile-arcs -ftest-coverage
+CFLAGS_REMOVE_vdso-note.o = -pg -fprofile-arcs -ftest-coverage -fcondition-coverage
+CFLAGS_REMOVE_um_vdso.o = -pg -fprofile-arcs -ftest-coverage -fcondition-coverage
 
 #
 # The DSO images are built using a special linker script.
diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
index 04f4ebdc3cf59..7939c8f5ced3c 100644
--- a/kernel/gcov/Kconfig
+++ b/kernel/gcov/Kconfig
@@ -52,4 +52,19 @@ config GCOV_PROFILE_ALL
 	larger and run slower. Also be sure to exclude files from profiling
 	which are not linked to the kernel image to prevent linker errors.
 
+config GCOV_CONDITION_COVERAGE
+	bool "Enable MC/DC condition coverage instrumentation"
+	depends on GCOV_KERNEL
+	depends on CC_HAS_CONDITION_COVERAGE
+	default n
+	help
+	This option adds Modified Condition/Decision Coverage (MC/DC)
+	instrumentation using GCC's -fcondition-coverage flag. MC/DC
+	coverage data can be viewed using gcov --conditions.
+
+	MC/DC is required by safety standards such as DO-178C (avionics)
+	and ISO 26262 (automotive).
+
+	This increases instrumentation overhead. If unsure, say N.
+
 endmenu
-- 
2.51.0


