Return-Path: <linux-kbuild+bounces-7604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D5AE2956
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F087616E6B0
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 13:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5595F21D5BC;
	Sat, 21 Jun 2025 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+8yleFK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2771872629;
	Sat, 21 Jun 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514271; cv=none; b=un24a+YmXYrI4cQw7GXUPrjZ/MmDCGIUbNFdhO43Bla+H4yQ0sW26VKYBD+h3WpyjthZW1pjEX9T2OvLF0PqpBtybJDhE8mt+e6YVRgjPsjVILwFc3qxZB0pG2GrSKUJvEqgC8lhWwnV0VHkijhekzVdm59yJckU92MFzWvCPEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514271; c=relaxed/simple;
	bh=cXATu5WHYSddNew6hPBjs/f3aIkMJ3j64KCP2miazbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx05LO84E8r+BoOTcuB8sBVpEEtXrFLD179gKtOOsvW3ZYxX0GjYew7gY3FBIQi1nFhfWRV+DJJoxdb93FY8IftZCBiL/8bouzjj85mOGJ8sHcV2XuvWR4UTDkTsmnJlqHk1gcR1i/GtdjADMUkU5Kbk6iw+VQHUKtH9DumCS2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+8yleFK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E3EC4CEE7;
	Sat, 21 Jun 2025 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514270;
	bh=cXATu5WHYSddNew6hPBjs/f3aIkMJ3j64KCP2miazbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+8yleFKIaGU88WKWjhroLJO29zQe1UJsd7OK4BWcOQ76RyyB2WvJWx6HJ/D6b4CA
	 zt0W7OHPa7lAAxEUqSqlWd205M2n3y+hsyZxybjvGp1+6SzZDl8pB+kA1cjDdRrhDG
	 D5K2mIgrzr3u/1oQU+5RWJ4E6DOtcgZ83LDdcVAuLlM5kE4/suIAw6GDGDkm4Nn1We
	 p+/96D0zAdMqc0jsjsfBYNJdirLRhpDe3fZKBRxx8e5nas4QZLrfghDrhHb0/nVdyu
	 CP/jfx12iQQ/dWLNc7a5Y8Nbq5qJxyJfIVdmy7ztXwtuAzA9ufS+RDR9yG77QUzKdH
	 9CbbNhzXftjYw==
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
	linux-scsi@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH v4 5/7] scsi: Always define blogic_pci_tbl structure
Date: Sat, 21 Jun 2025 15:57:17 +0200
Message-ID: <e9225a5e06b2590ff73ef7b7355e3163517c900a.1750511018.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750511018.git.legion@kernel.org>
References: <cover.1750511018.git.legion@kernel.org>
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
2.49.0


