Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4CB20C866
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 16:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgF1OVE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 10:21:04 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61703 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgF1OVE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 10:21:04 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05SEKjHU000993;
        Sun, 28 Jun 2020 23:20:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05SEKjHU000993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593354046;
        bh=SpnPV9Jw5FLt7p2FWt34dkohsBoVDDQyJ7GIPMdNLkI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LjZEpN6OmKC3Dlnr4iiYgVQ2KGQTzRqE5qn8MNy2sjSnRSG//D4QdALGNZwJR0iO3
         VKhqgHKS3inmjd+J/0Zm2sfESfi9IgY0se7xfNSWNgkdlHXiSkCNMkNsEk+y73Xe4G
         6zuiipXuCxOdxBQgR33fDgTzMNXD8jw+9sOKozsGiP1o/PMm3+8VhYSQnzHdIAUoyr
         MJnhZY7PLDTIDIzSE9D5cCReuSsIdHsIKoIcljtljlUcvbU+sZPk8b5cbhod3Yxdmn
         CcLMY8dcG8mOB3qOSwxe63JWcK4NUz+niytDatvFIzQYTb3PSZvUYVrhR/cwhgvLgr
         ad/sllCj2sqow==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id g14so4512484ual.11;
        Sun, 28 Jun 2020 07:20:46 -0700 (PDT)
X-Gm-Message-State: AOAM533P1483yBXJCNqwbT/jooK03neElbgCJb1taWMvnR2TTkdPQFB8
        /9giLcW228gBl8lqfX28EP394qNZGGFyms16i08=
X-Google-Smtp-Source: ABdhPJzgGpxo3c35DZ/opI47ier+SBwjNpJ3xnvkA6z7JRjbQVIVltyM0meLp/+nlcWIUJpb0HzN8MGJFoBllbJsK8A=
X-Received: by 2002:ab0:156d:: with SMTP id p42mr8085853uae.121.1593354044802;
 Sun, 28 Jun 2020 07:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <11c1e65b393b4c3ca6118515c77bbf19524dab11.1593074472.git.hns@goldelico.com>
 <CAK7LNATCLscXNDZ1RUmbnM5BeV-tvKjz9kQB8eo0SNp10WbjFQ@mail.gmail.com>
 <2D851B90-5F85-4136-AF70-E764FDF4D7DD@goldelico.com> <CAK7LNARfgaVgmqzsa+n2rvPx5K1dsmcqMLSeLe_tMP0O017=Yw@mail.gmail.com>
 <2F77152B-BF7D-4098-AE60-2F13794B027A@goldelico.com>
