Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9897C65DD2C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbjADTzF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240184AbjADTy6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:54:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6758A1AA11
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:54:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F35ECB818B9
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10283C433F0;
        Wed,  4 Jan 2023 19:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862094;
        bh=7eL7HbrvfN88cop/Q2OiR0WRyscekkrF/kn1kocOdzY=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=b/oJ9j1+5+jZNaxU0C6WVwYUuEWXjN1OBOXKeIX3ZeYUnRB1YX08sppahtxdX9l7o
         HSarPbftZaJTRCZYM9bF2vIeLwYg3//LXzLdqkXIKEGjrVsRFKG4CffUEdi4Ml6ZP8
         eoapsFObN66K0KBENtHQdOO+zjGaCl5BoawRJBx1SLZhLYKBrpQnf8c7vQL184wFeo
         9Gxf2M8BJc34qLnRJRVfCBWdMAh1wEfm+KkDUS3OgGYe/8eBeIunz3vgiJYr+zv1QD
         jvOXIblym8r1brXGY3t8/LVtyInuIQGBtJaSgeJ/RQH4JsqNmJNOFFtihRKquG0sM8
         9HP2x6NxjVuvg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:18 -0700
Subject: [PATCH 01/14] x86/boot/compressed: prefer cc-option for CFLAGS additions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-1-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4Z/QjeIidCHott5q7MuOWLlOJLESu2McA9pepWg0ceM=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3buWmV1Vy6dldnylOlduT1vN67cZvb9zZkn1/7qnFZh
 vMMp2FHKwiDGwSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmInmNkWH2+q014V/XagovTPx3zD
 sr+IdshVnt8+f6UzM9MmV8JLsZGc7Od3md0myQyG/OspnVZPKBs1M6nqmdM9e+5LN9vfDaZA4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Desaulniers <ndesaulniers@google.com>

as-option tests new options using KBUILD_CFLAGS, which causes problems
when using as-option to update KBUILD_AFLAGS because many compiler
options are not valid assembler options.

This will be fixed in a follow up patch. Before doing so, move the
assembler test for -Wa,-mrelax-relocations=no from using as-option to
cc-option.

Link: https://lore.kernel.org/llvm/CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com/
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: tglx@linutronix.de
Cc: mingo@redhat.com
Cc: bp@alien8.de
Cc: dave.hansen@linux.intel.com
Cc: x86@kernel.org
---
 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 1acff356d97a..6b6cfe607bdb 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -50,7 +50,7 @@ KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.
-KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
+KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 
 # sev.c indirectly inludes inat-table.h which is generated during

-- 
2.39.0
