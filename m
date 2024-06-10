Return-Path: <linux-kbuild+bounces-2050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE3902059
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 13:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABAEEB21AE7
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 11:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762EF80034;
	Mon, 10 Jun 2024 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdDhpUuF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967880026;
	Mon, 10 Jun 2024 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718018830; cv=none; b=HK6F4WrVYOrE38Cg/4WpJsxpGYEr8JkncSTED3hIE/kkSl9Ijdy1YbbV/FKsjqaijnO6truSTohrOXCGCDkdjaZ5nH+ymEPaYd08So08szxReiZCcYkNc29xiIwC1L9H2YeAieM1iItJcubWRL0IjEmdMloLmXjqJ96WiLXgg3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718018830; c=relaxed/simple;
	bh=8otrnDiqoQhgxvCkewI2dBjUDJnKxXquskHQT8fi5Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlQRoVD8EkWhlP7HaEdq7GL1g7bjIOXShlNbscF4hT5iqhBnerrlooNZGb0Fxq0L9pEX+TY0PTdqHwYMHULLB+sUyXI4/RqfbsuGL2+v77cxQb1x5urHuQY4rnR45b2HYuRuhCTdqArN/DgBTqShYv2E/TyGte1oeau1PYgBKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdDhpUuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEEBC4AF1C;
	Mon, 10 Jun 2024 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718018829;
	bh=8otrnDiqoQhgxvCkewI2dBjUDJnKxXquskHQT8fi5Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdDhpUuFwd2D78wNnBZYki/Ofz/1V5Y3HSgbu/wnZAn5sDhgI2fRujor9V7RIz7ur
	 O3tVLfvwdBFt2PX3c7XNEVCzmpLZvabEcLc3ccT19O1KfYOruquMjizTNsBFn7fp58
	 d1XZxWSejPAnc7QlMkavAKD2lIGL7G908vow+ikbjR/PqalO5s8nGXKN9TS8n5d3oa
	 g/dyxy+hEWrf/JMVJr8u3PfitiSux+X7sIIQKDMXJ0fPVlReQ1HLZz9gSfslkOEb/p
	 vmRvjmf37idJLLRh7gUUB16kdV/uKVIH/KKQXA7kZtgAW9woaLuSBF+jAk3ErFUp5s
	 DUy85uNATH9Hg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v3 3/3] kbuild: merge temporary vmlinux for BTF and kallsyms
Date: Mon, 10 Jun 2024 20:25:18 +0900
Message-ID: <20240610112657.602958-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610112657.602958-1-masahiroy@kernel.org>
References: <20240610112657.602958-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_DEBUG_INFO_BTF=y requires one additional link step.
(.tmp_vmlinux.btf)

CONFIG_KALLSYMS=y requires two additional link steps.
(.tmp_vmlinux.kallsyms1 and .tmp_vmlinux.kallsyms2)

Enabling both requires three additional link steps.

When CONFIG_DEBUG_INFO_BTF=y and CONFIG_KALLSYMS=y, the current build
process is as follows:

    KSYMS   .tmp_vmlinux.kallsyms0.S
    AS      .tmp_vmlinux.kallsyms0.o
    LD      .tmp_vmlinux.btf             # temporary vmlinux for BTF
    BTF     .btf.vmlinux.bin.o
    LD      .tmp_vmlinux.kallsyms1       # temporary vmlinux for kallsyms step 1
    NM      .tmp_vmlinux.kallsyms1.syms
    KSYMS   .tmp_vmlinux.kallsyms1.S
    AS      .tmp_vmlinux.kallsyms1.o
    LD      .tmp_vmlinux.kallsyms2       # temporary vmlinux for kallsyms step 2
    NM      .tmp_vmlinux.kallsyms2.syms
    KSYMS   .tmp_vmlinux.kallsyms2.S
    AS      .tmp_vmlinux.kallsyms2.o
    LD      vmlinux                      # final vmlinux

This is redundant because the BTF generation and the kallsyms step 1 can
be performed against the same temporary vmlinux.

When both CONFIG_DEBUG_INFO_BTF and CONFIG_KALLSYMS are enabled, we can
reduce the number of link steps by one.

