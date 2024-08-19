Return-Path: <linux-kbuild+bounces-3094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A256956FE2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36CC2B29E20
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97964187850;
	Mon, 19 Aug 2024 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JZxwyD7t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E72171E40;
	Mon, 19 Aug 2024 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083485; cv=none; b=u0xJrMRQm+G3jJ38kAReOE/ypgPPkKTMIQUYuXuCZhynViIkbtL6jD3arGb62xt96ih9+WW1hjSV2udjWA3B7WYrA58sMk/8EpGur1lfl1o8Mg9ZglaiXjcLr33x3zkH6LGmC7AOX0h9bS4K1O3in2CTX4OuOWO5hOybooc1P3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083485; c=relaxed/simple;
	bh=0xkrW+vuKDfRMFvlsJ+hmSwlR+hITyNXGV5ox6DCigc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dAKa1j4rrm00MwQlbBDn31U6hO7huXvq/sAiP4XDZJvQ0uLvUQAvN5YsfdfpqeH1rNKSY3wc4+glkMcIY6iRpt0Mus3resz6IBZ3yVyi2ZNZInjagudB4sATldKDEQXgvIlRO9VNOu4szeU5bWGZB781aZl4sc4lYI+ZOLdVKUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JZxwyD7t; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6vqe018670;
	Mon, 19 Aug 2024 16:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=5
	HCW0PQEz/mpn2E4tb1qNVdeD1lQfcMuieQszFL2LbI=; b=JZxwyD7tdf7xCS4Ne
	uUPIhMK8VoVo64FgRT0vd0lL+vR3dXU/4GdGoa2MJi4HcpjoTKcojP7uJ8hifji9
	vYYk3xORMwHGgnXBon95UYIJAsW+tkPh/B/8Avsf+yyg7sQZMBbqkybnh888g3WU
	9qUAQdreAvmKNGLjsv8kq0S7btMU3j86LEyb4glteqIAsiCO+jLz8PWoAGkgH4J6
	hm0RqymfsZ6j0xreNAJ3oD8eMh5VsMmfUi7/HYOiDzAhwZqKrbX+0J6Gs9lI081a
	K1n2dKSaim9+1/Diol2/XUqcMzLJpX6xhpxupXC1Zddo+GupvKCJI7d0eapy73cR
	aI9gQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3hjxvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbI2v007879;
	Mon, 19 Aug 2024 16:04:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbb4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:19 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fer014254;
	Mon, 19 Aug 2024 16:04:19 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-9;
	Mon, 19 Aug 2024 16:04:18 +0000
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
Subject: [RFC PATCH 08/11] kbuild: make link-vmlinux.sh respect $dry_run
Date: Mon, 19 Aug 2024 18:03:05 +0200
Message-Id: <20240819160309.2218114-9-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: KhSvNXLr-St7C3eJBbCoTqLhZ412VHt8
X-Proofpoint-GUID: KhSvNXLr-St7C3eJBbCoTqLhZ412VHt8

Make link-vmlinux.sh print the commands it wants to run instead of
actually running them when $dry_run is defined.

This is needed in order for make -n/--dry-run to output a complete
build script.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/Makefile.vmlinux | 15 ++++++++++++--
 scripts/link-vmlinux.sh  | 44 ++++++++++++++++++++++++++--------------
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 10d80e07f945c..1fe0faab52889 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -1,5 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+# there doesn't seem to be a straightforward way for 'make -n' to output
+# one command while actually executing another, so we resort to this hack
+# where we set an environment variable differently depending on whether
+# we are executing from 'make' or executing from the 'make -n' log.
+LINK_VMLINUX=scripts/link-vmlinux.sh
+export LINK_VMLINUX
+
 PHONY := __default
 __default: vmlinux
 
@@ -29,7 +36,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
-	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
+	"$${LINK_VMLINUX}"						\
+	"$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 # We don't know how to build these
@@ -37,7 +45,10 @@ PHONY += vmlinux.o
 PHONY += $(KBUILD_LDS)
 
 targets += vmlinux
-vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
+vmlinux: $(LINK_VMLINUX) vmlinux.o $(KBUILD_LDS) FORCE
+ifdef dry_run
+	@LINK_VMLINUX=/bin/true
+endif
 	+$(call if_changed_dep,link_vmlinux)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f7b2503cdba95..fd32e48a8a455 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -32,6 +32,17 @@ LD="$1"
 KBUILD_LDFLAGS="$2"
 LDFLAGS_vmlinux="$3"
 
