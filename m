Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14664954E2
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jan 2022 20:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347053AbiATTbR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Jan 2022 14:31:17 -0500
Received: from sdaoden.eu ([217.144.132.164]:50350 "EHLO sdaoden.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231733AbiATTbQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jan 2022 14:31:16 -0500
X-Greylist: delayed 562 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Jan 2022 14:31:16 EST
Received: from kent.sdaoden.eu (kent.sdaoden.eu [10.5.0.2])
        by sdaoden.eu (Postfix) with ESMTPS id 8A79916057;
        Thu, 20 Jan 2022 20:21:53 +0100 (CET)
Received: by kent.sdaoden.eu (Postfix, from userid 1000)
        id EF55D383E; Thu, 20 Jan 2022 20:21:51 +0100 (CET)
Date:   Thu, 20 Jan 2022 20:21:51 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From:   Steffen Nurpmeso <steffen@sdaoden.eu>
To:     linux-kbuild@vger.kernel.org
Cc:     Steffen Nurpmeso <steffen@sdaoden.eu>
Subject: Makefile: uses rsync(1), could this be optional?
Message-ID: <20220120192151.k46VF%steffen@sdaoden.eu>
User-Agent: s-nail v14.9.23-223-g046972b06d
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello.

I sent this to linux-kernel@vger.kernel.org on the 15th, which
seems to be legacy.  Just in case someone is wondering about the
resend.

As a not-yet-tested low-quality Makefile suggestion, with modern
GNU tools and find(1)'s -printf, wouldn't the following code work
out gracefully in practice?  (Not subscribed.)

Thanks for Linux!

--- Makefile.orig	2022-01-15 19:33:59.337393371 +0100
+++ Makefile	2022-01-15 19:34:07.447393217 +0100
@@ -1260,8 +1288,17 @@ export INSTALL_HDR_PATH = $(objtree)/usr
 quiet_cmd_headers_install = INSTALL $(INSTALL_HDR_PATH)/include
       cmd_headers_install = \
 	mkdir -p $(INSTALL_HDR_PATH); \
-	rsync -mrl --include='*/' --include='*\.h' --exclude='*' \
-	usr/include $(INSTALL_HDR_PATH)
+	if command -v rsync; then \
+		rsync -mrl --include='*/' --include='*\.h' --exclude='*' \
+		usr/include $(INSTALL_HDR_PATH);\
+	else \
+		cd usr;\
+		find include/ -type f -name '*.h' -printf '%f %h\n' |\
+		while read f d; do \
+			mkdir -p $(INSTALL_HDR_PATH)/$$d;\
+			cp -P $$d/$$f $(INSTALL_HDR_PATH)/$$d/$$f;\
+		done;\
+	fi
 
 PHONY += headers_install
 headers_install: headers

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
