Return-Path: <linux-kbuild+bounces-8852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB9FB83760
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 10:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36860723A3A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 08:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6AD2FBDF3;
	Thu, 18 Sep 2025 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kABUX8p8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BC2FBDE0;
	Thu, 18 Sep 2025 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182832; cv=none; b=OIRryJbIVyaBsmhGpdTKuTdInKTN2AZNcrr21xSF4Fpi5IIFAruLXmHu6cgEyPchn3Q5rlmHo6pJ/L9UKXX9u6dL5VzMd4Ptzuy4BceUUbACaD5P8s6XwrYe2oWfGPmkjGQB5BJh74hq5DyZkknhFJ0twGgUDC8UtF6oBcSLHWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182832; c=relaxed/simple;
	bh=XBWJaxmtBirrXj8wv9G7xuKZMzhfTcfINGcpYJ1NhCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSlD3gyWPXyF7BsTht0fZ8lo4vC+zw+YC730Tf4I2siyP7fT0N7yT+sGigcIcYeaCbo/F0QdDlmTTBwRXyDm76p/ZJUyQIo9PNDu3dWKcbS7ZUCfPx7p47tpQ9nc1B17Zc0XMP4wbGFlxXu2b3wIua2PgLRfE/zr8TmdBkZcSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kABUX8p8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28F5C4CEF0;
	Thu, 18 Sep 2025 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758182832;
	bh=XBWJaxmtBirrXj8wv9G7xuKZMzhfTcfINGcpYJ1NhCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kABUX8p8dFSCjVuNXWjogazoqPzMU8S2jGvFrlVOwSG0FxAoZbVf9kIicNYPH8b1J
	 m7dYaNL3r0rxtgyZqZVDXQozgA/iTS1P+ONRSBzAiW3yXxSE/PKdYP2mszcfllnmE1
	 l/70ScsDSHqKr6r/lg3mQe+EvzjZt8YoTIj3Eyutp9NVXdpElj5RPJHl5VW9PYpcNf
	 n6kl5+K3PvQmAF1gEQgca9KKk8DFnzblHkB8/Y/Q5XsB/Oss0I5P5DZ0H2Rkn3Uc1q
	 OlEK84bE/0nKFen9h7TbhM3XanxfTy8Q/i7IL7DxiK2esAwaf/rqNo/0Z50Eoo10aM
	 6R/qGgwxiEsag==
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
Subject: [PATCH v8 5/8] scsi: Always define blogic_pci_tbl structure
Date: Thu, 18 Sep 2025 10:05:49 +0200
Message-ID: <fd8e30de07de79a4923ae967eaee5ba2f2fcef00.1758182101.git.legion@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758182101.git.legion@kernel.org>
References: <cover.1758182101.git.legion@kernel.org>
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
2.51.0


