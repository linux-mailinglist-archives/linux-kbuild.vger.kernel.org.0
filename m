Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C8214E6F4
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2020 03:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgAaCJs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 21:09:48 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34011 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbgAaCJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 21:09:48 -0500
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 00V29a5f030104;
        Fri, 31 Jan 2020 11:09:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 00V29a5f030104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580436577;
        bh=1ml7WK63dNBM7MHoN9Z9msiF/YNQtLKjJ8iQrEqO4mg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Wu4frIsLmTiGVqxzf+hfs35hXsedrDOhCMDyBOeOWWfMcXNdIUrLQDnWdOJV3Ogii
         k8FNrtXxmHBPGHxz+Tz84EW44Hc3lky8Op7V/6FxlLlKy61DCeLJzHSzbhM8f613Ab
         c1qm8Icor9MygJhZf+wi/kc3VFb/svN8CQMsZi9vLBrqPpWz5V96C9gcW6y6s/k3JO
         Hm5zE12friJfgFDgWygobiw9vgXwyqLVVr24AENz+AiXMp1VjN7H/MplrqKhz0Az6z
         D9T+3cYd7E5L2b48I+cKXW3yDC3uwzgedlme73sJn/odwdEDjMYXjIh9l8dQX0xZ3u
         okmF6vdbi2aBA==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id c129so1656838vkh.7;
        Thu, 30 Jan 2020 18:09:37 -0800 (PST)
X-Gm-Message-State: APjAAAX9ar1dAKUZvL3H/YfrspDBgwfqswhkfJHGPvGOKBy8AF0YDR0l
        Et/Gh3o55mWvSXfAaaG0TsH67MOfp+Rr3xwLBhI=
X-Google-Smtp-Source: APXvYqwdA+Fex+HuhRymUnLjk7XdUW2IH0faVNX5Ii7SGIr3HF5wsVwXxXeG08q+In5n+9NDH3H9d+sdY9soiVEJV7I=
X-Received: by 2002:a1f:bfc2:: with SMTP id p185mr5026562vkf.73.1580436575822;
 Thu, 30 Jan 2020 18:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20200130122221.30029e32@gandalf.local.home> <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
 <20200130143941.23a0e217@gandalf.local.home>
In-Reply-To: <20200130143941.23a0e217@gandalf.local.home>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 31 Jan 2020 11:08:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNATryPUSTm8wPTFHO=E5f=sVPM4T0UxT=BF2qeyVehsH6Q@mail.gmail.com>
Message-ID: <CAK7LNATryPUSTm8wPTFHO=E5f=sVPM4T0UxT=BF2qeyVehsH6Q@mail.gmail.com>
Subject: Re: [GIT PULL] kconfig: localmodconfig: Minor clean ups to streamline_config.pl
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 31, 2020 at 4:39 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 31 Jan 2020 03:30:37 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> >
> > I know you are the author of streamline_config,
> > but actually did not know you were collecting
> > patches for this particular file.
> >
> >
> > I did not receive a notice email from you,
> > nor did these commits appear in linux-next at all.
> > Could you send a notice email when
> > you pick up a patch next time?
> > (Sorry, I also forgot to send a email.
> > I will drop them from my tree.)
> >
>
>
> It's my fault. I was looking through my inbox (actually my local
> patchwork that reads my inbox) and saw these patches from back in
> December. I then went to my "kconfig" development git repo, and saw I
> pulled them in, but never actually pushed them anywhere (not even to my
> "staging" machine where I stage my pushes to kernel.org).
>
> This being the merge window, I rushed to get them in as they were very
> trivial changes. This isn't my normal flow, it was more "Oh crap! I
> forgot about these, let me get them in now".
>
> If you have them in your tree, I'm fine with them getting in from there.
> I should have looked in next (I only looked to see if Linus already had
> them).
>
> Note, since this file hasn't been updated in years, my kconfig
> 'for-next' branch has been removed from linux-next :-/
>


Steven,

OK, I see.  I will also try my best to send a notice email.
I want to avoid a situation where two people
are picking up the same patches without noticing each other.



Linus,

If you have not pulled this one yet,
could you ignore it?


I will soon send pull requests for Kbuild + Kconfig,
which includes the same patches.



-- 
Best Regards
Masahiro Yamada
