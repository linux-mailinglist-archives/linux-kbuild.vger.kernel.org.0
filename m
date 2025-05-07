Return-Path: <linux-kbuild+bounces-6984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1EAAD8F4
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 09:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8D51C2325E
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 07:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0405A221552;
	Wed,  7 May 2025 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmRVgbtw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7820C48A;
	Wed,  7 May 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604183; cv=none; b=ErczcqtpNbsXgD1MP5FllQ6za4hwDDXXDbkysYM74w4voQE+wi7QMOV5iGV0/AmKR5BhQ2I5wLs1gLqEF9UMyQhV+kFrwV09/K6Xbdzhd22NfdEEZFHpB6dMdIoA9tMm6d3d6bOv309ZvUqTcz0+NKHmMQWLbarwDzd2wPOcbJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604183; c=relaxed/simple;
	bh=aKVeXsVP1cmcQfXqQm3R+VpM9vL3zBUMDZE6Vqz1Ib0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djE64AKFViJThgAiDZF1ewROVsSBcpxki5a/OxSSeSDCOnYqiDTTRAQtxyhA38xMYyy5q2z+GkThbj4nrk5n9b2eR3j99cdl5uOhUgY5qW6vY3Of2v1QOxt2VDOHo+c75MA67uzaefXyowObmyqbCNl5EzKqeAQtha3ugC44fd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmRVgbtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA50C4CEE7;
	Wed,  7 May 2025 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746604182;
	bh=aKVeXsVP1cmcQfXqQm3R+VpM9vL3zBUMDZE6Vqz1Ib0=;
	h=From:To:Cc:Subject:Date:From;
	b=TmRVgbtwaSR0HjomtUmH68y8XAFpWC7aZdgMOanCq7iAvSBE3Y7b8GevOKidbrHdt
	 I9EjH22spCzKxxSUQVsmpX54b2ZwCpHtHEXdY7OJ7Pa7jSxfwVXWds8V15ybapQ2yr
	 xhAWUdNH+5IzqwnRprjbAALxBg3F0bqfiTHeLgwaHz8SjPUl9JkBht4mQSefAEhnaB
	 cwkMV9EUC5Yzm/YZy3ymc6dEy7KjLIu9WMApSZr1MiC6P04OL284KUT9zFJ5CU0zEf
	 Ag/qa4jq5jdGjEsXaxaLj+Xtasl2riVoHXhg+8eiGwHT0x5OdPSnYLq1yLVX7ITyeR
	 SddZSSct/WJCg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Richard Weinberger <richard@nod.at>,
	linux-um@lists.infradead.org
Subject: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as well
Date: Wed,  7 May 2025 16:49:33 +0900
Message-ID: <20250507074936.486648-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the kernel with O= is affected by stale in-tree build artifacts.

So, if the source tree is not clean, Kbuild displays the following:

  $ make ARCH=um O=build defconfig
  make[1]: Entering directory '/.../linux/build'
  ***
  *** The source tree is not clean, please run 'make ARCH=um mrproper'
  *** in /.../linux
  ***
  make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
  make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
  make[1]: Leaving directory '/.../linux/build'
  make: *** [Makefile:248: __sub-make] Error 2

Usually, running 'make mrproper' is sufficient for cleaning the source
tree for out-of-tree builds.

However, building UML generates build artifacts not only in arch/um/,
but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
files remain under arch/x86/, Kbuild will reuse them instead of creating
new ones under the specified build directory.

This commit makes 'make ARCH=um clean' recurse into the SUBARCH directory.

Reported-by: Shuah Khan <skhan@linuxfoundation.org>
Closes: https://lore.kernel.org/lkml/20250502172459.14175-1-skhan@linuxfoundation.org/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/um/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 1d36a613aad8..9ed792e565c9 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -154,5 +154,6 @@ MRPROPER_FILES += $(HOST_DIR)/include/generated
 archclean:
 	@find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
 		-o -name '*.gcov' \) -type f -print | xargs rm -f
+	$(Q)$(MAKE) -f $(srctree)/Makefile ARCH=$(HEADER_ARCH) clean
 
 export HEADER_ARCH SUBARCH USER_CFLAGS CFLAGS_NO_HARDENING DEV_NULL_PATH
-- 
2.43.0


