Return-Path: <linux-kbuild+bounces-10777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBvCCUpTcWkKCQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10777-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:29:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6B5ECE0
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1BAB4ED42D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 22:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC344421EF5;
	Wed, 21 Jan 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMl9T3ZU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917EF43C059;
	Wed, 21 Jan 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034564; cv=none; b=cr5a0MibWEA6M3mq22CpG8rN4Je9UFkzfv6dS0/bEZZLpn8DYS6M5yyta7n3dlXY5a3TxGlDiDF87mNEMQnh3kDBSBWzzJ999s1z3CkfCykT1nS1Z2KMiff/5/cbSFC4sxFBVOa5w5J/SCcGR+PSEy/CIoZbjI8AA2u+jD3eaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034564; c=relaxed/simple;
	bh=03URoAD5rrDrIP1JgO7AfHgHCSLvGTiLJJH50AgZlhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RZ+d9OuwRnhNK2zwURmee2LH7TUL5SEvLGRhjq9h3busw7XiuIIVsrg7duKI4IWGjpLnDwvwrvJvIykoEm8mk6fMTFp4sfAE59AEhnWxKL2aYr863W7sldn+6DAnp4Ww74vViv6JhOLAs02r0fds0rXeSdkgpVG0f8Fl3ifP+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMl9T3ZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3309C4CEF1;
	Wed, 21 Jan 2026 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769034564;
	bh=03URoAD5rrDrIP1JgO7AfHgHCSLvGTiLJJH50AgZlhQ=;
	h=From:Date:Subject:To:Cc:From;
	b=qMl9T3ZUINaCK+/D02WeCqj0MaosSoh/erRxptpz9LT2Q2YtTx9DFH9PTFH0SFAJw
	 aiCLeyB4xRRMPr4xQ81I8D9JKWdgiTeiol4eJiietLTaTKcUGmvfl1DcJ/mRDdOhNc
	 a0RRlP4k/ej/PerwxA//w2Q1xFnLatoxTBwE/7J7ZEJRh2uC0ggmlOa+wA+r4x8cxE
	 UFVR0+KYO1ibk3qhoomU+AK9kaye9VF9uX2mgzQR50ZHHvOQ8niA2zP/rAmDDjv72F
	 3e5wg9ZdzvXEs5N9g6z8RpGEGrEUrxrQj1P7FhF7+HkktChS0Srv5lDR3YA042VWWC
	 EJU6Gi9XcH6Gw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 21 Jan 2026 15:29:15 -0700
Subject: [PATCH] kbuild: rpm-pkg: Generate debuginfo package manually
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-fix-module-signing-binrpm-pkg-v1-1-8fc5832b6cbc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJWwyJXsW4aMtYB2RoOkBMC
 He36vIt/t9BqTApXJsdCm2sPEuFPTUQn14SIffV4IzrjHUWH/zGae7XF6FyEpaEgaXkCfOY8HJ
 uyXchRuMN1EcuVIPf/3b/W9cwUFy+UziODw+0NsGBAAAA
X-Change-ID: 20260121-fix-module-signing-binrpm-pkg-943ea6bcc0a0
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Uday Shankar <ushankar@purestorage.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Holger Kiehl <Holger.Kiehl@dwd.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5870; i=nathan@kernel.org;
 h=from:subject:message-id; bh=03URoAD5rrDrIP1JgO7AfHgHCSLvGTiLJJH50AgZlhQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmFwU6fvvUfd3B4+azlivKluLiPmVyv9msILW210lN1q
 F0qfuB7RykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIunJGhjep2XdbJrbxiJ3p
 lc9Llzp69u78jz6LOdnOHd9Z4Vmf8oPhn45OqDjHCiHzHXqs2dONZwt26P1PVXHtFd+z+/t6qdY
 cZgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-10777-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dwd.de:email,system.map:url,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,p:email]
X-Rspamd-Queue-Id: 71E6B5ECE0
X-Rspamd-Action: no action

Commit a7c699d090a1 ("kbuild: rpm-pkg: build a debuginfo RPM") adjusted
the __spec_install_post macro to include __os_install_post, which runs
brp-strip. This ends up stripping module signatures, breaking loading
modules with lockdown enabled.

Undo most of the changes of the aforementioned debuginfo patch and
mirror commit 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead of
debug link for dbg package") in kernel.spec to generate a functionally
equivalent debuginfo package while avoiding touching the modules after
they have already been signed during modules_install.

