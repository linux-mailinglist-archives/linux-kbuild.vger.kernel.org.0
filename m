Return-Path: <linux-kbuild+bounces-1999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C08FCDBD
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 14:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6A9281447
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7D61CF88C;
	Wed,  5 Jun 2024 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpOqBZfZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D91CF886;
	Wed,  5 Jun 2024 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589145; cv=none; b=Wge3EKpmlBYuorLIbH2FiRAC3Nve47Y+YC3xdYLhHdC+URzwvCl+7svk7bp9/O7MDa+yDIr3EjZDdxrhE1an/RuCJ4MhcCS/5Z5BZb87BHVp0hI26RPbUNb8qZxHHVyXCoUZzjS6pr0k/0K0720E7e4O5R61wMuMm4tONifpC/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589145; c=relaxed/simple;
	bh=1s3Ac6OP/y7plV1Sn6ih2gcgGjdB6Qg9ntlWTBKEEuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0OZjplYXleiSvk7xJ423x/Zl1tz8Atj3wdAWoFUp4Be8vgMpQNtXRCtMDw1fPp9lBQzOiAckEnJDrG+ueDXJyUMIvpdVcrdYdhoP02av5HLyGOnZAWautJcF+fahPhM8hOKVI0UCeDCXdwhPXjZQZB/2KW4p3ODsI491BG1+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpOqBZfZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E74C32786;
	Wed,  5 Jun 2024 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589145;
	bh=1s3Ac6OP/y7plV1Sn6ih2gcgGjdB6Qg9ntlWTBKEEuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WpOqBZfZdAgtzD1UAxzcaFd/wTk6TSE78GglHYZlBbWdti01nkXRr3oZxIn8HH1iU
	 9Bq1zH7H7LmvVteEOEVDoOKlIVLvLRpdvnzKV3/h30NtpzOfYhYmJ+1QIhFMKTihD5
	 mwB7k82iRTP0Ux4KL9QOQhcEDnlQ3hHvs+lNdSzo9Lm342B5NfELMCq8wNCPTeV6NW
	 xj+SmoBVV1fap4geRsS0QgJlAkbcW8xUihmO+08/JSDxOQqBN4vxxZWM3FPmtNyqeJ
	 zx75y9Jq4jwXeA5uIv/9/0AHx5C+AXE/QjUg6OD2UHyDMENY380xXM9M2LSAT7fRJ8
	 Q1LmZZl3g7jBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/12] kbuild: fix short log for AS in link-vmlinux.sh
Date: Wed,  5 Jun 2024 08:05:20 -0400
Message-ID: <20240605120528.2967750-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120528.2967750-1-sashal@kernel.org>
References: <20240605120528.2967750-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.160
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
index 5a5a0cfad69df..40cbc73c7813c 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -278,7 +278,7 @@ kallsyms_step()
 	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
 	kallsyms ${kallsyms_vmlinux} ${kallsyms_S}
 
-	info AS ${kallsyms_S}
+	info AS ${kallsymso}
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
 	      -c -o ${kallsymso} ${kallsyms_S}
-- 
2.43.0


