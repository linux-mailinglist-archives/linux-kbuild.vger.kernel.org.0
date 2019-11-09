Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43A3F5DC7
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2019 08:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfKIH0A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Nov 2019 02:26:00 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29601 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfKIHZ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Nov 2019 02:25:59 -0500
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id xA97Pm3i024560;
        Sat, 9 Nov 2019 16:25:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com xA97Pm3i024560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573284349;
        bh=L9R9pJji5jVFslJYY8d/v4RAOOXUuB+GFMxYCssZSho=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cc/GDpDEYsa6QDEAY+He84nVqZ4/HIQ3qa/QE24xLc1DSNQQ6A8rdwpKaj2WDtDjG
         1L8Lwtm+qwy3Ubt3p8TRIzhyqVVdqc0rGxEdACXBBjHkct4C1QU5OTly3FeU4gWm7M
         sEe4t71hYDUzlMNu0esIb72GfmJA/OLi3UCzOQH8S4FKGk64WQ8zUBZOKvA4hR5Wro
         fWX2bO1DnIjIiJxHV3ltb40QDWf6/IG7EQKu1JxxKeT9KmJXGboE6OmorL1Q0qLLXd
         7uPFcZSkFiaWtSsnaJuA7MvvuwuHWb2+lph5jpzDzBBLwbbCaPK0aupZX/T09wKJCb
         tYrYWcJOj5MJA==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id e205so2056309vke.2;
        Fri, 08 Nov 2019 23:25:49 -0800 (PST)
X-Gm-Message-State: APjAAAWVXx3vfffF62pnEesUHBXleBe4fCX/vdq67BcvpvI6djK6E9Dd
        j/WSWohrAi4luwXYRrp0sVm+zP6yO+Cfr5lc9Vw=
X-Google-Smtp-Source: APXvYqy8S+kpCoAxNnMMUJS6CQ+70S7UYygQuU7EndbyiXhyfchswaWaKYA86TL2aaM2rreGwyfE/OSSUuJLTY0q0GM=
X-Received: by 2002:a1f:4b05:: with SMTP id y5mr10444571vka.12.1573284347802;
 Fri, 08 Nov 2019 23:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20191102063036.28601-1-unixbhaskar@gmail.com> <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org> <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org> <20191106044223.GA18076@Gentoo>
 <20191106193010.GG17669@fieldses.org> <20191106223918.GB1852@Slackware>
In-Reply-To: <20191106223918.GB1852@Slackware>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 9 Nov 2019 16:25:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com>
Message-ID: <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 7, 2019 at 7:39 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> On 14:30 Wed 06 Nov 2019, J. Bruce Fields wrote:
> >On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
> >> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
> >> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
> >> >>BTW.
> >> >>Bruce,
> >> >>Does the current script expect RHEL or something?
> >> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
> >> >
> >> >I test on Fedora.  Looks like on recent Fedora that's only provided by
> >> >an rpm "grubby-deprecated", which is an inauspicious name....
> >> >
> >> >I think maybe you're supposed to use "grubby" itself now.  Do you have
> >> >that?
> >> >
> >> >>It would still work with 'new-kernel-pkg: command not found'
> >> >>warning.
> >> >>
> >> >>We could bypass it if we like.
> >> >>
> >> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
> >> >
> >> >Looks like it's what updates the grub configuration, which is probably a
> >> >nice thing to do if you can.
> >> >
> >> >--b.
> >>
> >> Bruce,
> >>
> >> Two things,
> >>
> >> If the system doesn't run grub , how the fallback policy???
> >>
> >> This binary "new-kernel-pkg" also missing in other systems too...I can
> >> confirm that... i.e gentoo,slackware,
> >>
> >> So , you are only targeting the rpm based system????
> >
> >It's just what I happen to use.  If someone wants to make it work
> >elsewhere that'd be great, as long as we don't break what already works.
> >
> >I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
> >dunno.
> >
> >--b.
>
> Okay , thanks for the input. I was trying to write something in
> generalize way , that is why my code spins off.And if you see the
> subject line of my very first attempt to patch written was "removing
> old kernels and modules dir in selective way"... that was it.
>
> Now, there are plenty of distros around, not only rpm based one(yes I do
> agree that ,you wrote it while using and testing on it, but that is
> limited in nature),the broader user base might be using something else.
>
> we simply can not restrict it to certain packaging version or several
> packaging versions of selected distros. We are making and building this
> (worth an effort) to make it as generalized as possible.
>
> Importantly I was only thinking of people who put the stuff in standard
> places in the FSH and use it. I might be wrong.
>
> As I have said it before, I was no way trying to bypass your work ,but
> it seems very limited in nature to adopted. So trying to widen the
> spectrum.
>
> I am trying to incorporating both the pole, different kind user base in
> mind, like you , who don't like to be prompted for this operation and
> assuming things should go well, and you are right.
>
> On the other hand , I am kinda guy , sometime I need to know what is
> going on, so the prompting.
>
> Well, I have never taken into account about modifying the bootloader
> config by looking at your work. Had I been, I would have done it already
> and it would be extremely trivial in nature.
>
> Now, Grub, no doubt it's fantastic piece of software, but complexity
> is paramount with it. Don't you think so???  I HAVE NOTHING AGAINST
> GRUB!
>
> I have personally stops using it for years and using something very
> rudimentary and simple and useful. That is because I know what I am
> doing and my system well.
>
> Caveat emptor: that was me, not every one else in the wild. Grub is used
> by the most distro by default,everybody knows it,but certainly not the
> norm.
>
> I would love to give it a stab again and if you better people feel it is
> necessary, but I need some concrete understanding from you,Masahiro and
> Randy(who is helping me actively).
>
> Say, You people might come up ,
>
> We need these :
>
> a)
> b)
> c)
>
> and we don't need these:
>
> a)
> b)
> c)
>
>
> My two cents! kindly, flame me with your thoughts.


Honestly, I did not even know this script
before you submitted the patch.

I prune stale kernel/modules with my own script,
and I guess people do similar to meet their demand.

I am not sure how many people are using this.
If somebody is passionate to improve this script
in a simple way, that is fine, but
I do not want to see messy code for covering various use-cases.

-- 
Best Regards
Masahiro Yamada
