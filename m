Return-Path: <linux-kbuild+bounces-6378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B01FFA77102
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 00:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6EA9188C9A6
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Mar 2025 22:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575741C3BEE;
	Mon, 31 Mar 2025 22:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="G7POXj2I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B048472
	for <linux-kbuild@vger.kernel.org>; Mon, 31 Mar 2025 22:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743461214; cv=none; b=j5KWIqxxkKOeY7eckSsqKaRwY9AhucKuCgPb91M+cs1FDvxBI5POZRf3qUjbeVB/eOIs88gcRs3orIAe0Qw7allGkbp4rqG2fbRLwLRZ3WwP4rfhizh/MtSS2Wkk6qqLegdqNYNCDqsKhYA5rXjkxUnqqUfIGjvWdPbxDzUwl/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743461214; c=relaxed/simple;
	bh=0Sb6f7zDy8XsqRFEYtRFMI9gD1GYwRzOT9ujI6Lco6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h+1OyysQzIk5Y0oMSuq4D5LViDMLroT86hxSsc5uPZxw0ySu4cZUJxRmkj5QLscJh3IAy6ejvm6KK1sRN7Se5zh/5Rla+PrQFTNl8alWClYaYhjJG237rPi5K3AGUvdjVY9mzjJ6H/3C1Nk0xwGKvtPEdUuOqiTQ4ixWnVz55Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=G7POXj2I; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-226185948ffso95749875ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Mar 2025 15:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743461211; x=1744066011; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRaVM3CNehJvGQTGmZQ6mGENLfDCUn3HpGA973y7kNY=;
        b=G7POXj2Ikv/xpk5/WGqWN/EJU2bP0XRHcIJX7nynkn1WNqsDaoXK45DBZIVlbuvUYo
         bJXxiU+bC/aE7ptRk7fwodS9ICkXDCVdO5z2trXDIcw8966GnmE3PODnS/adEzCCgtyX
         NV13bkitW1HyVxsyXA8TzAGFyCmr4J/TmTfCfWE1n/d1oKGM3HxgA5awE9E6eJaWYYS8
         51ii0Xd2vNQKaxHcKhirJD09QBUsGBD6jVs1P7fYOVCfhjm+QRXO3NaES+hWK6+d4vhv
         tXRYViXuq+WPcNAPUP1RDcYV2E0AMHNQA9+6Nyu6zWCGqLl/FNLwPbZew/u/HkjRcaBM
         HZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743461211; x=1744066011;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRaVM3CNehJvGQTGmZQ6mGENLfDCUn3HpGA973y7kNY=;
        b=OcHhYpxwuwrPa5g15gjc25G9GjrQ0C0eSi08rIdauxhKX1rgBrDlqm+oVaxS/TeOg3
         Kf7q9atwvY44NiCUcTVyvFhHjsqIIDSHNuse2tRfqAzLk6EcY7T9QXRF6BsvuA1j+xga
         FrFUTIHns5YB0jkWB+lZH3+Ue5+a+AAAom8byMB7yGF7aDhtyVZenWtK9TSojhQsIghG
         JPdEi3ZtmAYS8CbFT8p1ySo26mpVtGA1yW/+eW44NSEgRFvjWM7GtkAiCrBV19WLip1G
         EEctua7GfiTBjexFxMCFmBlTm+BoQKnFGhcq/O56gOygeVSSQP9pJl0z6VIXmcEc9RSc
         oLEA==
X-Gm-Message-State: AOJu0Yy1KlPww58P3xKVW5+H8ZVuTlZQYijN95rjO+GLV1DG5gXuzaea
	BmW8vNKmcU5ODg/zxdkF48CtcJuiYHk93SqVzmQs6z+109/pHE1WT83HPbEv0Pz5C1kHdy+f1fQ
	RnnVUowFgXOWaYW8i39Ztp5WrodM404xw
X-Gm-Gg: ASbGncstb9UfItCA16qAyP5aCxt8uCMJyb1IXtgJMAgOnBQuEXRpTHAx12qYLwixihP
	lR0igXwW5fWOlg3baFdVrS7/1olEqJLoiNkzx6fAZ8miGd0sH/zdZGHAD5WvuUF4SvLDFzuiQky
	JLkfnqAecDyF69/uaFwJfaou0sfGHdb6x8AJJCTW2FIwP61x66wzBtP1cWLRkqalkWIgIfEfWyY
	5Zkut1A1CNsrIVRciIP6yOHBcqMyfsU0z5y5zL7fTuFWs/ciOj2YNuVDK52A6MlhYGg8eSJu82A
	cBJ9IjT5Nu6ya/XeVyYfFlas0ArYOzR9dyd9BW0wsytxAMsYJw==
