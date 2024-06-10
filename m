Return-Path: <linux-kbuild+bounces-2053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3C9026DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 18:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BCC281E4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 16:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24946144D19;
	Mon, 10 Jun 2024 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0Hr2vM1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A76114387E
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Jun 2024 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718037549; cv=none; b=vE4cyO4r9CvDyAGmzkSfyyfOf7OFAKwy8J9B4HGfkME6jtpPrUJ+ns6LSRVKT2PBjhkZz7ZsbFy3bh2fh0ltqsWBQEUWc6HzMCQgKW2lFEZloVy8e1E7ermBEiQeQzQzVIv1ocNoK4CA7LePV0ZXoJP74isn90QDW2ydMRg20oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718037549; c=relaxed/simple;
	bh=dN+77p+j/b8iZSyHVlGXH1wUBYhYLJsCm7Lq8sxSecA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBIt/qdg8T4kCgROxMID44YTbvYvGAgwdxDNX8m4osbS2fyiBluL8aI185SecjYODoqOBLpkzRkyNwcvUPil6yr0Ptm33B6ShtC34fit7VNu76bl9a9c3e0WUwDy7x2n3lUI24G/DE0h1FIkx/PxBcOZc7AUVTL1ukca1foeNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0Hr2vM1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718037546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cs2+zpw7zAO4JC3ZJJkARQKdcaav8qsg47LwqLONWbc=;
	b=F0Hr2vM1be5M3wnbM5yK6GBDU4OwTpZ220NnvdYs/Vxcbr18FZD8r2X83vrQjBWyMFOnoI
	lpVerXP1CeRA/wXsl7MQH3m6JaC8ITqp2gSebcqDrgumpBcAvV/s3lZTBIytMHlwe3f8Lb
	1jYr/IzYjEtdauhnUufT/S8I/o1p6WQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-JCJm8Pe4PTGh1Mp4o2xrng-1; Mon,
 10 Jun 2024 12:39:03 -0400
X-MC-Unique: JCJm8Pe4PTGh1Mp4o2xrng-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A67D19560BA;
	Mon, 10 Jun 2024 16:39:01 +0000 (UTC)
Received: from optiplex-lnx.redhat.com (unknown [10.22.17.224])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3FB8319560B0;
	Mon, 10 Jun 2024 16:38:59 +0000 (UTC)
From: Rafael Aquini <aquini@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: rpm-pkg: fix rpmbuild warnings for kernel.spec
Date: Mon, 10 Jun 2024 12:38:56 -0400
Message-ID: <20240610163856.693110-1-aquini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Newer revisions of rpmbuild are throwing warnings about the current
kernel.spec template having an unversioned kernel-headers in the
'Obsoletes:' field and not being able to source the epoch's date from
the spec's missing '%changelog' section:

  $ make srcrpm-pkg
    UPD     include/config/kernel.release
    GEN     rpmbuild/SPECS/kernel.spec
    UPD     .tmp_HEAD
    ARCHIVE linux.tar.gz
  rpmbuild -bs rpmbuild/SPECS/kernel.spec --define='_topdir /mnt/nfs/work/kernel/linux/rpmbuild'
  warning: line 34: It's not recommended to have unversioned Obsoletes: Obsoletes: kernel-headers
  warning: source_date_epoch_from_changelog set but %changelog is missing
  Wrote: /mnt/nfs/work/kernel/linux/rpmbuild/SRPMS/kernel-6.10.0_rc3-1.src.rpm

  RPM build warnings:
      line 34: It's not recommended to have unversioned Obsoletes: Obsoletes: kernel-headers
      source_date_epoch_from_changelog set but %changelog is missing

This patch addresses both RPM build warnings.

Signed-off-by: Rafael Aquini <aquini@redhat.com>
---
 scripts/package/kernel.spec | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index e095eb1e290e..4d58b29c03ad 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -1,3 +1,5 @@
+%global source_date_epoch_from_changelog 0
+
 # _arch is undefined if /usr/lib/rpm/platform/*/macros was not included.
 %{!?_arch: %define _arch dummy}
 %{!?make: %define make make}
@@ -27,7 +29,7 @@ The Linux Kernel, the operating system core itself
 %package headers
 Summary: Header files for the Linux kernel for use by glibc
 Group: Development/System
-Obsoletes: kernel-headers
+Obsoletes: kernel-headers < %{version}
 Provides: kernel-headers = %{version}
 %description headers
 Kernel-headers includes the C header files that specify the interface
-- 
2.45.1


