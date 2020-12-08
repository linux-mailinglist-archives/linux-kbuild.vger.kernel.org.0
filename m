Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD5E2D2E46
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 16:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgLHPaX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 10:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729795AbgLHPaX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 10:30:23 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7D0C06138C
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Dec 2020 07:29:04 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id 1rUy2400J4C55Sk01rUyYb; Tue, 08 Dec 2020 16:29:02 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kmevC-0090Gc-Hi; Tue, 08 Dec 2020 16:28:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kmevC-0094TH-5A; Tue, 08 Dec 2020 16:28:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] Documentation/kbuild: Document COMPILE_TEST and platform dependencies
Date:   Tue,  8 Dec 2020 16:28:55 +0100
Message-Id: <20201208152857.2162093-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

	Hi all,

This patch series documents best practices for COMPILE_TEST and
architecture/platform dependencies, like already in use in most
subsystems, to serve as a point of reference.

Thanks for your comments!

Geert Uytterhoeven (2):
  Documentation/kbuild: Document COMPILE_TEST dependencies
  Documentation/kbuild: Document platform dependency practises

 Documentation/kbuild/kconfig-language.rst | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
