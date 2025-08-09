Return-Path: <linux-kbuild+bounces-8328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFCB1F486
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Aug 2025 14:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85262623710
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Aug 2025 12:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9451275846;
	Sat,  9 Aug 2025 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q+9ier22"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8271BD035
	for <linux-kbuild@vger.kernel.org>; Sat,  9 Aug 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754741161; cv=none; b=s//0F4kLqNFz631BgY3FU8FVL4Ix8qeuRf3rUhcwhRks5STSKXJZILhouZqxXlYD9iLcn82eNerABP/4b+pYrL74yu+agi1Ug4HERVMWL+1eA/FX/Cu1PWT9f7Zwjz2DZr6+cICXwHxO+q6Hi9YM9ByQuZpmrw0SSVBUHtDZ3hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754741161; c=relaxed/simple;
	bh=Ibx9Bltnvn86+Mffl7e+s176pcBn4D82Z7YerShOWBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C04Ax4us4HCENKkfWihUCYqWyqzf7mkCG83QWRH5oMsieO3mlvs7iqaBwhrTHtmu/F3KL6wjXMFelGwkUvoIkuCKwlRUvSpxu8yowzcixYYxHGRJF7v7JCzp4wYqJVmomrNZp3DfnUpxaW6K2tuhNmwGqw8QaGIb2SsufM2VCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q+9ier22; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4K
	oFYVJlbu0CVVqOvGvUZRGS5uUL7FqL1hRsqc0+7RU=; b=Q+9ier22nkSc9AWN2+
	50edmeYK2qe/eE0JpSpUM13CjnZ40hg6vmCOnskyeYYFmGRneHma4jsU3jyG6/dy
	3Cb5wuUbxNK/2vC6g59BiXBFoc1iv2xTRcoi4ldKk/YYP2owD3kAsE8MVbLZLtJi
	qDq8iNiZIL9iv9kUAUEoZs9xc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBX6h5bOZdoY2wVAg--.54271S2;
	Sat, 09 Aug 2025 20:04:44 +0800 (CST)
From: "longguang.yue" <bigclouds@163.com>
To: linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org,
	nicolas.schier@linux.dev,
	masahiroy@kernel.org,
	"longguang.yue" <bigclouds@163.com>
Subject: [PATCH] Makefile: mrproper deletes signing_key.x509
Date: Sat,  9 Aug 2025 20:04:05 +0800
Message-Id: <20250809120405.22957-1-bigclouds@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBX6h5bOZdoY2wVAg--.54271S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRZku7DUUUU
X-CM-SenderInfo: peljuzprxg2qqrwthudrp/1tbioBCkQ2iXLEzFaAAAsl

deletes temporary signing_key.x509 and reserves user-defined x509.genkey

Signed-off-by: longguang.yue <bigclouds@163.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 37e37565515e..7ad2679fa1ab 100644
--- a/Makefile
+++ b/Makefile
@@ -1589,7 +1589,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  .config .config.old .version \
 		  Module.symvers \
 		  certs/signing_key.pem \
-		  certs/x509.genkey \
+		  certs/signing_key.x509 \
 		  vmlinux-gdb.py \
 		  rpmbuild \
 		  rust/libmacros.so rust/libmacros.dylib
-- 
2.34.1


