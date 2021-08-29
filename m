Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F473FAF1A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Aug 2021 01:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhH2XnT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Aug 2021 19:43:19 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:34546 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhH2XnS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Aug 2021 19:43:18 -0400
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17TNfuLw026504;
        Mon, 30 Aug 2021 08:41:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17TNfuLw026504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630280517;
        bh=D64RZDatLPGJKNWc3VFraw+rV9oh++4qeXxN/a79Z8E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jk4Bhci3GGLA+mXf3dHQsXOrDZXfWqZyokltRbYxTZrW3qDk0Ev0A9LBEXStssiac
         aLzndeRst/crsE+dx8MfGW3Sy+jd5EE13B35D1w6/vE/q0j8T8W25a61s+LfH+lkRW
         iA3/WG1NhhDPEQSx4wTG4JJzAAmFWpPDDUGLZjach5u8OdDy4F88YPAIERHXHx9mNr
         79jtYGiWvxJMllqkCQavoixNw1J4XYYeVsyoKfhFvCAVXE40o0Ekg1PVuNrUmoADLr
         +eH3iBlgVSdiVGw0rhhKfJv3AP6sBRE+NSzonwVOzSpRbE9knNpXlLGHGXJTq1MGWb
         tGFjDd4nJJUTA==
X-Nifty-SrcIP: [209.85.215.172]
Received: by mail-pg1-f172.google.com with SMTP id k24so11715489pgh.8;
        Sun, 29 Aug 2021 16:41:56 -0700 (PDT)
X-Gm-Message-State: AOAM530VJf2v9Onr9u6qYDqZBH8krjlipSSPtk7oJF8XGrETtF23yPuZ
        H8g3tGEsDZ+jmYGFVoxiHk/t2Tm/mWVPKUU9k8M=
X-Google-Smtp-Source: ABdhPJyzXQcbdJQ6cet6xGcAAgCmJ3tBeDLBzcob+G5fIUcaJEsK6vMdHctKc05DHuACbOKlKLroA1imvjpjz2KEtSs=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr18928498pgj.47.1630280516114;
 Sun, 29 Aug 2021 16:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
 <20210822192205.43210-3-arielmarcovitch@gmail.com> <CAK7LNATy17OQ900ThKJwHRy35+4Yg=9CRNg9Zp0tZ_O=uQ+kaw@mail.gmail.com>
 <2bba4c0a-8639-1d3a-5dd5-8e2576f6ab77@gmail.com>
