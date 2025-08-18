Return-Path: <linux-kbuild+bounces-8507-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA391B2AEAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 18:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57411564EE1
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 16:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62ECE3469F7;
	Mon, 18 Aug 2025 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB0Bvjmw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365333469EF;
	Mon, 18 Aug 2025 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536292; cv=none; b=hjsblqr/NEVEQX/qajf9uOJFMRck2CBawO3fl9eRokZZbLuLYeealCwQ9R/gbkrrBRyPk1U9b8EshCpPqRQtR8/90D/DXexdaozJmsIEThmiQfN3M1rrlvRDWTs+iGn+NXmV7824lpQsPlb4ht0BavNPi25r7ANzmxaRLnw1Eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536292; c=relaxed/simple;
	bh=N3he803lkE5a/WNpLfB7Z/3AuPDutheUOCNc37uUFKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SG4kmQjUaMiVJl5NYFngg2gbOXFOJq1RFreDfffQu1d0TZxD5eVT86x1ze8KMNjN8kOw4dqiK9JuHsNNDwmrMeKz3W4x0yf4CBBtaYHVxpI3z5P6Ve0kXQ8+JBZWlI0WY8ZoR4cLNfe0qgBL9T/OERBEnPqFnf8khSylBNfO+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB0Bvjmw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D6FC113D0;
	Mon, 18 Aug 2025 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536291;
	bh=N3he803lkE5a/WNpLfB7Z/3AuPDutheUOCNc37uUFKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XB0BvjmwYwuuNBOFvJcH222wgkemudU3ZawpDhJgD4nLk6yihDQcBtaCQTM6Fhl1p
	 RY9mrsBS5PmLK8wX955St5/Y1JPDJGPlWf1anIUDBOYJblUix1BmC6etzM3kJsFeVm
	 LYmalkM26zAkGgEWCQiIs41b0SE1+3lLtdaVMRnzaxbXrTUR7PHY5IudCTr/Y5m/JG
	 zfwE5uGBCOLiNYMjL1XPbpsSe+Heb+BToSpAztLugyk7zxWf547OZNxUSfSfUpoaCj
	 ADZYeqi6Z9NpUVJ5PTKWJxhmV/1sh3dc4rgvi9d58AvBwu7+4A2A5SOPiKzvuckLSn
	 R1Txez/o8kXBw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v7 5/8] scsi: Always define blogic_pci_tbl structure
Date: Mon, 18 Aug 2025 18:54:59 +0200
Message-ID: <fd9fcffb2f099bc4358ba6f1b25cb4f649fc7d34.1755535876.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755535876.git.legion@kernel.org>
References: <cover.1755535876.git.legion@kernel.org>
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

To avoid warnings when -Wunused-const-variable option is used, mark it
as __maybe_unused for such configuration.

Cc: Khalid Aziz <khalid@gonehiking.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/BusLogic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 1f100270cd385..82597bd96525b 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3715,7 +3715,6 @@ static void __exit blogic_exit(void)
 
 __setup("BusLogic=", blogic_setup);
 
-#ifdef MODULE
 /*static const struct pci_device_id blogic_pci_tbl[] = {
 	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -3725,13 +3724,12 @@ __setup("BusLogic=", blogic_setup);
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{ }
 };*/
-static const struct pci_device_id blogic_pci_tbl[] = {
+static const struct pci_device_id blogic_pci_tbl[] __maybe_unused = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER)},
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER_NC)},
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
 
 module_init(blogic_init);
-- 
2.50.1


