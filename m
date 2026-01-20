Return-Path: <linux-kbuild+bounces-10696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A018D3BC47
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 01:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19D443029578
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 00:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0FF186A;
	Tue, 20 Jan 2026 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Phkf2Ojm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65806179A3;
	Tue, 20 Jan 2026 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768867498; cv=none; b=rk8i02+wlK4KNskItmt8T55OPk4UQiWOIdeUEoMcccpFt6ASSlfPqaxK3PDiugnAqXvzCEYB1sYQ0zNtkP1+6jml76BeuJCJ3GihIGy802bEDW0/MUDcek0mfkcHE5Fxgi48iSB+cflHtACoX5+tL6IXL11XOMtrqItJiRNUO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768867498; c=relaxed/simple;
	bh=wK+xN5PugkJty1WlWb5aRQ6G3/ezerBoQaeo7vnIHdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxK732p9L19qjORywJ8tczeYN7mpkvCVl2j27u7QUrfmj4SMX89vpNUKNz203HTFi/d0RYeMU+pxiR7tCTAJq0axS7W6MPvf93FPA9ZxO4COQf29MlXPvrWLVZYWHSbD5N0+13ZAC9vxoZ13os8GAYSJDpQbU7HxdUTEC/uUiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Phkf2Ojm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFBEC116C6;
	Tue, 20 Jan 2026 00:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768867498;
	bh=wK+xN5PugkJty1WlWb5aRQ6G3/ezerBoQaeo7vnIHdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Phkf2OjmoHrozgZ4rRcCknQ87mG30CUu5Hh7lt93J9ZYEAhj4bhu52LUZ86cmfGdg
	 fKjSbZdvbs2yEmO1W0fxJ/Q+Zx8+l2DcOrNkLP1opaCV70lNIV+wIG2cNIocpaspv6
	 IpWw7sYIJ6C+yKkxGgH5om2q3yUe4460Gpoo/0+I3uvcg8/XzCXw01YlxKtE7gOMeE
	 skbrN2P1OiWHJBeM8NgGLr8J83oeKi6/zf1d0E6iyGg/c55RaLW1i5o4KrgHOUZJh5
	 hBpnQSNA8Xjw5xNfriUqromuWUfj/CaoCgftV3gostj+JcDVKVZDu72icyUPzHNZ8N
	 ObnTuirrrudXg==
Date: Mon, 19 Jan 2026 17:04:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-kbuild@vger.kernel.org,
	Uday Shankar <ushankar@purestorage.com>
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
Message-ID: <20260120000454.GA2366369@ax162>
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de>
 <aWFt34dkIvlu1EYI@derry.ads.avm.de>
 <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de>
 <aWLF4BwQemwIZMMp@levanger>
 <71934f81-c412-cdaa-421b-b3b599be756d@praktifix.dwd.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71934f81-c412-cdaa-421b-b3b599be756d@praktifix.dwd.de>

On Sun, Jan 11, 2026 at 06:41:39PM +0100, Holger Kiehl wrote:
> On Sat, 10 Jan 2026, Nicolas Schier wrote:
> 
> > A simple solution might be to call modules_sign target after the
> > find-debuginfo.sh run; but commit 16c36f8864e3 spunds to me as if we
> > should rather do something similiar as for the Debian packages:
> > modules_install with INSTALL_MOD_STRIP=1 and then install only the debug
> > infos manually.
> > 
> > Does that make sense?
> > 
> I am not a kernel developer and my knowledge in this area is very
> limited. Did try your suggestion to call modules_install with
> INSTALL_MOD_STRIP=1, but still the signature was removed in the
> RPM. Removing the 'chmod u+x', so find-debuginfo.sh does not strip
> them, did not help either. But, most properly, I am still missing
> something.

I think one of the items added to __spec_install_post by commit
a7c699d090a1 ("kbuild: rpm-pkg: build a debuginfo RPM") ends up
stripping the modules unconditionally, not just when the debuginfo
package is built, as this reproduces for me with your configuration
snippet from upthread and x86_64_defconfig, which does not have debug
information enabled.

I emulated commit 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead
of debug link for dbg package") for rpm-pkg, which appears to result in
a functionally equivalent standalone debuginfo package (but I did not
actually test) while fixing module signing for me. Could you give it a
test?

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

