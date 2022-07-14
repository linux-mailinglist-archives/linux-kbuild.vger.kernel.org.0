Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD2557439D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jul 2022 06:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237650AbiGNEhL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jul 2022 00:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbiGNEgW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jul 2022 00:36:22 -0400
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED35E7A
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jul 2022 21:26:38 -0700 (PDT)
Received: from tarshish.tkos.co.il (unknown [10.0.8.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id 064AF440F4F;
        Thu, 14 Jul 2022 07:26:16 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1657772776;
        bh=tTaXJje1p/pdEOXi6XRH0C5wg23H3zDcdL4JMPqVefo=;
        h=From:To:Cc:Subject:Date:From;
        b=J2qAJZOyMKOsxEyoojGEAG/jwz4fw75I0cCoIpSSpWu/PZ1LO462aln8fuoX0YL1K
         RmmzBlHhGREh7xD/Xqn9f4XxHPbeD6xp4sK/gyVYHMj3YBr4+Vj9OxfaiZ71g6O1mi
         PwUBxp2zSoQx3GAW3TtlvXZgU2AO/yRzJRM5niQ26Ni92bPc0uCDlzmneBUJoRZQLw
         1iOWFDYMrvihGa8rVWzESRGiQSmyTO4V9LWQyw8UtVCcEG5jYHZqIiDaLDGunA5U/G
         MmHc7JyqzS7NGgnCeJ8EUEJYV0qXL7JSPt1K+/l0MiUeyfN431q7Lc4AHzoLO0arjQ
         4TR6HM5mnh5Qw==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] docs: kbuild: fix typo
Date:   Thu, 14 Jul 2022 07:25:46 +0300
Message-Id: <d78714e8005b52d5c5dee59bd47a0ba7011b0e55.1657772746.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

on -> one.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/kbuild/kconfig-language.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index a7173843a294..7fb398649f51 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -672,7 +672,7 @@ Future kconfig work
 Work on kconfig is welcomed on both areas of clarifying semantics and on
 evaluating the use of a full SAT solver for it. A full SAT solver can be
 desirable to enable more complex dependency mappings and / or queries,
-for instance on possible use case for a SAT solver could be that of handling
+for instance one possible use case for a SAT solver could be that of handling
 the current known recursive dependency issues. It is not known if this would
 address such issues but such evaluation is desirable. If support for a full SAT
 solver proves too complex or that it cannot address recursive dependency issues
-- 
2.35.1

