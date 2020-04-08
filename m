Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80FC41A1D01
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 10:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgDHIAp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 04:00:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43082 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDHIAp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 04:00:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id i10so377171wrv.10;
        Wed, 08 Apr 2020 01:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=d9AtxtT4nMo93RM503Qhxe4mGcFfAQvtuS+cWl63KnQ=;
        b=JNrVsz3sRRBXbhytAbJMYbAf6UDteNy8rer92ZjVD7hXeKg175S/SdM5eJcGOuzX6w
         CQ4aC/dc8W9lZyo3hYJqr/pCAJLFosnWteEI+Ofb2tEy805+aOKPe7TYSLSG+b5wTUHk
         wACYbkPpwA85/loNt6gDT4/uP5+nEmleexyF5oAefs1B/dQ6t7+nfd0752YHxNjfOdeP
         JP340boEH90J7JfzDO7RiCwDtmz89Lt9snvUseZKll/oj4HUkk7K9g9FLP/G9uvmoZno
         PX4vE6BtndGB3INvwipqNb2sz+JioIyCNUYPHw8GbL7a+1WeqkkRQnhnXpa9Ex+JKAcM
         1TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=d9AtxtT4nMo93RM503Qhxe4mGcFfAQvtuS+cWl63KnQ=;
        b=NiZL8oV8F5JnX5OZ13BCbE0LHSr7iBktw9IQKRezV8C4xOwlWbewb3q251cMULx3RA
         7SvOKuCA8/x7gMOWGUdS8/Xde3V+9xyv5nbdgXRMseWSxTA/AXRtimPiybZauI3JKUCD
         OhQnRdNFMhqOO21IFbTHBMVkt+ogT3WmP2qp3eErebEw30vlYJXkX1drMYmXFrmZjmLa
         u3pHc6b+JF64XFBPJXBag3o/uRB6kRkOhnv5H0jMUhYkKiv+C8JvnFQ/sefRsW/v9oKQ
         fIFsrSaZ6qGk4FZBZw96SfCSj7mD952nvZ7PAcvTSocdbmsq0LsBzn23PbORDp+aPmVE
         UT8g==
X-Gm-Message-State: AGi0PuZdl2STlPn1b275JYf+AcuNQg87vzisCdmBrqaSmx+CgOIEf/8S
        TQJb9cJujk7Evlb+Bj6LcPCr0fmzg/MD2qYR2H4=
X-Google-Smtp-Source: APiQypIteFt2zEB7gCCSrCRpJSxLpfpZGJ01Q8vBp2/XWDKgny5v3VCM1rbtrsQhXGu5EETO6/qYOWNU6x8qL2dhw1E=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr5210814wro.197.1586332842029;
 Wed, 08 Apr 2020 01:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUWnZwaNooj4WLvS7FKhkDgq3R3xUaQ8hFjuDgZTSj0s2Q@mail.gmail.com>
 <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
In-Reply-To: <CAK7LNATub3fpeTY67miVYJ27MtfwaeETW0HrWHYdM0mmaKCYPA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 8 Apr 2020 10:00:30 +0200
Message-ID: <CA+icZUV0omDqrmcR__bLVCDevCBQV7KjJ=dOyuQct5AZEoKWew@mail.gmail.com>
Subject: Re: kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 7, 2020 at 8:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
> On Mon, Apr 6, 2020 at 7:01 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > [ Please CC me I am not subscribed to this mailing-list ]
> >
> > Hi,
> >
> > I think with your patch in [1] line #56 can go away, too?
> >
> > [ scripts/mkcompile_h ]
> >
> > 53 # Generate a temporary compile.h
> > 54
> > 55 { echo /\* This file is auto generated, version $VERSION \*/
> > 56   if [ -n "$CONFIG_FLAGS" ] ; then echo "/* $CONFIG_FLAGS */"; fi
>
>
>
> I think the this inserts a comment line
> to make sure compile.h is updated
> when any of CONFIG_SMP, CONFIG_PREEMPT, CONFIG_PREEMPT_RT
> is changed.
>
> So, this is unrelated to my patch at least.
>

I mixed up CONFIG_FLAGS with KBUILD_CFLAGS - my bad.

- sed@ -

>
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://patchwork.kernel.org/patch/11473667/
>
>
>
> --
> Best Regards
> Masahiro Yamada
