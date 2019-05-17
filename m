Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA22C2163A
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 11:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfEQJZs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 05:25:48 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39827 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbfEQJZs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 05:25:48 -0400
Received: by mail-io1-f65.google.com with SMTP id m7so4937768ioa.6;
        Fri, 17 May 2019 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bKzWWnOH9ydjE40E51J019WWbkt1Rysxj2Dtj7CPBxw=;
        b=hwL0cUFxucCOmv0o3XAkQAKca82DGUJVm1ca/Dbp2gWH7WmayUc1iz4KQeAX1cg5am
         mWz53Cr0ZUz5Fd7CnD3Xzj99EMSA5ej7m+1b1xv5iCqwvqvzgO8oqwAiuuTG/ISlPZae
         WduTyb5EDzypBr//Vi3LxBBwbDIBu+4MV5TJgGXnLUh2U6hTyTF9Iic8CofvMlRK1mLu
         MSYKK486pvy8OUIW8CY02gGCGmlWfQBgaYpb//oWtCdhviFlLKVWBlfr6d09A7XuhohB
         wB+jfzWuVHh4w9NUythOejL07BsUwYWQyHDeCZf8MB7aCbv23QAcTP4szJKRyd/1blWm
         ZBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bKzWWnOH9ydjE40E51J019WWbkt1Rysxj2Dtj7CPBxw=;
        b=pSYyBDU9HBzXqowk1UxznFZcdbCOT2CNOc6dHLizwFQy5RpQyDACvlwJOANI8aPxbw
         u0lkU5Eul5cbw25ae7IzUIdPqE6Riu/4PODdY2gtS8IwiK6jxYOfIVL5a/eZVWVajOuf
         C9I2DQONGO/d7qs8b8tENhOYdC1UE4JNlnU3TrGL9/BBUrVBr9TNHEDALlhkdxJz6Tix
         vLyGFfJRJPTMCyagkPG1EP3mZxenxuGMDDD3JV15Ia7wT+duUt5nH2HmuT73/hEYrVcJ
         /Ycl5Tr5LBfFmVK1MPrhBs4FHFb4qSF0CXHpp7yvXfyATXNLouVKpRjNCJ8UQwnJY/I9
         2hPg==
X-Gm-Message-State: APjAAAUSjiHj5dh7bEhwed/jb/0cy5KpnMgr8JITpXRscleW0BdJrakm
        U8p+Nk0mfaJSnR8oJTG/FiWUiBHA/K+3O9ltvo8=
X-Google-Smtp-Source: APXvYqw2PPNT7HlBk7nzmtIlDhS2mkjhDCAmXJhgUZaR1EUfi+er+VoWuqo3lY7upavsMf0+Lqqg1yUF/OS9vQFU+Ro=
X-Received: by 2002:a6b:8e84:: with SMTP id q126mr12832502iod.118.1558085147348;
 Fri, 17 May 2019 02:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com> <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at>
In-Reply-To: <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at>
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date:   Fri, 17 May 2019 12:25:10 +0300
Message-ID: <CAJ1xhMVaeQPoW1v91bcNOkw1FJOr7ddhDc-ir=3AiKRCSzCj=g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 11:58 AM Bernd Petrovitsch
<bernd@petrovitsch.priv.at> wrote:
>
> On 17/05/2019 10:16, Alexander Kapshuk wrote:
> [...]
> > The 'xargs' '-r' flag is a GNU extension.
> > If POSIX compliance is important here, the use of 'cat', 'xargs' and
> > 'basename' may be substituted with that of 'sed' to initialise
> > same_name_modules:
> > sed 's!.*/!!' modules.order modules.builtin | sort | uniq -d
>
> 's!' is TTBOMK also a GNU-extension:
> sed 's/.*\///' modules.order modules.builtin | sort | uniq -d

It isn't.
Here's an excerpt from the POSIX manpage for 'sed',
http://pubs.opengroup.org/onlinepubs/009695399/utilities/sed.html:
[2addr]s/BRE/replacement/flags
...  Any character other than backslash or <newline> can be used
instead of a slash to delimit the BRE and the replacement....

>
> > 'Sed' may also be used on its own in the 'for' loop instead of as part
> > of a pipeline along with 'grep' to generate the desired output:
> > sed '/\/'$m'/!d;s:^kernel/:  :' modules.order modules.builtin
>
> sed "/\/${m}/!d;s/^kernel\//  /" modules.order modules.builtin

The parameter expansion syntax is redundant here.
See https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02:
The parameter name or symbol can be enclosed in braces, which are
optional except for positional parameters with more than one digit or
when parameter is a name and is followed by a character that could be
interpreted as part of the name.

Here's an alternative version using double quotes.
sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin

>
> MfG,
>         Bernd
> --
> Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
>                      LUGA : http://www.luga.at