X-Google-Smtp-Source: AGHT+IH2hAavKdByNIIMuRkYpDbpoBagrgf9U61ZuF5CCGjY7hMQp8IuGIzRkHuArE4d7Oc71Ya3BkmsH/oY
X-Received: by 2002:a17:902:f548:b0:223:3ef1:a30a with SMTP id d9443c01a7336-2292f9fb9b8mr154143745ad.45.1743461211561;
        Mon, 31 Mar 2025 15:46:51 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2291eec553csm6147055ad.14.2025.03.31.15.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 15:46:51 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id AF928340235;
	Mon, 31 Mar 2025 16:46:50 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id A45EEE41615; Mon, 31 Mar 2025 16:46:50 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 31 Mar 2025 16:46:32 -0600
Subject: [PATCH v2] kbuild: rpm-pkg: build a debuginfo RPM
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-debuginfo-v2-1-fb460999a5b3@purestorage.com>
X-B4-Tracking: v=1; b=H4sIAEcb62cC/03MQQ6CMBCF4auQWVvTDqLAynsYFoVOyyykpJVGQ
 7i7hbhw+U/mfStECkwR2mKFQIkj+ykHngoYRj05EmxyA0qsJMpGGOoXx5P1YjClaS7qpi0qyP9
 zIMvvw3p0uUeOLx8+B53Ufv0pSv4pSQkpymttqa9qbFDf5yXQvtSOzoN/Qrdt2xedCqpaqAAAA
 A==
X-Change-ID: 20250209-debuginfo-cd3d9417af21
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

The rpm-pkg make target currently suffers from a few issues related to
debuginfo:
1. debuginfo for things built into the kernel (vmlinux) is not available
   in any RPM produced by make rpm-pkg. This makes using tools like
   systemtap against a make rpm-pkg kernel impossible.
2. debug source for the kernel is not available. This means that
   commands like 'disas /s' in gdb, which display source intermixed with
   assembly, can only print file names/line numbers which then must be
   painstakingly resolved to actual source in a separate editor.
3. debuginfo for modules is available, but it remains bundled with the
   .ko files that contain module code, in the main kernel RPM. This is a
   waste of space for users who do not need to debug the kernel (i.e.
   most users).

Address all of these issues by additionally building a debuginfo RPM
when the kernel configuration allows for it, in line with standard
patterns followed by RPM distributors. With these changes:
1. systemtap now works (when these changes are backported to 6.11, since
   systemtap lags a bit behind in compatibility), as verified by the
   following simple test script:

   # stap -e 'probe kernel.function("do_sys_open").call { printf("%s\n", $$parms); }'
   dfd=0xffffffffffffff9c filename=0x7fe18800b160 flags=0x88800 mode=0x0
   ...

2. disas /s works correctly in gdb, with source and disassembly
   interspersed:

   # gdb vmlinux --batch -ex 'disas /s blk_op_str'
   Dump of assembler code for function blk_op_str:
   block/blk-core.c:
   125     {
      0xffffffff814c8740 <+0>:     endbr64

   127
   128             if (op < ARRAY_SIZE(blk_op_name) && blk_op_name[op])
      0xffffffff814c8744 <+4>:     mov    $0xffffffff824a7378,%rax
      0xffffffff814c874b <+11>:    cmp    $0x23,%edi
      0xffffffff814c874e <+14>:    ja     0xffffffff814c8768 <blk_op_str+40>
      0xffffffff814c8750 <+16>:    mov    %edi,%edi

   126             const char *op_str = "UNKNOWN";
      0xffffffff814c8752 <+18>:    mov    $0xffffffff824a7378,%rdx

   127
   128             if (op < ARRAY_SIZE(blk_op_name) && blk_op_name[op])
      0xffffffff814c8759 <+25>:    mov    -0x7dfa0160(,%rdi,8),%rax

   126             const char *op_str = "UNKNOWN";
      0xffffffff814c8761 <+33>:    test   %rax,%rax
      0xffffffff814c8764 <+36>:    cmove  %rdx,%rax

   129                     op_str = blk_op_name[op];
   130
   131             return op_str;
   132     }
      0xffffffff814c8768 <+40>:    jmp    0xffffffff81d01360 <__x86_return_thunk>
   End of assembler dump.

