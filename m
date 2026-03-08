Return-Path: <linux-kbuild+bounces-11647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBrHEav+rGnnwwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11647-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 05:44:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE522E7D6
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 05:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77ADB301092D
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 04:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6C61531C1;
	Sun,  8 Mar 2026 04:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEiPsGH4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB330E838
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Mar 2026 04:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945050; cv=none; b=GpESJc9Y/XGbt+mI7xNBotVuADLB2xZcpfHfBRnG5gGbom6JNGq9/ZwrfL0+qnpH1uDvZnR7BaW8/axqH8scsYz7VKmijcdf3Tc3e1QRjC3czParVB4UuTN2O5yzhyIgk2gTLphkiApP+wdm7Src0NjhnQGkkuVkMTKrhmJohbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945050; c=relaxed/simple;
	bh=BEPY31XRopedaqNS7+wBx1nQfYh0wICaNLCuQ20sGnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmKyF+zpHnGwFGs3BlmJl0txitNjDw0BtoStmRSrQ4B4JbA41QmrUmXAGAjiKNR9aTl7wF6ksYNdGzZCHDLqHwlO08FTWTv2u1mJHhjf3W5yFMaOnE659ZlOerK2wWbronguDcVkBDQ7xxrT72RKbe1zEsN81/a2pW+KDIyt8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEiPsGH4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772945048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/tzKUblCF0tURXVep2oartxcy+yFAJCSL7GUTKu5zcA=;
	b=jEiPsGH4riJeGyyhLwrTyRj37mSwvL069TGoJZuubK1MH5NA2NpYGJeubLlRxFzf8uOUaj
	NPj/Jwg3lbDYhl8EMfuG7eTowwBj5et9yxVbaxrW5E8aMvifa1fMjt7Ztw9kUeS7DYISW/
	iyDOfY18O53ictrA51CZzFPlCh7+7sk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-MYFZZZJDPJqpiC_0NNJUBg-1; Sat,
 07 Mar 2026 23:44:03 -0500
X-MC-Unique: MYFZZZJDPJqpiC_0NNJUBg-1
X-Mimecast-MFC-AGG-ID: MYFZZZJDPJqpiC_0NNJUBg_1772945041
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91D1E1956089;
	Sun,  8 Mar 2026 04:44:01 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.2.16.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1E4DB30001BE;
	Sun,  8 Mar 2026 04:43:59 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] Delete .builtin-dtbs.S when running make clean
Date: Sat,  7 Mar 2026 23:43:30 -0500
Message-ID: <20260308044338.181403-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Queue-Id: 33BE522E7D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11647-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cmirabil@redhat.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[o.map:url]
X-Rspamd-Action: no action

The makefile tries to delete a file named ".builtin-dtb.S" but the file
created by scripts/Makefile.vmlinux is actually called ".builtin-dtbs.S".

Fixes: 654102df2ac2a ("kbuild: add generic support for built-in boot DTBs")
Cc: stable@vger.kernel.org

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d763c2c75cdbf..4d2a9d938f713 100644
--- a/Makefile
+++ b/Makefile
@@ -1578,7 +1578,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
-               .builtin-dtbs-list .builtin-dtb.S
+               .builtin-dtbs-list .builtin-dtbs.S
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
-- 
2.53.0