Fixes: a7c699d090a1 ("kbuild: rpm-pkg: build a debuginfo RPM")
Reported-by: Holger Kiehl <Holger.Kiehl@dwd.de>
Closes: https://lore.kernel.org/68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de/
Tested-by: Holger Kiehl <Holger.Kiehl@dwd.de>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Uday, could you verify that your usecases for the debuginfo package
continue to work after this change?

Nicolas, if you would like to take this as a fix, please do so.
Otherwise, I can apply it to kbuild-next.
---
 scripts/package/kernel.spec | 65 +++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 98f206cb7c60..0f1c8de1bd95 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -2,6 +2,8 @@
 %{!?_arch: %define _arch dummy}
 %{!?make: %define make make}
 %define makeflags %{?_smp_mflags} ARCH=%{ARCH}
+%define __spec_install_post /usr/lib/rpm/brp-compress || :
+%define debug_package %{nil}
 
 Name: kernel
 Summary: The Linux Kernel
@@ -46,34 +48,12 @@ against the %{version} kernel package.
 %endif
 
 %if %{with_debuginfo}
-# list of debuginfo-related options taken from distribution kernel.spec
-# files
-%undefine _include_minidebuginfo
-%undefine _find_debuginfo_dwz_opts
-%undefine _unique_build_ids
-%undefine _unique_debug_names
-%undefine _unique_debug_srcs
-%undefine _debugsource_packages
-%undefine _debuginfo_subpackages
-%global _find_debuginfo_opts -r
-%global _missing_build_ids_terminate_build 1
-%global _no_recompute_build_ids 1
-%{debug_package}
+%package debuginfo
+Summary: Debug information package for the Linux kernel
+%description debuginfo
+This package provides debug information for the kernel image and modules from the
+%{version} package.
 %endif
-# some (but not all) versions of rpmbuild emit %%debug_package with
-# %%install. since we've already emitted it manually, that would cause
-# a package redefinition error. ensure that doesn't happen
-%define debug_package %{nil}
-
-# later, we make all modules executable so that find-debuginfo.sh strips
-# them up. but they don't actually need to be executable, so remove the
-# executable bit, taking care to do it _after_ find-debuginfo.sh has run
-%define __spec_install_post \
-	%{?__debug_package:%{__debug_install_post}} \
-	%{__arch_install_post} \
-	%{__os_install_post} \
-	find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \\\
-		| xargs --no-run-if-empty chmod u-x
 
 %prep
 %setup -q -n linux
@@ -87,7 +67,7 @@ patch -p1 < %{SOURCE2}
 mkdir -p %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinuz
 # DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
-%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} DEPMOD=true modules_install
+%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} INSTALL_MOD_STRIP=1 DEPMOD=true modules_install
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
@@ -118,22 +98,31 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 	echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
 } > %{buildroot}/kernel.list
 
-# make modules executable so that find-debuginfo.sh strips them. this
-# will be undone later in %%__spec_install_post
-find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \
-	| xargs --no-run-if-empty chmod u+x
-
 %if %{with_debuginfo}
 # copying vmlinux directly to the debug directory means it will not get
 # stripped (but its source paths will still be collected + fixed up)
 mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
 cp vmlinux %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
+
+echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginfo.list
+
+while read -r mod; do
+	mod="${mod%.o}.ko"
+	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
+	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+	link="%{buildroot}/usr/lib/debug/.build-id/${buildid}.debug"
+
+	mkdir -p "${dbg%/*}" "${link%/*}"
+	"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
+	ln -sf --relative "${dbg}" "${link}"
+
+	echo "${dbg#%{buildroot}}" >> %{buildroot}/debuginfo.list
+	echo "${link#%{buildroot}}" >> %{buildroot}/debuginfo.list
+done < modules.order
 %endif
 
 %clean
 rm -rf %{buildroot}
-rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources.list \
-	elfbins.list
 
 %post
 if [ -x /usr/bin/kernel-install ]; then
@@ -172,3 +161,9 @@ fi
 /usr/src/kernels/%{KERNELRELEASE}
 /lib/modules/%{KERNELRELEASE}/build
 %endif
+
+%if %{with_debuginfo}
+%files -f %{buildroot}/debuginfo.list debuginfo
+%defattr (-, root, root)
+%exclude /debuginfo.list
+%endif

---
base-commit: d4271702ab2fb0e4474ce66e3c68dfbdf8dc3e4c
change-id: 20260121-fix-module-signing-binrpm-pkg-943ea6bcc0a0

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