This commit changes the build process as follows:

    KSYMS   .tmp_vmlinux0.kallsyms.S
    AS      .tmp_vmlinux0.kallsyms.o
    LD      .tmp_vmlinux1                # temporary vmlinux for BTF and kallsyms step 1
    BTF     .tmp_vmlinux1.btf.o
    NM      .tmp_vmlinux1.syms
    KSYMS   .tmp_vmlinux1.kallsyms.S
    AS      .tmp_vmlinux1.kallsyms.o
    LD      .tmp_vmlinux2                # temporary vmlinux for kallsyms step 2
    NM      .tmp_vmlinux2.syms
    KSYMS   .tmp_vmlinux2.kallsyms.S
    AS      .tmp_vmlinux2.kallsyms.o
    LD      vmlinux                      # final vmlinux

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
---

Changes in v3:
 - Use ${strip_debug} for clean-up

Changes in v2:
 - Fix the handling --strip-debug flag

 scripts/link-vmlinux.sh | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 83d605ba7241..c64158a04f82 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -105,11 +105,10 @@ vmlinux_link()
 
 # generate .BTF typeinfo from DWARF debuginfo
 # ${1} - vmlinux image
-# ${2} - file to dump raw BTF data into
 gen_btf()
 {
 	local pahole_ver
-	local btf_data=${2}
+	local btf_data=${1}.btf.o
 
 	if ! [ -x "$(command -v ${PAHOLE})" ]; then
 		echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
@@ -122,8 +121,6 @@ gen_btf()
 		return 1
 	fi
 
-	vmlinux_link ${1}
-
 	info BTF "${btf_data}"
 	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
 
@@ -177,15 +174,13 @@ kallsyms()
 	kallsymso=${2}.o
 }
 
-# Perform one step in kallsyms generation, including temporary linking of
-# vmlinux.
-kallsyms_step()
+# Perform kallsyms for the given temporary vmlinux.
+sysmap_and_kallsyms()
 {
-	kallsyms_vmlinux=.tmp_vmlinux.kallsyms${1}
+	mksysmap "${1}" "${1}.syms"
+	kallsyms "${1}.syms" "${1}.kallsyms"
 
-	vmlinux_link "${kallsyms_vmlinux}"
-	mksysmap "${kallsyms_vmlinux}" "${kallsyms_vmlinux}.syms"
-	kallsyms "${kallsyms_vmlinux}.syms" "${kallsyms_vmlinux}"
+	kallsyms_sysmap=${1}.syms
 }
 
 # Create map file with all symbols from ${1}
@@ -228,11 +223,21 @@ kallsymso=
 strip_debug=
 
 if is_enabled CONFIG_KALLSYMS; then
-	kallsyms /dev/null .tmp_vmlinux.kallsyms0
+	kallsyms /dev/null .tmp_vmlinux0.kallsyms
+fi
+
+if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
+
+	# The kallsyms linking does not need debug symbols, but the BTF does.
+	if ! is_enabled CONFIG_DEBUG_INFO_BTF; then
+		strip_debug=1
+	fi
+
+	vmlinux_link .tmp_vmlinux1
 fi
 
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
-	if ! gen_btf .tmp_vmlinux.btf .btf.vmlinux.bin.o ; then
+	if ! gen_btf .tmp_vmlinux1; then
 		echo >&2 "Failed to generate BTF for vmlinux"
 		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
 		exit 1
@@ -268,14 +273,16 @@ if is_enabled CONFIG_KALLSYMS; then
 	# The kallsyms linking does not need debug symbols included.
 	strip_debug=1
 
-	kallsyms_step 1
+	sysmap_and_kallsyms .tmp_vmlinux1
 	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	kallsyms_step 2
+	vmlinux_link .tmp_vmlinux2
+	sysmap_and_kallsyms .tmp_vmlinux2
 	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
-		kallsyms_step 3
+		vmlinux_link .tmp_vmlinux3
+		sysmap_and_kallsyms .tmp_vmlinux3
 	fi
 fi
 
@@ -301,7 +308,7 @@ fi
 
 # step a (see comment above)
 if is_enabled CONFIG_KALLSYMS; then
-	if ! cmp -s System.map ${kallsyms_vmlinux}.syms; then
+	if ! cmp -s System.map "${kallsyms_sysmap}"; then
 		echo >&2 Inconsistent kallsyms data
 		echo >&2 'Try "make KALLSYMS_EXTRA_PASS=1" as a workaround'
 		exit 1
-- 
2.43.0


