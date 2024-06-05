Return-Path: <linux-kbuild+bounces-1995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4278FCCE6
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 14:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766AB1C23A5D
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 12:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1123B1A01C7;
	Wed,  5 Jun 2024 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyjU5UXs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA62199258;
	Wed,  5 Jun 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588968; cv=none; b=QvsgoGP862LARqpidLlQ1aOs3DP8DU60+q8AnbcNRej4hcPSQKT4D+eR6mz8ZkBaeFHU8lMBZHTAvasHs9eaKxNcHixfBwqaNbE28BJic+1oro/RfYm9DAAt47YBq7avomKhiaaFQ9k5B0KbDR6a2IvZygK3hcIy1ugY+eFJ4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588968; c=relaxed/simple;
	bh=75mwtd+1CNCKWFDAvfqi5xcQqvMCply+b+85p3C7MM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYySlkbb4K/6GrZ0mAuOJRC4PuekmC6m/FfqTqVicvLd42rMWdSN1YlBMqy0EzsshDUEw3h4c6KD5J/6VJIsAdhmre31pmOfBfbNaDtRM8Ee5IzAaAKT50wrpnz4q3ix0nRerz95kGeJcmJUIR20Hs27mcRYntPyMkxn96kgpCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyjU5UXs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1A8C32781;
	Wed,  5 Jun 2024 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588967;
	bh=75mwtd+1CNCKWFDAvfqi5xcQqvMCply+b+85p3C7MM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyjU5UXsrI7F6rOMVNWA0tIyqngQPIGJCg5a2LA2nyqZgbrCAa9DP427m7T1+GLKE
	 V1BrnccslZNFxqBp5MLiIyOrZOGfxvr8CbxmFBmz9LHd2axRe/0RcT3oVs+ya+Qg8u
	 UOIkhwzwNts1FjZF9xaueFk42k7f7q2IDO/rXyUNydjJY19YdObw3R7NG4+CAOp9NI
	 qtv2anXVlJYdhnMexTNu5vUvCl5bgziwJyKBA8w77OnzHov0T0N/Jkmv15DHgV9jPr
	 xfjU74RLKjozah1XuL6/wQOp2tzXfza49l5KtTJ+hQaNOpuNayp0AV8BdImnHgAlrh
	 2VNUMczYwgDKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 15/23] kbuild: fix short log for AS in link-vmlinux.sh
Date: Wed,  5 Jun 2024 08:01:58 -0400
Message-ID: <20240605120220.2966127-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120220.2966127-1-sashal@kernel.org>
References: <20240605120220.2966127-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
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
index 7862a81017477..a9434a72cac4f 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -182,7 +182,7 @@ kallsyms_step()
 	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms ${kallsymso_prev}
 	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
 
-	info AS ${kallsyms_S}
+	info AS ${kallsymso}
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
 	      -c -o ${kallsymso} ${kallsyms_S}
-- 
2.43.0


