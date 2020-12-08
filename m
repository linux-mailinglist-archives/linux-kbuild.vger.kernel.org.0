Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874942D2E3F
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 16:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgLHP3n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 10:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729735AbgLHP3m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 10:29:42 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E501C06179C
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Dec 2020 07:29:02 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 1rUy2400X4C55Sk01rUyDW; Tue, 08 Dec 2020 16:28:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kmevC-0090Gd-Jy; Tue, 08 Dec 2020 16:28:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kmevC-0094TL-6w; Tue, 08 Dec 2020 16:28:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] Documentation/kbuild: Document COMPILE_TEST dependencies
Date:   Tue,  8 Dec 2020 16:28:56 +0100
Message-Id: <20201208152857.2162093-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208152857.2162093-1-geert+renesas@glider.be>
References: <20201208152857.2162093-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Document best practises for using COMPILE_TEST dependencies.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/kbuild/kconfig-language.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 1cf1aebdd6cdf8fa..2b746332d8aa6bce 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -553,6 +553,17 @@ with "depends on m".  E.g.::
 
 limits FOO to module (=m) or disabled (=n).
 
+Compile-testing
+~~~~~~~~~~~~~~~
+If a config symbol has a dependency, but the code controlled by the config
+symbol can still be compiled if the dependency is not met, it is encouraged to
+increase build coverage by adding an "|| COMPILE_TEST" clause to the
+dependency.  This is especially useful for drivers for more exotic hardware, as
+it allows continuous-integration systems to compile-test the code on a more
+common system, and detect bugs that way.
+Note that compile-tested code should avoid crashing when run on a system where
+the dependency is not met.
+
 Kconfig recursive dependency limitations
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.25.1

