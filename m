Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B87646F517
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Dec 2021 21:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhLIUoN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Dec 2021 15:44:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbhLIUoN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Dec 2021 15:44:13 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9633DC061746;
        Thu,  9 Dec 2021 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
        bh=bG5qQMAl6wHLs3c9e3C/JvmbcaZe6O3BsiSBfN0SM0A=; b=C2PVF5Nn738SuwXt0ERKHcxQDh
        FnjMAvBPAKYeXJp++OQWL80V3NtrMJwjeqFQmf7sVS2WxesrAOzziProhWgxdHLbN5lMV+USHy+hF
        TVbyxWYXgGq6jaYjS7v2sp0YayAOUNk/a9L/yBA2zszukWF0nFL7yDYz0rNxes4Z15k5iDIAwdmfs
        TlGNVH1ccUkRBLi9IikEA0hqPmBcgcmkf+KE+wn0zUd13r3EB+/49qKIn9Z8av8gUMUhwwDiz/w3Z
        jEW2AvDjVR+nVuPRJznQ8YENU5zw8UsYl8zQQRKYuqCyF5eqA7crssH9ekhMKc5yEcIE4wQt97Tsg
        aHZ8joDg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mvQDN-00HVRD-Pw; Thu, 09 Dec 2021 20:40:29 +0000
Date:   Thu, 9 Dec 2021 12:40:29 -0800
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Vimal Agrawal <Vimal.Agrawal@sophos.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jan Beulich <JBeulich@suse.com>, Jeff Mahoney <jeffm@suse.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "jeyu@kernel.org" <jeyu@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kernel/module.c: fix for symbol decode in stack trace
 for stripped modules
Message-ID: <YbJpvT/zRBuyuNxT@bombadil.infradead.org>
References: <LO2P265MB2671DF8D82C0C6A1504D85D6939F9@LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM>
 <LO2P265MB267173F563B0A2CA5995FA2C939F9@LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM>
 <106F23FD-3768-4CF0-893D-EDFE4A0BA2BF@sophos.com>
 <YbEIe+jxzQTFPHwk@bombadil.infradead.org>
 <DB2D69B2-B523-4626-BDCE-CE7DEFCD9268@sophos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB2D69B2-B523-4626-BDCE-CE7DEFCD9268@sophos.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 09, 2021 at 05:37:48AM +0000, Vimal Agrawal wrote:
> Hi Luis,
> 
> My replies in-line under Vimal>>
> 
> Thanks,
> Vimal
> 
> ﻿-----Original Message-----
> From: Luis Chamberlain <mcgrof@infradead.org> on behalf of Luis Chamberlain <mcgrof@kernel.org>
> Date: Thursday, 9 December 2021 at 1:03 AM
> To: Vimal Agrawal <Vimal.Agrawal@sophos.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Jan Beulich <JBeulich@suse.com>, Jeff Mahoney <jeffm@suse.com>, Sam Ravnborg <sam@ravnborg.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
> Cc: "jeyu@kernel.org" <jeyu@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH] kernel/module.c: fix for symbol decode in stack trace for stripped modules
> 
>     Thanks for your patch! I will note to start off with that unfortunately
>     whatever it is you use to send emails leaves them with UTF encodings
>     which does not let me easily download the patches using lore. For
>     instance, this is what I see:
> 
>     https://lore.kernel.org/all/106F23FD-3768-4CF0-893D-EDFE4A0BA2BF@sophos.com/raw
> 
>     Here is an example of a good patch:
> 
>     https://lore.kernel.org/all/20211129034509.2646872-2-ming.lei@redhat.com/raw
> 
>     What are you using to send patches? Consider using git send-email.
>     I think your mailer is sending the emails out as MIME attachments.
> Vimal>> I am using outlook app on mac and I changed format to use "plain format text". I will use git send-email from next time for patches.
> Thanks for letting me know.

Oh my. Even your replies do not follow typical development style best
practices. I recommend trying a Mail User Agent like mutt or anything
that can let you reply bottom style, please read:

https://en.wikipedia.org/wiki/Posting_style#Bottom-posting

Your MUA setting for "plain fomat text" seems to have lied.

If you really want a GUI for a MUA, consider Thunderbird.
I am not sure what other ones to recommend for the Mac.

>     On Mon, Nov 22, 2021 at 02:02:30PM +0000, Vimal Agrawal wrote:
>     > If kernel modules are stripped off symbols (say built by using strip --
>     > strip-unneeded)
> 
>     OK so is your build system using something like:
> 
>     make install modules_install INSTALL_MOD_STRIP="--strip-unneeded"
> 
>     At least that's one way to strip modules using upstream techniques since
>     the 2.6 kernel days. Because it would be wise for us to document *how* to
>     reproduce the issue you are seeing in your commit log.
> Vimal>> yes, our build uses INSTALL_MOD_STRIP="--strip-unneeded"

Ok great the commit log should indicate this.

>     > then stack traces in dmesg do not show module name or
>     > symbol name for addresses.
> 
>     as intended. So there is actually no issue and your patch is not a fix.
>     It is an optimization to help readers with a hint. So if we get anywhere
>     with this patch I'd say change the subject to relate it to
>     a heuristic enhancement for INSTALL_MOD_STRIP when --strip-unneeded is used.
> Vimal>> yes, problem is only when --strip-unneeded option is used to strip the modules.

