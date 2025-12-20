Return-Path: <linux-kbuild+bounces-10307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A6CD2F2D
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 13:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23B4B3001806
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 12:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D254429E11B;
	Sat, 20 Dec 2025 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ntx9tSNP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1087A2C0266;
	Sat, 20 Dec 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766235296; cv=none; b=tqET/hKFGKOhidGhtN3Xv+f2DFrOjnHfU35J+3n4W7VFQouB/eZQU6mZsk0Yt4w3tjNFfZ5BAyJGBLdkyhmyMrmXVnSoYnvmpITxiekrl1Vv22P7/0GHN08guOhv/Vbxkcy5rJcTFJIELJ9XEVbINykIZb+L/UwHTXjv3wwIn6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766235296; c=relaxed/simple;
	bh=ewbZI7Gn1O2V41p5mG1GjYt88CKEW/lrlYaWLPkOyrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rY+hVLdj8y43ekXyAyKa3PzvGP1S/iUjN3csbwQmm8urPKsiVgDAE8DpJ1MhYtax2wXh0ZplpeyXBGDOCwrtPx7rWQY/5kA9h9xyP77Xaa8LlJO3jNDTu4AxyUxSZUFFS3q94yj1VG5evL0W+bkk3VO5V6BflFZfBUZtLOs/K3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ntx9tSNP; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766235284; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=guR21CmAnjrQcPDa1q+0Tk1rmlP1GIsJInsWBMa2ypA=;
	b=Ntx9tSNPVJUKffvFy7c3Z6bi+uJF+FinfXr1mwopF+QiL0aXTzbIOmVr6588RXXzDUFHZ277vb5VTAH/280o4SDCGLQyS+oS5kT1Ru8YlAWgkqh6ptnBKBUn/qoqHZj4vScWRjD88Cn9HRtH0SC35HxCDiL9WMRfof9rBHrYih8=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WvG8yIX_1766235279 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 20 Dec 2025 20:54:44 +0800
From: cp0613@linux.alibaba.com
To: nathan@kernel.org,
	nsc@kernel.org,
	corbet@lwn.net
Cc: linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] docs: kbuild: Fix typos in makefiles.rst
Date: Sat, 20 Dec 2025 20:54:34 +0800
Message-ID: <20251220125434.2430-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Pei <cp0613@linux.alibaba.com>

The correct command to generate header files is
make headers_install.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 Documentation/kbuild/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 8aef3650c1f3..24a4708d26e8 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1264,7 +1264,7 @@ Add prerequisites to archheaders
 --------------------------------
 
 The archheaders: rule is used to generate header files that
-may be installed into user space by ``make header_install``.
+may be installed into user space by ``make headers_install``.
 
 It is run before ``make archprepare`` when run on the
 architecture itself.
-- 
2.50.1


