Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253F22D2D41
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 15:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbgLHOcB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 09:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729558AbgLHOcB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 09:32:01 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0722CC0613D6;
        Tue,  8 Dec 2020 06:31:21 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id b9so14553040ejy.0;
        Tue, 08 Dec 2020 06:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zIR+0wdX9mGZ+9nZq06jlSlh4CwZTHmgzYjBIwlfzOY=;
        b=kUOnfZTEkCfHF08lRsp7EbR4PQPdz2eCqeaWPixuzgaa46cpgZV+c28DPhaPpLol5W
         49ztne8MsRTGzYp58vevprD5qcfdIoIdsnbOmqhVc/9e1worAspYwZGeeP05MKZYO0k6
         teyGwD67498U+ZfPrD+WgAgPB+TzDlsyuO88zKzUjNh33lFaK0oiFvNn/KGDZsCLvUTD
         hsuPHy1kfoo5r0E33vcuFWKMSEUfjxqZMtvanAMaO/luxNUaivEVuXUFQk7CyYCpRbMN
         Q5be070aLvQloX2Jhw2/FNaArCtnjQCCzcizpHRvVRXeawRiIvszibC7nZWgI2N1igD0
         9A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zIR+0wdX9mGZ+9nZq06jlSlh4CwZTHmgzYjBIwlfzOY=;
        b=R5OJahc17ZYv5N75iIO955OM913xzLbwmP4k/7aLI35IRyQgqRxwfhK28vG3UuBkZe
         Jcw9eVJrA+wl8vSn7vlir4z1ad/LGfTqyhn5ubdrbGqVHPe1UBSsM3Az1M5YLBwI9VfR
         YwVGADE3LLy5oOgFeJE/ndAHQXUcWOVoxHQdinGEpn549hUFobRkT4tY8SgCD4xNhXag
         JVOuVeinTWl4agIdsaWgxUTfhW7CYAauaBGgXlxeK6+p6fkMXLX1bdYUDG2rJoNIGXiu
         dh7xiiOpFdN/0BMGBTvJlwDRqnAyVkTb5a6YWejmmLS0d28QlUkNvu5cwRHSunmWnKoI
         s/Zg==
X-Gm-Message-State: AOAM5321a7f+ShCs4aeyreX78qpPP/dG/FeZTrAJjocD0FyDH/gn9XyL
        TmbTJVDaQVJYXmCjGrFLzsY=
X-Google-Smtp-Source: ABdhPJxYuVzXUbQwlOK9irzsnxgYEXuMG1PqywQhmv9duFQLU8Ywl20n7RLQUBc2aWc9FVJ468Uu0w==
X-Received: by 2002:a17:907:20a4:: with SMTP id pw4mr23094192ejb.499.1607437879764;
        Tue, 08 Dec 2020 06:31:19 -0800 (PST)
Received: from localhost (176-74-128-122.netdatacomm.cz. [176.74.128.122])
        by smtp.gmail.com with ESMTPSA id 3sm15792444ejn.7.2020.12.08.06.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:31:18 -0800 (PST)
Date:   Tue, 8 Dec 2020 15:31:17 +0100
From:   Artem Savkov <artem.savkov@gmail.com>
To:     WANG Chao <chao.wang@ucloud.cn>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        joe.lawrence@redhat.com
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
Message-ID: <20201208143117.GA3333762@wtfbox.lan>
References: <20201103054425.59251-1-chao.wang@ucloud.cn>
 <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
 <20201123150452.GA68187@MacBook-Pro-2>
 <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
 <20201208092035.GA96434@MacBook-Pro-2.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208092035.GA96434@MacBook-Pro-2.local>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 08, 2020 at 05:20:35PM +0800, WANG Chao wrote:
> Sorry for the late reply.
> 
> On 11/25/20 at 10:42P, Masahiro Yamada wrote:
> > On Tue, Nov 24, 2020 at 12:05 AM WANG Chao <chao.wang@ucloud.cn> wrote:
> > >
> > > On 11/23/20 at 02:23P, Masahiro Yamada wrote:
> > > > On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
> > > > >
> > > > > extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> > > > > ("kbuild: do not create built-in objects for external module builds").
> > > > >
> > > > > This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> > > > > and 'make M=...' to build livepatch patch module.
> > > > >
> > > > > Add extra-y to targets-for-modules so that such kind of build works
> > > > > properly.
> > > > >
> > > > > Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> > > > > ---
> > > > >  scripts/Makefile.build | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > > > index ae647379b579..0113a042d643 100644
> > > > > --- a/scripts/Makefile.build
> > > > > +++ b/scripts/Makefile.build
> > > > > @@ -86,7 +86,7 @@ ifdef need-builtin
> > > > >  targets-for-builtin += $(obj)/built-in.a
> > > > >  endif
> > > > >
> > > > > -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > > > > +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > > > >
> > > > >  ifdef need-modorder
> > > > >  targets-for-modules += $(obj)/modules.order
> > > > > --
> > > > > 2.29.1
> > > > >
> > > >
> > > > NACK.
> > > >
> > > > Please fix your Makefile.
> > > >
> > > > Hint:
> > > > https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
> > > >
> > > >
> > > > Probably what you should use is 'targets'.
> > >
> > > I tried with 'targets' and 'always-y'. Both doesn't work for me.
> > >
> > > I narraw it down to the following example:
> > >
> > > cat > Makefile << _EOF_
> > > obj-m += foo.o
> > >
> > > ldflags-y += -T $(src)/kpatch.lds
> > > always-y += kpatch.lds
> > >
> > > foo-objs += bar.o
> > >
> > > all:
> > >         make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
> > > clean:
> > >         make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> > > _EOF_
> > >
> > > Take a look into scripts/Makefile.build:488:
> > >
> > > __build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
> > >          $(if $(KBUILD_MODULES), $(targets-for-modules)) \
> > >          $(subdir-ym) $(always-y)
> > >         @:
> > >
> > > 'always-y' is built after 'targets-for-modules'. This makes
> > > 'targets-for-modules' fails because kpatch.lds isn't there.
> > 
> > 
> > Heh, you rely on the targets built from left to right,
> > and you have never thought Make supports the parallel option -j.
> 
> You're right. I missed that.
> 
> > 
> > 
> > You need to specify the dependency if you expect objects
> > are built in the particular order.
> > 
> > However, in this case, using ldflags-y looks wrong
> > in the first place.
> > 
> > The linker script is used when combining the object
> > as well as the final link of *.ko

We want linker script to be used on both those steps, otherwise modpost
fails.

It looks like the right thing to do here is leave ldflags-y in, get rid
of always-y/extra-y altogether and specify our linker script as a
dependency for the object.

> I don't have a clean fix to kpatch right now.
> 
> I'm looping kpatch forks in. They're also looking at this right now:
> 
> https://github.com/dynup/kpatch/pull/1149
> 
> Thanks
> WANG Chao
> 
> > 
> > 
> > > For 'targets', in case of OOT, does not seem to be useful.
> > >
> > > What change do you suggest to make to fix this kind of Makefile?
> > >
> > > Thanks,
> > > WANG Chao
> > 
> > 
> > 
> > -- 
> > Best Regards
> > Masahiro Yamada
> > 
> 

-- 
Regards,
  Artem Savkov
