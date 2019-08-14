Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3B28D190
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 12:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbfHNKyk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 06:54:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:52498 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfHNKyf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 06:54:35 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7EAs34Y024567;
        Wed, 14 Aug 2019 19:54:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7EAs34Y024567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565780045;
        bh=KNIkl3BaVdtuV4S46GHgiFB1XPYspoKpIq3NRC3qoAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TDbpOJbvMqNT0bpf/NUssvpsQHzkNV6FB4VdlAUtvotQm1rWW8tDgDAUe7tkK1F9R
         1g4GtGTWqs3yNSOUlzFCWeE7K/t7fBkPfIwvOh/j9W90tSmmljVautvqFrUHCi3x7S
         Jo0CuOD3N+WSHdPil+YAmNpmnq1yqD5Ax2agYtiTfKdoYAFe18dSMOv6pQcDNmHqnS
         dil2G4VDtBBlj28TTw4HyBEEsdTNTKB1lcCWl5BuqipeMjdDj/25FIrTGn9SRNx6Xg
         1efOCbkA0C1RC04xLqLyvceuq+jOrpaMTdkmlI0HOsbG+2kcsQDnF8CwOJpmWoXwm4
         cVQ1FslrsnCdQ==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] docs: kbuild: fix invalid ReST syntax
Date:   Wed, 14 Aug 2019 19:53:59 +0900
Message-Id: <20190814105400.1339-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814105400.1339-1-yamada.masahiro@socionext.com>
References: <20190814105400.1339-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I see the following warnings when I open this document with a ReST
viewer, retext:

/home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1142: (WARNING/2) Inline emphasis start-string without end-string.
/home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1152: (WARNING/2) Inline emphasis start-string without end-string.
/home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1154: (WARNING/2) Inline emphasis start-string without end-string.

These hunks were added by commit e846f0dc57f4 ("kbuild: add support
for ensuring headers are self-contained") and commit 1e21cbfada87
("kbuild: support header-test-pattern-y"), respectively. They were
written not for ReST but for the plain text, and merged via the
kbuild tree.

In the same development cycle, this document was converted to ReST
by commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename
to *.rst"), and merged via the doc sub-system.

Merging them together into Linus' tree resulted in the current situation.

To fix the syntax, surround the asterisks with back-quotes, and
use :: for the code sample.

Fixes: 39ceda5ce1b0 ("Merge tag 'kbuild-v5.3' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index f4f0f7ffde2b..b4c28c543d72 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1139,7 +1139,7 @@ When kbuild executes, the following steps are followed (roughly):
 
     header-test-y
 
-	header-test-y specifies headers (*.h) in the current directory that
+	header-test-y specifies headers (`*.h`) in the current directory that
 	should be compile tested to ensure they are self-contained,
 	i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
 	this builds them as part of extra-y.
@@ -1147,11 +1147,11 @@ When kbuild executes, the following steps are followed (roughly):
     header-test-pattern-y
 
 	This works as a weaker version of header-test-y, and accepts wildcard
-	patterns. The typical usage is:
+	patterns. The typical usage is::
 
-		  header-test-pattern-y += *.h
+		header-test-pattern-y += *.h
 
-	This specifies all the files that matches to '*.h' in the current
+	This specifies all the files that matches to `*.h` in the current
 	directory, but the files in 'header-test-' are excluded.
 
 6.7 Commands useful for building a boot image
-- 
2.17.1

