Return-Path: <linux-kbuild+bounces-7279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840EAC4B22
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E0BB17C8C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FBF24DD13;
	Tue, 27 May 2025 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFm7Hz4D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C722688B;
	Tue, 27 May 2025 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336895; cv=none; b=PJqLiJ7aedAjPsWdBtTiAlrui6JReVlX1wO+0f7SMWtRe8GUI9pOS2Zn9KgoPu41bitawry2iRYxePt3IZlpHNh8BEchg5yDKfYPaWdIKs6FiroRC5oVdKuPNX6mVEm0S2/SrgCa++PKsRHWPU1s8VELS8Z9XHqcZqY8nP2otGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336895; c=relaxed/simple;
	bh=AzvE08+Vtmh2j/LN2k0JUwxxFHlnrEYfshug5ur5K8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecdMGX+zzQzvTUFZlRJXAhKdejkMdiMkLweLp7NoN96uGqNj9XF06rx9svV2Qu4geT7EgfIuywfK5Jd2Ph1dYjiu0yGIgegS9B/X4mXl1kRm1zbADnH/qcVNNt+4/NU13linjmw8SuLKnY6tmfTsuoS51a7O2fTFDbD+q+eQMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFm7Hz4D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A80CC4CEEE;
	Tue, 27 May 2025 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336894;
	bh=AzvE08+Vtmh2j/LN2k0JUwxxFHlnrEYfshug5ur5K8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tFm7Hz4DPlpdjUs6RTbnptqCYxl1IHBJ94qxCr7WjQD4lKFKrO3E9LckO5qUm/pIX
	 rvYktX0GyTyxnBU972YHpXP/7Z1z65K3R6aXM38W6sv9yW4P95Mm/TenFsfouFyNqB
	 0gaFX6K0YF9wBhZRc8ttIQU7Cbs/vsnlx4AIaZtfup368H47oIb6/f4gumePCvbUho
	 5CnSdD71cCqCZas83r7ztVcpBNdM0mi8yUka/SvnQfUavNb6iDCZOWLu+shXDFwcBm
	 16SjCtARnWII/Gxf7VZ+KvL+dZ90b5mwbcJ8SXZ1ekKC6qkjdsz3VJsnHCORG0CHob
	 kVzi5jetyiQNw==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
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
Subject: [PATCH v3 1/6] scsi: Define MODULE_DEVICE_TABLE only if necessary
Date: Tue, 27 May 2025 11:07:55 +0200
Message-ID: <628e85f1b7e9d0423a8b83ac3150b3e151c9c4e3.1748335606.git.legion@kernel.org>
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

Define MODULE_DEVICE_TABLE only if a structure is defined for it.

drivers/scsi/BusLogic.c:3735:26: error: use of undeclared identifier 'blogic_pci_tbl'
 3735 | MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);

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


