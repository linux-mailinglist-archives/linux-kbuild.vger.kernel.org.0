Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FF96A8353
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Mar 2023 14:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjCBNRd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Mar 2023 08:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCBNRb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Mar 2023 08:17:31 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC5F3B0F5
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 05:17:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSBTq2Dr6z4x80;
        Fri,  3 Mar 2023 00:17:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1677763039;
        bh=0JIQWJKznz7AtiZOyXNJNdwCGrnZhYEwd8v6MXpZZbk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mx3WB01f/BIglEyoyz+c+rctgDHNseoJp9meZk/si0LfJlCdGCBb32q1e/Ju7OZ9c
         fXqmqO2TeyTW5dj1LmXzJsKsDNHVmNC80eQ5YlYFfXOxIBMVZZaSB1U+0Ql/J0swlZ
         HpYWMXDdtuuH1WvKQcsjx4DRRY8cSrMlXnL7HX+al/ESHnErySHt/jcQTcTNmJlIeS
         GVC9R/XgWOd22ZBBJ6fYGZDm5xjhWtTQzVWiAQLA8pHPu4p64HSRTd4gjDsoSY5Z9W
         Mwiy64D7rMVg/u6kj/lzGJwTsM2wWvU7ouw7MSegeBNawSOrewwjZP4s4IqhHlR48X
         frBVjzrU/EnoA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     <linuxppc-dev@lists.ozlabs.org>
Cc:     <nathan@kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
Date:   Fri,  3 Mar 2023 00:16:56 +1100
Message-Id: <20230302131656.50626-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302131656.50626-1-mpe@ellerman.id.au>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For the -mtune option clang doesn't accept power10/9/8, instead it
accepts pwr10/9/8. That will be fixed in future versions of clang, but
the kernel must support the clang versions in the wild.

So add support for the "pwr" spelling if clang is in use.

Reported-by: Nathan Chancellor <nathan@kernel.org>
BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig.cputype | 4 ++++
 1 file changed, 4 insertions(+)

Need to confirm the clang <= 16 statement is correct.

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 7d7477b73951..e4e0e81be7de 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -278,6 +278,10 @@ config TUNE_CPU
 	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
 	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
 	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
+	# clang <= 16 only supports the "pwr" names
+	default "-mtune=pwr10"   if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr10)
+	default "-mtune=pwr9"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr9)
+	default "-mtune=pwr8"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr8)
 
 config PPC_BOOK3S
 	def_bool y
-- 
2.39.2

