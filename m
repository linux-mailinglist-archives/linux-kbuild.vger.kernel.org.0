Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C383633DB
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Apr 2021 07:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhDRFxX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Apr 2021 01:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhDRFxW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Apr 2021 01:53:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E030C06174A;
        Sat, 17 Apr 2021 22:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=/rCL1SYcH1QoHtrqqF4WkXopfevtsa/urBlN4iQBDWw=; b=Aby8ZKgVQPY5JBenOCUicNdTbO
        jRAjdORthOqnDIn7JJP4N48itiH3fDi74K6ioiwPj3ppt1z2nEnJD4JFz+F/z4mpcOrU5LdNgHGMw
        VOsnGg+h1dHyODaMcWDGper5V9viK08YZMOoiAEpbuYasSr+c8XSHIxT1mWDAl3gwOJ+wOqezcROo
        ncBCeJyQO5MbC2i1vzEXA0SuW1ekUhJQ/Y0XbCU57lTYuOMmfxOs9L1LmPCtQlI8yedWzFFbH/Opy
        Mp8+wmYMD3OF1f4j2u9I6tO1B6XI9WeC++2Jqv0Y6ltf8MlbmydawWQ5XAPWY961hvuA1xXu/9hUQ
        V8Nlrsyg==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lY0LR-00C6rN-LM; Sun, 18 Apr 2021 05:51:50 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] kconfig: highlight xconfig 'comment' lines with '***'
Date:   Sat, 17 Apr 2021 22:51:23 -0700
Message-Id: <20210418055123.14085-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210418055123.14085-1-rdunlap@infradead.org>
References: <20210418055123.14085-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Mark Kconfig "comment" lines with "*** <commentstring> ***"
so that it is clear that these lines are comments and not some
kconfig item that cannot be modified.

This is helpful in some menus to be able to provide a menu
"sub-heading" for groups of similar config items.

This also makes the comments be presented in a way that is
similar to menuconfig and nconfig.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/kconfig/qconf.cc |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210416.orig/scripts/kconfig/qconf.cc
+++ linux-next-20210416/scripts/kconfig/qconf.cc
@@ -122,6 +122,7 @@ void ConfigItem::updateMenu(void)
 		goto set_prompt;
 	case P_COMMENT:
 		setIcon(promptColIdx, QIcon());
+		prompt = "*** " + prompt + " ***";
 		goto set_prompt;
 	default:
 		;
