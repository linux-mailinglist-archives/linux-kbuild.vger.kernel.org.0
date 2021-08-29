Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CB23FABEB
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Aug 2021 15:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbhH2NS4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Aug 2021 09:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbhH2NSz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Aug 2021 09:18:55 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC5FC061575;
        Sun, 29 Aug 2021 06:18:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id e26so1586185wmk.2;
        Sun, 29 Aug 2021 06:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EyXmTgzZ2zMDj7nsmJ87p+yGZvGhOM2tNp+X59sw35E=;
        b=R1xfsFbn2UTnbSLdJyexs6uW2wrEaS3KsTJyrIu+QV9lBRqUW4NNR/R3mYj8tjYzEH
         QUo1P7B9bsr5KAWq8IG/dqvCkQ7BoNITg/pfhN6+lf9mDwUitMxEId463HIrssvVAyG8
         tdFgR1QYYlBj5B2TCr0OaoqNibjAeosF0boHdOt1gSrRPQX7SHQKLP7bB0g7O8v8Cx0b
         vebPCuVT43XOKgsl7rggWQtHgnf+dfSMeGDbUidx0/rsLb56M22FpPNyV3Mt89JW7uuN
         vloTNLsi7LndEcZPZRfxNZxWyrnvA6g2pk58n0gfCV07/dn952hPbwCRv4HFzJHzkwrn
         5arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EyXmTgzZ2zMDj7nsmJ87p+yGZvGhOM2tNp+X59sw35E=;
        b=hrfRXLXFqlWIR3H7URdITi5LFjoP4VSeN+ff+kKOVCCuzlQJtUd4vM1TX62y3140Cg
         P3CIrfwfHL5ZiazF1GJ+lyJVAXF3LlcGtBGdGu8CdMQODIbLxBPwAp3CCIJ0ZkiXac30
         IciIvw+tea4ckzqt/9VNy3swSUTMZkkhEeZlfJ0yLy/Fc5IFDdVoQYIBRxBDq5EN05C3
         gAI562JQe6xk9dvSJOlrZFw64mo0ghlF6Trk2t53SjGSVE4UE7hVadm6yBGj8BIJgUbX
         pECZD1KB9FhAqTTbp4WFZxnSjBTboT5t8ZWFLMEVQfbabY8nrLk31Otqc3DyDfwLUKNr
         AW/w==
X-Gm-Message-State: AOAM530iHjanPmO8uI3EZHtMjVysg/+Hx6NmhdKwSKBKa5a0MlmdwzE0
        et8b8uLFxJRDK8/jWLKTDVYPjGclFRfsmg==
X-Google-Smtp-Source: ABdhPJzmGdk93MK3MTqEwxVzTGxK6uvggZeDCdnkjUSzNcJ8nZ8880OY7b2ib279roa2BBQXpMUPoA==
X-Received: by 2002:a1c:35c9:: with SMTP id c192mr8180677wma.121.1630243082150;
        Sun, 29 Aug 2021 06:18:02 -0700 (PDT)
Received: from [192.168.1.107] ([147.235.73.50])
        by smtp.gmail.com with ESMTPSA id l187sm10972182wml.39.2021.08.29.06.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 06:18:01 -0700 (PDT)
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
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Message-ID: <2bba4c0a-8639-1d3a-5dd5-8e2576f6ab77@gmail.com>
Date:   Sun, 29 Aug 2021 16:17:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATy17OQ900ThKJwHRy35+4Yg=9CRNg9Zp0tZ_O=uQ+kaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello again!

