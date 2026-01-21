Return-Path: <linux-kbuild+bounces-10771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPopLuAicWl8eQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10771-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 20:02:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9285BC01
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 20:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FD28B03C50
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 18:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FEE36E463;
	Wed, 21 Jan 2026 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a6xoM53o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422934EEE3
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019417; cv=none; b=mbbbv+79ZzK+gan3aHLUe4hRNfq+smctYLA/FNqSXOI4Hyyg4C9/ww9YRgJRFbyY/KPnOYoPhzSvz6tsgQO6GUWn6AQ8oTW0mdRi4+TSERUpoPlNwalsTNaqFB37IoENFJBeQ3u9hNzCqF+CJSaGPJ/JlMg5qPAUEtLKv1/WaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019417; c=relaxed/simple;
	bh=EWJ+M2aurz/ZDVQ4cF0rmciL+eLNgTv9Y3fYeGkYLPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMo6nXF+BK66o9jd8ndH/aEdi+Upi7yn6j+rKGKoW+FZP5GzIg7rtDdSlCN/pJ8c8xoJ83UjiHCJjI4BuDf/QLAywNZRYVL6Ro1F+I1ZORZ4F6oDBCtZSd1sjko9r9A5ICl6oGLPGjpd0vEOiTgf4KdyhUfFQpZmokbcgesx/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a6xoM53o; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769019402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GhqpgloiqR9YVGZDPWVRJeg0INhy+dJCnyzXd7L9Q0A=;
	b=a6xoM53oFEzdTTj2BjY8MAhMNh8fu59B6uIHTx+gBO5kaJAwDeLlZm1CGsqUhJknZBeOEt
	WLyhJwNfFIrrpXE+FuOPreklEMCkTzsCTg41CcVbBxG19K4collwN0UHmyxKnprgAVrp7s
	lI6I8cccS10NAKlsiRUZ9ER+ogw5maU=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1] scripts/gen-btf.sh: Use CONFIG_SHELL for execution
Date: Wed, 21 Jan 2026 10:16:17 -0800
Message-ID: <20260121181617.820300-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10771-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linux.dev,none];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0E9285BC01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the docs [1], kernel build scripts should be executed via
CONFIG_SHELL, which is sh by default.

Fixup gen-btf.sh to be runnable with sh, and use CONFIG_SHELL at every
invocation site.

See relevant discussion for context [2].

[1] https://docs.kernel.org/kbuild/makefiles.html#script-invocation
[2] https://lore.kernel.org/bpf/CAADnVQ+dxmSNoJAGb6xV89ffUCKXe5CJXovXZt22nv5iYFV5mw@mail.gmail.com/

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 scripts/Makefile.modfinal | 2 +-
 scripts/gen-btf.sh        | 8 ++++----
 scripts/link-vmlinux.sh   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 422c56dc878e..adcbcde16a07 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -43,7 +43,7 @@ quiet_cmd_btf_ko = BTF [M] $@
 	if [ ! -f $(objtree)/vmlinux ]; then				\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
 	else	\
-		$(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
+		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
 	fi;
 
 # Same as newer-prereqs, but allows to exclude specified extra dependencies
diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
index be21ccee3487..8ca96eb10a69 100755
--- a/scripts/gen-btf.sh
+++ b/scripts/gen-btf.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (c) 2025 Meta Platforms, Inc. and affiliates.
 #
@@ -81,7 +81,7 @@ gen_btf_data()
 
 gen_btf_o()
 {
-	local btf_data=${ELF_FILE}.btf.o
+	btf_data=${ELF_FILE}.btf.o
 
 	# Create ${btf_data} which contains just .BTF section but no symbols. Add
 	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
@@ -107,11 +107,11 @@ embed_btf_data()
 	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF ${ELF_FILE}
 
 	# a module might not have a .BTF_ids or .BTF.base section
-	local btf_base="${ELF_FILE}.BTF.base"
+	btf_base="${ELF_FILE}.BTF.base"
 	if [ -f "${btf_base}" ]; then
 		${OBJCOPY} --add-section .BTF.base=${btf_base} ${ELF_FILE}
 	fi
-	local btf_ids="${ELF_FILE}.BTF_ids"
+	btf_ids="${ELF_FILE}.BTF_ids"
 	if [ -f "${btf_ids}" ]; then
 		${RESOLVE_BTFIDS} --patch_btfids ${btf_ids} ${ELF_FILE}
 	fi
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 08cd8e25c65c..16d6a048e07c 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -206,7 +206,7 @@ fi
 
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
 	info BTF .tmp_vmlinux1
-	if ! ${srctree}/scripts/gen-btf.sh .tmp_vmlinux1; then
+	if ! ${CONFIG_SHELL} ${srctree}/scripts/gen-btf.sh .tmp_vmlinux1; then
 		echo >&2 "Failed to generate BTF for vmlinux"
 		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
 		exit 1
-- 
2.52.0