In-Reply-To: <2F77152B-BF7D-4098-AE60-2F13794B027A@goldelico.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 23:20:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRocttsA9xGOm45QPnjfk4sMZMoYC-kazrCWccj=fK7Q@mail.gmail.com>
Message-ID: <CAK7LNASRocttsA9xGOm45QPnjfk4sMZMoYC-kazrCWccj=fK7Q@mail.gmail.com>
Subject: Re: [PATCH] modpost: remove use of non-standard strsep() in HOSTCC code
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 5:20 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
>
> > Am 28.06.2020 um 09:52 schrieb Masahiro Yamada <masahiroy@kernel.org>:
> >
> > On Sun, Jun 28, 2020 at 3:17 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>
> >> Hi,
> >>
> >>> Am 28.06.2020 um 07:51 schrieb Masahiro Yamada <masahiroy@kernel.org>:
> >>>
> >>> On Thu, Jun 25, 2020 at 5:47 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >>>>
> >>>> strsep() is neither standard C nor POSIX and used outside
> >>>> the kernel code here. Using it here requires that the
> >>>> build host supports it out of the box which is e.g.
> >>>> not true for a Darwin build host and using a cross-compiler.
> >>>> This leads to:
> >>>>
> >>>> scripts/mod/modpost.c:145:2: warning: implicit declaration of function 'strsep' [-Wimplicit-function-declaration]
> >>>> return strsep(stringp, "\n");
> >>>> ^
> >>>>
> >>>> and a segfault when running MODPOST.
> >>>>
> >>>> See also: https://stackoverflow.com/a/7219504
> >>>>
> >>>> So let's add some lines of code separating the string at the
> >>>> next newline character instead of using strsep(). It does not
> >>>> hurt kernel size or speed since this code is run on the build host.
> >>>>
> >>>> Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() helpers")
> >>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >>>> ---
> >>>> scripts/mod/modpost.c | 7 ++++++-
> >>>> 1 file changed, 6 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> >>>> index 6aea65c65745..8fe63989c6e1 100644
> >>>> --- a/scripts/mod/modpost.c
> >>>> +++ b/scripts/mod/modpost.c
> >>>> @@ -138,11 +138,16 @@ char *read_text_file(const char *filename)
> >>>>
> >>>> char *get_line(char **stringp)
> >>>> {
> >>>> +       char *p;
> >>>>       /* do not return the unwanted extra line at EOF */
> >>>>       if (*stringp && **stringp == '\0')
> >>>
> >>> This check does not make sense anymore.
> >>>
> >>> Previously, get_line(NULL) returns NULL.
> >>>
> >>> With your patch, get_line(NULL) crashes
> >>> due to NULL-pointer dereference.
> >>
> >> Well, that is original code.
> >
> >
> > Sorry for confusion.
> >
> > I meant this:
> >
> >  char *s = NULL;
> >  get_line(&s);
> >
> >
> > In the current code, get_line(&s) returns NULL.
> > As 'man strsep' says this:
> >  "If *stringp is NULL, the strsep() function returns NULL
> >   and does nothing else."
> >
> > With your patch, **stringp will cause
> > NULL-pointer dereference.
>
> Ah, now I see. strsep() has a special case that is not covered
> by my patch.
>
> On the other hand, get_line() is only called as get_line(&pos) and
> pos = buf can not be NULL because that is checked before in read_dump().
> This is why I did not observe a segfault.
>
> But it is wise to make get_line() it more robust than needed. We do
> never know who will copy this code fragment... And I am tempted to
> handle the get_line(NULL) case as well.

No.
(stringp == NULL) is a bug.
Better to not handle.


(*stringp == NULL) has a good reason to be handled.


*stringp is updated to point to the next.

But, there is no more delimiter, *stringp reaches
the end of a string (**stringp == '\0').
In this case, we cannot advance *stringp any more.
(We cannot point the next character of '\0';
it would cause buffer overrun).

So,*stringp is set to NULL to represent no more string.
In the next iteration, (*stringp == NULL) is input,
then NULL is returned.




>
> >> I have only replaced the strsep() function.
> >> But yes, it looks to be better in addition to
> >> my patch.
> >>
> >>>
> >>>
> >>>
> >>>>               return NULL;
> >>>>
> >>>> -       return strsep(stringp, "\n");
> >>>> +       p = *stringp;
> >>>> +       while (**stringp != '\n')
> >>>> +               (*stringp)++;
> >>>
> >>>
> >>> Is this a safe conversion?
> >>>
> >>> If the input file does not contain '\n' at all,
> >>> this while-loop continues running,
> >>> and results in the segmentation fault
> >>> due to buffer over-run.
> >>
> >> Ah, yes, you are right.
> >>
> >> We should use
> >>
> >> +       while (**stringp && **stringp != '\n')
> >>
> >>>
> >>>
> >>>
> >>>> +       *(*stringp)++ = '\0';
> >>>> +       return p;
> >>>> }
> >>>
> >>>
> >>>
> >>> How about this?
> >>>
> >>> char *get_line(char **stringp)
> >>> {
> >>>       char *orig = *stringp;
> >>
> >> ^^^ this still segfaults with get_line(NULL)
> >
> >
> > This is OK.
> >
> > get_line(NULL) should crash because we never expect
> > the case  ' stringp == NULL'.
> >
> > We need to care about the case ' *stringp == NULL'.
> > In this case, get_line() should return NULL.
> >
> >
> >
> >
> >>>       char *next;
> >>>
> >>>       /* do not return the unwanted extra line at EOF */
> >>>       if (!orig || *orig == '\0')
> >>>               return NULL;
> >>>
> >>>       next = strchr(orig, '\n');
> >>>       if (next)
> >>>               *next++ = '\0';
> >>>
> >>>       *stringp = next;
> >>
> >> Yes, this code is easier to understand than my while loop.
> >> And strchr() is POSIX.
> >>
> >> So should I submit an updated patch or do you want to submit
> >> it (with a suggested-by: H. Nikolaus Schaller <hns@goldelico.com>)
> >
> > Please send a patch.
> > (Co-developed-by if you want to give some credit to me)
>
> Yes, I will do in the next days.
>
> BR and thanks,
> Nikolaus Schaller
>


-- 
Best Regards
Masahiro Yamada
