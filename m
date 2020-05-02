Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDD91C27A7
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 20:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgEBS3z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 14:29:55 -0400
Received: from mail.nic.cz ([217.31.204.67]:58004 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728252AbgEBS3z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 14:29:55 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 70FE6141BBC;
        Sat,  2 May 2020 20:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1588444189; bh=X2QkZXVxyMa7J/twRjrZzAq9+mUWcgLFy24w6guzz/k=;
        h=Date:From:To;
        b=N6yJ4PikshmQIrIjjOlLk5/XnyeMwQ65ap1i/gz6fXbYV6hT4xGCfIT1aD2jhcLlk
         bUz7P/VjMtk8nlep/cIjFDQGINCwHr9aEUA49kMBW+Ki+YhvE3YZFrm1CJELcBcKPo
         e2DI3/d2M/AHS0JSM7GZsdgEekW2Bd3k8xANUmd4=
Date:   Sat, 2 May 2020 20:29:43 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH kbuild RFC] kbuild: fix modpost throwing away module
 symvers when linking vmlinux.o
Message-ID: <20200502202943.0c13a451@nic.cz>
In-Reply-To: <20200501224300.1012-1-marek.behun@nic.cz>
References: <20200501224300.1012-1-marek.behun@nic.cz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just to note how this breaks things:

On OpenWRT this may happen
1. make modules is run
   - Module.symvers contains symbols from modules
2. make Image/bzImage is run (as part of another OpenWRT make target)
   - Module.symvers is rewritten to contain only vmlinux.o symbols
3. external kernel modules try to build (wireguard, mac80211)
   - this now fails because external modules may depend on symbols from
     other modules and this information isn't in Module.symvers anymore

Marek
