Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C505F3610D6
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 19:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhDORO1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 13:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhDORO0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 13:14:26 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC746C061574;
        Thu, 15 Apr 2021 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nkflvBcB1OAOg8cL9Czq3wUEW43GgtwSsqa8GY7v0s4=; b=Fuz5Og5Ss/NLF5hz+9ZGKDnVGN
        cWlPJlCqVYU0nKJRcwBOx9cECNKJnuQUY2U5nqmhC8JFZ1M8tdrdpP8Z5qhGRvBpFIag+gDtqX/CR
        HP1bSmoYb3N0EnMJwei9q+xecabngB9crdWOLcCRJVqgifSpqKQejQo3Lu772Pp0PsrscMWeeFVc0
        eIrRvTMeJLdF8FHp/4UsbCw9A1gSCbZYqmESq5cvlT3oHKRJVWZZMzJkWdJ6aOQYgf/Y4iyIJRhXG
        RLOxyNMi/UDm24+SgRcWS9IJ4VFbWbbKsIS/rFnhy1eknz3iOBb2eBVh+4d109BHf8kMUU3HykOay
        s27BTC1w==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lX5Yz-00GpJa-JD; Thu, 15 Apr 2021 17:13:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Subject: [PATCH v2] uml: fix W=1 missing-include-dirs warnings
Date:   Thu, 15 Apr 2021 10:13:52 -0700
Message-Id: <20210415171352.27398-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently when using "W=1" with UML builds, there are over 700 warnings
like so:

  CC      arch/um/drivers/stderr_console.o
cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]

but arch/um/ does not have include/uapi/ at all, so add that
subdir and put one Kbuild file into it (since git does not track
empty subdirs).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: linux-um@lists.infradead.org
---
v2: use Option 4 from v1: add arch/um/include/uapi so that 'make' is
    placated -- and just like all other arch's have.

 arch/um/include/uapi/asm/Kbuild |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/um/include/uapi/asm/Kbuild b/arch/um/include/uapi/asm/Kbuild
new file mode 100644
index 000000000000..f66554cd5c45
--- /dev/null
+++ b/arch/um/include/uapi/asm/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0
