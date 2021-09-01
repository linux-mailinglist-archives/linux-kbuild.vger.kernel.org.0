Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC973FDE6C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Sep 2021 17:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245717AbhIAPS5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Sep 2021 11:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbhIAPS4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Sep 2021 11:18:56 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD5AC061575;
        Wed,  1 Sep 2021 08:17:59 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id q11so68195wrr.9;
        Wed, 01 Sep 2021 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=T4Y99/7Fxv1S0B7SrxwOuANOPYGVNX7NDwW0uOwzV0k=;
        b=oPuUQf0NjApUfu1QJAR5acnQPgjsp0nHrdJjmVuZg8miZBlXkdL0pvK3hAw4jGcGpJ
         zRwZURzZEvfNjwUuqIfVKQaOzfl9Uc3f68u0bUCjmI6UarxwwRok2oFf2cdqSsRxYdmH
         H8eyxkuqaoUWmYt+9b23Jvdv81RGtPwNaDB4aeuPdUvOElf0F/g5dSnYZfSsY/b9FZ0x
         c6H6nSVVApKzYiZnvAx3wf5EyAZaDzh+EgmrohSvQ3zf0YvayHiggTOlxXotqeBkkmJC
         JGGZItHHhTXpxbbE+o1s4IO7I+P1zJ9xfVrqGvYn4kyBawZ7rTe+LJO7pcrAvfn0u6xF
         NTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=T4Y99/7Fxv1S0B7SrxwOuANOPYGVNX7NDwW0uOwzV0k=;
        b=HQ8Wnu+KH33ZYg/COC6f1kY7TWmoxVlEqPJK1S3BKuonDfZmR7eQ8VwwWrQz/RaVT3
         S/BED4eOXsecc/8Dv5iUaTQO/QcIDb0EsHYjYXQ5XNRw6S7CYlvfe0RsaErM14T7oNI+
         ChMHT8sr6qsH9xONeYdCa7SCD8hdBsP9n/VCL+GZz9Bic6k/grZj38vJ0lVACfj9RZJE
         3479Z0TYxCf1x5BHXdDjJxdOjRDHC9+7uI1OPpp7JL0g6vF/7qGXVvpC4q/jdsb7pDcr
         G/QKFlGHioTkS6A0XDA8oYpm2yRYwdS7OcVnfhJNgN4NH4ijzy7hBFYrZB8S34UcTH6E
         S5rw==
X-Gm-Message-State: AOAM533RjibyzO5M9z9aaHebL/UCTWQyvp8NW0mdFIa+oVnOlb79WopL
        FSZWCpwtBE0Plw0X5Fnbk/4zrLCed0m8Zw==
X-Google-Smtp-Source: ABdhPJzYLlFBZBnh+6CxuMNVBeO60F+PJUXfc2KYZc0Cf3ZCCJQW218A3EuVwbVe1aDxypNb+ksulA==
X-Received: by 2002:a5d:4991:: with SMTP id r17mr39867717wrq.247.1630509478264;
        Wed, 01 Sep 2021 08:17:58 -0700 (PDT)
Received: from [192.168.1.107] ([147.235.73.50])
        by smtp.gmail.com with ESMTPSA id p9sm5635141wrg.14.2021.09.01.08.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 08:17:57 -0700 (PDT)
Subject: Re: [PATCH 2/3] checkkconfigsymbols.py: Fix Kconfig parsing to find
 'if' lines
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
 <20210822192205.43210-3-arielmarcovitch@gmail.com>
 <CAK7LNATy17OQ900ThKJwHRy35+4Yg=9CRNg9Zp0tZ_O=uQ+kaw@mail.gmail.com>
 <2bba4c0a-8639-1d3a-5dd5-8e2576f6ab77@gmail.com>
 <CAK7LNATy+ptW8agt04nauMfgCvAFccstrpbwd0Y+Vt5xqdNLhg@mail.gmail.com>
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Message-ID: <73d31fc9-c1d0-7643-c9aa-2fcebdb24b73@gmail.com>
Date:   Wed, 1 Sep 2021 18:17:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATy+ptW8agt04nauMfgCvAFccstrpbwd0Y+Vt5xqdNLhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi again!


On 30/08/2021 2:41, Masahiro Yamada wrote:
 > On Sun, Aug 29, 2021 at 10:18 PM Ariel Marcovitch
 > <arielmarcovitch@gmail.com> wrote:
 >>
 >> Hello again!
 >>
 >> On 24/08/2021 16:30, Masahiro Yamada wrote:
 >>  > On Mon, Aug 23, 2021 at 4:22 AM Ariel Marcovitch
 >>  > <arielmarcovitch@gmail.com> wrote:
 >>  >>
 >>  >> When parsing Kconfig files to find symbol definitions and 
references,
 >>  >> lines after a 'help' line are skipped until a new config definition
 >>  >> starts.
 >>  >>
 >>  >> However, it is quite common to define a config and then make 
some other
 >>  >> configs depend on it by adding an 'if' line. This kind of kconfig
 >>  >> statement usually appears after a config definition which might 
