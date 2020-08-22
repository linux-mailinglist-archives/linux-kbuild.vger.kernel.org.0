Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578CB24E56F
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 06:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgHVEg1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 00:36:27 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39210 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgHVEg1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 00:36:27 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 07M4a58T012181;
        Sat, 22 Aug 2020 13:36:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 07M4a58T012181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598070966;
        bh=rSIgi0UFKz69QzH3NpYejP9Y0Myj8ahAjyAwuXUo0y4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nETSiJ6G6e6j50F+eXPO8/miIYXOGdWH4Ef8B76Up44da4sP4jb3TAlLPoeKlm1zx
         msSWTYvBneihW/i4sQHK4Y1Kv2c5SaAGFF6Z9EWvnF8jlbTeuQ3w26116Jk4D0rh0m
         U5BvGOvvBQ7Jw2l7GLXUVkwOCAuSHJeRmQNLDjoZDBY+iJ5tX38C9KRJM7+bT0OErw
         NK4m/CsMKc2DcAYByiKXTveqBu76/oTFMIJkbsdrbkLrSKH+4Ftvo7Djj7Ex68jBHN
         q7tnXzF7a3YYi924zJkh8eqGgHFJRpxNyEVXkHrnnYPuJK6K5kVReGZ25QAFxC7jWm
         mMoEDHTwUfG+Q==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id l184so867816vki.10;
        Fri, 21 Aug 2020 21:36:06 -0700 (PDT)
X-Gm-Message-State: AOAM533oO3bTo5QM5RHstUr+BEQi9SeHQLIN+hB2QTTgc65qMrnZhN4N
        Xbw7EX3LzaV1at2KtrU1+LQqnGSJgtqNm8h9CLE=
X-Google-Smtp-Source: ABdhPJzA8U5Km+A7DbPsH2kycxln5g6rCYtMQmeGygnvwm3V8T21s6b9QpSavI1akPmpTW1XMXlpoFetD3AvG6BOloA=
X-Received: by 2002:a1f:7347:: with SMTP id o68mr3766544vkc.26.1598070964727;
 Fri, 21 Aug 2020 21:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200821190159.1033740-1-masahiroy@kernel.org>
 <20200821190159.1033740-7-masahiroy@kernel.org> <CAKwvOdn9ZfvC4dzuVnxc_a52JFn_q1ewOWwZZD5b9=izeEayKQ@mail.gmail.com>
In-Reply-To: <CAKwvOdn9ZfvC4dzuVnxc_a52JFn_q1ewOWwZZD5b9=izeEayKQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 Aug 2020 13:35:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASt-PnF6gaEoS-8nNjrReszWAeS02_4XNLQtE9wv8w2AQ@mail.gmail.com>
Message-ID: <CAK7LNASt-PnF6gaEoS-8nNjrReszWAeS02_4XNLQtE9wv8w2AQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] gen_compile_commands: move directory walk to a
 generator function
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

On Sat, Aug 22, 2020 at 9:41 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:

> > +    for path in paths:
> > +        cmdfiles = cmdfiles_in_dir(path)
> > +
> > +        for cmdfile in cmdfiles:
>
> If `cmdfiles` is never referenced again, please make this:
>
> for cmdfile in cmdfiles_in_dir(path):


I intentionally wrote in this way
because in the next commit,
cmdfiles will be selectively set.





> With those 2 changes feel free to add my
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > +            with open(cmdfile, 'rt') as f:
> >                  result = line_matcher.match(f.readline())
> >                  if result:
> >                      try:
> > -                        entry = process_line(directory,
> > -                                             result.group(1), result.group(2))
> > +                        entry = process_line(directory, result.group(1),
> > +                                             result.group(2))
> >                          compile_commands.append(entry)
> >                      except ValueError as err:
> >                          logging.info('Could not add line from %s: %s',
> > -                                     filepath, err)
> > +                                     cmdfile, err)
> >
> >      with open(output, 'wt') as f:
> >          json.dump(compile_commands, f, indent=2, sort_keys=True)
> > --
> > 2.25.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdn9ZfvC4dzuVnxc_a52JFn_q1ewOWwZZD5b9%3DizeEayKQ%40mail.gmail.com.



--
Best Regards
Masahiro Yamada