+# If $dry_run is set, just echo the command instead of executing it.
+run()
+{
+	if [ ! -v dry_run ]
+	then
+		eval "$1"
+	else
+		echo "$1"
+	fi
+}
+
 is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
 }
@@ -40,7 +51,10 @@ is_enabled() {
 # Will be supressed by "make -s"
 info()
 {
-	printf "  %-7s %s\n" "${1}" "${2}"
+	if [ ! -v dry_run ]
+	then
+		printf "  %-7s %s\n" "${1}" "${2}"
+	fi
 }
 
 # Link of vmlinux
@@ -97,10 +111,10 @@ vmlinux_link()
 		ldflags="${ldflags} ${wl}-Map=${output}.map"
 	fi
 
-	${ld} ${ldflags} -o ${output}					\
+	run "${ld} ${ldflags} -o ${output}				\
 		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
 		${wl}--start-group ${libs} ${wl}--end-group		\
-		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
+		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}"
 }
 
 # generate .BTF typeinfo from DWARF debuginfo
@@ -129,8 +143,8 @@ gen_btf()
 	# deletes all symbols including __start_BTF and __stop_BTF, which will
 	# be redefined in the linker script. Add 2>/dev/null to suppress GNU
 	# objcopy warnings: "empty loadable segment detected at ..."
-	${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
-		--strip-all ${1} "${btf_data}" 2>/dev/null
+	run "${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
+		--strip-all ${1} "${btf_data}" 2>/dev/null"
 	# Change e_type to ET_REL so that it can be used to link final vmlinux.
 	# GNU ld 2.35+ and lld do not allow an ET_EXEC input.
 	if is_enabled CONFIG_CPU_BIG_ENDIAN; then
@@ -161,11 +175,11 @@ kallsyms()
 	fi
 
 	info KSYMS "${2}.S"
-	scripts/kallsyms ${kallsymopt} "${1}" > "${2}.S"
+	run "scripts/kallsyms ${kallsymopt} \"${1}\" > \"${2}.S\""
 
 	info AS "${2}.o"
-	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
-	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
+	run "${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o \"${2}.o\" \"${2}.S\""
 
 	kallsymso=${2}.o
 }
@@ -184,12 +198,12 @@ sysmap_and_kallsyms()
 mksysmap()
 {
 	info NM ${2}
-	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
+	run "${NM} -n \"${1}\" | sed -f \"${srctree}/scripts/mksysmap\" > \"${2}\""
 }
 
 sorttable()
 {
-	${objtree}/scripts/sorttable ${1}
+	run "${objtree}/scripts/sorttable ${1}"
 }
 
 cleanup()
@@ -270,13 +284,13 @@ if is_enabled CONFIG_KALLSYMS; then
 	strip_debug=1
 
 	sysmap_and_kallsyms .tmp_vmlinux1
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
+	[ -v dry_run ] || size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
 	vmlinux_link .tmp_vmlinux2
 	sysmap_and_kallsyms .tmp_vmlinux2
-	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
+	[ -v dry_run ] || size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
+	if [ ! -v dry_run ] || [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		vmlinux_link .tmp_vmlinux3
 		sysmap_and_kallsyms .tmp_vmlinux3
 	fi
@@ -289,7 +303,7 @@ vmlinux_link vmlinux
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
 	info BTFIDS vmlinux
-	${RESOLVE_BTFIDS} vmlinux
+	run ${RESOLVE_BTFIDS} vmlinux
 fi
 
 mksysmap vmlinux System.map
@@ -303,7 +317,7 @@ if is_enabled CONFIG_BUILDTIME_TABLE_SORT; then
 fi
 
 # step a (see comment above)
-if is_enabled CONFIG_KALLSYMS; then
+if [ ! -v dry_run ] && is_enabled CONFIG_KALLSYMS; then
 	if ! cmp -s System.map "${kallsyms_sysmap}"; then
 		echo >&2 Inconsistent kallsyms data
 		echo >&2 'Try "make KALLSYMS_EXTRA_PASS=1" as a workaround'
-- 
2.34.1


