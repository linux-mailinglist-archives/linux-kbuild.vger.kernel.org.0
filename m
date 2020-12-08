Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5822D2E41
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 16:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbgLHP3n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 10:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730083AbgLHP3n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 10:29:43 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E6DC061794
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Dec 2020 07:29:02 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 1rUy2400Z4C55Sk01rUysS; Tue, 08 Dec 2020 16:28:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kmevC-0090Ge-MH; Tue, 08 Dec 2020 16:28:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kmevC-0094TP-8O; Tue, 08 Dec 2020 16:28:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] Documentation/kbuild: Document platform dependency practises
Date:   Tue,  8 Dec 2020 16:28:57 +0100
Message-Id: <20201208152857.2162093-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208152857.2162093-1-geert+renesas@glider.be>
References: <20201208152857.2162093-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Document best practises for using architecture and platform dependencies.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/kbuild/kconfig-language.rst | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2b746332d8aa6bce..87e9bbe14a21ce83 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -564,6 +564,30 @@ common system, and detect bugs that way.
 Note that compile-tested code should avoid crashing when run on a system where
 the dependency is not met.
 
+Architecture and platform dependencies
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Due to the presence of stubs, most drivers can now be compiled on most
+architectures.  However, this does not mean it makes sense to have all drivers
+available everywhere, as the actual hardware may only exist on specific
+architectures and platforms.  This is especially true for on-SoC IP cores,
+which may be limited to a specific vendor or SoC family.
+
+To prevent asking the user about drivers that cannot be used on the system(s)
+the user is compiling a kernel for, and if it makes sense, config symbols
+controlling the compilation of a driver should contain proper dependencies,
+limiting the visibility of the symbol to (a superset of) the platform(s) the
+driver can be used on.  The dependency can be an architecture (e.g. ARM) or
+platform (e.g. ARCH_OMAP4) dependency.  This makes life simpler not only for
+distro config owners, but also for every single developer or user who
+configures a kernel.
+
+Such a dependency can be relaxed by combining it with the compile-testing rule
+above, leading to:
+
+  config FOO
+	bool "Support for foo hardware"
+	depends on ARCH_FOO_VENDOR || COMPILE_TEST
+
 Kconfig recursive dependency limitations
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.25.1

