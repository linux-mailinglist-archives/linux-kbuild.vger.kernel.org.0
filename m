Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CA6FFF82
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 08:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfKRHbm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Nov 2019 02:31:42 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50224 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfKRHbm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 02:31:42 -0500
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xAI7VQBK021482;
        Mon, 18 Nov 2019 16:31:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xAI7VQBK021482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574062287;
        bh=emxptW2soOFW3R7+ZpydijJ0615//BEKeeTXQTbjo+A=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=kGz1y8NQK+2kg0hZ1K/Anw6af7KOMxf9L70CvdNNvRL1CK3LQUqxWyUBPw/mJXAe5
         TAHK8bAq0pjDntY2MJe28zNtBsHsvjsEEY0abeSAxK4/EPhm0IyNOzHpvaBJkQdDzq
         sYJj796mw5KxMLqEWZ0JDPb4kaNzRjq6fgV6UlnPU2UnyqgbBVIu0qyyUPHeg2mh/Q
         1IBDgEc1Kg/Lw0HKw8F8QCLbBzzf4F7RDm8PBopETciK68zQQ4XAPquqXRcSNDx0eK
         GfOFn5rgcvOFBvrW2thmQTojyrQzG8UH/4UYhqHXXVAVBOs0EXULdkcMDB2VAQMn7+
         hidLmB+vt214A==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id w10so2446275uar.12;
        Sun, 17 Nov 2019 23:31:27 -0800 (PST)
X-Gm-Message-State: APjAAAWNpa4xpWXw09R+1zEK6RZ1m6V4o1IL1U0uMzeLdTHihFfji8Wt
        YgrXLSzUQiFAx1NTLcfkAm7LzuhCi2ZROlz1EhM=
X-Google-Smtp-Source: APXvYqy4UcbDIObxmfCY0q8w22O5AZC1dbRPJMJhFK3iq/NB6chvtlo7aIKdtjY1+hqmNOwb8KB5/McoONye+v1x9Ws=
X-Received: by 2002:ab0:279a:: with SMTP id t26mr16477375uap.40.1574062286127;
 Sun, 17 Nov 2019 23:31:26 -0800 (PST)
MIME-Version: 1.0
References: <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
 <20191105023243.GA16635@fieldses.org> <CAK7LNARAgOEnMRYAyzbvJ-xZzFfwOMckxb=bW0-E+P1HYu5nhA@mail.gmail.com>
 <20191106043120.GB6355@fieldses.org> <20191106044223.GA18076@Gentoo>
 <20191106193010.GG17669@fieldses.org> <20191106223918.GB1852@Slackware>
 <CAK7LNASvoh1k=vw6DOyTXa5xYDYNT5uH-5YWS=_95t9XwfAgTQ@mail.gmail.com>
 <20191109111335.GA1198@Gentoo> <CAK7LNAR9PrnXWhA6CCvgexpwVfeZxvHiXp_JtKH7Xb1OZDGusw@mail.gmail.com>
 <20191115152102.GA23525@Gentoo>
