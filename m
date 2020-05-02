Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061A51C2630
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 16:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgEBObM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 10:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgEBObL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 10:31:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F884C061A0C;
        Sat,  2 May 2020 07:31:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s18so6010362pgl.12;
        Sat, 02 May 2020 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vhi2tvdPkQONRnK1IeM1tHo7lHmp8jdJZUoTTd6D+Ag=;
        b=KqOsiBJpLDVTukQX0u2+4+6PR5r/Wn8QsUF74GKgAgL/ianIkHjTcjdnkRlujFZNOf
         WvRDCZyaYgIErtPkQHJVMF5/7MChkji3RYu2N6cAjxaf2Yz1dU/uW7WDUOntMOy1LT/7
         vlkg1ehGLs1/nS77pMu8ElfVplyocf5qR0NtSEuAK+zZgY4CZ0C3qEBZbhl92BDMll7D
         YdvvSmiy14FrNr57+IjTS7czhgGgZH/Ex7mS8KDOzH9D8P+t6FjhYhYh3yVBngYfda42
         o/9P6QnGZmg+JREoVDoznHYmY1S20a09pzyBQvSwney/u/TiDjctWAG9tqsxKt0KnL89
         i4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vhi2tvdPkQONRnK1IeM1tHo7lHmp8jdJZUoTTd6D+Ag=;
        b=Ic0cnceuQoREPicwpydK1Nu07kG25PkxGnZm9NJCoLkHAe5KfxEDw4CQWDox1/Na98
         +pw2TB7vTaMC/+oGcepzD3o7MAfYNqHWsM11m2pTpqGcyU9w5X+JYNVc+INmjOKw2hWE
         ZU9w6P61iXfeWdgp5wov5t1nxG/XRqo+Qs6Q5YnYuFBOiIm571CSInJ9Be8Elps3Vp0s
         vQmH2w6AmB9Ha0dZDiQFdBpmOYzs8WnJd8QHEsAephgDFZ/PtzgJ39iwR59as/tb6YrR
         pNkdhEXHVD0vP8RW3HIV91HENrt/VzCrrAF2rN1Z74XrsMdAuVsagWJo3QN0nvImnKc8
         Vslg==
X-Gm-Message-State: AGi0Pubz9mHxs3DN5i4mLizlMoJ4UHJrNF78ef+uIz0/LJUPgVDM2bl4
        9zvmln6qAvvo13hbz6XBvWs=
X-Google-Smtp-Source: APiQypIGB/651r3FlV11uzBvQ+F44rjU0ixNxQkSmV2X7LIlXcSlhStwSkHbmYKJJEixkpom3jOgwQ==
X-Received: by 2002:a65:6882:: with SMTP id e2mr8672696pgt.170.1588429870711;
        Sat, 02 May 2020 07:31:10 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id c80sm4587098pfb.82.2020.05.02.07.31.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 07:31:09 -0700 (PDT)
Date:   Sat, 2 May 2020 14:31:08 +0000
From:   Changbin Du <changbin.du@gmail.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Changbin Du <changbin.du@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200502143106.7cpbots6oriib26v@mail.google.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
 <20200501130729.3a3e4994@gandalf.local.home>
 <20200502133054.gx77eoas7u7gnxxm@mail.google.com>
 <20200502094024.6142a04e@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502094024.6142a04e@oasis.local.home>
User-Agent: NeoMutt/20180716-508-7c9a6d
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi, Steven,
On Sat, May 02, 2020 at 09:40:24AM -0400, Steven Rostedt wrote:
> On Sat, 2 May 2020 21:30:54 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > > > Sometimes it is useful to preserve batches of configs when making
> > > > localmodconfig. For example, I usually don't want any usb and fs
> > > > modules to be disabled. Now we can do it by:
> > > > 
> > > >  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig  
> > > 
> > > That's too much typing ;-) What about just "KEEP='drivers/usb;fs'"?
> > >  
> > I think we'd better use a long name since it will be passed to the entire kbuild.
> > And we alreay have one named LOCALMODCONFIG_DEBUG. The prefix LOCALMODCONFIG_
> > can help to avoid namespace pollution.
> 
> I politely disagree. Build options is not common. The
> LOCALMODCONFIG_DEBUG is an environment variable, which I couldn't just
> use DEBUG.
> 
This is what I am worried about since LOCALMODCONFIG_PRESERVE also is an
environment variable. A short name possibly overwrite internal kbuild
variables.

> If you absolutely require a prefix, shorten it to LMC_ or something. I
> already hate typing 'localmodconfig' once ;-)
> 
I undstand your pain. This why I never type 'localmodconfig' but copy it
from 'make help' :). Maybe we can get more inputs from others.

> -- Steve

-- 
Cheers,
Changbin Du