On 24/08/2021 16:30, Masahiro Yamada wrote:
 > On Mon, Aug 23, 2021 at 4:22 AM Ariel Marcovitch
 > <arielmarcovitch@gmail.com> wrote:
 >>
 >> When parsing Kconfig files to find symbol definitions and references,
 >> lines after a 'help' line are skipped until a new config definition
 >> starts.
 >>
 >> However, it is quite common to define a config and then make some other
 >> configs depend on it by adding an 'if' line. This kind of kconfig
 >> statement usually appears after a config definition which might contain
 >> a 'help' section. The 'if' line is skipped in parse_kconfig_file()
 >> because it is not a config definition.
 >>
 >> This means that symbols referenced in this kind of statements are
 >> ignored by this function and thus are not considered undefined
 >> references in case the symbol is not defined.
 >>
 >> The REGEX_KCONFIG_STMT regex can't be used because the other types of
 >> statements can't break help lines.
 >>
 >> Define a new regex for matching 'if' statements and stop the 'help'
 >> skipping in case it is encountered.
 >>
 >> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
 >> ---
 >>  scripts/checkkconfigsymbols.py | 8 +++++++-
 >>  1 file changed, 7 insertions(+), 1 deletion(-)
 >>
 >> diff --git a/scripts/checkkconfigsymbols.py 
b/scripts/checkkconfigsymbols.py
 >> index b9b0f15e5880..875e9a2c14b2 100755
 >> --- a/scripts/checkkconfigsymbols.py
 >> +++ b/scripts/checkkconfigsymbols.py
 >> @@ -26,6 +26,7 @@ EXPR = r"(?:" + OPERATORS + r"|\s|" + SYMBOL + r")+"
 >>  DEFAULT = r"default\s+.*?(?:if\s.+){,1}"
 >>  STMT = r"^\s*(?:if|select|imply|depends\s+on|(?:" + DEFAULT + 
r"))\s+" + EXPR
 >>  SOURCE_SYMBOL = r"(?:\W|\b)+[D]{,1}CONFIG_(" + SYMBOL + r")"
 >> +IF_LINE = r"^\s*(?:if)\s+" + EXPR
 >
 >
 > Why is it enclosed by "(?: )"   ?
 >
 > "(?:if)"  seems to the same as "if"
Oh you are absolutely right.
I just mindlessly copied the STMT regex and removed the other types :)
 >
 >
 >
 >
 >
 >
 >>
 >>  # regex objects
 >>  REGEX_FILE_KCONFIG = re.compile(r".*Kconfig[\.\w+\-]*$")
 >> @@ -35,11 +36,11 @@ REGEX_KCONFIG_DEF = re.compile(DEF)
 >>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
 >>  REGEX_KCONFIG_STMT = re.compile(STMT)
 >>  REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 >> +REGEX_KCONFIG_IF_LINE = re.compile(IF_LINE)
 >>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 >>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 >>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
 >>
 >> -
 >>  def parse_options():
 >>      """The user interface of this module."""
 >>      usage = "Run this tool to detect Kconfig symbols that are 
referenced but " \
 >> @@ -445,6 +446,11 @@ def parse_kconfig_file(kfile):
 >>          line = line.strip('\n')
 >>          line = line.split("#")[0]  # ignore comments
 >>
 >> +        # 'if EXPR' lines can be after help lines
 >> +        # The if line itself is handled later
 >> +        if REGEX_KCONFIG_IF_LINE.match(line):
 >> +            skip = False
 >> +
 >
 >
 > I do not think this is the right fix.
 > There are similar patterns where
 > config references are ignored.
 >
 > For example, FOO and BAR are ignored
 > in the following cases.
 >
 > ex1)
 >
 > choice
 >           prompt "foo"
 >           default FOO
 >
 >
 >
 > ex2)
 >
 > menu "bar"
 >            depends on BAR
 >
 >
 >
 >
 > The help block ends with shallower indentation.
So IIUC we need to measure the indentation when we encounter a help
statement and in the next lines look for a line with a different depth
(which is not an empty line because these are allowed).
 >
 >
 >
 >
 >>          if REGEX_KCONFIG_DEF.match(line):
 >>              symbol_def = REGEX_KCONFIG_DEF.findall(line)
 >>              defined.append(symbol_def[0])
 >> --
 >> 2.25.1
 >>
 >
 >
 > --
 > Best Regards
 > Masahiro Yamada

Thanks for your time!

Ariel Marcovitch