In-Reply-To: <20191115152102.GA23525@Gentoo>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 18 Nov 2019 16:30:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhV9Zy20WRQmZRkcVLtWYT_LKjrpT_Pyx75auCp_veLg@mail.gmail.com>
Message-ID: <CAK7LNARhV9Zy20WRQmZRkcVLtWYT_LKjrpT_Pyx75auCp_veLg@mail.gmail.com>
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000006b6e5d059799effa"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--0000000000006b6e5d059799effa
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 16, 2019 at 12:21 AM Bhaskar Chowdhury
<unixbhaskar@gmail.com> wrote:
>
> On 10:58 Fri 15 Nov 2019, Masahiro Yamada wrote:
> >On Sat, Nov 9, 2019 at 8:14 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> >>
> >> On 16:25 Sat 09 Nov 2019, Masahiro Yamada wrote:
> >> >On Thu, Nov 7, 2019 at 7:39 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> >> >>
> >> >> On 14:30 Wed 06 Nov 2019, J. Bruce Fields wrote:
> >> >> >On Wed, Nov 06, 2019 at 10:12:26AM +0530, Bhaskar Chowdhury wrote:
> >> >> >> On 23:31 Tue 05 Nov 2019, J. Bruce Fields wrote:
> >> >> >> >On Wed, Nov 06, 2019 at 11:53:28AM +0900, Masahiro Yamada wrote:
> >> >> >> >>BTW.
> >> >> >> >>Bruce,
> >> >> >> >>Does the current script expect RHEL or something?
> >> >> >> >>I do not see 'new-kernel-pkg' on my Ubuntu machine.
> >> >> >> >
> >> >> >> >I test on Fedora.  Looks like on recent Fedora that's only provided by
> >> >> >> >an rpm "grubby-deprecated", which is an inauspicious name....
> >> >> >> >
> >> >> >> >I think maybe you're supposed to use "grubby" itself now.  Do you have
> >> >> >> >that?
> >> >> >> >
> >> >> >> >>It would still work with 'new-kernel-pkg: command not found'
> >> >> >> >>warning.
> >> >> >> >>
> >> >> >> >>We could bypass it if we like.
> >> >> >> >>
> >> >> >> >>command -v new-kernel-pkg && new-kernel-pkg --remove $f
> >> >> >> >
> >> >> >> >Looks like it's what updates the grub configuration, which is probably a
> >> >> >> >nice thing to do if you can.
> >> >> >> >
> >> >> >> >--b.
> >> >> >>
> >> >> >> Bruce,
> >> >> >>
> >> >> >> Two things,
> >> >> >>
> >> >> >> If the system doesn't run grub , how the fallback policy???
> >> >> >>
> >> >> >> This binary "new-kernel-pkg" also missing in other systems too...I can
> >> >> >> confirm that... i.e gentoo,slackware,
> >> >> >>
> >> >> >> So , you are only targeting the rpm based system????
> >> >> >
> >> >> >It's just what I happen to use.  If someone wants to make it work
> >> >> >elsewhere that'd be great, as long as we don't break what already works.
> >> >> >
> >> >> >I think Debian uses grub2-mkconfig?  Might be OK for Fedora too, I
> >> >> >dunno.
> >> >> >
> >> >> >--b.
> >> >>
> >> >> Okay , thanks for the input. I was trying to write something in
> >> >> generalize way , that is why my code spins off.And if you see the
> >> >> subject line of my very first attempt to patch written was "removing
> >> >> old kernels and modules dir in selective way"... that was it.
> >> >>
> >> >> Now, there are plenty of distros around, not only rpm based one(yes I do
> >> >> agree that ,you wrote it while using and testing on it, but that is
> >> >> limited in nature),the broader user base might be using something else.
> >> >>
> >> >> we simply can not restrict it to certain packaging version or several
> >> >> packaging versions of selected distros. We are making and building this
> >> >> (worth an effort) to make it as generalized as possible.
> >> >>
> >> >> Importantly I was only thinking of people who put the stuff in standard
> >> >> places in the FSH and use it. I might be wrong.
> >> >>
> >> >> As I have said it before, I was no way trying to bypass your work ,but
> >> >> it seems very limited in nature to adopted. So trying to widen the
> >> >> spectrum.
> >> >>
> >> >> I am trying to incorporating both the pole, different kind user base in
> >> >> mind, like you , who don't like to be prompted for this operation and
> >> >> assuming things should go well, and you are right.
> >> >>
> >> >> On the other hand , I am kinda guy , sometime I need to know what is
> >> >> going on, so the prompting.
> >> >>
> >> >> Well, I have never taken into account about modifying the bootloader
> >> >> config by looking at your work. Had I been, I would have done it already
> >> >> and it would be extremely trivial in nature.
> >> >>
> >> >> Now, Grub, no doubt it's fantastic piece of software, but complexity
> >> >> is paramount with it. Don't you think so???  I HAVE NOTHING AGAINST
> >> >> GRUB!
> >> >>
> >> >> I have personally stops using it for years and using something very
> >> >> rudimentary and simple and useful. That is because I know what I am
> >> >> doing and my system well.
> >> >>
> >> >> Caveat emptor: that was me, not every one else in the wild. Grub is used
> >> >> by the most distro by default,everybody knows it,but certainly not the
> >> >> norm.
> >> >>
> >> >> I would love to give it a stab again and if you better people feel it is
> >> >> necessary, but I need some concrete understanding from you,Masahiro and
> >> >> Randy(who is helping me actively).
> >> >>
> >> >> Say, You people might come up ,
> >> >>
> >> >> We need these :
> >> >>
> >> >> a)
> >> >> b)
> >> >> c)
> >> >>
> >> >> and we don't need these:
> >> >>
> >> >> a)
> >> >> b)
> >> >> c)
> >> >>
> >> >>
> >> >> My two cents! kindly, flame me with your thoughts.
> >> >
> >> >
> >> >Honestly, I did not even know this script
> >> >before you submitted the patch.
> >> >
> >> :)
> >>
> >> >I prune stale kernel/modules with my own script,
> >> >and I guess people do similar to meet their demand.
> >> >
> >> I do the same.
> >>
> >> >I am not sure how many people are using this.
> >> Only people who look up in the kernel source scripts directory , nobody
> >> else for sure.
> >> >If somebody is passionate to improve this script
> >> >in a simple way, that is fine, but
> >> >I do not want to see messy code for covering various use-cases.
> >> Agreed. That is why need guideline from you people(You, Randy and Bruce
> >> needs to tell me clearly), like what I mentioned, we can do
> >> these and we can not do these. I am asking because you people have had more
> >> exposure ,so might come up with some valid points to build up.
> >> >
> >
> >We have two topics here.
> >
> >[1]  add the interactive option
> For that, my last patch stand , I have covered it in a sane way, please try that
> once more with options.Yes , you said, the modules directory should be
> pruned at once with kernel. But , every system keeps the modules
> directory in different names AFAIK. So, the explicitness of the calling.
> >[2]  do nice things for non-rpm systems
> Bruce's code cover the base for RPM based system , which can be applied
> to other similar distribution using that format.Provided I figure out
> the "unknown binary" in the code.
>
> I might add other packaging format distribution to cover. Those will
> append behind the existing code.
> >
> >
> >They should be done by separate patches.
> >
> Agreed. Moduler and clear.
> >I think [1] is easy to do in a few liners.
> >
> My last patch stand.AFAIK...let me know if you feel it should be done
> differently.
> >
> >For [2], I am not sure how well it goes
> >until I see an actual patch.