It is not a problem, it is by design.

>     > It just prints absolute address ( without any
>     > reference of module)
>     > e.g.
>     > 
>     > [245864.699580]  do_nmi+0x12f/0x370
>     > [245864.699583]  end_repeat_nmi+0x16/0x50
>     > [245864.699585] RIP: 0010:0xffffffffc06b67ec                           <<<<<<<<
>     > [245864.699585] RSP: 0000:ffffaaa540cffe48 EFLAGS: 00000097
>     > [245864.699586] RAX: 0000000000000001 RBX: ffff93357a729000 RCX: 0000000000000001
>     > [245864.699587] RDX: ffff93357a729050 RSI: 0000000000000000 RDI: ffff93357a729000
>     > [245864.699588] RBP: ffff9335cf521300 R08: 0000000000000001 R09: 0000000000000004
>     > [245864.699588] R10: ffffaaa545b23ed0 R11: 0000000000000001 R12: ffffffffc06b61a0
>     > [245864.699589] R13: ffffaaa540cffe60 R14: ffff9335c77fa3c0 R15: ffff9335cf51d7c0
>     > [245864.699590]  ? 0xffffffffc06b61a0
>     > [245864.699592]  ? 0xffffffffc06b67ec                                  <<<<<<<<
>     > [245864.699593]  ? 0xffffffffc06b67ec
>     > [245864.699594]  </NMI>
>     > 
>     > Note RIP: 0010:0xffffffffc06b67ec and 0xffffffffc06b67ec printed in above
>     > stack trace as absolute address.
>     > There is no easy way in case box crashes as we loose /proc/modules to see
>     > load address of modules to map address to one specific module. It will be
>     > really good to give some hint of module and offset inside module section
>     > about such addresses.
>     > 
>     > so changed kernel/module.c so that it can decode address to _MODULE_START_+
>     > offset/size or _MODULE_INIT_+offset/size depending on where the address
>     > lies (in core/.text or init/.init.text section of module).
>     > 
>     > e.g. nfnm_queue_net_init+0x2f1/0x393 [nfnetmap_queue] printed in case of
>     > symbols present shows up as 0010:0xffffffffc06b67ec in case symbols are
>     > absent. With modified logic, it will be shown as _MODULE_INIT_+0x2f1/0x393
>     > [nfnetmap_queue]
>     > 
>     > This will help for developer to debug and map this to actual nfnm_queue_net
>     > _init symbol later. One can use objdump/readelf/nm to find symbols with
>     > offset in .init.text and .text sections.
>     > 
>     > tests done:
>     > ===========
>     > 1. added WARN_ON_ONE(1) in init_module of a module
>     > ----------------------------------------------------
>     > [53.795977] task: ffff9d60094b3000 task.stack: ffff9d602c704000
>     > [53.795978] RIP: 0010:_MODULE_INIT_+0x2f1/0x393 [nfnetmap_queue]   <=====
> 
>     Huh, if the module is already printed (the [nfnetmap_queue]) why even
>     have _MODULE_INIT_ and instead we just say:
> 
>     [53.795978] RIP: 0010:[module __init]+0x2f1/0x393 [nfnetmap_queue]
> 
>     This way if you come up with other heuristics this can also be put in
>     the [] and we'd document that.
>
> Vimal>> I am fine with that. I used _MODULE_INIT_ and _MODULE_START_
> because I see something similar being reported by bt command in crash
> utility in these cases.  So I took reference of that. See following bt
> from crash utility: <<

Oh boy reading your replies is really difficult. Please please use an
MUA that lets you reply using bottom style, don't do the Vimal>> thing
and instead use the ">" and levels of that to imply what was said last.
The wikipedia article has examples of that and you can see other
mailing list exchanges for how this is done. Also don't make long lines.

> #6 [ffff99cdc059b8c0] _MODULE_START_act_mirred at ffffffffc06cd7ee [act_mirred]
>  #7 [ffff99cdc059b900] tcf_action_exec at ffffffff864c57bc
>  #8 [ffff99cdc059b948] _MODULE_START_cls_u32 at ffffffffc06d2620 [cls_u32]

Ah, intersting, then it is something to consider.

Can you find the commit for crash bt that added that heuristic? I'm
curious to see why they opted for _MODULE_START.

