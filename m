Return-Path: <linux-kbuild+bounces-11093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBpLDrXYimnrOAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11093-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:05:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BF117A61
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B41543018751
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 07:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38E932ED37;
	Tue, 10 Feb 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rn067kQe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2232ED32;
	Tue, 10 Feb 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707108; cv=none; b=Xu/iTt5jD6NvIXbHPAo+jyYuVQOmTlHELamro3gQYbm+OWTsjotDaylVV8Z/bty8uBqpHfs11Pl/HVSwYJLnt0FN6aXem55hy8h5uESW9mzvU+89Y8SMU73ZjExD5bLAdvDT81JFGYKrKk1LG5fIMmLSfgIUcrG0eL7FaXExRZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707108; c=relaxed/simple;
	bh=+qzEFBmfeqSLYrCR2eI88t+RY0Z1ab7ZBq1BYl/KUvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5dWP/EaqWNkXDvhLCvSRKUKCACg5wv3+HIdd3G5DFj2eK3Cil7T+EOWt5tywgJQ4TRmkYN67kA8g74wLe74VD2uvqOHbe8dyhLNYmpTJVJxdbCGTesfFaL9NAkTsfIxEKGHo96nE8uydmqdEh/f73i9DS3xyxFoH0Nft0SWxj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rn067kQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D85C19424;
	Tue, 10 Feb 2026 07:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770707108;
	bh=+qzEFBmfeqSLYrCR2eI88t+RY0Z1ab7ZBq1BYl/KUvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rn067kQe3vdwaIPZWIjNv2y9iD100K0itZ/RIM/iIn4WYFBvXniJfywh57AKMMRCR
	 UFdMSvA4UI/aau2g2GIMaxCdpqbkhXnLtsIZunnvZGnqjUkCfAEOuhgQViZgvcFEmY
	 YHrXN6MdoaYU49iwrH+lDaMJ1s96NNEgKxiuj5Snr8Mg+lnOseY0gpH5mHLr+rmTr/
	 RJhSbeBqJ3I08qE76Ifo5WP5DS6jPuwzGeXNpKjY1gOll6CVYKd3EDWeRYUzvqIbfk
	 EcwYgC6SMlfCWBahc8s1sz/eb2gR3YtMt/IQMhOEQzZWzu4cdDbY5GMuSLPNDtzXC3
	 zvGjoRnqJ3hzw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Feb 2026 00:04:48 -0700
Subject: [PATCH 1/2] kbuild: rpm-pkg: Restrict manual debug package
 creation
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-kbuild-fix-debuginfo-rpm-v1-1-0730b92b14bc@kernel.org>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
In-Reply-To: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Steve French <smfrench@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6150; i=nathan@kernel.org;
 h=from:subject:message-id; bh=+qzEFBmfeqSLYrCR2eI88t+RY0Z1ab7ZBq1BYl/KUvw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJldNxba6h/nVViytPLEdmO1yxEHbZzPcqst/Fhqotn6Z
 vnXuq07O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE7E4yMiy49EFlgaFvfcyS
 T1Md30R0tO/fkZ/LIsxiJ5deH7JXQJ/hN8t7vcWMHOnh7PyzXiT9Cd5/d+7VDXtWm0Q0dPEpXZt
 4lAUA
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
	TAGGED_FROM(0.00)[bounces-11093-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[find-debuginfo.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E0BF117A61
X-Rspamd-Action: no action

Commit 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package
manually") moved away from the built-in RPM machinery for generating
-debuginfo packages to a more manual way to be compatible with module
signing, as the built-in machinery strips the modules after the
installation process, breaking the signatures.

Unfortunately, prior to rpm 4.20.0, there is a bug where a custom %files
directive is ignored for a -debuginfo subpackage [1], meaning builds
using older versions of RPM (such as on RHEL9 or RHEL10) fail with:

  Checking for unpackaged file(s): /usr/lib/rpm/check-files .../rpmbuild/BUILDROOT/kernel-6.19.0_dirty-1.x86_64
  error: Installed (but unpackaged) file(s) found:
     /debuginfo.list
     /usr/lib/debug/.build-id/09/748c214974bfba1522d434a7e0a02e2fd7f29b.debug
     /usr/lib/debug/.build-id/0b/b96dd9c7d3689d82e56d2e73b46f53103cc6c7.debug
     /usr/lib/debug/.build-id/0e/979a2f34967c7437fd30aabb41de1f0c8b6a66.debug
    ...

To workaround this, restrict the manual debug info package creation
process to when it is necessary (CONFIG_MODULE_SIG=y) and possible (when
using RPM >= 4.20.0). A follow up change will restore the RPM debuginfo
creation process using a separate internal flag to allow the package to
be built in more situations, as RPM 4.20.0 is a fairly recent version
and the built-in -debuginfo generation works fine when module signing is
disabled.

Cc: stable@vger.kernel.org
Fixes: 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package manually")
Link: https://github.com/rpm-software-management/rpm/commit/49f906998f3cf1f4152162ca61ac0869251c380f [1]
Reported-by: Steve French <smfrench@gmail.com>
Closes: https://lore.kernel.org/CAH2r5mugbrHTwnaQwQiYEUVwbtqmvFYf0WZiLrrJWpgT8iwftw@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/package/kernel.spec |  9 +++++----
 scripts/package/mkspec      | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 0f1c8de1bd95..b7deb159f404 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -47,12 +47,13 @@ This package provides kernel headers and makefiles sufficient to build modules
 against the %{version} kernel package.
 %endif
 
-%if %{with_debuginfo}
+%if %{with_debuginfo_manual}
 %package debuginfo
 Summary: Debug information package for the Linux kernel
 %description debuginfo
 This package provides debug information for the kernel image and modules from the
 %{version} package.
+%define install_mod_strip 1
 %endif
 
 %prep
@@ -67,7 +68,7 @@ patch -p1 < %{SOURCE2}
 mkdir -p %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinuz
 # DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
-%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} INSTALL_MOD_STRIP=1 DEPMOD=true modules_install
+%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} %{?install_mod_strip:INSTALL_MOD_STRIP=1} DEPMOD=true modules_install
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
@@ -98,7 +99,7 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 	echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
 } > %{buildroot}/kernel.list
 