In-Reply-To: <2bba4c0a-8639-1d3a-5dd5-8e2576f6ab77@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 30 Aug 2021 08:41:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATy+ptW8agt04nauMfgCvAFccstrpbwd0Y+Vt5xqdNLhg@mail.gmail.com>
Message-ID: <CAK7LNATy+ptW8agt04nauMfgCvAFccstrpbwd0Y+Vt5xqdNLhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] checkkconfigsymbols.py: Fix Kconfig parsing to find
 'if' lines
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 29, 2021 at 10:18 PM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> Hello again!
>
> On 24/08/2021 16:30, Masahiro Yamada wrote:
>  > On Mon, Aug 23, 2021 at 4:22 AM Ariel Marcovitch
>  > <arielmarcovitch@gmail.com> wrote:
>  >>
>  >> When parsing Kconfig files to find symbol definitions and references,
>  >> lines after a 'help' line are skipped until a new config definition
>  >> starts.
>  >>
>  >> However, it is quite common to define a config and then make some other
>  >> configs depend on it by adding an 'if' line. This kind of kconfig
>  >> statement usually appears after a config definition which might contain
>  >> a 'help' section. The 'if' line is skipped in parse_kconfig_file()
>  >> because it is not a config definition.
>  >>
>  >> This means that symbols referenced in this kind of statements are
>  >> ignored by this function and thus are not considered undefined
>  >> references in case the symbol is not defined.
>  >>
>  >> The REGEX_KCONFIG_STMT regex can't be used because the other types of
>  >> statements can't break help lines.
>  >>
>  >> Define a new regex for matching 'if' statements and stop the 'help'
>  >> skipping in case it is encountered.
>  >>
>  >> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
>  >> ---
>  >>  scripts/checkkconfigsymbols.py | 8 +++++++-
>  >>  1 file changed, 7 insertions(+), 1 deletion(-)
>  >>
>  >> diff --git a/scripts/checkkconfigsymbols.py
> b/scripts/checkkconfigsymbols.py
>  >> index b9b0f15e5880..875e9a2c14b2 100755
>  >> --- a/scripts/checkkconfigsymbols.py
>  >> +++ b/scripts/checkkconfigsymbols.py
>  >> @@ -26,6 +26,7 @@ EXPR = r"(?:" + OPERATORS + r"|\s|" + SYMBOL + r")+"
>  >>  DEFAULT = r"default\s+.*?(?:if\s.+){,1}"
>  >>  STMT = r"^\s*(?:if|select|imply|depends\s+on|(?:" + DEFAULT +
> r"))\s+" + EXPR
>  >>  SOURCE_SYMBOL = r"(?:\W|\b)+[D]{,1}CONFIG_(" + SYMBOL + r")"
>  >> +IF_LINE = r"^\s*(?:if)\s+" + EXPR
>  >
>  >
>  > Why is it enclosed by "(?: )"   ?
>  >
>  > "(?:if)"  seems to the same as "if"
> Oh you are absolutely right.
> I just mindlessly copied the STMT regex and removed the other types :)
>  >
>  >
>  >
>  >
>  >
>  >
>  >>
>  >>  # regex objects
>  >>  REGEX_FILE_KCONFIG = re.compile(r".*Kconfig[\.\w+\-]*$")
>  >> @@ -35,11 +36,11 @@ REGEX_KCONFIG_DEF = re.compile(DEF)
>  >>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
>  >>  REGEX_KCONFIG_STMT = re.compile(STMT)
>  >>  REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
>  >> +REGEX_KCONFIG_IF_LINE = re.compile(IF_LINE)
>  >>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
>  >>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
>  >>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
>  >>
>  >> -
>  >>  def parse_options():
>  >>      """The user interface of this module."""
>  >>      usage = "Run this tool to detect Kconfig symbols that are
> referenced but " \
>  >> @@ -445,6 +446,11 @@ def parse_kconfig_file(kfile):
>  >>          line = line.strip('\n')
>  >>          line = line.split("#")[0]  # ignore comments
>  >>
>  >> +        # 'if EXPR' lines can be after help lines
>  >> +        # The if line itself is handled later
>  >> +        if REGEX_KCONFIG_IF_LINE.match(line):
>  >> +            skip = False
>  >> +
>  >
>  >
>  > I do not think this is the right fix.
>  > There are similar patterns where
>  > config references are ignored.
>  >
>  > For example, FOO and BAR are ignored
>  > in the following cases.
>  >
>  > ex1)
>  >
>  > choice
>  >           prompt "foo"
>  >           default FOO
>  >
>  >
>  >
>  > ex2)
>  >
>  > menu "bar"
>  >            depends on BAR
>  >
>  >
>  >
>  >
>  > The help block ends with shallower indentation.
> So IIUC we need to measure the indentation when we encounter a help
> statement and in the next lines look for a line with a different depth
> (which is not an empty line because these are allowed).



If you want to implement it precisely, yes.


Or, if you want to adopt a simpler
solution, detect the following keywords.

comment
if
menu
choice


This is not precise, but it will work
in most cases.



In the following example, the first 'menu'
is just a comment.
The second 'menu' is a keyword since it has
a shallower indentation.



    help
       blah blah
       menu blah blah
       blah blah
  menu "menu prompt"
     depends on FOO












--
Best Regards
Masahiro Yamada
