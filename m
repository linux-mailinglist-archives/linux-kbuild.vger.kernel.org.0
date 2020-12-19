Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606C52DED65
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Dec 2020 07:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgLSGAe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Dec 2020 01:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgLSGAe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 01:00:34 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68C7C0617B0;
        Fri, 18 Dec 2020 21:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=O9bjY+SNHfXjv0V54vYMlNi5hdu//UMl4vRGxnEx0LU=; b=aTKwqxGTdzj9007qxiCXI0R4Sr
        y4fGSInKZL3S2+Ci8ee4zkMLWuSH2KocQcLbIztGWOc2Oy1rHUH7lKeICx9PnlgSUvNg7wLsdgeG7
        MToHAEfL1aQqCRZC59DCExxd/bi/Mj45vSBb+KImWdsbliDnxaVfFc2eM9zzppD7S2EUEov6H0BqX
        +GMtpXsZT6dPB5AE10dFAVmxHSUdLiwljpTnDKtaGGGhZ+mRa6PYK/iPTiJmuyL0zawAxo9KWGvQc
        RnPGVNEz/JuKDiVBX5oMgJNefznfvOCTiWqbmMKlGhU5fRdVnDxu4lIv65Vs0N6wM775XLwrsvRgo
        uEKXgn7A==;
Received: from [2601:1c0:6280:3f0::64ea] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kqVHT-0001zz-94; Sat, 19 Dec 2020 05:59:51 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andi Kleen <ak@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kconfig: config script: add a little user help
Date:   Fri, 18 Dec 2020 21:59:47 -0800
Message-Id: <20201219055947.29587-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Give the user a clue about the problem along with the 35 lines of
usage/help text.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/config |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20201218.orig/scripts/config
+++ linux-next-20201218/scripts/config
@@ -223,6 +223,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	*)
+		echo "bad cmd: $CMD"
 		usage
 		;;
 	esac