-%if %{with_debuginfo}
+%if %{with_debuginfo_manual}
 # copying vmlinux directly to the debug directory means it will not get
 # stripped (but its source paths will still be collected + fixed up)
 mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
@@ -162,7 +163,7 @@ fi
 /lib/modules/%{KERNELRELEASE}/build
 %endif
 
-%if %{with_debuginfo}
+%if %{with_debuginfo_manual}
 %files -f %{buildroot}/debuginfo.list debuginfo
 %defattr (-, root, root)
 %exclude /debuginfo.list
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index c7375bfc25a9..1080395ca0e1 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -23,15 +23,42 @@ else
 echo '%define with_devel 0'
 fi
 
+# manually generate -debuginfo package
+with_debuginfo_manual=0
 # debuginfo package generation uses find-debuginfo.sh under the hood,
 # which only works on uncompressed modules that contain debuginfo
 if grep -q CONFIG_DEBUG_INFO=y include/config/auto.conf &&
    (! grep -q CONFIG_MODULE_COMPRESS=y include/config/auto.conf) &&
    (! grep -q CONFIG_DEBUG_INFO_SPLIT=y include/config/auto.conf); then
-echo '%define with_debuginfo %{?_without_debuginfo: 0} %{?!_without_debuginfo: 1}'
-else
-echo '%define with_debuginfo 0'
+	# If module signing is enabled (which may be required to boot with
+	# lockdown enabled), the find-debuginfo.sh machinery cannot be used
+	# because the signatures will be stripped off the modules. However, due
+	# to an rpm bug in versions prior to 4.20.0
+	#
+	#     https://github.com/rpm-software-management/rpm/issues/3057
+	#     https://github.com/rpm-software-management/rpm/commit/49f906998f3cf1f4152162ca61ac0869251c380f
+	#
+	# We cannot provide our own debuginfo package because it does not listen
+	# to our custom files list, failing the build due to unpackaged files.
+	# Manually generate the debug info package if using rpm 4.20.0. If not
+	# using rpm 4.20.0, avoid generating a -debuginfo package altogether,
+	# as it is not safe.
+	if grep -q CONFIG_MODULE_SIG=y include/config/auto.conf; then
+		rpm_ver_str=$(rpm --version 2>/dev/null)
+		# Split the version on spaces
+		IFS=' '
+		set -- $rpm_ver_str
+		if [ "${1:-}" = RPM -a "${2:-}" = version ]; then
+			IFS=.
+			set -- $3
+			rpm_ver=$(( 1000000 * $1 + 10000 * $2 + 100 * $3 + ${4:-0} ))
+			if [ "$rpm_ver" -ge 4200000 ]; then
+				with_debuginfo_manual='%{?_without_debuginfo:0}%{?!_without_debuginfo:1}'
+			fi
+		fi
+	fi
 fi
+echo "%define with_debuginfo_manual $with_debuginfo_manual"
 
 cat<<EOF
 %define ARCH ${ARCH}

-- 
2.53.0


