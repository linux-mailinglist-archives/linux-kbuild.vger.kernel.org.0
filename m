Return-Path: <linux-kbuild+bounces-2041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46F901722
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 19:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFBF1C20A71
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 17:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4BA4D8B7;
	Sun,  9 Jun 2024 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Akv8SX1l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A14D8B3;
	Sun,  9 Jun 2024 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717952964; cv=none; b=BbQNZAXfahGqN6w4mExU8elUT/euXGG/PAHsjjgxtthFN5kZ8CGhRTUmtAGIuV3l1V40V1LHaqGycfGjP1mHreuP5dlad/KWpDR0eWrV/PTJnm8b29hv96MiJXasgz3syopWEPl//pGKz/f9iX8672td41+PsOi6viDrif73hX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717952964; c=relaxed/simple;
	bh=fwdRwtkshBcqDeuP1FhFGHJWYOHNN1ovkmYO50ggPa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tciUApK1vErtyKTEgzSgLgkDoKq2XiVFwNzXWia+HHz0ZAoivBaPtHpR/4sMLIFZyVBCqlCTyAnhvy/6kjpLDLje9dW+0x/rpDdWx1oq1omSJ/hy0WBKyxg8BKYa4mTW7HEEREm0LLWaYGQ5sT09GgZMhZmkmAjz+mw/hJZORs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Akv8SX1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C241CC4AF49;
	Sun,  9 Jun 2024 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717952964;
	bh=fwdRwtkshBcqDeuP1FhFGHJWYOHNN1ovkmYO50ggPa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Akv8SX1lOsEdLATsb8JeKHFMqjeN+sI2Jpup/gjUNgCP0LzzbKNzHQUH+FRhfJGas
	 wthh8HT/yUT7SX6MQLPQ6Dgw1zbx2iaOwYg6TCR47un8uBdtiMreRlZhxX7mSYYnP8
	 Qq/reQ5Q0jBWRIy0+ph/wX8vhJIj8E4wZGjX1bH/+R++uWy12st28jRtk7wGsQpxfg
	 jtene7C6bLl2iz2tFua68D0c/CIB2+PuS25iawYDmkydrtLEV+JCUCoRpzUQYuKay4
	 W9JF+uHjcTCOHmuC64fGlqJCv4UJXLnX1CfFqD/mV9pShAW6BkvHC7dI77QL2wW86I
	 EBA7EU9Dw5G8g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 3/3] kbuild: merge temporary vmlinux for BTF and kallsyms
Date: Mon, 10 Jun 2024 02:04:20 +0900
Message-ID: <20240609170855.1708665-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240609170855.1708665-1-masahiroy@kernel.org>
References: <20240609170855.1708665-1-masahiroy@kernel.org>
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

When CONFIG_DEBUG_INFO_BTF=y and CONFIG_KALLSYMS=y, the build steps are
as follows:

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
reduce the number of link steps.

The build steps will be changed as follows:

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

Changes in v2:
 - Fix the handling --strip-debug flag

 scripts/link-vmlinux.sh | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 6f2fdc9e4fbf..14aedec224af 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -89,7 +89,8 @@ vmlinux_link()
 	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
 
 	# The kallsyms linking does not need debug symbols included.
-	if [ "$output" != "${output#.tmp_vmlinux.kallsyms}" ] ; then
+	if [ "$output" != vmlinux ] &&
+	   (! is_enabled CONFIG_DEBUG_INFO_BTF || [ "$output" != .tmp_vmlinux1 ]) then
 		ldflags="${ldflags} ${wl}--strip-debug"
 	fi
 
@@ -105,11 +106,10 @@ vmlinux_link()
 
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
@@ -122,8 +122,6 @@ gen_btf()
 		return 1
 	fi
 
-	vmlinux_link ${1}
-
 	info BTF "${btf_data}"
 	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
 
@@ -177,15 +175,13 @@ kallsyms()
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
@@ -227,11 +223,15 @@ kallsymso=
 btf_vmlinux_bin_o=
 
 if is_enabled CONFIG_KALLSYMS; then
-	kallsyms /dev/null .tmp_vmlinux.kallsyms0
+	kallsyms /dev/null .tmp_vmlinux0.kallsyms
+fi
+
+if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
+	vmlinux_link .tmp_vmlinux1
 fi
 
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
-	if ! gen_btf .tmp_vmlinux.btf .btf.vmlinux.bin.o ; then
+	if ! gen_btf .tmp_vmlinux1; then
 		echo >&2 "Failed to generate BTF for vmlinux"
 		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
 		exit 1
@@ -264,14 +264,16 @@ if is_enabled CONFIG_KALLSYMS; then
 	# a)  Verify that the System.map from vmlinux matches the map from
 	#     ${kallsymso}.
 
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
 
@@ -295,7 +297,7 @@ fi
 
 # step a (see comment above)
 if is_enabled CONFIG_KALLSYMS; then
-	if ! cmp -s System.map ${kallsyms_vmlinux}.syms; then
+	if ! cmp -s System.map "${kallsyms_sysmap}"; then
 		echo >&2 Inconsistent kallsyms data
 		echo >&2 'Try "make KALLSYMS_EXTRA_PASS=1" as a workaround'
 		exit 1
-- 
2.43.0


