Return-Path: <linux-kbuild+bounces-262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9EF805AAE
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 18:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B901E1F212AA
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Dec 2023 17:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890C36928C;
	Tue,  5 Dec 2023 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Klv1bDCr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA4669280;
	Tue,  5 Dec 2023 17:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35DBC433C7;
	Tue,  5 Dec 2023 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795970;
	bh=6SgvmhGkAC7ViFPJylFiTyaDn+gXFAjdcjaov4tn2dw=;
	h=From:Date:Subject:To:Cc:From;
	b=Klv1bDCrNMC09jDz9M17m8p16AcX3uPPWX03b3wpEiVuDJzRuMMaNXf8LHMeheV0W
	 ZYvOs+ShE8kwK64GrkZQD3AqvclIRAvTKBk3Mrc5NWArwbW1Hq3ePuHbQcwqD5o7ik
	 aeOMZwdm9VcMrP1CGD8NrdBqrv2+ZAp/ePENA5NCFRDiwSltpc1wp7PT9FoOhIITo1
	 UDGusZ3MpHrQcE1zyoumCdftUd9PFkglqU59LA9e5+wcz+9YnoS+1yU2W7xUM39PiT
	 0MvZqKzVyw2RiV3W0uk1jHP4quLo7yzrlB/hEqm0SMQjm77k/eJ2DIKe/NOLHL9C57
	 wnwMCB1qPH35w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Dec 2023 10:05:57 -0700
Subject: [PATCH] MAINTAINERS: Add scripts/clang-tools to Kbuild section
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-maintainers-kbuild-clang-tools-v1-1-a646a1985300@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHRYb2UC/x2NQQqDMBBFryKz7kCc2IC9SunC6FQH06RkbCmId
 +/g4i0ePP7fQbkKK9yaHSp/RaVkk/bSwLgMeWaUyRzIkW/JXfE1SN4Mropr/EiacEwW4lZKUux
 9CCF25KMjsJF35af8zoP74zj+wV2icHAAAAA=
To: masahiroy@kernel.org
Cc: nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
 justinstitt@google.com, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6SgvmhGkAC7ViFPJylFiTyaDn+gXFAjdcjaov4tn2dw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5EY395Qvqvrmx3e/LfbVqTcrHgneJpyelXvNaxp1i/
 fHkncuHOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEmDwYGc484NM1XMCz+rfp
 PobtBvkzz+esvH6kZjnXdu5PS9u8Nj9kZHgTPmndinxOhb3OIg4qIieqWlmdkl6GvFp9fPH1B6Z
 /z3MDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Masahiro has always applied scripts/clang-tools patches but it is not
included in the Kbuild section, so neither he nor linux-kbuild get cc'd
on patches that touch those files.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 788be9ab5b73..cd9bf44dc1b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11526,6 +11526,7 @@ F:	scripts/*vmlinux*
 F:	scripts/Kbuild*
 F:	scripts/Makefile*
 F:	scripts/basic/
+F:	scripts/clang-tools/
 F:	scripts/dummy-tools/
 F:	scripts/mk*
 F:	scripts/mod/

---
base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
change-id: 20231205-maintainers-kbuild-clang-tools-93666b423b02

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