> It is following format of _MODULE_START_<module_name>. As I saw module name already at the end under [] so I removed the module name.
> 
>     > [53.795979] RSP: 0018:ffff9d602c707c40 EFLAGS: 00010286
>     > [53.795980] RAX: 0000000000000047 RBX: ffff9d600b4c0800 RCX: 0000000000000006
>     > [53.795980] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff9d603fc172f0
>     > [53.795981] RBP: 0000000000000000 R08: 00000000000004bd R09: 0000000000000002
>     > [53.795981] R10: ffffffffc2250083 R11: 0000000000000001 R12: ffff9d5fb785a870
>     > [53.795982] R13: 00000000fffffff4 R14: ffff9d5fb785a800 R15: 0000000000000000
>     > [53.795983] FS:  00007ffb73c2ab80(0000) GS:ffff9d603fc00000(0000)
>     > [53.795983] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     > [53.795984] CR2: 00000000f76e6270 CR3: 0000000107c0c006 CR4: 00000000001606f0
>     > [53.796014] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>     > [53.796014] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>     > [53.796015] Call Trace:
>     > [53.796022]  ops_init.constprop.8+0x81/0x110
>     > [53.796024]  register_pernet_operations+0x92/0xc0
>     > [53.796026]  ? _MODULE_INIT_+0x393/0x393 [nfnetmap_queue]          <======
>     > [53.796027]  register_pernet_subsys+0x1f/0x40
>     > [53.796028]  init_module+0x51/0xc6d [nfnetmap_queue]
>     > [53.796031]  do_one_initcall+0x36/0x160
>     > 
>     > 2. added a call to sprint_symbol in a module
>     > ---------------------------------------------
>     > $ decode for symbol nfnm_queue_flush+16:
>     > _MODULE_START_+0x7e0/0x1daa [nfnetmap_queue]                       <======
>     > 
>     > $ nm nfnetmap_queue.ko | grep _flush
>     > 00000000000007d0 t nfnm_queue_flush
>     > 0x7d0 + 16d = 0x7e0 so this offset maps to symbol nfnm_queue_flush
>     > 
>     > tested on kernel 4.14.38
>     > 
>     > Signed-off-by: Vimal Agrawal <vimal.agrawal@sophos.com>
>     > ---
>     >  kernel/module.c | 21 +++++++++++++++++----
>     >  1 file changed, 17 insertions(+), 4 deletions(-)
>     > 
>     > diff --git a/kernel/module.c b/kernel/module.c
>     > index 84a9141a5e15..d55fb8405151 100644
>     > --- a/kernel/module.c
>     > +++ b/kernel/module.c
>     > @@ -4259,12 +4259,19 @@ static const char *find_kallsyms_symbol(struct module *mod,
>     >         unsigned int i, best = 0;
>     >         unsigned long nextval, bestval;
>     >         struct mod_kallsyms *kallsyms = rcu_dereference_sched(mod->kallsyms);
>     > +       char *module_base_name = "_MODULE_START_";
> 
>     I don't think "_MODULE_START_" tells the user anything clear.
>     If we're going to use heuristics best we use a nomenclature we
>     can expand later and not be cryptic.
> 
>     So maybe just [module] is good enough.
> Vimal>> As mentioned above, I just took reference from bt output of crash utility. Problem is some symbol will be from init section in module. So user needs to know if it belongs to core or init section of module so that it can be decoded manually later. We need some hint for user to suggest if it is part of init section or not.
> Are you suggesting [module] for address in core section and [module __init] (with space between module and _init) for init section? 

Yes my suggestion was:

[module]
[module __init]

I think that implies a heuristic with the brackets and the rest is
pretty self explanatory. _MODULE_START_ seems cryptic. But I'm curious
why crash bt went with that. So if you can look into that it would be
appreciated.

>     We don't have to initialize this as well, as its either one or the other.
> Vimal>> yes. I will fix it.
> 
>     > +       unsigned long module_base_address = 0;
>     > 
>     >         /* At worse, next value is at end of module */
>     > -       if (within_module_init(addr, mod))
>     > +       if (within_module_init(addr, mod)) {
>     >                 nextval = (unsigned long)mod->init_layout.base+mod->init_layout.text_size;
>     > -       else
>     > +               module_base_address = (unsigned long)mod->init_layout.base;
>     > +               module_base_name = "_MODULE_INIT_";
>     > +       } else {
>     >                 nextval = (unsigned long)mod->core_layout.base+mod->core_layout.text_size;
>     > +               module_base_address = (unsigned long)mod->core_layout.base;
>     > +               module_base_name = "_MODULE_START_";
>     > +       }
>     > 
>     >         bestval = kallsyms_symbol_value(&kallsyms->symtab[best]);
>     > 
>     > @@ -4295,8 +4302,14 @@ static const char *find_kallsyms_symbol(struct module *mod,
>     >                         nextval = thisval;
>     >         }
>     > 
>     > -       if (!best)
>     > -               return NULL;
>     > +       if (!best) {
>     > +               /* return MODULE base and offset from it */
>     > +               if (size)
>     > +                       *size = nextval - module_base_address;
>     > +               if (offset)
>     > +                       *offset = addr - module_base_address;
>     > +               return module_base_name;
> 
>     Have you tested this on recent kernels? If not please test this there
>     as I cannot reproduce with your changes taking effect at all. In fact
>     this branch is not hit at all.
> Vimal>> No. I tested on kernel 4.14.173 only. I will test on latest kernel. Have you stripped the module using --strip-unneeded? I saw the code base for this function is same in latest vs 4.14.173 so I skipped the testing part on latest kernel. Will do that now.
> 

Please test with linux-next. Your patch should be based on linux-next as
well. You can test your stuff by adding a WARN_ON_ONCE(1) to
lib/test_module.c

  Luis
