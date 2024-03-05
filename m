Return-Path: <linux-kbuild+bounces-1162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580F9871D13
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 12:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A051C2148B
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 11:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D53D58139;
	Tue,  5 Mar 2024 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZaZVjo2c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70222097
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636968; cv=none; b=V6ebY7B+YwZxdhEfNwpIHPkEdNp3MYlr6mCCSS0RhtkfPG99DujWu8SkCV4WwFIGJgQ7Uccdw7+4Iy+3sqG2gvHd62HxnJcG4Gmd16fO3mkYQ2pddzd8aGSy84gwvIPC8jpaE7LXK+AsO26zI/2sXfNUT+9MQVlSvwMYNKkHrQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636968; c=relaxed/simple;
	bh=sI+zC116lrLUDgrVYIDFht2kB+ywpJ+il0as5t/Gyt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yp+fB0TTXOUtufJXPWFZsQsVcFgYZX5fhFT45D+GZDd/TPqYkHBXMuwWvGHfpgQFOwZ42CdsmOH1T/EL76dqaWvhY9UU0CRm09iB6ba4Mv0JFNHD7Du+Wi2nn8F76Aaw2C/EvMpPBWTuqJZHDpYUV9rmXvZvgz7FYokAAbV4o00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZaZVjo2c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709636965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FOj+CTG3SczYt5053rYyt+wNtrjSgCNxcupvIafBB1I=;
	b=ZaZVjo2cMyDM2C0ltPfCThedLi8IfR1Zm11jaOPP3dW1r1+Ns+BiOIeSyo1UncRV1l2h1T
	MhTnrlKsnzMfQS0AGp9ufXbySKUkJxSx6AE0c0V3xW0zvbOPltUezZo5ZyeL+BejeYBNLH
	/L5/hYQuA5tBOCJxf3UIUQGBq+EvMjc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-4IfDmY3WOjWRA8jzMbgPeA-1; Tue,
 05 Mar 2024 06:09:21 -0500
X-MC-Unique: 4IfDmY3WOjWRA8jzMbgPeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2308A3C025B8;
	Tue,  5 Mar 2024 11:09:21 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAE6640735E9;
	Tue,  5 Mar 2024 11:09:18 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] kbuild: rpm-pkg: add dtb files in kernel rpm
Date: Tue,  5 Mar 2024 12:09:12 +0100
Message-ID: <20240305110915.184868-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Some architectures, like aarch64 ones, need a dtb file to configure the
hardware. The default dtb file can be preloaded from u-boot, but the final
and/or more complete dtb file needs to be able to be loaded later from
rootfs.

Add the possible dtb files to the kernel rpm and mimic Fedora shipping
process, storing the dtb files in the module directory. These dtb files
will be copied to /boot directory by the install scripts, but add fallback
just in case, checking if the content in /boot directory is correct.

Mark the files installed to /boot as %ghost to make sure they will be
removed when the package is uninstalled.

Tested with Fedora Rawhide (x86_64 and aarch64) with dnf and rpm tools.
In addition, fallback was also tested after modifying the install scripts.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 scripts/package/kernel.spec | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index c256b73cca3e..5c4c1ffcba6c 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -61,6 +61,9 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEAS
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
+if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ];then
+	%{make} %{makeflags} INSTALL_DTBS_PATH=%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb dtbs_install
+fi
 ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEASE}/build
 %if %{with_devel}
 %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
@@ -81,6 +84,14 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 		echo "%ghost /boot/${x}-%{KERNELRELEASE}"
 	done
 
+	if [ -d "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" ];then
+		echo "/lib/modules/%{KERNELRELEASE}/dtb"
+		for x in $(find "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" -name "*" \
+				-exec realpath --relative-to "%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb" {} \;); do
+			echo "%ghost /boot/dtb-%{KERNELRELEASE}/${x}"
+		done
+	fi
+
 	echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
 } > %{buildroot}/kernel.list
 
@@ -96,6 +107,12 @@ for file in vmlinuz System.map config; do
 		cp "/lib/modules/%{KERNELRELEASE}/${file}" "/boot/${file}-%{KERNELRELEASE}"
 	fi
 done
+if [ -d "/lib/modules/%{KERNELRELEASE}/dtb" ]; then
+	if ! diff -rq "/lib/modules/%{KERNELRELEASE}/dtb" "/boot/dtb-%{KERNELRELEASE}" &>/dev/null; then
+		rm -rf "/boot/dtb-%{KERNELRELEASE}"
+		cp -r "/lib/modules/%{KERNELRELEASE}/dtb" "/boot/dtb-%{KERNELRELEASE}"
+	fi
+fi
 if [ ! -e "/lib/modules/%{KERNELRELEASE}/modules.dep" ]; then
 	/usr/sbin/depmod %{KERNELRELEASE}
 fi
-- 
2.43.2