3. The size of the main kernel package goes down substantially,
   especially if many modules are built (quite typical). Here is a
   comparison of installed size of the kernel package (configured with
   allmodconfig, dwarf4 debuginfo, and module compression turned off)
   before and after this patch:

   # rpm -qi kernel-6.13* | grep -E '^(Version|Size)'
   Version     : 6.13.0postpatch+
   Size        : 1382874089
   Version     : 6.13.0prepatch+
   Size        : 17870795887

   This is a ~92% size reduction.

Note that a debuginfo package can only be produced if the following
configs are set:
- CONFIG_DEBUG_INFO=y
- CONFIG_MODULE_COMPRESS=n
- CONFIG_DEBUG_INFO_SPLIT=n

The first of these is obvious - we can't produce debuginfo if the build
does not generate it. The second two requirements can in principle be
removed, but doing so is difficult with the current approach, which uses
a generic rpmbuild script find-debuginfo.sh that processes all packaged
executables. If we want to remove those requirements the best path
forward is likely to add some debuginfo extraction/installation logic to
the modules_install target (controllable by flags). That way, it's
easier to operate on modules before they're compressed, and the logic
can be reused by all packaging targets.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Changes in v2:
- Check config requirements more explicitly (Masahiro Yamada)
- Ensure modules stay non-executable (Masahiro Yamada)
- Always combine debuginfo and debugsource package
- Link to v1: https://lore.kernel.org/r/20250210-debuginfo-v1-0-368feb58292a@purestorage.com
---
 scripts/package/kernel.spec | 46 +++++++++++++++++++++++++++++++++++++++++++--
 scripts/package/mkspec      | 10 ++++++++++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index ac3e5ac01d8a4daa031bc9e70b792a68f74c388b..726f34e1196018165adf350933a5f816faeeef0b 100644
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
@@ -46,6 +44,36 @@ This package provides kernel headers and makefiles sufficient to build modules
 against the %{version} kernel package.
 %endif
 
+%if %{with_debuginfo}
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
+%endif
+# some (but not all) versions of rpmbuild emit %%debug_package with
+# %%install. since we've already emitted it manually, that would cause
+# a package redefinition error. ensure that doesn't happen
+%define debug_package %{nil}
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
+
 %prep
 %setup -q -n linux
 cp %{SOURCE1} .config
@@ -89,8 +117,22 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 	echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
 } > %{buildroot}/kernel.list
 
+# make modules executable so that find-debuginfo.sh strips them. this
+# will be undone later in %%__spec_install_post
+find %{buildroot}/lib/modules/%{KERNELRELEASE} -name "*.ko" -type f \
+	| xargs --no-run-if-empty chmod u+x
+
+%if %{with_debuginfo}
+# copying vmlinux directly to the debug directory means it will not get
+# stripped (but its source paths will still be collected + fixed up)
+mkdir -p %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
+cp vmlinux %{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}
+%endif
+
 %clean
 rm -rf %{buildroot}
+rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources.list \
+	elfbins.list
 
 %post
 if [ -x /usr/bin/kernel-install ]; then
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 4dc1466dfc815c110eb7206f83dd874b17f5170f..c7375bfc25a9ad3ae98c088273bd76375ea6962e 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -23,6 +23,16 @@ else
 echo '%define with_devel 0'
 fi
 
+# debuginfo package generation uses find-debuginfo.sh under the hood,
+# which only works on uncompressed modules that contain debuginfo
+if grep -q CONFIG_DEBUG_INFO=y include/config/auto.conf &&
+   (! grep -q CONFIG_MODULE_COMPRESS=y include/config/auto.conf) &&
+   (! grep -q CONFIG_DEBUG_INFO_SPLIT=y include/config/auto.conf); then
+echo '%define with_debuginfo %{?_without_debuginfo: 0} %{?!_without_debuginfo: 1}'
+else
+echo '%define with_debuginfo 0'
+fi
+
 cat<<EOF
 %define ARCH ${ARCH}
 %define KERNELRELEASE ${KERNELRELEASE}

---
base-commit: 2c8725c1dca3de043670b38592b1b43105322496
change-id: 20250209-debuginfo-cd3d9417af21

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>


