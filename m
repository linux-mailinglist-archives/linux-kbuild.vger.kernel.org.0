Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9321795459
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2019 04:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfHTCZU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 22:25:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34456 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728647AbfHTCZT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 22:25:19 -0400
Received: by mail-wr1-f67.google.com with SMTP id s18so10678793wrn.1;
        Mon, 19 Aug 2019 19:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PmmdLjAbLWYIX1qFNc1WXndwzxCg8W0lx5gykrGDbVE=;
        b=RZkyaJJCqg+TqN1s+p5yx2tqdCmWBSlDnH/gMuti6Hr5J/yHzHhkZjY01RKZjfbC3A
         toqcMqJzTqRxct9C0Qu702+P7JLEaex1LsellLU2GxoIhpsHLt5aUjS9yFIa2IH/9o+k
         FtTbyi+ZvckvmrdkNeIFX/IB+/PEpBDeGD9HKs+9YUPXsPwS6YF4XQYBLOG8KEiWhbe0
         dyHS3w4+tQpNDulgpgc50wImIY97ivOEAYPkxK3Ul4Q2UkBhutGQ+2Zaj7YlNmbKDIrb
         v4pQ8EdS3bD4liuHu7eGBj1vXs2pXPBAJS+IsJQAiD/BHP2eOLuojmvfvT2B0TL7YXaU
         oPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PmmdLjAbLWYIX1qFNc1WXndwzxCg8W0lx5gykrGDbVE=;
        b=qMdZynCc1iy9rM5PVluSo5ENYybuStbd6cYCGDTpQt+9mjwPzUgtD7XjpdIUBhZD4p
         wCYOAVhb/HZBK3jcpeYh48dMTYUMy5nC/mF2NIlhDhxjNGqRBIt3Y7fx/+VT6F95Nh5Q
         q+3o19kxNGDbm99jBVCTuzfwRbZ9PcZ5kggU22tRNKHWsZ2EkOZLdmh6tPKqeGTCkKRM
         GtJgcxmgkGhpf/Zpyb16peeAhqCN+1ZGoeHY6g6mEWdnv7cT1F315DVcbZKSRZTub6m0
         EdObsHF3lkatQBWx6uqrJqX3Z/zUPklFW5MTAED0OIc+If5RK9jW8WsVqEW6LyQHd4VH
         7PzQ==
X-Gm-Message-State: APjAAAUXR92J/33qmcJBzKsKrMbJ02z6pmHQImBqtNQ4VW0qaCeNOkge
        MYEa9qlVHiJcz9yTx1MbekE=
X-Google-Smtp-Source: APXvYqwmtHgUWjBBzBVhqVOXLr7xAnJl35gavhqxAvui5pSfgZDCynsys6hSKsAjLUWffbLIXnXBCQ==
X-Received: by 2002:adf:f304:: with SMTP id i4mr25292909wro.61.1566267916510;
        Mon, 19 Aug 2019 19:25:16 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id m7sm18024413wmi.18.2019.08.19.19.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 19:25:15 -0700 (PDT)
Date:   Mon, 19 Aug 2019 19:25:14 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Burton <paul.burton@mips.com>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: enable unused-function warnings for W= build
 with Clang
Message-ID: <20190820022514.GB30221@archlinux-threadripper>
References: <20190819105138.5053-1-yamada.masahiro@socionext.com>
 <20190819160920.GA108942@archlinux-threadripper>
 <CAK7LNARDQPixBfWp8od1=13w+hcycYbyTX9+G-gqEHHwXxDCvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARDQPixBfWp8od1=13w+hcycYbyTX9+G-gqEHHwXxDCvA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 20, 2019 at 01:58:26AM +0900, Masahiro Yamada wrote:
> Hi Nathan,
> 
> On Tue, Aug 20, 2019 at 1:09 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Mon, Aug 19, 2019 at 07:51:38PM +0900, Masahiro Yamada wrote:
> > > GCC and Clang have different policy for -Wunused-function; GCC does
> > > not report unused-function warnings at all for the functions marked
> > > as 'static inline'. Clang does report unused-function warnings if they
> > > are defined in source files instead of headers.
> > >
> > > We could use Clang for detecting unused functions, but it has been
> > > suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> > > warning for unused static inline functions").
> > >
> > > So, we never notice left-over code if functions in .c files are
> > > marked as inline.
> > >
> > > Let's remove __maybe_unused from the inline macro. As always, it is
> > > not a good idea to sprinkle warnings for the normal build. So, these
> > > warnings will be shown for the W= build.
> > >
> > > If you contribute to code clean-up, please run "make CC=clang W=1"
> > > and check -Wunused-function warnings. You will find lots of unused
> > > functions.
> > >
> > > Some of them are false-positives because the call-sites are disabled
> > > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > > unused-function warnings because it might affect the compiler's
> > > optimization. When I need to fix unused-functions warnings, I prefer
> > > adding #ifdef or __maybe_unused to function definitions.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > So if I understand everything correctly, this change allows us to start
> > finding unused static inline functions with clang at W=1 but disables
> > -Wunused-function by default... I am not sure that is a good tradeoff
> > as I am pretty sure that W=1 is fairly noisy for clang although I
> > haven't checked lately. I'd argue most regular developers do not build
> > with W=1 meaning -Wunused-function generally will not be run with clang
> > at all, missing stuff like this:
> 
> 
> Try "git log --grep=W=1"
> 
> Some people are making efforts to fix W=1 warnings.
> I believe somebody will start to remove unused static inline functions.

Yes, it could be a good way to get people involved with working with
clang.

> 
> 
> 
> >
> > https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/
> >
> > https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/
> >
> > Furthermore, per the documemtation [1], -Wno-unused-function will also
> > disable -Wunneeded-internal-declaration, which can help find bugs like
> > commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> > mlxplat_mlxcpld_msn201x_items").
> >
> > [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> 
> 
> How about this?
> 
> KBUILD_CFLAGS += -Wno-unused-function
> KBUILD_CFLAGS += -Wunneeded-internal-declaration

Yes, that would work.

> 
> 
> 
> > Is there a way to conditionally remove __maybe_unused from the inline
> > defintion so that we keep the current behavior but we can still
> > selectively find potentially unused functions?
> 
> It would be possible by tweaking include/linux/compiler_types.h
> but I am not a big fan of uglifying the 'inline' replacement any more.

I agree that ugly is not ideal but I think it is even less ideal to
weaken the default set of warnings for clang... Merely food for thought
though.

Cheers,
Nathan
