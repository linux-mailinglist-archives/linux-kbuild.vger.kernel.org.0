Return-Path: <linux-kbuild+bounces-6754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6625A9DC31
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7A11691D3
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F3F25D530;
	Sat, 26 Apr 2025 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnMkIMv3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9825CC40;
	Sat, 26 Apr 2025 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684323; cv=none; b=S8oDLcRqw3t8dzUK+TtzAMi1A622UtQxIvJhtn5R+SqQOCrB+ifK8ABdtrz6PAb15m0+L25aLOZEnMgpjH0CMkQBlJwzQK4KMy9tK5/QKQZgsfueSORb9h2JPTFsrN4RHGyRBQs+vBFOtjSViNNBdWRhprlZ0WJvLmArfWiZryQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684323; c=relaxed/simple;
	bh=VyYtCy9B85P8thKXpYtDaf/ZX6+kr5jzyBf/yvSB39c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaPntw2LUrKS/BJaZLMJntw0zDRYR9fPXeEzh3hDraqcO5hs4wnDEDEuzI8BjF5jjtYLUil7YDvcZGd+NCGEMGP9k4jIYK6X9rPJ3ZTgNZtz8nrJWibbezvigbIIfLJ4PdvdXG+HCutB/2HYfTCCbwBLhhhSEtKgI3jax0D1zcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnMkIMv3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849AFC4CEEB;
	Sat, 26 Apr 2025 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684320;
	bh=VyYtCy9B85P8thKXpYtDaf/ZX6+kr5jzyBf/yvSB39c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnMkIMv3ji79gfO2IbB4tRqGZbyr4ZC+4oZd01WU0YpHbF2D4w9G865Vn2mZFspGc
	 zXU7FtCHELBjMQ4xxUrNMDXyUCZs3xxPsBgybQ2kP/U5XV16eAftBCc5DFWoSGBUkx
	 cH2BbZXAaGkKYN615tK52lcsZ9FLE32iiIda9gFww7mKJDcd+2sSomfFBBsC5y0RSj
	 rtxCm8Pc+2J52YA7UsH4ieIUH6mxiR6e/w/kN9zVs8ZSnp7ZxeaeN7aCwA1l7UkGoe
	 wBUUK61gUmYkKe7SsGYFmlaTizh6U2X/ZlR2o5zG2mVlciVFzUItOtzpdXrzu8+IOi
	 y2aFulYy4fFQg==
From: Alexey Gladkov <legion@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Khalid Aziz <khalid@gonehiking.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v1 2/7] scsi: Define MODULE_DEVICE_TABLE only if necessary
Date: Sat, 26 Apr 2025 18:16:33 +0200
Message-ID: <1fa1e0f73501456e56c5fe52bacaee5ca51a6973.1745591072.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define MODULE_DEVICE_TABLE only if a structure is defined for it.

drivers/scsi/BusLogic.c:3735:26: error: use of undeclared identifier 'blogic_pci_tbl'
 3735 | MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
      |                          ^
1 error generated.

Fixes: 1079a2d251f2 ("[SCSI] BusLogic: stop using check_region")
Cc: Khalid Aziz <khalid@gonehiking.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/scsi/BusLogic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 1f100270cd38..8ce2ac9293a3 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3731,8 +3731,8 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
+#endif
 
 module_init(blogic_init);
 module_exit(blogic_exit);
-- 
2.49.0


