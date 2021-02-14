Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426E231B362
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 00:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBNX3E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Feb 2021 18:29:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:37014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhBNX3C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Feb 2021 18:29:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEE6364DEA;
        Sun, 14 Feb 2021 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613345302;
        bh=efoTZGS4GOWtgLfEDyhxgk/lrW/RFXOY8gNlqYkEdgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tIeP07i7K6dwxc2eNzHJpfZtjpdC1+i95QJPbeBow/VijH33XpXE+bMKc/dgaw7C2
         R2owAhbr1iQl3gcdDyaYPZg48aYDeyvkMFgZH6NdotUf4sFiA2QVVdzaO9XsSJTi3W
         YJTN6F9vO9ih1KurkEQdf+PKPwY1opcilp320lrd8o5T/MPBaiheIrspiTR1HqVMBR
         5b4cYLLlFzZbB+yrmeYzTR9d9MbruNf4QIYopOklj1cuSN/a/i486VQkSyblFiCC8b
         FSNY/H0L26Xzm0imWuGabB/GhW+/LUgBjJh9cflRWoHljkVV+e7HSIQR2Z+OzGDk2A
         CWHQ9yRi79FNw==
Date:   Sun, 14 Feb 2021 16:28:20 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Stephen Zhang <stephenzhangzsd@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
Message-ID: <20210214232820.GA55343@24bbad8f3778>
References: <20210208195439.GA1097868@ubuntu-m3-large-x86>
 <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86>
 <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86>
 <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
 <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
 <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
 <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 14, 2021 at 07:49:22PM +0800, Stephen Zhang wrote:
> Masahiro Yamada <masahiroy@kernel.org> 于2021年2月13日周六 下午8:46写道：
> > This is the steps I tested.
> >
> >
> > masahiro@oscar:~/ref/linux$ make O=build  defconfig all -j24
> >   [ snip ]
> > masahiro@oscar:~/ref/linux$
> > ./scripts/clang-tools/gen_compile_commands.py  -d build
> > masahiro@oscar:~/ref/linux$ grep '"file":' compile_commands.json |
> > grep scripts/ | head -n5
> >     "file": "/home/masahiro/ref/linux/scripts/mod/empty.c"
> >     "file": "/home/masahiro/ref/linux/scripts/mod/sumversion.c"
> >     "file": "/home/masahiro/ref/linux/scripts/mod/file2alias.c"
> >     "file": "/home/masahiro/ref/linux/scripts/mod/modpost.c"
> >     "file": "/home/masahiro/ref/linux/build/scripts/kconfig/parser.tab.c"
> >
> > --
> > Best Regards
> > Masahiro Yamada
> 
> Thanks. Nathan had a detailed description about  this:
> 
> > $ make O=build
> >
> > will work with '-d .' because the .cmd files are in '.' and the source
> > files will be placed relative to '.', which is correct. Your command
> > does not work for two reasons:
> >
> > 1. You are using a build directory that is not a subpath of the source
> > directory. In other words, this script would not work for
> >
> > $ make O=/tmp/build
> >
> > because '-d /tmp/build' needs to be used to find the .cmd files but then
> > the relative path of the source files is messed up, as you point out.
> 
> This may help you reproduce the problem. So you shoud try:
> 
> >masahiro@oscar:~/ref/linux$ make O=/tmp/build  defconfig all -j24
> 
> where the build directory  is not a subpath of the source directory.
> 

This will actually work for the regular build system as it uses the full
path to the files when O= is outside of the source tree. My comment
applies only to the tools/ build system, which Masahiro has explicitly
said he does not want this script to support.

Cheers,
Nathan
