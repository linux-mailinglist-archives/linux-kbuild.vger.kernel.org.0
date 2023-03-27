Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB26F6CA2B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Mar 2023 13:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjC0LpM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Mar 2023 07:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjC0LpL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2023 07:45:11 -0400
X-Greylist: delayed 2058 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Mar 2023 04:45:09 PDT
Received: from mail.schwarzvogel.de (unknown [IPv6:2a01:4f8:252:1806::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03C92127
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Mar 2023 04:45:09 -0700 (PDT)
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.96)
        (envelope-from <klausman@schwarzvogel.de>)
        id 1pgkkT-0001Nv-1M;
        Mon, 27 Mar 2023 13:10:49 +0200
Date:   Mon, 27 Mar 2023 13:10:49 +0200
From:   Tobias Klausmann <klausman@schwarzvogel.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Subject: recent kbuild change (36862e14e31611f9786622db366327209a7aede7)
 broke Debian headers pkg
Message-ID: <f5434ce4-3b10-4052-85b8-5aaf8e58b09a@skade.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hey,

I recently noticed that my generated .deb files for linux-headers had
broken paths:

$ dpkg -c '../linux-headers-6.3.0-rc3_6.3.0-rc3-35_amd64.deb'
[...]
drwxr-xr-x root/root         0 2023-03-27 11:10 ./usr/src/linux-headers-/tools/
drwxr-xr-x root/root         0 2023-03-27 11:10 ./usr/src/linux-headers-/tools/objtool/
-rwxr-xr-x root/root    843880 2023-03-27 11:10 ./usr/src/linux-headers-/tools/objtool/objtool
[...]

I bisected it, and it seems the commit in the subject is the culprit. I
tried figuring out what exactly broke, but my Makefile skills are all
atrophied :)

I can provide more info as needed. Also, if you prefer, I can report
this on the kernel Bugzilla.

Best,
Tobias

-- 
Sent from aboard the Culture ship
	GCU (Ridge Class) Jaundiced Outlook
