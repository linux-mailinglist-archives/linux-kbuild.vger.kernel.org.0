Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6783451F2
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Mar 2021 22:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhCVVkz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Mar 2021 17:40:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229730AbhCVVkd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Mar 2021 17:40:33 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F5F76191D;
        Mon, 22 Mar 2021 21:40:33 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.94)
        (envelope-from <rostedt@goodmis.org>)
        id 1lOSHo-001aO4-3e; Mon, 22 Mar 2021 17:40:32 -0400
Message-ID: <20210322213806.089334551@goodmis.org>
User-Agent: quilt/0.66
Date:   Mon, 22 Mar 2021 17:38:06 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: [PATCH 0/2] streamline_config.pl: Fix Perl spacing
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Talking with John Hawley about how vim and emacs deal with Perl files
with respect to tabs and spaces, I found that some of my Perl code in
the kernel had inconsistent spacing. The way emacs handles Perl by default
is to use 4 spaces per indent, but make all 8 spaces into a single tab.
Vim does not do this by default. But if you add the vim variable control:

 # vim: softtabstop=4

to a perl file, it makes vim behave the same way as emacs.

The first patch is to change all 8 spaces into a single tab (mostly from
people editing the file with vim). The next patch adds the softtabstop
variable to make vim act like emacs by default.

Steven Rostedt (VMware) (2):
      streamline_config.pl: Make spacing consistent
      streamline_config.pl: Add softtabstop=4 for vim users

----
 scripts/kconfig/streamline_config.pl | 80 ++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 39 deletions(-)
