Return-Path: <linux-kbuild+bounces-8130-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C0B10C09
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C35A5A4C80
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1541C2E2652;
	Thu, 24 Jul 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moaa3z5j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE72E175F;
	Thu, 24 Jul 2025 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365023; cv=none; b=ic/eUPSO4LZ7NnuFi3GcPNgBv2COWKub89GlwF1qGdbBYzH4/DN6RcnYp98CM7+o3gJNtOxyBIZILttXfbkoZK3dNTr72LBLMALPTXXq+hXMaOb5CV708HghYGnMsZqW3nL+aRxnOFc4hxyzEm3zQ+scYizG0frlNrWk/a1JG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365023; c=relaxed/simple;
	bh=9uoPb133GCaKetRWqdjQUMfYOCdH8EWDfhbgoqCMV1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGEnK42D/pLab1YjYWBplyMaWFA3M1q/rb61qT80bS3gr/KiwZHBATCCLYtG/ba1Gi73Z0AxEoQ3OLwx393WdOKvXOgxGQQiXYkx6E7DbWzIXuxVHfN5zv5JQtE18Gc1gQpYafBlu/KaKQAwEHaz6+6Eybs5smzN08PR8/wT6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moaa3z5j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2FCC4CEF7;
	Thu, 24 Jul 2025 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365022;
	bh=9uoPb133GCaKetRWqdjQUMfYOCdH8EWDfhbgoqCMV1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=moaa3z5jyK7uTq41wwmcZXVwkOCVfOiLXzuBa3KTbS15p5ahG5JKRRV0yPA67u+hg
	 pLZBMzNl0xBIzq3BD/CKk9pbwXwOscQ1xpI1uA38zkJ8hZlnuPakqPfiI9moFRTnAZ
	 eHH3864VAUutwr/UJcBJSKd7iTZHmiIBnMV0aEfFbr4YSTzWLxW1ookmjU9Bv7NKeH
	 azx+pPiqiheOIDz2ZAhd7Ao9SjF8Ikvaa0lecV2y45mRjjmnBJ7CwZ9S6SX6/CtORJ
	 +uBgwl7RBAabniACPqJalZXRXdhH4EGalWusaPOoIidhwsihCJF9v3DpELwx7PnQFq
	 KZqynNLB6RZMA==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH v5 05/10] scsi: Always define blogic_pci_tbl structure
Date: Thu, 24 Jul 2025 15:49:42 +0200
Message-ID: <efa2ef9ec8b1935d5593914abb2329f4bb0ab064.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blogic_pci_tbl structure is used by the MODULE_DEVICE_TABLE macro.
There is no longer a need to protect it with the MODULE condition, since
this no longer causes the compiler to warn about an unused variable.

Cc: Khalid Aziz <khalid@gonehiking.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/scsi/BusLogic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 1f100270cd38..08e12a3d6703 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3715,7 +3715,6 @@ static void __exit blogic_exit(void)
 
 __setup("BusLogic=", blogic_setup);
 
-#ifdef MODULE
 /*static const struct pci_device_id blogic_pci_tbl[] = {
 	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -3731,7 +3730,6 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
 
 module_init(blogic_init);
-- 
2.50.1


