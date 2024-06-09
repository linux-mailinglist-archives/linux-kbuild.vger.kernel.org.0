Return-Path: <linux-kbuild+bounces-2039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DA90171D
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 19:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F1821C20918
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 17:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C98487AE;
	Sun,  9 Jun 2024 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh3bS5uE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E932482EE;
	Sun,  9 Jun 2024 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717952960; cv=none; b=LY6pMqYj/gqQ1M8PMfdwO+g/mm8+IHeLSiYveLj1OGrGvVnEJSpuyzqNXVHoaj9UR0t3GgjuH3R5RnprF2Ins5q1cyDGoKnqVFUtZHQy0iyhrE0BzuyY3mSlhvdSstRPagQvUkZaf9oPMdFXRScg7T94z4nRycHasg1U8/0Qrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717952960; c=relaxed/simple;
	bh=AYWEKiG2NcYekv5InaWsI2GNC5+7R4jU7/8muIQK4Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEV2iuK8ISHgMGqY3r11G6GJwb0fa09yzNXdBENf5CQ0FYmYhRNY8yhDfYzlWf4RI7C8jAup2hzRweYOR2/jxizmymG2WWKrAWfRSmw/t4pczE1zZDhYj1GCRHUU2y+ucLYvG7FWTEAhNedYGtpx+dtOSFPKow09sEJhPcnI9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh3bS5uE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E414C2BD10;
	Sun,  9 Jun 2024 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717952959;
	bh=AYWEKiG2NcYekv5InaWsI2GNC5+7R4jU7/8muIQK4Y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dh3bS5uEQyZg+2XNXNyIpk/jMqeRiGG8tHYSp4oJ9SOf1bBfUQvR7YlLAgvjgvYUN
	 7YRWP8l2CKd+QM0+2gM9NBOYGQyj/RUz4W4qdPeZUu5WxIJ/Uo9/WKQWUgL5F000zs
	 2X1zuYmc0YRsdchBSLWY5bWeQSsYBG+cEpv46j+xmaWn3ectdBAL3fW4mynt2I8rvw
	 iio0HFnhDSGNgXASCuxlvsJGaHku6GjJmQ4gasJFRujhT+iPy2f7Z8KOJhhqimioAY
	 YWqMS0FYquMCLsBJ7bRcVD+gS08I5UiS5LNEhnuClJtJ1ZnZ8L4ZBEOYX5h7mKpiuX
	 H2/ErZek/J+hA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 1/3] kbuild: refactor variables in scripts/link-vmlinux.sh
Date: Mon, 10 Jun 2024 02:04:18 +0900
Message-ID: <20240609170855.1708665-2-masahiroy@kernel.org>
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

Clean up the variables in scripts/link-vmlinux.sh

 - Specify the extra objects directly in vmlinux_link()
 - Move the AS rule to kallsyms()
 - Set kallsymso and btf_vmlinux_bin_o where they are generated
 - Remove unneeded variable, kallsymso_prev
 - Introduce btf_data variable

No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/link-vmlinux.sh | 57 +++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 518c70b8db50..da3879469e53 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -45,7 +45,6 @@ info()
 
 # Link of vmlinux
 # ${1} - output file
-# ${2}, ${3}, ... - optional extra .o files
 vmlinux_link()
 {
 	local output=${1}
@@ -101,7 +100,7 @@ vmlinux_link()
 	${ld} ${ldflags} -o ${output}					\
 		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
 		${wl}--start-group ${libs} ${wl}--end-group		\
-		$@ ${ldlibs}
+		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
 }
 
 # generate .BTF typeinfo from DWARF debuginfo
