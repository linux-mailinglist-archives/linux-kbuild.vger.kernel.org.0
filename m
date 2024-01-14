Return-Path: <linux-kbuild+bounces-553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CED82CFF7
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jan 2024 09:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5495628241E
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jan 2024 08:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7F11FA3;
	Sun, 14 Jan 2024 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTq45+E8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BE186B
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Jan 2024 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705219651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffLmMyOaklOqYbWQCeCLRdG1Ympe93V9wLE3GPAo5oQ=;
	b=iTq45+E85f6fOQ+vOUKMxBUPMiyrLartwVTFrlH5kbiSYrxsHUFmcuJRtHPbxho3O2+T2t
	b2tRF3en8CDPQoTO95ec1nM8FsXfevc1iQdl3/Ky+lWUA0GZxEQiuGMru5I+uFYTTZJrZr
	iSPhDu+k84x47zMIBe0hshwtYSZV8vU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-TTVYK9QGOK6liqwc9JxW7w-1; Sun, 14 Jan 2024 03:07:26 -0500
X-MC-Unique: TTVYK9QGOK6liqwc9JxW7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B3E683B7EF;
	Sun, 14 Jan 2024 08:07:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 702331C066AE;
	Sun, 14 Jan 2024 08:07:23 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: masahiroy@kernel.org
Cc: dcavalca@meta.com,
	jtornosm@redhat.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	nicolas@fjasle.eu,
	stable@vger.kernel.org
Subject: [PATCH V5 2/2] rpm-pkg: avoid install/remove the running kernel
Date: Sun, 14 Jan 2024 09:07:11 +0100
Message-ID: <20240114080711.5109-1-jtornosm@redhat.com>
In-Reply-To: <CAK7LNAR_wgQBs-q9NH1icb_FPBoVMNEhQpvV8qzH2dFsrDS0pQ@mail.gmail.com>
References: <CAK7LNAR_wgQBs-q9NH1icb_FPBoVMNEhQpvV8qzH2dFsrDS0pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Normally, upper tools and scripts are checking if we want to modify the
running kernel but not always. Check install and remove operation that
affect the running kernel to avoid possible issues.

Tested with Fedora 38, Fedora 39, RHEL 9, Oracle Linux 9.3,
openSUSE Tumbleweed and openMandrive ROME, using dnf/zypper and rpm tools.

cc: stable@vger.kernel.org
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 scripts/package/kernel.spec | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 74542af8cbfe..216514cbf5f6 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -69,6 +69,12 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 %clean
 rm -rf %{buildroot}
 
+%pre
+if [ $(uname -r) == %{KERNELRELEASE} ];then
+echo "same kernel release is running" > /dev/stderr
+exit 1
+fi
+
 %post
 if [ -x /usr/bin/kernel-install ]; then
 /usr/bin/kernel-install add %{KERNELRELEASE} /lib/modules/%{KERNELRELEASE}/vmlinuz
@@ -85,6 +91,10 @@ fi
 done
 
 %preun
+if [ $(uname -r) == %{KERNELRELEASE} ];then
+echo "same kernel release is running" > /dev/stderr
+exit 1
+fi
 if [ -x /sbin/new-kernel-pkg ]; then
 new-kernel-pkg --remove %{KERNELRELEASE} --rminitrd --initrdfile=/boot/initramfs-%{KERNELRELEASE}.img
 elif [ -x /usr/bin/kernel-install ]; then
-- 
2.43.0


