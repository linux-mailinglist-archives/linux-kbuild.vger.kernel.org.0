Return-Path: <linux-kbuild+bounces-1998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AAF8FCD8E
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 14:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A3C028929C
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 12:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E071AB8EC;
	Wed,  5 Jun 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGhZ5Yl+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE11AB8E7;
	Wed,  5 Jun 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589112; cv=none; b=c8npjSq5MkJoB/lY4KczMSDFnIUljZY/qDs2ZFnYruCC39QQEe57ycdk/Ymcnx5QgbnrgHGOHhUmUiA2Qp8/iBa9E7oyPvCZyjEKtiSrqEMrh/QJhEMqmANzYarc+ilXXrrof6G6d4Um6XoSxF9VUvXxIMKjv7ixgFwdUrl7pTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589112; c=relaxed/simple;
	bh=Y/32szHfbZYbXDSCF25V/z9KTLPAFSYNCqwZHL/VUkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+H7anHb2l5kJhm1t7zxW4UdAYqI0s0eGqkAFFfJlm/u33ui8KiNAJKyYtqQNJSpgoOKQ5idOzvVficmqW7Ht3v0LlgrsKxqJ+BSGDPDfx4FeoVbTS2gP3+ePXlNrJbUMNwY4U4RjYLj4IEHlrDLM6nYJeziASpyIENNAGGdo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGhZ5Yl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DB6C32781;
	Wed,  5 Jun 2024 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589112;
	bh=Y/32szHfbZYbXDSCF25V/z9KTLPAFSYNCqwZHL/VUkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BGhZ5Yl+vqVoa7W4RgEQVl97X464HR7IHawAF+LCyM38YB+oVLKSbFLUlmPMjJWiZ
	 0pWmrs4GfrRHOqAap+CqTN7d/EWLTkNDfTeGzNBwbubyBHhp6FYhd1rzQP4FE52J1Y
	 mImQqe4k6hzPzS3MTuC0OZmxiBeifD43jGsVF2dZ/fsLA7DKrCdJvYHvydRx7neEKr
	 XbO1WgrsNn+9lLbnP2KJQSsp0M+WDVLTJSqCxMwvnxJeGm0nt1NEftaQHr2x3pBPcw
	 GUDLZWt75mPDT6Kib/HcXtV8ixsnmP+LwEwtNwpNiMt0bLoKnCkc6OifmwB0oVpwql
	 GgctNhfQ0kUzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/14] kbuild: fix short log for AS in link-vmlinux.sh
Date: Wed,  5 Jun 2024 08:04:43 -0400
Message-ID: <20240605120455.2967445-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120455.2967445-1-sashal@kernel.org>
References: <20240605120455.2967445-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.92
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
index 458b2948b580d..019560548ac98 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -182,7 +182,7 @@ kallsyms_step()
 	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
 	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
 
-	info AS ${kallsyms_S}
+	info AS ${kallsymso}
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
 	      -c -o ${kallsymso} ${kallsyms_S}
-- 
2.43.0


