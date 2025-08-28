Return-Path: <linux-kbuild+bounces-8645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD754B3AB86
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 754C45619EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 20:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEB029E10B;
	Thu, 28 Aug 2025 20:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U476Iymk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C82272E74
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Aug 2025 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756412304; cv=none; b=tDFEU+nlMv8mzw/Loz8ekKvAywduemmsWswxlmgPlzti7zghcv5eR2kYblHU3beZnmnkzw92yojEQvYLCouo2J7/Iqfx0RtHzv+DJj/i22K5rgMuhH/Bygm//mEjMzNNJTifxwnUSaUITX0ICcNuExHLihYzid2qGVorrmU0AKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756412304; c=relaxed/simple;
	bh=qg+3oIqG7mayJdAt5GbGzkJZY42jlTJTAwBrZ+wJjrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mbe2ILn2/DtDHw3un7NlKfVvkN3SQ09xSJJM6oLGkFZB9sDKTrJ4gXAYjnB67O3t2mgUZNTIDIuvuVyr5nQQ7jfixG8puQ51Q6F5OugQMGPtwxVQId+K7JzjBFmKX2tbkC6RKACNqxkvjoUwnbSSBHo0F551oyKJM05MkfC+FPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U476Iymk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756412299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NTA9IKDkp2Paf/SGLMLL4L71cM4DqP2Xed7l/lJLYX8=;
	b=U476Iymk5yVazYDFjPjWVZFUKehYXTevED0fAX+5i2gkmXiVh4RL3RJHohefdc5GoMcXFe
	sk/RxTH3OhPqP+C0uoY/JKGvsb7TdWImyBo4hZ06iQahZbaJCF3BGropGcbdskwgjUIl+0
	Y6HvyLsIBst/jcAIVMuq3Uq7Qm48xNQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-VeVuWJETMfOBNGtRDLvQTw-1; Thu,
 28 Aug 2025 16:18:16 -0400
X-MC-Unique: VeVuWJETMfOBNGtRDLvQTw-1
X-Mimecast-MFC-AGG-ID: VeVuWJETMfOBNGtRDLvQTw_1756412295
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 984BF1956048;
	Thu, 28 Aug 2025 20:18:15 +0000 (UTC)
Received: from dev64.com (unknown [10.64.240.107])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 91E5F3000198;
	Thu, 28 Aug 2025 20:18:13 +0000 (UTC)
From: Masatake YAMATO <yamato@redhat.com>
To: linux-kbuild@vger.kernel.org
Cc: yamato@redhat.com,
	ldv@strace.io,
	alex.williamson@redhat.com
Subject: [PATCH] vfio: show the name of IOMMU driver in /proc/$pid/fdinfo
Date: Fri, 29 Aug 2025 05:17:29 +0900
Message-ID: <20250828201729.3660771-1-yamato@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The ops of VFIO overlap:

  (include/uapi/linux/vfio.h)
  #define VFIO_DEVICE_GET_PCI_HOT_RESET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
  ...
  #define VFIO_MIG_GET_PRECOPY_INFO _IO(VFIO_TYPE, VFIO_BASE + 21)
  ...
  #define VFIO_IOMMU_DIRTY_PAGES             _IO(VFIO_TYPE, VFIO_BASE + 17)
  #define VFIO_IOMMU_SPAPR_TCE_GET_INFO	_IO(VFIO_TYPE, VFIO_BASE + 12)
  #define VFIO_EEH_PE_OP			_IO(VFIO_TYPE, VFIO_BASE + 21)
  #define VFIO_IOMMU_SPAPR_REGISTER_MEMORY	_IO(VFIO_TYPE, VFIO_BASE + 17)
  ...
  #define VFIO_IOMMU_SPAPR_TCE_REMOVE	_IO(VFIO_TYPE, VFIO_BASE + 20)

These overlapping makes strace decoding the ops and their arguments hard.
See also https://lists.strace.io/pipermail/strace-devel/2021-May/010561.html

This change adds "vfio-iommu-driver" field to /proc/$pid/fdinfo/$fd
where $fd opens /dev/vfio/vfio. The value of the field helps strace
decode the ops arguments.

The prototype version of strace based on this change works fine:
- https://lists.strace.io/pipermail/strace-devel/2021-August/010660.html
- https://lists.strace.io/pipermail/strace-devel/2021-August/010660.html

Cc: Dmitry V. Levin <ldv@strace.io>
Signed-off-by: Masatake YAMATO <yamato@redhat.com>
---
 drivers/vfio/container.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
index d53d08f16973..03677fda49de 100644
--- a/drivers/vfio/container.c
+++ b/drivers/vfio/container.c
@@ -11,6 +11,7 @@
 #include <linux/iommu.h>
 #include <linux/miscdevice.h>
 #include <linux/vfio.h>
+#include <linux/seq_file.h>
 #include <uapi/linux/vfio.h>
 
 #include "vfio.h"
@@ -384,12 +385,22 @@ static int vfio_fops_release(struct inode *inode, struct file *filep)
 	return 0;
 }
 
+static void vfio_fops_show_fdinfo(struct seq_file *m, struct file *filep)
+{
+	struct vfio_container *container = filep->private_data;
+	struct vfio_iommu_driver *driver = container->iommu_driver;
+
+	if (driver && driver->ops->name)
+		seq_printf(m, "vfio-iommu-driver:\t%s\n", driver->ops->name);
+}
+
 static const struct file_operations vfio_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vfio_fops_open,
 	.release	= vfio_fops_release,
 	.unlocked_ioctl	= vfio_fops_unl_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
+	.show_fdinfo    = vfio_fops_show_fdinfo,
 };
 
 struct vfio_container *vfio_container_from_file(struct file *file)
-- 
2.51.0


