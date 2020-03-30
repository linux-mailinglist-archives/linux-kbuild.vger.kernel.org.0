Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65B71983DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2020 21:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgC3TDP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Mar 2020 15:03:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39436 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgC3TDP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 15:03:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id x11so19308059otp.6;
        Mon, 30 Mar 2020 12:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zeoBlPxZ+Ud3NYVMylVFKFU+gocBDIOivDsTMxLaWac=;
        b=WhhkvcSuf7XMeV/nvNGHJZiA3X3e7FQvL/apW4ILZiCEPgxBHT0jzpMmxYqDJUNQ8L
         qGBErGd7vZZ8KP9DbP5SsmKCZ9F9T3JGQ+MfEHexksRfWJukEnRb91irh4GiyfEFC/CZ
         27qTgEVF2Jvz9qRVPHnrObZiNRghLU5kUgQsMqCd8QTiW6LrPa/l3jvDum/O20QU3oC5
         fpFijKzMJgc32YP92Wpk7aBbavTuRBCqzZAQzh80Bo2bKODcDZ0p6byeqT9DLC6hr08x
         CmCqim3Tx++bTR8/LfAbC+NbRtyPCcKU5sp6ych36vRsoA9tcTDiILl5x6SLKPY2faTU
         2sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zeoBlPxZ+Ud3NYVMylVFKFU+gocBDIOivDsTMxLaWac=;
        b=P/DPIADG56O0t4DQKE5JUs8V+pf+cjlML023Op9o0IWFbxXL7/FFvy5a/m/4v4wiPX
         TSOIYFgnZKsFxxBe3gV6L/+NdOLsAApoa4cx9rwy2NQjYZ37lrNDihx5SqQi6/8zlfde
         UxGHhH8hXLTk2uJtMEjgF5LMZTUOIOFlNg7YzCAJKxFbz1E9mfSMmdD5aKBAfDbKHS+Z
         vBvfiqyatj5smAcXIDwGeiaTzCUygrOwOcssoG6sBxgrOCjAiibqK50PxKtnjWHiQyB1
         s319TDhnTH/3BFJMobvnyGvOPYpVdRg8xfAej4uNwjLjA3WDcHLs3XcXz7LJ0LLSqTOq
         Zdmw==
X-Gm-Message-State: ANhLgQ1AKXuyd+L6CcYiknp6Hsdnvs/Ad9XBLT59lzoI8IFrufFhwYii
        qmys75uUigTmuk+WYf375Cc=
X-Google-Smtp-Source: ADFU+vuLaeiHpJ9lD+hTDcZgvgbVqPHpfdzGXiu4vdVdFKcmJ6I4ukYdC/RhhbSe2SUDwG/alBeS+A==
X-Received: by 2002:a05:6830:1e93:: with SMTP id n19mr10914726otr.153.1585594994572;
        Mon, 30 Mar 2020 12:03:14 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id c12sm4690809otk.4.2020.03.30.12.03.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 12:03:14 -0700 (PDT)
Date:   Mon, 30 Mar 2020 12:03:12 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
Message-ID: <20200330190312.GA32257@ubuntu-m2-xlarge-x86>
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86>
 <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86>
 <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 30, 2020 at 11:58:19AM -0700, Nick Desaulniers wrote:
> On Sat, Mar 28, 2020 at 6:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > I also had planned to provide a single switch to change
> > all the tool defaults to LLVM.
> >
> > So, supporting 'LLVM' is fine, but I'd rather want this
> > look symmetrical, and easy to understand.
> >
> > CPP        = $(CC) -E
> > ifneq ($(LLVM),)
> 
> Yes, a simple if statement is much simpler than the overly complex patch I had.
> 
> > CC         = $(LLVM_DIR)clang
> 
> Do we need $LLVM_DIR? Shouldn't users just have that in their $PATH?
> 
> Also, I think we need to support suffixed binaries, as debian
> distributes these with version suffixes, as Nathan points out.  Or do
> the debian packages install suffixed binaries AND path versioned
> non-suffixed binaries?

I think the idea here is that ultimately, the suffixed versions of clang
that Debian has in /usr/bin are symlinks to binaries in
/usr/lib/llvm-#/bin; as a result, a user could say
LLVM_DIR=/usr/lib/llvm-#/bin/ and all of those tools would be picked up
automatically. I am not really sure what is better.

I'll try to have some other comments by later today/tonight.

> > LD         = $(LLVM_DIR)ld.lld
> > AR         = $(LLVM_DIR)llvm-ar
> > NM         = $(LLVM_DIR)llvm-nm
> > OBJCOPY    = $(LLVM_DIR)llvm-objcopy
> > OBJDUMP    = $(LLVM_DIR)llvm-objdump
> > READELF    = $(LLVM_DIR)llvm-readelf
> > OBJSIZE    = $(LLVM_DIR)llvm-size
> > STRIP      = $(LLVM_DIR)llvm-strip
> > else
> > CC         = $(CROSS_COMPILE)gcc
> > LD         = $(CROSS_COMPILE)ld
> > AR         = $(CROSS_COMPILE)ar
> > NM         = $(CROSS_COMPILE)nm
> > OBJCOPY    = $(CROSS_COMPILE)objcopy
> > OBJDUMP    = $(CROSS_COMPILE)objdump
> > READELF    = $(CROSS_COMPILE)readelf
> > OBJSIZE    = $(CROSS_COMPILE)size
> > STRIP      = $(CROSS_COMPILE)strip
> > endif
> >
> >
> >
> > I attached two patches.
> > Comments appreciated.
> 
> I'm not sure the second one that recommends changing cc/c++ is the way
> to go; I think it might harm hermeticity.

Agreed. I do not modify my host system at all for this project, just
relying on PATH modification. In theory, we can still override HOSTCC
and HOSTCXX but that would defeat the purpose of that patch.

Cheers,
Nathan
