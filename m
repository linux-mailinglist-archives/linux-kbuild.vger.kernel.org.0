Return-Path: <linux-kbuild+bounces-7289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0DAC4F7A
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 15:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E6917AA2EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B705F26A08C;
	Tue, 27 May 2025 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhvOlfHu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887B1192D87;
	Tue, 27 May 2025 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351820; cv=none; b=TFo8lAWGEiF75s5hUS38PuFt0Hi59omm9aswxGVV5dL4M2N9aXUrTbzujx4ydOJvjnNqOrUeHS7Jb8NVUTLeRVHl+ICjF/f4kpeT57g3VbcfsSP3js3S2lFvJoI9GFpPjmOJVLzEUmNCCb2ZpQ4dQegwtgig1FpfHeW+1ng9+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351820; c=relaxed/simple;
	bh=n/H8Wa7Ftb0H4j1QNhebHw57Ogax0FKs1fXVb4lhuj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRmsrITM+4CasV8IQivDSO1s0TIdmc/fxY8/6AW4UpYM/AidLuY6Id2ZJaiqJymvtJCy3z8kmX27wjq6XYuuaXkQ78ASWk1hTDOGlNRkE+l7qTr8+X5Gpv/SdmxXHxIEY2MxSJp29vuwpH5rBtsAMc5ikdPtOLnzT5ebE/UtObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhvOlfHu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0312C4CEE9;
	Tue, 27 May 2025 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748351820;
	bh=n/H8Wa7Ftb0H4j1QNhebHw57Ogax0FKs1fXVb4lhuj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhvOlfHun5eWDOutHEK8j3nc/KMUkcJkrhBYNOzh/fWupluJQqOw3m0iDqlrHeL47
	 2GkHK98Km3bB4Ew5ABQYgufA8eoUWV01ox21ePYM7KH4zXcppG19a2NWL6Sk5yr12d
	 mwlyJy4ek9R1cep8okRA2oNYKNGCradFPRRz2cBz0fNIo3x2zRLfKPM5Ut7cI+qjI6
	 0ROMPJNI6o2TGeDhKd5O85aOFVrxf9I1Ijvfda1eak3k6aSEUyrcdSVK4/hFdO9xzh
	 7b5F2P9IKpM7m8f8ZAsz/731rwQpHnCnfjjTNIfRXFQGcI3RULLceCKEuYPdK9ifYl
	 MJFdDRsnFrQDA==
From: Alexey Gladkov <legion@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v3 7/6] scsi: Always define MODULE_DEVICE_TABLE
Date: Tue, 27 May 2025 15:15:44 +0200
Message-ID: <20250527131544.63330-1-legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748335606.git.legion@kernel.org>
References: <cover.1748335606.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since MODULE_DEVICE_TABLE no longer depends on whether the module is
built separately or compiled into the kernel, it now makes sense to
always define DEVICE_TABLE. In this case, even if the module is in the
kernel, correct module.builtin.modaliases will be generated.

Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/scsi/BusLogic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 8ce2ac9293a3..08e12a3d6703 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3715,7 +3715,6 @@ static void __exit blogic_exit(void)
 
 __setup("BusLogic=", blogic_setup);
 
-#ifdef MODULE
 /*static const struct pci_device_id blogic_pci_tbl[] = {
 	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -3732,7 +3731,6 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{0, },
 };
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
-#endif
 
 module_init(blogic_init);
 module_exit(blogic_exit);
-- 
2.49.0


