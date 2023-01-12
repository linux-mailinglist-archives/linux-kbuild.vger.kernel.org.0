Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78F5666940
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235939AbjALDFo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235706AbjALDFm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CA54882A;
        Wed, 11 Jan 2023 19:05:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0FFDE61F24;
        Thu, 12 Jan 2023 03:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E07C433EF;
        Thu, 12 Jan 2023 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492741;
        bh=Q6J0MPxHgB97C1dlcB1nqGDmiSZvc4LEaiCPSbsj0DE=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=ZlFcLYS0+ijYK9R8go6A0m8VLWC1AF4RKCZ4Efd/fPyMsIMWGGYW63marO1wUTLq/
         y15XwYoeTNC878nuNHIBiEVPWvwnVOlSM+HE1JssMM4V2AmHQZkm3yzfkxTudXbrFL
         0/N/gmUakImYb0hiWnmwrfnVX/k9MQFYPafMy90jV2L5Ufl7mXuhHr5BzqnrrAZ7kX
         HXzrWP01sikH+51KjBO5eAB7Jyn14BU4re3Htv3cG55yx+LdOvIE1/6/63jyNAfcr2
         iwnremta4JEbQKvSMZ2zm7JgxbHlUNpfrdduP7feH1h0IIUlgM0Myhfe4P1D5HYNzn
         e+ehAZLBVa/Xw==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:06 -0700
Subject: [PATCH v2 09/14] s390/vdso: Drop unused '-s' flag from
 KBUILD_AFLAGS_64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-9-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Q6J0MPxHgB97C1dlcB1nqGDmiSZvc4LEaiCPSbsj0DE=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K34HaJktqq3dp2i5tFOxNaf+8xv7CSLMxXv8DtzR18+p
 CrLpKGVhEONgkBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPJ3cjw30XtuFj8ooe5/9U4t61bxD
 r3lxa70e2f1sFhpdtPRF57IsLIcLPBxd107WlZ7ZKtyxuOym2PELeVZKvvfF7pM982TOEiMwA=
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

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
warns:

  clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]

The compiler's '-s' flag is a linking option (it is passed along to the
linker directly), which means it does nothing when the linker is not
invoked by the compiler. The kernel builds all .o files with '-c', which
stops the compilation pipeline before linking, so '-s' can be safely
dropped from KBUILD_AFLAGS_64.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Reviewed-by: Sven Schnelle <svens@linux.ibm.com>
---
Cc: linux-s390@vger.kernel.org
---
 arch/s390/kernel/vdso64/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 9e2b95a222a9..a2fe9383d452 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -22,7 +22,7 @@ KBUILD_AFLAGS += -DBUILD_VDSO
 KBUILD_CFLAGS += -DBUILD_VDSO -DDISABLE_BRANCH_PROFILING
 
 KBUILD_AFLAGS_64 := $(filter-out -m64,$(KBUILD_AFLAGS))
-KBUILD_AFLAGS_64 += -m64 -s
+KBUILD_AFLAGS_64 += -m64
 
 KBUILD_CFLAGS_64 := $(filter-out -m64,$(KBUILD_CFLAGS))
 KBUILD_CFLAGS_64 += -m64 -fPIC -shared -fno-common -fno-builtin

-- 
2.39.0

