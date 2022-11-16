Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCD662CD5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Nov 2022 23:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbiKPWH5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Nov 2022 17:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234107AbiKPWHz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Nov 2022 17:07:55 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A7265E4A
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Nov 2022 14:07:51 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id g62so18768214pfb.10
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Nov 2022 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=USUBJEQYr7zCoXTygKbEoAl5/bOlE5sjNcmPMMnNO+I=;
        b=aOXRrMzLYEFxRa8SaRW4Ih90tXTtmdiLlMY5L9fwgvk5ZkEvOJPwSUwRFH0VVe0KNX
         Tf7RQspv3rT5ZdHZwrc2/gApQJqkPiCcet8AWh1asaTK6+tRSU0QJ9WlaBD3CZ1nrUfF
         RLbgixYHaOds9zuQVBWGzWco4eawNq4P2jfKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USUBJEQYr7zCoXTygKbEoAl5/bOlE5sjNcmPMMnNO+I=;
        b=U8FoN8F5Aabvk1mHMiFaX2Qy7OEX0QvL1WrcL/3bAQ2sN9YTEozWrwJ1MQ7qBcRrpy
         8b6AJmWUoiPnE5xLgJ9GKIQ9tmvk5MX0zVayVwRGduH40LR3a35vSlBtz/ro75tc+kvc
         kEnn2vl6KIMTN38jrjf5WzmT+/n2iPZO6J5Mkzl3LaCtpUk7VFdZ/qcD5WSaQkwQs0tr
         Q9BCtKxAYNXEKA3DX2C9+toZ4zfL9SBtJoc5oepb1yuyjKrcOjLePj8PwWLlcMLarRfk
         GQ3RvSKAk84CFMnaTRioiJ40nT8v/Itn2OqWeCcJq8YxfTngIEb9Yvig7jjys0TurjCK
         63Qg==
X-Gm-Message-State: ANoB5pkL5KDFQDgk3EAKL7DO3/w+1EHPz8NAdPe3EQmIoCDeWGa7xewV
        naogm7agbik0y3NJ3TUI8XudAg==
X-Google-Smtp-Source: AA0mqf64K5vUgue30E5gIXBgliS7kLgA+JyCtiS271x1i8ctDHfLG/fqrQchGdWFMA8s4VGWRw5BnA==
X-Received: by 2002:a63:535e:0:b0:43c:7da:e64b with SMTP id t30-20020a63535e000000b0043c07dae64bmr22822743pgl.231.1668636470644;
        Wed, 16 Nov 2022 14:07:50 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090a450b00b001fd76f7a0d1sm2093989pjg.54.2022.11.16.14.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 14:07:50 -0800 (PST)
Date:   Wed, 16 Nov 2022 14:07:49 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: fix SIGPIPE error message for AR=gcc-ar and
 AR=llvm-ar
Message-ID: <202211161406.EF075E28E9@keescook>
References: <20221027162839.410720-1-masahiroy@kernel.org>
 <202211161056.1B9611A@keescook>
 <CAK7LNATWbvpovH8qsGMX-5-31QiQ6pjKNnm+YEDEqr4io1hrSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATWbvpovH8qsGMX-5-31QiQ6pjKNnm+YEDEqr4io1hrSw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 17, 2022 at 05:37:31AM +0900, Masahiro Yamada wrote:
> On Thu, Nov 17, 2022 at 4:01 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Oct 28, 2022 at 01:28:39AM +0900, Masahiro Yamada wrote:
> > > Jiri Slaby reported that building the kernel with AR=gcc-ar shows:
> > >   /usr/bin/ar terminated with signal 13 [Broken pipe]
> > >
> > > Nathan Chancellor reported the latest AR=llvm-ar shows
> > >   error: write on a pipe with no reader
> > >
> > > The latter occurs since LLVM commit 51b557adc131 ("Add an error message
> > > to the default SIGPIPE handler").
> > >
> > > The resulting vmlinux is correct, but it is better to silence it.
> > >
> > > 'head -n1' exits after reading the first line, so the pipe is closed.
> > >
> > > Use 'sed -n 1p' to eat the stream till the end.
> >
> > I think this is wrong because it needlessly consumes CPU time. SIGPIPE
> > is _needed_ to stop a process after we found what we needed, but it's up
> > to the caller (the shell here) to determine what to do about it.
> >
> > Similarly, that LLVM commit is wrong -- tools should _not_ catch their
> > own SIGPIPEs. They should be caught by their callers.
> >
> > For example, see:
> >
> > $ seq 10000 | head -n1
> > 1
> >
> > ^^^ no warnings from the shell (caller of "seq")
> > And you can see it _is_ being killed by SIGPIPE:
> >
> > $ strace seq 1000 | head -n1
> > ...
> > write(1, "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14"..., 8192) = 8192
> > 1
> > write(1, "\n1861\n1862\n1863\n1864\n1865\n1866\n1"..., 4096) = -1 EPIPE (Broken pipe)
> > --- SIGPIPE {si_signo=SIGPIPE, si_code=SI_USER, si_pid=3503448, si_uid=1000} ---
> > +++ killed by SIGPIPE +++
> >
> > If we use "sed -n 1p" seq will continue to run, consuming needless time
> > and CPU resources.
> >
> > So, I strongly think this is the wrong solution. SIGPIPE should be
> > ignored for ar, and LLVM should _not_ catch its own SIGPIPE.
> >
> > -Kees
> 
> 
> I thought of this - it is just wasting CPU time,
> but I did not come up with a better idea on the kbuild side.
> 
> I do not want to use 2>/dev/null because it may hide
> non-SIGPIPE (i.e. real) errors.

Yes, I've opened an upstream LLVM bug for this:
https://github.com/llvm/llvm-project/issues/59037

-- 
Kees Cook
