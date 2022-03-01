Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D014E4C9357
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Mar 2022 19:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiCAShX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 13:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiCAShW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 13:37:22 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05439583BF
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 10:36:41 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e8so23081350ljj.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=laq0kj8LMyGe/L1lT4KstA0XXC6SaMCcvXF5TxzEHJE=;
        b=cseWP725xZEV5DG7/7HhVJRXJnnaYgNPB1QfXwbbjJWC6NVSFyAMkJnSMdzVYN+n60
         V9cvbOA4GrTsck7K9O3QNmy+H7nsE3YEuIxG2cCOrCVGYwH5NihTAIdmy8y3gSNZmwx4
         zLlcJNhvp1ZVSQpebvj6G95RGqsP1b0x1EdFxN6sakgkUVzwYaQ2r21HHjUR5Lpex4Ka
         lVrffVkbgA0ULYB9m7sL+IwDm7FOTcFUBVz3PLwJTl2oJs/7FFRLf1IyXCFtabrPKm5W
         0pd0zgJgGqprZsjC25j1xKjr0ocnOLOF5Zt0aAbsJ8YLb1XM0lCdrL2AwaD3wIuqntwK
         Rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=laq0kj8LMyGe/L1lT4KstA0XXC6SaMCcvXF5TxzEHJE=;
        b=nmQvk3MXDiYbpUbXle85lAb0fMtncXYbkoCIAufUKDucqrDIFxhu7gcvLqQxdQ2bFY
         /yVDWRp/Y3FjB2uE4LrGBMnkxyFWY0PXUmtZTbENoWrY/mk9PwYrfBOTKrghdtzmavR2
         FbykXQA2x+2kUQGH2JXaF/AGThaLkhQ+BnOoIEOcpNBCpJiOcoL//QKLp2t1WximETxt
         OR4LxG624Y8/oMGJRethb0CeVUoJlaN6P9GGQxRR9v7Ytb6fewQ93U1pQFLNG+nChQ8A
         k32dT7wH6zd1mDW5RO9PuCvYFUiD/UQi3H/7mxrWz4n9aQxIi5gQVFnfevrHnoTHmUj9
         cqHA==
X-Gm-Message-State: AOAM533SuSnDtNkM4yrcA0r98E+cj2VCdBp2R+XoSEPkv2yMYNCkWalI
        0YF+n7jsxP5B6HYhKgZ28VsAROooRUElz4wRA9Z93A==
X-Google-Smtp-Source: ABdhPJxz4/POajrQSh8J95G0LI2PlY3NITd9Zvp3oAgJtLNGpqE4DU9eXJyf3aKPc/XYqvLBavqMBoHZX32nQhO2HJA=
X-Received: by 2002:a2e:8942:0:b0:246:4536:cf22 with SMTP id
 b2-20020a2e8942000000b002464536cf22mr17923344ljk.235.1646159798280; Tue, 01
 Mar 2022 10:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20220225144245.182659-1-masahiroy@kernel.org> <CAKwvOd=WjnHSHKLVRJifHxV2tyDsLTkek80NWU=do=FSHhNLug@mail.gmail.com>
 <67b75a36cf874dfea0871649ccd268d3@AcuMS.aculab.com> <CAK7LNASatB_W3WmE3BOqFNwJcFQeqh_haEDMjZnfi127gcY0QQ@mail.gmail.com>
In-Reply-To: <CAK7LNASatB_W3WmE3BOqFNwJcFQeqh_haEDMjZnfi127gcY0QQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Mar 2022 10:36:26 -0800
Message-ID: <CAKwvOdmC5J-KpA-oyQQApt=vGCxSSd84ZRdHiS3t3fjvG_d7iA@mail.gmail.com>
Subject: Re: [PATCH v2] fixdep: use fflush() and ferror() to ensure successful
 write to files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     David Laight <David.Laight@aculab.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 1, 2022 at 12:22 AM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> David answered most of the questions from Nick.
