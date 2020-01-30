Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94BAD14E34F
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2020 20:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgA3Tjo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 14:39:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:52768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgA3Tjo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 14:39:44 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E38A920CC7;
        Thu, 30 Jan 2020 19:39:42 +0000 (UTC)
Date:   Thu, 30 Jan 2020 14:39:41 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] kconfig: localmodconfig: Minor clean ups to
 streamline_config.pl
Message-ID: <20200130143941.23a0e217@gandalf.local.home>
In-Reply-To: <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
References: <20200130122221.30029e32@gandalf.local.home>
        <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 31 Jan 2020 03:30:37 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> 
> I know you are the author of streamline_config,
> but actually did not know you were collecting
> patches for this particular file.
> 
> 
> I did not receive a notice email from you,
> nor did these commits appear in linux-next at all.
> Could you send a notice email when
> you pick up a patch next time?
> (Sorry, I also forgot to send a email.
> I will drop them from my tree.)
> 


It's my fault. I was looking through my inbox (actually my local
patchwork that reads my inbox) and saw these patches from back in
December. I then went to my "kconfig" development git repo, and saw I
pulled them in, but never actually pushed them anywhere (not even to my
"staging" machine where I stage my pushes to kernel.org).

This being the merge window, I rushed to get them in as they were very
trivial changes. This isn't my normal flow, it was more "Oh crap! I
forgot about these, let me get them in now".

If you have them in your tree, I'm fine with them getting in from there.
I should have looked in next (I only looked to see if Linus already had
them).

Note, since this file hasn't been updated in years, my kconfig
'for-next' branch has been removed from linux-next :-/

-- Steve
