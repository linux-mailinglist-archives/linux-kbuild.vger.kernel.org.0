Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430BA2C0E69
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 16:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgKWPFE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 10:05:04 -0500
Received: from m9785.mail.qiye.163.com ([220.181.97.85]:54133 "EHLO
        m9785.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbgKWPFE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 10:05:04 -0500
Received: from localhost (unknown [1.203.100.158])
        by m9785.mail.qiye.163.com (Hmail) with ESMTPA id 23F5D5C16B8;
        Mon, 23 Nov 2020 23:04:53 +0800 (CST)
Date:   Mon, 23 Nov 2020 23:04:52 +0800
From:   WANG Chao <chao.wang@ucloud.cn>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
Message-ID: <20201123150452.GA68187@MacBook-Pro-2>
References: <20201103054425.59251-1-chao.wang@ucloud.cn>
 <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSUI3V1ktWUFJV1kPCR
        oVCBIfWUFZSEtJQ0tKQ0oeS0JIVkpNS01KT0hDQkhJS0xVGRETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mj46FTo4Nz0xLjJRHjM8NzoT
        TThPCzJVSlVKTUtNSk9IQ0JISE1DVTMWGhIXVRgTGhRVDBoVHDsOGBcUDh9VGBVFWVdZEgtZQVlK
        VUlLSFVKS0tVSk5DWVdZCAFZQUhPQ0o3Bg++
X-HM-Tid: 0a75f5a2de9f2087kuqy23f5d5c16b8
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/23/20 at 02:23P, Masahiro Yamada wrote:
> On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
> >
> > extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> > ("kbuild: do not create built-in objects for external module builds").
> >
> > This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> > and 'make M=...' to build livepatch patch module.
> >
> > Add extra-y to targets-for-modules so that such kind of build works
> > properly.
> >
> > Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> > ---
> >  scripts/Makefile.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index ae647379b579..0113a042d643 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -86,7 +86,7 @@ ifdef need-builtin
> >  targets-for-builtin += $(obj)/built-in.a
> >  endif
> >
> > -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> >
> >  ifdef need-modorder
> >  targets-for-modules += $(obj)/modules.order
> > --
> > 2.29.1
> >
> 
> NACK.
> 
> Please fix your Makefile.
> 
> Hint:
> https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
> 
> 
> Probably what you should use is 'targets'.

I tried with 'targets' and 'always-y'. Both doesn't work for me.

I narraw it down to the following example:

cat > Makefile << _EOF_
obj-m += foo.o

ldflags-y += -T $(src)/kpatch.lds
always-y += kpatch.lds

foo-objs += bar.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
_EOF_

Take a look into scripts/Makefile.build:488:

__build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
	 $(subdir-ym) $(always-y)
	@:

'always-y' is built after 'targets-for-modules'. This makes
'targets-for-modules' fails because kpatch.lds isn't there.

For 'targets', in case of OOT, does not seem to be useful.

What change do you suggest to make to fix this kind of Makefile?

Thanks,
WANG Chao