>
>
> Let me answer this question:
> "Why call ferror as opposed to checking the return code of fflush?
> Reading the man page closer:"
>
>
> When fprintf() happens to need to write data to the end device,
> the internal buffer is cleared anyway (even if the writing to the
> end device fails).
> (We do not notice the failure of this because this patch is
> removing xprintf().)
>
>
> If the buffer has been cleared by the previous fprintf() call,
> fflush() succeeds because there is no data in the internal buffer.
>
> So, checking the return value of fflush() is not enough.
>
> That's my understanding.
> (I ran a small piece of test code under "ulimit -f")
>
>
> So, we have two options:
>
> [1] Check the return values in *all* the call-sites
>     of fprintf() and fflush().
>
>
> [2] Call fprintf() and fflush() or whatever without checking
>      their return values.
>     And, check ferror() at the last moment.
>
>
>
>
> If you are really sure that all the return values are checked,
> you can go with [1], then you do not need to call ferror(),
> but it is generally less fragile than [2].

Sure, doesn't matter much to me; was more curious "why."
Reviewd-by: Nick Desaulniers <ndesaulniers@google.com>

>
>
>
>
>
>
> On Tue, Mar 1, 2022 at 11:28 AM David Laight <David.Laight@aculab.com> wr=
ote:
> >
> > Someone send HTML mail =E2=80=93 outlook is broken =E2=80=93 only lets =
you top post :-(
> >
> >
> >
> > The return value from fprintf() is normally the number of bytes written=
 to
> >
> > the internal buffer (8k in glibc?)
> >
> > Only if the buffer is full and an actual write() is done do you get any=
 indication of an error.
> >
> > So you can use the error return from fprintf() to terminate a loop =E2=
=80=93 but it usually
> >
> > just isn=E2=80=99t worth the effort.
> >
> > The error status returned by ferror() is =E2=80=98sticky=E2=80=99, so y=
ou need only check once.
> >
> > But you need to check before fclose().
> >
> > Since fclose() has to write out the buffer =E2=80=93 that write can als=
o fail.
> >
> > I=E2=80=99m not sure whether fclose() returns and error in that case, b=
ut adding fflush()
> >
> > makes the coding easier.
> >
> >
> >
> > So if you have lots of fprintf() adding data to a file (which is often =
the case)
> >
> > almost all of them always succeed =E2=80=93 even if the disk is full.
> >
> > Adding the error paths that can never really happen just makes the
> >
> > code harder to read and clutters things up.
> >
> >
> >
> >                 David
> >
> >
> >
> > From: Nick Desaulniers <ndesaulniers@google.com>
> > Sent: 28 February 2022 23:01
> > To: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>; David Lai=
ght <David.Laight@ACULAB.COM>; LKML <linux-kernel@vger.kernel.org>; Michal =
Marek <michal.lkml@markovi.net>
> > Subject: Re: [PATCH v2] fixdep: use fflush() and ferror() to ensure suc=
cessful write to files
> >
> >
> >
> > On Fri, Feb 25, 2022 at 6:43 AM Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> > >
> > > Checking the return value of (v)printf does not ensure the successful
> > > write to the .cmd file.
> >
> > Masahiro,
> > Apologies for my delay reviewing; I was on vacation last week.
> >
> > Do you have more context for why this change is necessary? Perhaps you =
might describe further in the commit message the use case you're trying to =
support?
> >
> > Reading the man pages for vprintf(3), fflush(3), and ferror(3), I'm cur=
ious why checking the return value of ferror(3) after not doing so for `vpr=
intf` and `fflush` is preferred?
> >
> > Why not simply unconditionally add a call to fflush while leaving the e=
xisting return code checking on vprintf?
> >
> > >
> > > Call fflush() and ferror() to make sure that everything has been
> > > written to the file.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > > Changes in v2:
> > >   - add error message
> > >
> > >  scripts/basic/fixdep.c | 46 +++++++++++++++++-----------------------=
--
> > >  1 file changed, 19 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> > > index 44e887cff49b..2328f9a641da 100644
> > > --- a/scripts/basic/fixdep.c
> > > +++ b/scripts/basic/fixdep.c
> > > @@ -105,25 +105,6 @@ static void usage(void)
> > >         exit(1);
> > >  }
> > >
> > > -/*
> > > - * In the intended usage of this program, the stdout is redirected t=
o .*.cmd
> > > - * files. The return value of printf() must be checked to catch any =
error,
> > > - * e.g. "No space left on device".
> > > - */
> > > -static void xprintf(const char *format, ...)
> > > -{
> > > -       va_list ap;
> > > -       int ret;
> > > -
> > > -       va_start(ap, format);
> > > -       ret =3D vprintf(format, ap);
> > > -       if (ret < 0) {
> > > -               perror("fixdep");
> > > -               exit(1);
> >
> > Wouldn't the existing approach abort sooner if there was an error encou=
ntered?
> >
> > > -       }
> > > -       va_end(ap);
> > > -}
> > > -
> > >  struct item {
> > >         struct item     *next;
> > >         unsigned int    len;
> > > @@ -189,7 +170,7 @@ static void use_config(const char *m, int slen)
> > >
> > >         define_config(m, slen, hash);
> > >         /* Print out a dependency path from a symbol name. */
> > > -       xprintf("    $(wildcard include/config/%.*s) \\\n", slen, m);
> > > +       printf("    $(wildcard include/config/%.*s) \\\n", slen, m);
> > >  }
> > >
> > >  /* test if s ends in sub */
> > > @@ -318,13 +299,13 @@ static void parse_dep_file(char *m, const char =
*target)
> > >                                  */
> > >                                 if (!saw_any_target) {
> > >                                         saw_any_target =3D 1;
> > > -                                       xprintf("source_%s :=3D %s\n\=
n",
> > > -                                               target, m);
> > > -                                       xprintf("deps_%s :=3D \\\n", =
target);
> > > +                                       printf("source_%s :=3D %s\n\n=
",
> > > +                                              target, m);
> > > +                                       printf("deps_%s :=3D \\\n", t=
arget);
> > >                                 }
> > >                                 is_first_dep =3D 0;
> > >                         } else {
> > > -                               xprintf("  %s \\\n", m);
> > > +                               printf("  %s \\\n", m);
> > >                         }
> > >
> > >                         buf =3D read_file(m);
> > > @@ -347,8 +328,8 @@ static void parse_dep_file(char *m, const char *t=
arget)
> > >                 exit(1);
> > >         }
> > >
> > > -       xprintf("\n%s: $(deps_%s)\n\n", target, target);
> > > -       xprintf("$(deps_%s):\n", target);
> > > +       printf("\n%s: $(deps_%s)\n\n", target, target);
> > > +       printf("$(deps_%s):\n", target);
> > >  }
> > >
> > >  int main(int argc, char *argv[])
> > > @@ -363,11 +344,22 @@ int main(int argc, char *argv[])
> > >         target =3D argv[2];
> > >         cmdline =3D argv[3];
> > >
> > > -       xprintf("cmd_%s :=3D %s\n\n", target, cmdline);
> > > +       printf("cmd_%s :=3D %s\n\n", target, cmdline);
> > >
> > >         buf =3D read_file(depfile);
> > >         parse_dep_file(buf, target);
> > >         free(buf);
> > >
> > > +       fflush(stdout);
> > > +
> > > +       /*
> > > +        * In the intended usage, the stdout is redirected to .*.cmd =
files.
> > > +        * Call ferror() to catch errors such as "No space left on de=
vice".
> > > +        */
> > > +       if (ferror(stdout)) {
> >
> > Why call ferror as opposed to checking the return code of fflush?  Read=
ing the man page closer:
> >
> >        The  function feof() tests the end-of-file indicator for the str=
eam pointed to by stream, returning nonzero if it is set.  The end-of-file =
indicator can be cleared only by the function
> >        clearerr().
> >
> >        The function ferror() tests the error indicator for the stream p=
ointed to by stream, returning nonzero if it is set.  The error indicator c=
an be reset only by the clearerr() function.
> >
> > Does that imply that "the end-of-file indicator" is distinct from "the =
error indicator?"
> >
> > > +               fprintf(stderr, "fixdep: not all data was written to =
the output\n");
> > > +               exit(1);
> > > +       }
> > > +
> > >         return 0;
> > >  }
> > > --
> > > 2.32.0
> > >
> >
> >
> >
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, M=
K1 1PT, UK
> > Registration No: 1397386 (Wales)
> >
> > P Please consider the environment and don't print this e-mail unless yo=
u really need to
>
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
Thanks,
~Nick Desaulniers
