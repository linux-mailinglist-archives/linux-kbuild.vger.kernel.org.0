Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75EDB6BE7E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 16:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfGQOoQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 10:44:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59430 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfGQOoN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 10:44:13 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <seth.forshee@canonical.com>)
        id 1hnlAC-0003E9-12
        for linux-kbuild@vger.kernel.org; Wed, 17 Jul 2019 14:44:12 +0000
Received: by mail-io1-f72.google.com with SMTP id y13so27313413iol.6
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jul 2019 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2386PExRpbgkN+Uat/urOUj93u5UGvh9BJdUwckpNOU=;
        b=MrfedLij/lY/ZA7fM9VJkj5L2ba9v3j7g2YLu8ciSvzVA6dWzZ9xtIyDGmTHA0Z6HW
         sDBpIsNNfAgJKcRI/SNzkLjZ1QCO5sth9PcQSuR5NJtAst6rizth98Ie2fdSwitkiR4B
         jErWaQSEY2+gpZN9Bal+4ocgUTfXGiRRmwNplv95Xig7nnYFSYFAFOjFx1JybGHPa7HY
         kPo1eXaY9dsdoWW67YG3XZ9wtpsGUJh+CnAk6giET/fD9s1ki9hNdVKYWMs8thWqPRcn
         h5lbnQ3PNUVZcDY27H4NGWuhP54O1X62a355FkX+cZD8Dj1nc3yM5MtddDD5jXWOCn6G
         0Efw==
X-Gm-Message-State: APjAAAUbrZTlJhx5VHiTvuSbF400zTa9FCkWgQUyWOfLt/Jer2Ye1WW6
        QvrtPGh08mPDKcqZm6bREGDai8J3QNBOo+SOFwo7D7du9K6A3a8bmfGwbi/LAQuv2p/xPdg/gP0
        KkR/4meq4IMcuZZygro4fZx4DbS2b9x8awpNwEdeDyg==
X-Received: by 2002:a5e:8a46:: with SMTP id o6mr6672202iom.36.1563374650645;
        Wed, 17 Jul 2019 07:44:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqfT69e5rzzR/7TL/+M0DTpyD7jvbubvnAeiiJgh1lxop81SNNuRZlYSPK0abCBA7IaEXmNQ==
X-Received: by 2002:a5e:8a46:: with SMTP id o6mr6672164iom.36.1563374650305;
        Wed, 17 Jul 2019 07:44:10 -0700 (PDT)
Received: from localhost ([2605:a601:ac2:fb20:31dd:dc66:96d:f1eb])
        by smtp.gmail.com with ESMTPSA id l11sm18574102ioj.32.2019.07.17.07.44.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 07:44:08 -0700 (PDT)
Date:   Wed, 17 Jul 2019 09:44:07 -0500
From:   Seth Forshee <seth.forshee@canonical.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>, kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
Message-ID: <20190717144407.GU5418@ubuntu-xps13>
References: <201907160706.9xUSQ36X%lkp@intel.com>
 <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
 <20190716124249.GP5418@ubuntu-xps13>
 <20190716162014.iu47g6o7ralxhcf5@treble>
 <CAK7LNASDRFuwC4jxvjgs0bUU8EJ93k1_eQTynK2wRfJCRfmFjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASDRFuwC4jxvjgs0bUU8EJ93k1_eQTynK2wRfJCRfmFjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 17, 2019 at 11:52:07AM +0900, Masahiro Yamada wrote:
> On Wed, Jul 17, 2019 at 1:20 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Tue, Jul 16, 2019 at 07:42:49AM -0500, Seth Forshee wrote:
> > > On Tue, Jul 16, 2019 at 03:57:24PM +0900, Masahiro Yamada wrote:
> > > > (+ Josh Poimboeuf)
> > > >
> > > > On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
> > > > >
> > > > > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > > > > head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> > > > > commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> > > > > config: x86_64-randconfig-s2-07160214 (attached as .config)
> > > > > compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> > > > > reproduce:
> > > > >         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
> > > > >         # save the attached .config to linux build tree
> > > > >         make ARCH=x86_64
> > > >
> > > > 0-day bot reports objtool warnings with the following applied:
> > > > https://patchwork.kernel.org/patch/11037379/
> > > >
> > > > I have no idea about objtool.
> > > >
> > > > Is it better to drop this patch for now?
> > >
> > > I'm surprised that the change would have any impact on a build with
> > > gcc-4.9, since -fcf-protection seems to have been introduced in gcc-8. I
> > > guess there's no full build log that would let us see the actual flags
> > > passed to the compiler.
> > >
> > > I'll try to reproduce this result. If you think the patch should be
> > > dropped in the meantime, that's fine.
> >
> > The problem with this patch is that it's breaking the following check in
> > arch/x86/Makefile.  GCC 4.9 doesn't support retpolines, so it's supposed
> > to fail with the below error.
> >
> > ifdef CONFIG_RETPOLINE
> > ifeq ($(RETPOLINE_CFLAGS),)
> >         @echo "You are building kernel with non-retpoline compiler." >&2
> >         @echo "Please update your compiler." >&2
> >         @false
> > endif
> > endif
> >
> > Maybe the flags should be placed in another variable other than
> > RETPOLINE_CFLAGS.
> 
> 
> 
> Josh,
> Thanks. You are right.
> 
> 
> Seth,
> I think you can add the flag to KBUILD_CFLAGS.
> 
> If you want to make sure this does not affect non-retpoline
> build, you can surround the code with ifdef.
> 
> ifdef CONFIG_RETPOLINE
> KBUILD_CFLAGS  += $(call cc-option,-fcf-protection=none)
> endif

Thanks, I'll send an updated patch shortly.

Seth
