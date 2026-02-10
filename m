Return-Path: <linux-kbuild+bounces-11094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ITFMNLYimnrOAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11094-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:05:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28254117A76
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA0B4303CEBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 07:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1575E32ED27;
	Tue, 10 Feb 2026 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCo1YNco"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E476532ED21;
	Tue, 10 Feb 2026 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707110; cv=none; b=QxcCiIZJZR40VnWBR++bbSJmXgXBFIJexvnn5MRJOdLLtoFP0HbC8crjgfQ34QcA6DReYyUTP//EOBOL01xR0evYQEd4j3kiXLKrJHYv3CIYmUQYBjvpzAh/fLjn9gSKnGWV8kBW1r+o5M0tZUW7erFfNM1VvxP1QkQH/JmLbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707110; c=relaxed/simple;
	bh=hCN2nmr0Cunr+xmaxPIDlR1TXMxoDqdYCYTAfgqv3YY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CgHHYwYrMI+B+L3qU4sU69DYWzNz4IqZCu3kkf/hZrZ7JGGUSTHSBKVyE5EQo1VQtVxCYCt7uIOkBfGE5f4fadCzpdK8NG7ShZA4y8xSMAJWjjAUlYIjuH6nmXwf0CqNhP+2hSXidm9voF0fDbX01Q+QJDNpW4aeiNgwdkL+Bfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCo1YNco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03FAC19424;
	Tue, 10 Feb 2026 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770707109;
	bh=hCN2nmr0Cunr+xmaxPIDlR1TXMxoDqdYCYTAfgqv3YY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dCo1YNcooFmh404GXDEtzdOGIV0ywdEEuPmgCr0xak/dbvEA0zDtseQOVZr4guIm/
	 HQGP+cm+CYQNv9Flr+2dtFIaDI2JULOXAvw0ORHq7opWxVZqDcBnfrqO9ZwGq3ZjD5
	 +mkHUravUIUdEECHVSlpyj2AD2BJo6/+Kwuk+xgwjy4kUpqLJkgt9DyKdibbOAprUf
	 7hWK/GBu6fwFIG2L43gSzG8QSJfG8vd+5h8cJvoYnQFQzWNIvhlv0nYxdHaNIWdt/F
	 w1eZUBP1k9nV1qU8d8kRC0G380Spb7NOUzHrdHZfxgRO6JuEhCXBO/YZmOlkFd6XYG
	 LzmgWbuZcmZYA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Feb 2026 00:04:49 -0700
Subject: [PATCH 2/2] kernel: rpm-pkg: Restore find-debuginfo.sh approach to
 -debuginfo package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-kbuild-fix-debuginfo-rpm-v1-2-0730b92b14bc@kernel.org>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
