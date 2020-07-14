Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C4121F89C
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 19:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgGNRyR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 13:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729024AbgGNRyO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 13:54:14 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EE8C08C5DB
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 10:54:14 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so7332062plx.6
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45xI8rEeWi7QXFwrqKcRbpSWjjoJSS/Qt/Ikgj5NGNk=;
        b=Rw2Ooa/4ydY2kuipZY7t3EHXuDLvDsaolNVYTbOw/NHk5Jj0yTma+nZMIhm0RimdW1
         4JfbmJtFIImxCLNF7Likd5JJ75qLUq1nUBH2EITFJdGdoeazyFh1iNO8AUdKQSjKGvkb
         vWPL6G0Ys/dM88zsh00Mm3C64zTOwNylvBlKCSCyQZmVrKUl2gs/OaYNb00wcMR4DAe7
         HqLTQu9936MuMSL6GVU2YNVrqJKkGAGTgtOqKFRzuK+QyPeCSCgh+hD/dBEIkV1NTSF1
         di8HEi1g5AXgcdN3uU8s7dqxHfQFyrPIIaOX6UfyK+tDEjX6rN6ML4r7djGwSQ0peH3h
         HIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45xI8rEeWi7QXFwrqKcRbpSWjjoJSS/Qt/Ikgj5NGNk=;
        b=gqATJenvWZECyEUW606lKJYEhUTgs69kAbIWWuUC8YhLdoN74U6C9jxZQxYjv29WzV
         IEL2BwfK1ngP3aziyNWKNuu3gdSDGEGsPXZ0RM3yIlhIlWGySd6viZVT6HuXIYo79bRe
         D7r+7E1HodaloLbSLFrmcQ0skroJhgVwnhgjXOAwLGVszut0VlU69yaf6EYM9Ov8vUoF
         zdUdScWu8N7mzRF1URgUs6VwSb3RBNZ6Gvkew9uqBIzh77NtDhX60jgyDaTPMusD84VD
         KOsgQXKZsPEzMMCCSUCTBd3U2AR7pjURiBsHi3tvu51XUP1r6l8jHVYZbK6OC2JduC9u
         XiPw==
X-Gm-Message-State: AOAM530QWbkWzFbNJu+eD4yW25GHHWlabkrAOp4dycXrqYpg7Ky2IydE
        7oKFDMzUseQO1fvbcpC8JtWdaJkpZoyLGUcISYjB/A==
X-Google-Smtp-Source: ABdhPJwcIBhuWQSJnb22Hu6ykmJZrRn50yho0jiA1jzvQkDPRjZ5DnsFPHJW6iYaLbzuW2WylixGSW07GgQyW7nvEuA=
X-Received: by 2002:a17:90a:21ef:: with SMTP id q102mr6056117pjc.101.1594749253773;
 Tue, 14 Jul 2020 10:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
 <671d8923-ed43-4600-2628-33ae7cb82ccb@molgen.mpg.de> <CA+icZUXPB_C1bjA13zi3OLFCpiZh+GsgHT0y6kumzVRavs4LkQ@mail.gmail.com>
 <20200712184041.GA1838@Ryzen-9-3900X.localdomain> <CA+icZUWyqb8jdzTAophvBKuX3e2NvG7vQPnMW+SRW5v0PmU7TA@mail.gmail.com>
In-Reply-To: <CA+icZUWyqb8jdzTAophvBKuX3e2NvG7vQPnMW+SRW5v0PmU7TA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Jul 2020 10:54:02 -0700
Message-ID: <CAKwvOdnFxihNnGYTsowzEbtMvb-pwv9pHNo-tihD2h74LX+H+g@mail.gmail.com>
Subject: Re: [PATCH 00/22] add support for Clang LTO
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 14, 2020 at 2:44 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, Jul 12, 2020 at 8:40 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Lastly, for the future, I would recommend grabbing b4 to easily apply
> > patches (specifically full series) from lore.kernel.org.
> >
> > https://git.kernel.org/pub/scm/utils/b4/b4.git/
> > https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst
> >
> > You could grab this series and apply it easily by either downloading the
> > mbox file and following the instructions it gives for applying the mbox
> > file:
> >
> > $ b4 am 20200624203200.78870-1-samitolvanen@google.com
> >
> > or I prefer piping so that I don't have to clean up later:
> >
> > $ b4 am -o - 20200624203200.78870-1-samitolvanen@google.com | git am
> >
>
> It is always a pleasure to read your replies and enrich my know-how
> beyond Linux-kernel hacking :-).
>
> Thanks for the tip with "b4" tool.
> Might add this to our ClangBuiltLinux wiki "Command line tips and tricks"?
>
> - Sedat -
>
> [1] https://github.com/ClangBuiltLinux/linux/wiki/Command-line-tips-and-tricks

Good idea, done.

-- 
Thanks,
~Nick Desaulniers