As I said before, your patch is replacing everything,
and breaking how it previously worked.

If you want to support the interactive mode,
what you need to do is quite simple -
1) check the command line option -i
2) if -i is given, show a prompt before the removal


It would be possible to do these
in smaller changes.
I attached a sample patch.






> That would be a undertaking to deal with the native packaging system for
> different distributions.
>
> >--
> >Best Regards
> >Masahiro Yamada
>
> Thanks,
> Bhaskar



-- 
Best Regards
Masahiro Yamada

--0000000000006b6e5d059799effa
Content-Type: text/x-patch; charset="US-ASCII"; name="prune-kernel.diff"
Content-Disposition: attachment; filename="prune-kernel.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_k343ch1n0>
X-Attachment-Id: f_k343ch1n0

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvcHJ1bmUta2VybmVsIGIvc2NyaXB0cy9wcnVuZS1rZXJuZWwK
aW5kZXggZThhYTk0MGJjMGE5Li45MDkxZWUxMTI1ZjUgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvcHJ1
bmUta2VybmVsCisrKyBiL3NjcmlwdHMvcHJ1bmUta2VybmVsCkBAIC01LDYgKzUsMTEgQEAKICMg
YWdhaW4sIC9ib290IGFuZCAvbGliL21vZHVsZXMvIGV2ZW50dWFsbHkgZmlsbCB1cC4KICMgRHVt
YiBzY3JpcHQgdG8gcHVyZ2UgdGhhdCBzdHVmZjoKIAoraWYgWyAiJDEiID0gLWkgXTsgdGhlbgor
CWludGVyYWN0aXZlPXkKKwlzaGlmdAorZmkKKwogZm9yIGYgaW4gIiRAIgogZG8KICAgICAgICAg
aWYgcnBtIC1xZiAiL2xpYi9tb2R1bGVzLyRmIiA+L2Rldi9udWxsOyB0aGVuCkBAIC0xMiwxMCAr
MTcsMjAgQEAgZG8KICAgICAgICAgZWxpZiBbICQodW5hbWUgLXIpID0gIiRmIiBdOyB0aGVuCiAg
ICAgICAgICAgICAgICAgZWNobyAia2VlcGluZyAkZiAocnVubmluZyBrZXJuZWwpICIKICAgICAg
ICAgZWxzZQotICAgICAgICAgICAgICAgIGVjaG8gInJlbW92aW5nICRmIgotICAgICAgICAgICAg
ICAgIHJtIC1mICIvYm9vdC9pbml0cmFtZnMtJGYuaW1nIiAiL2Jvb3QvU3lzdGVtLm1hcC0kZiIK
LSAgICAgICAgICAgICAgICBybSAtZiAiL2Jvb3Qvdm1saW51ei0kZiIgICAiL2Jvb3QvY29uZmln
LSRmIgotICAgICAgICAgICAgICAgIHJtIC1yZiAiL2xpYi9tb2R1bGVzLyRmIgotICAgICAgICAg
ICAgICAgIG5ldy1rZXJuZWwtcGtnIC0tcmVtb3ZlICRmCisJCWZvciBnIGluICQobHMgLWQgL2Jv
b3QvaW5pdHJhbWZzLSRmLmltZyAvYm9vdC9TeXN0ZW0ubWFwLSRmIFwKKwkJCSAgIC9ib290L3Zt
bGludXotJGYgL2Jvb3QvY29uZmlnLSRmIC9saWIvbW9kdWxlcy8kZiBcCisJCQkgICAyPi9kZXYv
bnVsbCkKKwkJZG8KKwkJCWlmIFsgIiRpbnRlcmFjdGl2ZSIgPSB5IF07IHRoZW4KKwkJCQlwcmlu
dGYgInJlbW92ZSAnJGcnPyAiCisJCQkJcmVhZCBhbnMKKwkJCQlpZiBbICRhbnMgIT0gWSAtYSAk
YW5zICE9IHkgXTsgdGhlbgorCQkJCQljb250aW51ZQorCQkJCWZpCisJCQllbHNlCisJCQkJZWNo
byAicmVtb3ZpbmcgJyRnJyIKKwkJCWZpCisJCQlybSAtcmYgJGcKKwkJZG9uZQogICAgICAgICBm
aQogZG9uZQo=
--0000000000006b6e5d059799effa--