In-Reply-To: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5041; i=nathan@kernel.org;
 h=from:subject:message-id; bh=hCN2nmr0Cunr+xmaxPIDlR1TXMxoDqdYCYTAfgqv3YY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJldNxb65bOH/31z1LP70qyYpO6NipdyJVjmnPTd/+3u6
 8Xq64+JdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJRMQw/NNy3Pj42wXNH4Fq
 4SZB+y7byrS2Gfz/vj/pd8UBozDH1IOMDC/yjB/HapwM6PVhvnSRzW9Tf1WjX2/1/0nHGCZemC8
 cwQ8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11094-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[find-debuginfo.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28254117A76
X-Rspamd-Action: no action

Commit 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package
manually") effectively reverted commit a7c699d090a1 ("kbuild: rpm-pkg:
build a debuginfo RPM") but the approach it took is not safe for older
RPM releases. Restore commit a7c699d090a1 ("kbuild: rpm-pkg: build a
debuginfo RPM") for the !CONFIG_MODULE_SIG case to allow more
environments and configurations to take advantage of the separate debug
information package process.

Cc: stable@vger.kernel.org
Fixes: 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package manually")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/package/kernel.spec | 50 +++++++++++++++++++++++++++++++++++++++++----
 scripts/package/mkspec      |  5 +++++
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index b7deb159f404..af682a705477 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -2,8 +2,6 @@
 %{!?_arch: %define _arch dummy}
 %{!?make: %define make make}
 %define makeflags %{?_smp_mflags} ARCH=%{ARCH}
-%define __spec_install_post /usr/lib/rpm/brp-compress || :
-%define debug_package %{nil}
 
 Name: kernel
 Summary: The Linux Kernel
@@ -56,6 +54,38 @@ This package provides debug information for the kernel image and modules from th
 %define install_mod_strip 1
 %endif
 
+%if %{with_debuginfo_rpm}
+# list of debuginfo-related options taken from distribution kernel.spec
+# files
+%undefine _include_minidebuginfo
+%undefine _find_debuginfo_dwz_opts
+%undefine _unique_build_ids
+%undefine _unique_debug_names
+%undefine _unique_debug_srcs
+%undefine _debugsource_packages
+%undefine _debuginfo_subpackages
+%global _find_debuginfo_opts -r
+%global _missing_build_ids_terminate_build 1
+%global _no_recompute_build_ids 1
+%{debug_package}
+
+# later, we make all modules executable so that find-debuginfo.sh strips
+# them up. but they don't actually need to be executable, so remove the
+# executable bit, taking care to do it _after_ find-debuginfo.sh has run
+%define __spec_install_post \
+	%{?__debug_package:%{__debug_install_post}} \
+	%{__arch_install_post} \
+	%{__os_install_post} \
+	find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \\\
+		| xargs --no-run-if-empty chmod u-x
+%else
+%define __spec_install_post /usr/lib/rpm/brp-compress || :
+%endif
+# some (but not all) versions of rpmbuild emit %%debug_package with
+# %%install. since we've already emitted it manually, that would cause
+# a package redefinition error. ensure that doesn't happen
+%define debug_package %{nil}
+
 %prep
 %setup -q -n linux
 cp %{SOURCE1} .config
@@ -99,14 +129,22 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 	echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
 } > %{buildroot}/kernel.list
 
-%if %{with_debuginfo_manual}
+%if 0%{with_debuginfo_manual}%{with_debuginfo_rpm} > 0
 # copying vmlinux directly to the debug directory means it will not get
 # stripped (but its source paths will still be collected + fixed up)
 mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
 cp vmlinux %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
+%endif
 
-echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginfo.list
+%if %{with_debuginfo_rpm}
+# make modules executable so that find-debuginfo.sh strips them. this
+# will be undone later in %%__spec_install_post
+find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \
+	| xargs --no-run-if-empty chmod u+x
+%endif
 
+%if %{with_debuginfo_manual}
+echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginfo.list
 while read -r mod; do
 	mod="${mod%.o}.ko"
 	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
@@ -124,6 +162,10 @@ done < modules.order
 
 %clean
 rm -rf %{buildroot}
+%if %{with_debuginfo_rpm}
+rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources.list \
+	elfbins.list
+%endif
 
 %post
 if [ -x /usr/bin/kernel-install ]; then
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 1080395ca0e1..c604f8c174e2 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -23,6 +23,8 @@ else
 echo '%define with_devel 0'
 fi
 
+# use %{debug_package} machinery to generate -debuginfo
+with_debuginfo_rpm=0
 # manually generate -debuginfo package
 with_debuginfo_manual=0
 # debuginfo package generation uses find-debuginfo.sh under the hood,
@@ -56,9 +58,12 @@ if grep -q CONFIG_DEBUG_INFO=y include/config/auto.conf &&
 				with_debuginfo_manual='%{?_without_debuginfo:0}%{?!_without_debuginfo:1}'
 			fi
 		fi
+	else
+		with_debuginfo_rpm='%{?_without_debuginfo:0}%{?!_without_debuginfo:1}'
 	fi
 fi
 echo "%define with_debuginfo_manual $with_debuginfo_manual"
+echo "%define with_debuginfo_rpm $with_debuginfo_rpm"
 
 cat<<EOF
 %define ARCH ${ARCH}

-- 
2.53.0


