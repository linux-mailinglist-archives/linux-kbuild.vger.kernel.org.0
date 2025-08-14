Return-Path: <linux-kbuild+bounces-8462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E498B26661
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77263188A111
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A143019A7;
	Thu, 14 Aug 2025 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uA2e5TOV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377D301010;
	Thu, 14 Aug 2025 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176888; cv=none; b=Ffc8RJXD/Fnv6zwWlxaHCDFytBGF9n33+2a/w4QZxQVwcfZ7TeFJJRZNooabxpgF9l0yZ1zpY/lpnofhmci8PXJzaG/wjByWX2b9LtKzSoYh1fushpnMwhNdUx3qaF3N6YKONgbFaCB3anHtCnkJl5gTYjebDzH+p8aqyW/lPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176888; c=relaxed/simple;
	bh=7VIlza3DFZd9t15O6Mnto/RGJe+xCXiRNcV7zBDq5AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6/JWMN3ZPPuJokLCd9B4momPWChDzJEP7epvWhVrGDST9c2PEaF8qIF5IdvUaPuJjibSr4M+U/wNvMXqjWKcj0XCofFjLt4u+MZ1uf5lNethhIg4BRqNC9Q8FtJLaSA4FnOIRwd8YiDpFTvjQP2rszVdB7TQ3z9IfL4ebIwpFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uA2e5TOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C94C19423;
	Thu, 14 Aug 2025 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176887;
	bh=7VIlza3DFZd9t15O6Mnto/RGJe+xCXiRNcV7zBDq5AU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uA2e5TOVfhtF17EBnkfEGXxo9CS51/8+GK4605OKP/tMlY3Kxb3TT5OgOeNTHWVlE
	 AYeEAJqxUQu4Skql5POGhkjtRQPMZaCGhzKhw+fSpWLtJBaLhsRf3Ywhwj5frV7Bu4
	 coTqkjyeYfQjy+QHHf3PgIB8yphiGnHCbnR82pR+IGbF5dt4gOSN9RFxWyvRMSHxo3
	 U3+xyL4QMqm2mQefDWCQbBnOa/wwoa3wIqjDYO82BZHP7z/gumgiRKhFJkKHayVVRG
	 2johg/FXlh9FoE0eXfF4qotrGiEQAVgp49RJAGw/8ET5+GEhR7q+DKbyskTyghslnK
	 b1kCUEt/eU3rA==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
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
Subject: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
Date: Thu, 14 Aug 2025 15:07:12 +0200
Message-ID: <93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755170493.git.legion@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
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
index 1f100270cd38..82597bd96525 100644
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


