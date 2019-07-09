Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46BAB6337E
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 11:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfGIJdD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 05:33:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfGIJc5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:57 -0400
Received: from orion.localdomain ([95.118.92.226]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1cvQ-1iV4bZ3MRU-0122MZ; Tue, 09 Jul 2019 11:32:41 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        info@metux.net, apw@canonical.com, joe@perches.com,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 1/4] Makefile: rules for printing kernel architecture and localversion
Date:   Tue,  9 Jul 2019 11:32:36 +0200
Message-Id: <1562664759-16009-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:uc03CDIsqb9vBEzIMWVZpyU2revDgAT8kF66aLNaXkdHn4yNDk8
 p4J0t/KayKdxyG9BCpkBBkU883Z/mAiidkam56XGgnJjXVus1UnoYBDpSXCbbaXo1F1J5su
 0JpsapweoM8r10i+aYj0l1EFuPRJEhzRcGNdzVlCONEBw8XcAK7B3G8+0q1mD7EpIXP+Hja
 HDptjN8qIK8MJh3DG/8yg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5EjeTTw4q4M=:HMIXZz/XPCgvbro1gN0kmS
 0nX4PljAVK0pGfLMSmNHN9UrOjhKd2+AqneTIQGzFw5yQ/pnOsgMDtAiXFQ9zUxb2jbbbgTDV
 5yvsErr8Jz0jByZBkKxdHNlUFhTTxlXYQzYbrb5Kvo35y5gR8t7gXfkJjy3uXCdQiWy9D9NT5
 0MYsr6Jciw7CRPmjnfZaIRA0Cf8yNpzq/xvvjoc5oW+uPoREGbJZt+LeNPcit+iXMYRAE5N9O
 CT1um5XV519QyBF9W/uoVNYEmbOzo0IT5vfxv4q3GNMlKAuE/galW1VV0SpIINF8UFwKzrRON
 qqnk9AvP/PqLR1V+CRnAmlU+DtVMCZYGxMLZa2J+Dx8h+9O1RanxF07IamZafWThQZOO75swt
 jz+wS63UXk9bxQVK++XIJtpjnJ++lfCuSFHqNjSKhmefETgihL7LEJxWDkwFOmp4azkI84Iqj
 IgE9h0Y2+4wtJuVu5jrYuVXd4fvnY6huF8ei5Z7TOJloj4YdneL09kD3708MXOLlLhrzCPf8V
 MzDqAU6Xi0jew2LhFsNcycoAHgV2OZtvSCAw+aOonwcAWTc5S3iG5w95TZvi08Cgeu+uTtEHP
 rl0XDuOKIqHkUlF/oYKheO5UdNpbCmTDCyKgY//6ANXvRy5TFyBiSIPCr8g2fnDMh8Qfawnvd
 bK0aN9e+ttkHA46Gwo+Ow1qgY/MFRqb9SGzqiSCxWhE0lP3l3WPZ5Eyh6ZwfrV92dVG/UNyDF
 t1pOnuS9iki+hbpLbuNXRepne+gP8YxEHhjZLA==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

trivial rule to print out the kernel arch and localversion, so
external tools, like distro packagers, can easily get it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 3e4868a..5afc3de 100644
--- a/Makefile
+++ b/Makefile
@@ -1706,6 +1706,12 @@ kernelrelease:
 kernelversion:
 	@echo $(KERNELVERSION)
 
+kernellocalversion:
+	@$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree) | sed -e 's~^\-~~'
+
+kernelarch:
+	@echo $(ARCH)
+
 image_name:
 	@echo $(KBUILD_IMAGE)
 
-- 
1.9.1

