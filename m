Return-Path: <linux-kbuild+bounces-10398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 328B2CEC7AB
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 19:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6D9B300B803
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 18:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C932C178D;
	Wed, 31 Dec 2025 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZKPMCBX0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A769522D780
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767206396; cv=none; b=oJ6QQzuuAyl87P93vCPuz93bLKc+k+1RMmGbXh64GGcbpKGEKJmI97UGaRdfFIHpEoWRHI7PFmVQU3197VR92L+zxtecjCRl2IcN/VBNjxBluxLsg+WiWYGwXQ6tWVRwA1w9nrvhIRf1IbnUaeCzte1li+NvAcCAWSoWZJBzFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767206396; c=relaxed/simple;
	bh=xtKqFYMr9x9sy/5E26limGxs4iDAUIR/sCKyR/ALW+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZC7R8z7rUCDjqu5QrElw7cx6lTGOTez46RIOvolMXogkRiiJRmZUWxyQ8bzqYZbeh5AiJ0gT9CbuAfMFbLFMUXbmZcKNze+E7pFrTGp9CekFWrvo4ptcJbiPRmjK0KhGDZ5jl8iV1RTZ/9FkDy66bQnyy5bTDXkf/DPxfGGrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZKPMCBX0; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767206391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tsL+ME6SOiPiO9GFf0yZueNO5btH9OG1yjy0K0+IBuY=;
	b=ZKPMCBX0ihwP5qQjuGPgPjHU9tkxeFq2ScDJmjaUaLGY0Ot97Et+eCHDdUoJAO9jHDV1kr
	MvPEU40VaB60/WoDvMOJosFVHythcR0ePtDvN+Ksd/XET3Xt+ReH7Udp7MNDp+MQoL19lv
	AAAeL1TCleucxXVb2rimPNzezEBqNjs=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1] scripts/gen-btf.sh: Reduce log verbosity
Date: Wed, 31 Dec 2025 10:39:29 -0800
Message-ID: <20251231183929.65668-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove info messages from gen-btf.sh, as they are unnecessarily
detailed and sometimes inaccurate [1].  Verbose log can be produced by
passing V=1 to make, which will set -x for the shell.

[1] https://lore.kernel.org/bpf/CAADnVQ+biTSDaNtoL=ct9XtBJiXYMUqGYLqu604C3D8N+8YH9A@mail.gmail.com/

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 scripts/gen-btf.sh      | 10 ----------
 scripts/link-vmlinux.sh |  3 ++-
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
index 0aec86615416..d6457661b9b6 100755
--- a/scripts/gen-btf.sh
+++ b/scripts/gen-btf.sh
@@ -60,28 +60,20 @@ is_enabled() {
 	grep -q "^$1=y" ${objtree}/include/config/auto.conf
 }
 
-info()
-{
-	printf "  %-7s %s\n" "${1}" "${2}"
-}
-
 case "${KBUILD_VERBOSE}" in
 *1*)
 	set -x
 	;;
 esac
 
-
 gen_btf_data()
 {
-	info BTF "${ELF_FILE}"
 	btf1="${ELF_FILE}.BTF.1"
 	${PAHOLE} -J ${PAHOLE_FLAGS}			\
 		${BTF_BASE:+--btf_base ${BTF_BASE}}	\
 		--btf_encode_detached=${btf1}		\
 		"${ELF_FILE}"
 
-	info BTFIDS "${ELF_FILE}"
 	${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_FLAGS}	\
 		${BTF_BASE:+--btf_base ${BTF_BASE}}	\
 		--btf ${btf1} "${ELF_FILE}"
@@ -95,7 +87,6 @@ gen_btf_o()
 	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
 	# deletes all symbols including __start_BTF and __stop_BTF, which will
 	# be redefined in the linker script.
-	info OBJCOPY "${btf_data}"
 	echo "" | ${CC} ${CLANG_FLAGS} ${KBUILD_CFLAGS} -c -x c -o ${btf_data} -
 	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF \
 		--set-section-flags .BTF=alloc,readonly ${btf_data}
@@ -113,7 +104,6 @@ gen_btf_o()
 
 embed_btf_data()
 {
-	info OBJCOPY "${ELF_FILE}.BTF"
 	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF ${ELF_FILE}
 
 	# a module might not have a .BTF_ids or .BTF.base section
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 1915adf3249b..08cd8e25c65c 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -205,6 +205,7 @@ if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
 fi
 
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
+	info BTF .tmp_vmlinux1
 	if ! ${srctree}/scripts/gen-btf.sh .tmp_vmlinux1; then
 		echo >&2 "Failed to generate BTF for vmlinux"
 		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
@@ -265,7 +266,7 @@ fi
 vmlinux_link "${VMLINUX}"
 
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
-	info OBJCOPY ${btfids_vmlinux}
+	info BTFIDS ${VMLINUX}
 	${RESOLVE_BTFIDS} --patch_btfids ${btfids_vmlinux} ${VMLINUX}
 fi
 
-- 
2.52.0