contain
 >>  >> a 'help' section. The 'if' line is skipped in parse_kconfig_file()
 >>  >> because it is not a config definition.
 >>  >>
 >>  >> This means that symbols referenced in this kind of statements are
 >>  >> ignored by this function and thus are not considered undefined
 >>  >> references in case the symbol is not defined.
 >>  >>
 >>  >> The REGEX_KCONFIG_STMT regex can't be used because the other 
types of
 >>  >> statements can't break help lines.
 >>  >>
 >>  >> Define a new regex for matching 'if' statements and stop the 'help'
 >>  >> skipping in case it is encountered.
 >>  >>
 >>  >> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
 >>  >> ---
 >>  >>  scripts/checkkconfigsymbols.py | 8 +++++++-
 >>  >>  1 file changed, 7 insertions(+), 1 deletion(-)
 >>  >>
 >>  >> diff --git a/scripts/checkkconfigsymbols.py
 >> b/scripts/checkkconfigsymbols.py
 >>  >> index b9b0f15e5880..875e9a2c14b2 100755
 >>  >> --- a/scripts/checkkconfigsymbols.py
 >>  >> +++ b/scripts/checkkconfigsymbols.py
 >>  >> @@ -26,6 +26,7 @@ EXPR = r"(?:" + OPERATORS + r"|\s|" + SYMBOL + 
r")+"
 >>  >>  DEFAULT = r"default\s+.*?(?:if\s.+){,1}"
 >>  >>  STMT = r"^\s*(?:if|select|imply|depends\s+on|(?:" + DEFAULT +
 >> r"))\s+" + EXPR
 >>  >>  SOURCE_SYMBOL = r"(?:\W|\b)+[D]{,1}CONFIG_(" + SYMBOL + r")"
 >>  >> +IF_LINE = r"^\s*(?:if)\s+" + EXPR
 >>  >
 >>  >
 >>  > Why is it enclosed by "(?: )"   ?
 >>  >
 >>  > "(?:if)"  seems to the same as "if"
 >> Oh you are absolutely right.
 >> I just mindlessly copied the STMT regex and removed the other types :)
 >>  >
 >>  >
 >>  >
 >>  >
 >>  >
 >>  >
 >>  >>
 >>  >>  # regex objects
 >>  >>  REGEX_FILE_KCONFIG = re.compile(r".*Kconfig[\.\w+\-]*$")
 >>  >> @@ -35,11 +36,11 @@ REGEX_KCONFIG_DEF = re.compile(DEF)
 >>  >>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
 >>  >>  REGEX_KCONFIG_STMT = re.compile(STMT)
 >>  >>  REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 >>  >> +REGEX_KCONFIG_IF_LINE = re.compile(IF_LINE)
 >>  >>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 >>  >>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 >>  >>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
 >>  >>
 >>  >> -
 >>  >>  def parse_options():
 >>  >>      """The user interface of this module."""
 >>  >>      usage = "Run this tool to detect Kconfig symbols that are
 >> referenced but " \
 >>  >> @@ -445,6 +446,11 @@ def parse_kconfig_file(kfile):
 >>  >>          line = line.strip('\n')
 >>  >>          line = line.split("#")[0]  # ignore comments
 >>  >>
 >>  >> +        # 'if EXPR' lines can be after help lines
 >>  >> +        # The if line itself is handled later
 >>  >> +        if REGEX_KCONFIG_IF_LINE.match(line):
 >>  >> +            skip = False
 >>  >> +
 >>  >
 >>  >
 >>  > I do not think this is the right fix.
 >>  > There are similar patterns where
 >>  > config references are ignored.
 >>  >
 >>  > For example, FOO and BAR are ignored
 >>  > in the following cases.
 >>  >
 >>  > ex1)
 >>  >
 >>  > choice
 >>  >           prompt "foo"
 >>  >           default FOO
 >>  >
 >>  >
 >>  >
 >>  > ex2)
 >>  >
 >>  > menu "bar"
 >>  >            depends on BAR
 >>  >
 >>  >
 >>  >
 >>  >
 >>  > The help block ends with shallower indentation.
 >> So IIUC we need to measure the indentation when we encounter a help
 >> statement and in the next lines look for a line with a different depth
 >> (which is not an empty line because these are allowed).
 >
 >
 >
 > If you want to implement it precisely, yes.
 >
 >
 > Or, if you want to adopt a simpler
 > solution, detect the following keywords.
 >
 > comment
 > if
 > menu
 > choice

Actually, it seems that all statements are legal in this context.

So we can just use the STMT regex!

It does require reshuffling the logic there a little but this should
do.

 >
 >
 >
 > This is not precise, but it will work
 > in most cases.
 >
 >
 >
 > In the following example, the first 'menu'
 > is just a comment.
 > The second 'menu' is a keyword since it has
 > a shallower indentation.
 >
 >
 >
 >     help
 >        blah blah
 >        menu blah blah
 >        blah blah
 >   menu "menu prompt"
 >      depends on FOO
 >
 >

Yeah this will probably drive the parser crazy (even without my
changes, although my changes might make it worse).

But the indentation solution is kinda nasty.

Do you think the STMT regex check is enough or should I handle the
cases you mentioned with the indentation check?


 >
 >
 >
 >
 >
 >
 >
 >
 >
 >
 > --
 > Best Regards
 > Masahiro Yamada

Thanks again for your time :)
Ariel Marcovitch
