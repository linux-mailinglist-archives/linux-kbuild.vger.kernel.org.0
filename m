Return-Path: <linux-kbuild+bounces-2000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC18FCDD9
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 14:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3351F27AEE
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 12:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1261D1CE1;
	Wed,  5 Jun 2024 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2SGETUY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF41D0EEF;
	Wed,  5 Jun 2024 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589169; cv=none; b=YTRsOtJKtx99IpDBWtbatSm9sCtCzGWJ/xC4zkuz8PDkQQnt8qiAjA5J1Y/5GJhB2Nsw0BG/OHh5BddPyQtNEb7xBv+O1/DJqrEO1kRR0wLrinIPkaVeOoAGY5/eLp17tyVfNVXyri8axFEvClUJ24nCOHpMnPZKtgtb3ngrN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589169; c=relaxed/simple;
	bh=hXdZSShDMwHYbGcpjQIkAqMxNxMIlbqclSd25LeJYIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czHpZtzvxl8DaeVy6neb3stZECux+vif+nqukKn3ExoqwX3goFWF+XbVxxeBISHelGQvIBNGpg0XbAo82PsVdWZcmp4iYonzpfQEozRJZ4sZo6HwF+X0zVhAsidb/yfNaZt+1h/kfJkjE3Ql49VRB8Tmex/H7lCCRGhSD6ApLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2SGETUY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE93C32786;
	Wed,  5 Jun 2024 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589168;
	bh=hXdZSShDMwHYbGcpjQIkAqMxNxMIlbqclSd25LeJYIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2SGETUY3fYmk9cGIH/SW2s/JIf+kcPpha02haARUNDi1fdam0QNCJmo0ggGfLWGB
	 zzUMRQy3XxU7gso3SZmY1HSREHBOvbDrEaFsmDn0lBdbxsm3v9TIFEZhdV9PsHbzLT
	 zWfK0HOJEb2dvc3gDJ1sk1CKz1AcZTm5PHDBvKKucqzoLUuhZx9J3pkAeboijrz4Oq
	 /i4EAX1Ld9t/SRMRetw50B0liJiaZm6+WcdpmRO1RN5cSfvtVEhv2W/HS9VIUMeS2M
	 T6G5Bpg2hI/ciTpzEXDVziyQUJcqUxB/5LgTQBrLdp5ptyXLSdQBQuT1/rmkthHaOK
	 l1AR2jqQDMrfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 8/8] kbuild: fix short log for AS in link-vmlinux.sh
Date: Wed,  5 Jun 2024 08:05:51 -0400
Message-ID: <20240605120554.2968012-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120554.2968012-1-sashal@kernel.org>
References: <20240605120554.2968012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.218
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 3430f65d6130ccbc86f0ff45642eeb9e2032a600 ]

In convention, short logs print the output file, not the input file.

Let's change the suffix for 'AS' since it assembles *.S into *.o.

[Before]

  LD      .tmp_vmlinux.kallsyms1
  NM      .tmp_vmlinux.kallsyms1.syms
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
  NM      .tmp_vmlinux.kallsyms2.syms
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux

[After]

  LD      .tmp_vmlinux.kallsyms1
  NM      .tmp_vmlinux.kallsyms1.syms
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.o
  LD      .tmp_vmlinux.kallsyms2
  NM      .tmp_vmlinux.kallsyms2.syms
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.o
  LD      vmlinux

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 3a1ffd84eac28..bf534a323fddc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -213,7 +213,7 @@ kallsyms_step()
 	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
 	kallsyms ${kallsyms_vmlinux} ${kallsyms_S}
 
-	info AS ${kallsyms_S}
+	info AS ${kallsymso}
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
 	      -c -o ${kallsymso} ${kallsyms_S}
-- 
2.43.0