@@ -110,6 +109,7 @@ vmlinux_link()
 gen_btf()
 {
 	local pahole_ver
+	local btf_data=${2}
 
 	if ! [ -x "$(command -v ${PAHOLE})" ]; then
 		echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
@@ -124,16 +124,16 @@ gen_btf()
 
 	vmlinux_link ${1}
 
-	info "BTF" ${2}
+	info BTF "${btf_data}"
 	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
 
-	# Create ${2} which contains just .BTF section but no symbols. Add
+	# Create ${btf_data} which contains just .BTF section but no symbols. Add
 	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
 	# deletes all symbols including __start_BTF and __stop_BTF, which will
 	# be redefined in the linker script. Add 2>/dev/null to suppress GNU
 	# objcopy warnings: "empty loadable segment detected at ..."
 	${OBJCOPY} --only-section=.BTF --set-section-flags .BTF=alloc,readonly \
-		--strip-all ${1} ${2} 2>/dev/null
+		--strip-all ${1} "${btf_data}" 2>/dev/null
 	# Change e_type to ET_REL so that it can be used to link final vmlinux.
 	# GNU ld 2.35+ and lld do not allow an ET_EXEC input.
 	if is_enabled CONFIG_CPU_BIG_ENDIAN; then
@@ -141,10 +141,12 @@ gen_btf()
 	else
 		et_rel='\1\0'
 	fi
-	printf "${et_rel}" | dd of=${2} conv=notrunc bs=1 seek=16 status=none
+	printf "${et_rel}" | dd of="${btf_data}" conv=notrunc bs=1 seek=16 status=none
+
+	btf_vmlinux_bin_o=${btf_data}
 }
 
-# Create ${2} .S file with all symbols from the ${1} object file
+# Create ${2}.o file with all symbols from the ${1} object file
 kallsyms()
 {
 	local kallsymopt;
@@ -165,27 +167,25 @@ kallsyms()
 		kallsymopt="${kallsymopt} --lto-clang"
 	fi
 
-	info KSYMS ${2}
-	scripts/kallsyms ${kallsymopt} ${1} > ${2}
+	info KSYMS "${2}.S"
+	scripts/kallsyms ${kallsymopt} "${1}" > "${2}.S"
+
+	info AS "${2}.o"
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
+
+	kallsymso=${2}.o
 }
 
 # Perform one step in kallsyms generation, including temporary linking of
 # vmlinux.
 kallsyms_step()
 {
-	kallsymso_prev=${kallsymso}
 	kallsyms_vmlinux=.tmp_vmlinux.kallsyms${1}
-	kallsymso=${kallsyms_vmlinux}.o
-	kallsyms_S=${kallsyms_vmlinux}.S
 
-	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
-	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
-	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
-
-	info AS ${kallsymso}
-	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
-	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
-	      -c -o ${kallsymso} ${kallsyms_S}
+	vmlinux_link "${kallsyms_vmlinux}"
+	mksysmap "${kallsyms_vmlinux}" "${kallsyms_vmlinux}.syms"
+	kallsyms "${kallsyms_vmlinux}.syms" "${kallsyms_vmlinux}"
 }
 
 # Create map file with all symbols from ${1}
@@ -223,19 +223,17 @@ fi
 
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
 
-btf_vmlinux_bin_o=""
+kallsymso=
+btf_vmlinux_bin_o=
+
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
-	btf_vmlinux_bin_o=.btf.vmlinux.bin.o
-	if ! gen_btf .tmp_vmlinux.btf $btf_vmlinux_bin_o ; then
+	if ! gen_btf .tmp_vmlinux.btf .btf.vmlinux.bin.o ; then
 		echo >&2 "Failed to generate BTF for vmlinux"
 		echo >&2 "Try to disable CONFIG_DEBUG_INFO_BTF"
 		exit 1
 	fi
 fi
 
-kallsymso=""
-kallsymso_prev=""
-kallsyms_vmlinux=""
 if is_enabled CONFIG_KALLSYMS; then
 
 	# kallsyms support
@@ -262,10 +260,9 @@ if is_enabled CONFIG_KALLSYMS; then
 	#     ${kallsymso}.
 
 	kallsyms_step 1
-	kallsyms_step 2
+	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	# step 3
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
+	kallsyms_step 2
 	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
@@ -273,7 +270,7 @@ if is_enabled CONFIG_KALLSYMS; then
 	fi
 fi
 
-vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
+vmlinux_link vmlinux
 
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
-- 
2.43.0


