Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049913451F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Mar 2021 22:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhCVVk5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Mar 2021 17:40:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230048AbhCVVkd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Mar 2021 17:40:33 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E971619A9;
        Mon, 22 Mar 2021 21:40:33 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.94)
        (envelope-from <rostedt@goodmis.org>)
        id 1lOSHo-001aPB-Df; Mon, 22 Mar 2021 17:40:32 -0400
Message-ID: <20210322214032.293992979@goodmis.org>
User-Agent: quilt/0.66
Date:   Mon, 22 Mar 2021 17:38:08 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim users
References: <20210322213806.089334551@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

The tab stop for Perl files is by default (at least in emacs) to be 4
spaces, where a tab is used for all 8 spaces. Add a local variable comment
to make vim do the same by default, and this will help keep the file
consistent in the future when others edit it via vim and not emacs.

Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 059061b6daef..044829972ba5 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -702,3 +702,5 @@ foreach my $module (keys(%modules)) {
 	print STDERR "\n";
     }
 }
+
+# vim: softtabstop=4
-- 
2.30.1


