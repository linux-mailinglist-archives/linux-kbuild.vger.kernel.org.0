Return-Path: <linux-kbuild+bounces-7294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E174FAC5081
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 16:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1B787AEA27
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 14:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4F3277806;
	Tue, 27 May 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkeFT7iW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B34253F3D;
	Tue, 27 May 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354804; cv=none; b=hWVQoeLqfvxU8o9eB8IOR1CCyjCNLw0J5KuRx4WoHqmzAhW0UO/ytqB6hmrKphmrWsk+/g+DJsoWDwK9Z24HJxZfoP8WNcmyMqGJG+0DKkYSDzY5e4/+RWw62LIfM7JYc0/z+2jx7dtmt31HHQ+RBVC6/Ab/UvDtAKPIAraJ5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354804; c=relaxed/simple;
	bh=cXATu5WHYSddNew6hPBjs/f3aIkMJ3j64KCP2miazbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CK35B81fNZzS0uKNx6xA9mftv/yKSkwpUwlx52x43BjkpSX5wnCOS8n72SYYtCTAWY1g389QG45Cflr/cXg9L0mTudg1ifT7UXA0hU/yVoufLA4EQWZPuQUyxqsWPyDjEBEnQ5DpRZ5fvNk07CIaPIcDlTvz8n15HKx+R2ghzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkeFT7iW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8331C4CEE9;
	Tue, 27 May 2025 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748354802;
	bh=cXATu5WHYSddNew6hPBjs/f3aIkMJ3j64KCP2miazbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkeFT7iW8HfmGs5YBA0pl5ucKIivrXEuZAtNoB4MNXAYf2gUKKzg88bCYwXGHYx92
	 GiWYdxtkJOoE+mxPSWU3r0YVnvKPw5vl769zaYv4CxRdRBz8a1Kor+oMNlVPRezhTo
	 PdERM0T/KJIRhiMVG8gsyZK51zeZXLSo5u365g4LNKo2U54cOz85lgFctGZGOD8WCK
	 K+GsQ+H3ZdPofxp4pU6AEAKY4pSS7rRYuzbIYvllhj4wo/x9vA00a6k3/6craqz0+Y
	 nJa/Frgr3fF7xLwKowxOMHjL3oTkJIGlqaYT6RrSjPwGFXLD1mYZO2pjVAIPtf7xr4
	 kalPgBtISkNWA==
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
Subject: [PATCH v4 1/6] scsi: Always define blogic_pci_tbl structure
Date: Tue, 27 May 2025 16:06:06 +0200
Message-ID: <20250527140606.68526-1-legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <628e85f1b7e9d0423a8b83ac3150b3e151c9c4e3.1748335606.git.legion@kernel.org>
References: <628e85f1b7e9d0423a8b83ac3150b3e151c9c4e3.1748335606.git.legion@kernel.org>
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


