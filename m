Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A193D18E74
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 18:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfEIQwK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 12:52:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35317 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfEIQwK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 12:52:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id t87so1631713pfa.2
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aVeDGqfbT0YGG1y1uT4kmEchoYa9pupr9YpNC6PdnA4=;
        b=cEmfOBgAi+j3wDMyN2HuQ8YOAyEOvblZNzvn4ss1G8HyoBp6uVkeWdDSKXx1VxS3/Q
         y/d9aZeJg9/MJ9Ryz+ewFOxRPwSVlr6YDx4ROjWLeIf6DpZVCWcDflTo2N9G/HCo6uVj
         Ev3q2WToDXYuTcB7vEYj04kGomUTNvSQhRKBefDilB4iThJ7Q6wdXhIRywnj0NJDhBaZ
         flyWYM53ifjnS0gFNtReN2FpfRdHTzbLKtaR0r8v+xksDe3G8/TnFB0f6x8ZEiqB5NvI
         EYa/elhvhyMawxgPw7Ur0eAmRofJTpshP2GkQ9cjE6Z3Wsj+AILirPuWKgAh5+u6xkMm
         GG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVeDGqfbT0YGG1y1uT4kmEchoYa9pupr9YpNC6PdnA4=;
        b=h7EnJCvEshHeAHZ+vN9ewMcxnBoKT47UA9kGRlPoyIkLUTyrxeTuY0euh79fw9gbc7
         6YdfsyCCsvnstn2yi5GLlACF8h2mzI61NLz9/45vBUjN5mkQzV17MS/Q976h+0JZz4x0
         vyywnxea0+j2Fj0uAtyP7tL5uZ712+k2r25SuPkovL0WcN2mPyaVx0PbXiIrrlFYRl2n
         FIMjC+w7BsEiJoEl4taOSZb/+FjDAV1CaDJGhpyTlABpc5eOLpNGac23zYkQEJLouSD+
         NR1DCOhSS3jeLj8eLZ0uPHBatiESUDzHrC/keG6iJ8JVfEvi3LCx+F5b+Y6Hyxn4igvK
         vFyg==
X-Gm-Message-State: APjAAAV5RgUe5fRsX5Gxiw5Utd7E8QZQ3e04tkrxKGLoKDnGc8Z+/MeU
        UfBC4YZH4L4uiF9xsSn5Dzg7lI6v7mhaYVTyWESmBA==
X-Google-Smtp-Source: APXvYqwilvKZBerd/RIiPZ0wRdI5EOy9Y7Ffui3bXF5SQ9uDUWYuz7xExBnRYaOSy7gRyxeb4muNbUsVaVXCNgub+fI=
X-Received: by 2002:a62:704a:: with SMTP id l71mr6797419pfc.32.1557420729060;
 Thu, 09 May 2019 09:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com> <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
In-Reply-To: <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 9 May 2019 09:51:57 -0700
Message-ID: <CAKwvOd=cbvYyVPcGYweMbPDM5WpBtZr8tOQgHu9BJiGqoq4RDg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Wed, May 8, 2019 at 11:46 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > This flag is documented in the GCC 4.6 manual, and recognized by
> > Clang as well. Let's rip off the cc-option switch.

Checked w/ godbolt w/ Clang 4 and GCC 4.6.4.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
