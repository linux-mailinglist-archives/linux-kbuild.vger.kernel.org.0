Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F267753A632
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jun 2022 15:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbiFANva (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jun 2022 09:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353339AbiFANv3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jun 2022 09:51:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278DB6EC7A
        for <linux-kbuild@vger.kernel.org>; Wed,  1 Jun 2022 06:51:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id f7-20020a1c3807000000b0039c1a10507fso1131094wma.1
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Jun 2022 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vrp+XKlrC28VPKzB31gc6GZw4V9Xd+q7p21Hsrobnd4=;
        b=FpFvX4hFfUH6VWvkQhTYbU3f+XhlhYR/2tnLxnA8032oH+YHZQHsQaxTqDV71rZPmh
         nMYVbgoQVI2dKS5A5zkqszLi6M+/tvBTKZkZpIdyuqbJzNBe8SglccWtsFvmGhZBluXx
         7bdEtJreXPPhVcDi6U+HdF3/TfwJJxqwyDWrBXUuwB6YahptuRrMe0GfYlw1MEdzrsK6
         B50k+ke1HaJJyLPD3DigT7OtPaMrkU20wu7kBmvk2Uk36jDInXr78Tb6nCGUAPema74n
         5poFlCdWrMQ3fvXDB8NDTC5ANX+5PoGBDVdJHxpwW1OUvqTN6dlmHZ6pM8bXu3AnIFKA
         0W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vrp+XKlrC28VPKzB31gc6GZw4V9Xd+q7p21Hsrobnd4=;
        b=O3F/6YX61wkTIiqOx+eMZgBnivJ0QD8TjfOznzJXrWDlTAo9pvWUO2Zfn2ZwhCp4/J
         Jn4OvAjR730DCGDnVWYExwUtaK81iVrjF5d2Ym2YpFptue2LA05iH1wmdBp61PbSRAl6
         e4X5KtcqmAcTSmN0OoQxHyolXIY7HtyKbRS0+bfr/VwOn/dISOPeuYGN5M7GrMu/wCDm
         6SYz4Jn7Kv43CBnkcoFF6koX4+g9uNzLWxT433ROzKfguzo8cRXILLSwBEWhySoSbpNb
         bZLGRAb3jXErLCz9uAiILVBlZ4kC1uAoGslyYGJrbL9FUGtBpZH68hVMNqCEJo+EtTJ9
         yW+A==
X-Gm-Message-State: AOAM530B16NX5b7fUHk6SXAZQTpiw/EXUe4lbLE40TOnLtR4jADf0X8V
        ajRbciT3SZGQLb0DpyNYEgOgaw==
X-Google-Smtp-Source: ABdhPJzVyw5pIrFFSo6BlJP0awDsWCHEctDO99hX8Sjr5Plkug/ABPLsyvMQsahyZa100CqafVezzA==
X-Received: by 2002:a7b:c5cb:0:b0:397:47ae:188f with SMTP id n11-20020a7bc5cb000000b0039747ae188fmr28614746wmk.137.1654091486522;
        Wed, 01 Jun 2022 06:51:26 -0700 (PDT)
Received: from nogikh.google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c2cac00b0039749256d74sm5754412wmc.2.2022.06.01.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 06:51:25 -0700 (PDT)
Date:   Wed, 1 Jun 2022 13:51:20 +0000
From:   Aleksandr Nogikh <nogikh@google.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     syzbot <syzbot+48135e34de22e3a82c99@syzkaller.appspotmail.com>,
        applications@thinkbigglobal.in, David Miller <davem@davemloft.net>,
        gustavo@padovan.org, Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Ingo Molnar <mingo@redhat.com>, Michal Marek <mmarek@suse.com>,
        Netdev <netdev@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Aleksandr Nogikh <nogikh@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in corrupted (4)
Message-ID: <Ypdu2H6fUOCZck1j@nogikh.google.com>
References: <000000000000c1925305ac997812@google.com>
 <000000000000b6b4eb05dfa1b325@google.com>
 <CAHk-=whH5pmgyzE6+6C==p2VQFUgGiPhSwX=R2zKs+iHZuX7_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whH5pmgyzE6+6C==p2VQFUgGiPhSwX=R2zKs+iHZuX7_A@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Thank you for looking at the syzbot's email!

The bisection info was indeed included in this case by mistake. We have fixed this, now the bot should not mention bisections that point to release commits and thefefore won't be pinging you as the commit author.


Best Regards,
Aleksandr

On Sun, May 22, 2022 at 08:56PM -0700, Linus Torvalds wrote:
> On Sun, May 22, 2022 at 4:01 PM syzbot
> <syzbot+48135e34de22e3a82c99@syzkaller.appspotmail.com> wrote:
> >
> > The issue was bisected to:
> >
> > commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sun Feb 19 22:34:00 2017 +0000
> >
> >     Linux 4.10
> 
> Heh. That looks very unlikely, so the bisection seems to sadly have
> failed at some point.
> 
> At least one of the KASAN reports (that "final oops") does look very
> much like the bug fixed by commit 1bff51ea59a9 ("Bluetooth: fix
> use-after-free error in lock_sock_nested()"), so this may already be
> fixed, but who knows...
> 
> But that "update Makefile to 4.10" is not the cause...
> 
>                Linus
