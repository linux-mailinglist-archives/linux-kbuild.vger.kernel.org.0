Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3627E34A2D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Mar 2021 09:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhCZH7g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Mar 2021 03:59:36 -0400
Received: from smtprelay0186.hostedemail.com ([216.40.44.186]:52784 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229528AbhCZH7Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Mar 2021 03:59:24 -0400
X-Greylist: delayed 445 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Mar 2021 03:59:24 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id A132B1802CCDB
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Mar 2021 07:51:59 +0000 (UTC)
Received: from omf10.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 45B281802A07B;
        Fri, 26 Mar 2021 07:51:54 +0000 (UTC)
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA id 164B52351F7;
        Fri, 26 Mar 2021 07:51:52 +0000 (UTC)
Message-ID: <2af5ea06f8ebd20e0d3bdd51bd8a44f5fdad08d9.camel@perches.com>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim
 users
From:   Joe Perches <joe@perches.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Date:   Fri, 26 Mar 2021 00:51:51 -0700
In-Reply-To: <20210325095039.7202d675@gandalf.local.home>
References: <20210322213806.089334551@goodmis.org>
         <20210322214032.293992979@goodmis.org>
         <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
         <20210324095417.49c6377b@gandalf.local.home>
         <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
         <20210325095039.7202d675@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.10
X-Rspamd-Server: rspamout02
X-Stat-Signature: yiew45t8hn63jayzix9m7w1ekgn33n4o
X-Rspamd-Queue-Id: 164B52351F7
X-HE-Tag: 1616745112-554895
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2021-03-25 at 09:50 -0400, Steven Rostedt wrote:
> On Thu, 25 Mar 2021 15:20:13 +0900 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > 
> > The root cause of inconsistency is that
> > you mix up space-indentation and tab-indentation.
> > I do not know if it is a standard way either.
> 
> This is the default way emacs has edited perl files for as long as I can
> remember (back to 1996). It became my standard of editing perl files just
> because of that. For everything else, I use tabs.
[]
> > For example, scripts/checkpatch.pl uses only tabs,
> > which I think is more robust.
> 
> Probably because Joe probably uses vim ;-)

I generally use emacs.  Maybe Andy Whitcroft uses vim.
For checkpatch.pl I just followed Andy's style.
get_maintainer.pl uses the 4 spaces then 1 tab style like Steven uses.

perl code can be pretty long left to right so using smaller indentation
seems useful there.

