Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3801E24E494
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 03:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHVB4o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 21:56:44 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:26066 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgHVB4o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 21:56:44 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 07M1uRqE012037;
        Sat, 22 Aug 2020 10:56:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 07M1uRqE012037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598061388;
        bh=q3L66YZXyG50TUDwrxJ74OdS8uQta7H1te/B0BYs9zU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XraiQyZsUu0Jn/HCfncWFKXxMCA9EFMDQL+EtMWOdkAWvtb6sLRESg572S7cau/2M
         OqgJKAFqNZRl1EVTZXRG1W0bOw4CIzBrDrli6nxVk2CUeBqaRYx9PErN3lZ8pUq8RV
         47iNrEIIhav6hl1MyDpcC+tqLkuBVnnsaUT0Mq9gHy4j8wvpwNrNcV5wgXJfytyr7f
         C6YxwNBhzeZ8XisYjK6mI0SvHSs8OAcdiI3gXZb5uxNRoEKQMKc1jO2xSYjsygrWI7
         viGycatXEBb3lvqERXWVGKTIpMzAHB7ie0eaP2hmqOshnYH67UOi8l8uZkj6PT65pX
         bgF6xvdCyfr+A==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id r197so803284vkf.13;
        Fri, 21 Aug 2020 18:56:28 -0700 (PDT)
X-Gm-Message-State: AOAM532MigHR3uf7jI4+RJnor2YddPd1qlrZNEZL3UCy/iiM5HX47MKQ
        K/iLC4kBXB8w1Om056vp50H075V2PE1NmG7qDBw=
X-Google-Smtp-Source: ABdhPJz0rXXcQvD+bIW8QJzYQGf5IQgfFZcImslJWk0nYuyJBlx6z3U/YI4b8+QHR71PYqjIrnjn0K8nnLkiRGHiSmA=
X-Received: by 2002:a1f:eac1:: with SMTP id i184mr3803919vkh.66.1598061386864;
 Fri, 21 Aug 2020 18:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org>
 <20200821190159.1033740-5-masahiroy@kernel.org> <CAKwvOdnCZ7ao55Zdh3qkJQzudOwhkPFPOY802Emx3o7GMDdCwA@mail.gmail.com>
In-Reply-To: <CAKwvOdnCZ7ao55Zdh3qkJQzudOwhkPFPOY802Emx3o7GMDdCwA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 Aug 2020 10:55:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+ZdwCg7Dcg3BR5YysxzeraEHMAVsHuez5znwjoN+1pQ@mail.gmail.com>
Message-ID: <CAK7LNAR+ZdwCg7Dcg3BR5YysxzeraEHMAVsHuez5znwjoN+1pQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gen_compile_commands: reword the help message of
 -d option
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 22, 2020 at 9:29 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Aug 21, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > I think the help message of the -d option is somewhat misleading.
> >
> >   Path to the kernel source directory to search (defaults to the working directory)
> >
> > The part "kernel source directory" is the source of the confusion.
> > Some people misunderstand as if this script did not support separate
> > output directories.
> >
> > Actually, this script also works for out-of-tree builds. You can
> > use the -d option to point to the object output directory, not to
> > the source directory. It should match to the O= option used in the
> > previous kernel build, and then appears in the "directory" field of
> > compile_commands.json.
> >
> > Reword the help message.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >   - New patch
> >
> >  scripts/gen_compile_commands.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> > index 1b9899892d99..5f6318da01a2 100755
> > --- a/scripts/gen_compile_commands.py
> > +++ b/scripts/gen_compile_commands.py
> > @@ -31,13 +31,13 @@ def parse_arguments():
> >
> >      Returns:
> >          log_level: A logging level to filter log output.
> > -        directory: The directory to search for .cmd files.
> > +        directory: The work directory where the objects were built
>
> Punctuation (add a period `.`).

Will fix.


> >          output: Where to write the compile-commands JSON file.
> >      """
> >      usage = 'Creates a compile_commands.json database from kernel .cmd files'
> >      parser = argparse.ArgumentParser(description=usage)
> >
> > -    directory_help = ('Path to the kernel source directory to search '
> > +    directory_help = ('specify the output directory used for the kernel build '
>
> Capitalization (specify -> Specify)




The help message of -h starts with a lower case.
The others start with a capital letter.

It would be better if "show this help message and exit"
started with a capital letter. But, it comes from the
library, so I do not know how to change it.

I changed our code to make it consistent, but
starting them with a capital letter is a preferred style,
I can do as you suggest.


Currently, the help looks like follows:

---------------->8-----------------------
masahiro@oscar:~/ref/linux$ ./scripts/gen_compile_commands.py  -h
usage: gen_compile_commands.py [-h] [-d DIRECTORY] [-o OUTPUT]
                               [--log_level LOG_LEVEL]

Creates a compile_commands.json database from kernel .cmd files

optional arguments:
  -h, --help            show this help message and exit
  -d DIRECTORY, --directory DIRECTORY
                        Path to the kernel source directory to search
                        (defaults to the working directory)
  -o OUTPUT, --output OUTPUT
                        The location to write compile_commands.json
                        (defaults to compile_commands.json in the search
                        directory)
  --log_level LOG_LEVEL
                        The level of log messages to produce (one of
                        DEBUG, INFO, WARNING, ERROR, CRITICAL; defaults to
                        WARNING)
---------------->8-----------------------



Thanks.


-- 
Best Regards
Masahiro Yamada
