Return-Path: <linux-kbuild+bounces-3662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F997E6F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 09:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B472D1F21776
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 07:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784D84EB45;
	Mon, 23 Sep 2024 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ru76ufvX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C2E47772;
	Mon, 23 Sep 2024 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078235; cv=none; b=d+gJAHjm0vB4UWmrqsbRvtUmE1MMNTRwFq7FIrZpFETFf8knSp+l7pqYfRM78KEbbYjgTZJpXb3ZQW562tpzMvAR0M39uyXjNDOHfw4ml6Gf8XQAZGCKmupyWydln3m6vk0BuLlWQYSh9M9ImmV7e3a/beeckpkrB4ux2PalpSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078235; c=relaxed/simple;
	bh=/67wU+xu3DRRRzxut6ybxR6VskXWX3/R07CWLjzgkcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d/Mxquwi73RSj9+vGKNIvDcmkVeScI5Ytr/WbGKu8dlp+gFStxrmPug9C4WyH1IxM5Ma9yXxRpSTNOAw7m6B/cIu1x/mcyeFoavN9DoN6wq97qo8xFGJFm5Se31vr5HicYYm7sKHrUddnoTWXhrn/SAsgnwMLTT5c+Hy9nLgFSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ru76ufvX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2EEC4CEC4;
	Mon, 23 Sep 2024 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727078234;
	bh=/67wU+xu3DRRRzxut6ybxR6VskXWX3/R07CWLjzgkcg=;
	h=From:To:Cc:Subject:Date:From;
	b=Ru76ufvX2yyZa4cxQbZARKV6kv+IPZvCz+FKw4j7EdLS/TkMhGh7gqHwYGAph3ree
	 oBmOuXwf8RdlpcXWrixZDcJMxwZi0unAnef9huV8RG0DJlMekWGXZ5c6iRvhTra8s7
	 AGSlDInfPbp/saAMisCU4wQrv7puSpEX/U3JKyXEecoy2XoAcsQB1Xde5d+M0/znFc
	 KVvfRpwBuizmL7hTnnQjRjI5X/pIWLjy2O61WyBl6VSYAuR05r7XGIHm9wlN5lacYg
	 T+icvrqkf4tbzMvn91PtD3cK63Yb6NC1PXI8z05k6vY/lW/Uv94a9qV1F2CKfQR1zV
	 lNqmT0qaYpWMw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v3 1/2] kbuild: move non-boot built-in DTBs to .rodata section
Date: Mon, 23 Sep 2024 16:56:02 +0900
Message-ID: <20240923075704.3567313-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit aab94339cd85 ("of: Add support for linking device tree blobs
into vmlinux") introduced a mechanism to embed DTBs into vmlinux.

Initially, it was used for wrapping boot DTBs in arch/*/boot/dts/, but
it is now reused for more generic purposes, such as testing.

Built-in DTBs are discarded because KERNEL_DTB() is part of INIT_DATA,
as defined in include/asm-generic/vmlinux.lds.h.

This has not been an issue so far because OF unittests are triggered
during boot, as defined by late_initcall(of_unittest).

However, the recent clk KUnit test additions have caused problems
because KUnit can execute test suites after boot.

For example:

  # echo > /sys/kernel/debug/kunit/clk_register_clk_parent_data_device/run

This command triggers a stack trace because built-in DTBs have already
been freed.

While it is possible to move such test suites from kunit_test_suites to
kunit_test_init_section_suites, it would be preferable to avoid usage
limitations.

This commit moves non-boot built-in DTBs to the .rodata section. Since
these generic DTBs are looked up by name, they do not need to be placed
in the special .dtb.init.rodata section.

Boot DTBs should remain in .dtb.init.rodata because the arch boot code
generally does not know the DT name, thus it uses the __dtb_start symbol
to locate it.

This separation also ensures that the __dtb_start symbol references the
boot DTB. Currently, the .dtb.init.rodata is a mixture of both boot and
non-boot DTBs. The __dtb_start symbol must be followed by the boot DTB,
but we currently rely on the link order (i.e., the order in Makefiles),
which is very fragile.

Fixes: 5c9dd72d8385 ("of: Add a KUnit test for overlays and test managed APIs")
Fixes: 5776526beb95 ("clk: Add KUnit tests for clk fixed rate basic type")
Fixes: 274aff8711b2 ("clk: Add KUnit tests for clks registered with struct clk_parent_data")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - Move to .rodata section instead of .init.rodata

 scripts/Makefile.dtbs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 46009d5f1486..3e81cca6f68a 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -34,12 +34,14 @@ $(obj)/dtbs-list: $(dtb-y) FORCE
 # Assembly file to wrap dtb(o)
 # ---------------------------------------------------------------------------
 
+builtin-dtb-section = $(if $(filter arch/%, $(obj)),.dtb.init.rodata,.rodata)
+
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_wrap_S_dtb = WRAP    $@
       cmd_wrap_S_dtb = {								\
 		symbase=__$(patsubst .%,%,$(suffix $<))_$(subst -,_,$(notdir $*));	\
 		echo '\#include <asm-generic/vmlinux.lds.h>';				\
-		echo '.section .dtb.init.rodata,"a"';					\
+		echo '.section $(builtin-dtb-section),"a"';				\
 		echo '.balign STRUCT_ALIGNMENT';					\
 		echo ".global $${symbase}_begin";					\
 		echo "$${symbase}_begin:";						\
-- 
2.43.0


