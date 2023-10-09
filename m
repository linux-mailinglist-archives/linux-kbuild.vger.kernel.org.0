Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3914E7BD6EB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 11:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345994AbjJIJ0Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 05:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346001AbjJIJ0B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 05:26:01 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D74172D
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 02:24:51 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-45766b79b14so502328137.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2023 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696843490; x=1697448290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UF4HHtAjsWoW8COUfPjIq04oTy0Y9WnIOpm6XrK+h+s=;
        b=YS7xzKT46ZMifl9oguA8263a5DF7FCAM9sN3edMXX9XJ7+Q3rOFpuGhmM+bMuezBZY
         g8MDqQBksM/+6adprZMFR2fUwDOK0C4JTiB286ouhont4CIiB81GlkK+kS/HcOLpYDWG
         QWlwORx/6+y1m38t/Q1u1NBP33amrg18IJMbH+OLK1Mbt8yi2mPoE+PR5WBpo3B8elkU
         JIS9qpfGhM03SRcslNE1tIswUXFhD4QwLeD59nHgCy9GgBUrfSDy6ihgGKHBRi9WXQ1N
         VAjqVwlaMq6sbE+EJK9vDKTEgH4myDWeNlAJ1RHv9h7qUAhg6ol8Vz3IEDJT/bYdl9br
         pzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696843490; x=1697448290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UF4HHtAjsWoW8COUfPjIq04oTy0Y9WnIOpm6XrK+h+s=;
        b=gkW+3LgNKi4q9UXnvafxBDHp1yX0xK2zVYlZBkc1En9Ps8nQLkvHN0aihIFOlrIIPS
         Q8iKURv8sbm2dRPzuGKJIBEaJe5JenzMe777Kmpn7AbSmGwsz3Fkx38aj1KzJuhY2o/h
         8T4WEbm6uHAuMoQJ5uyX1eDSwrLHPvlAwnc2IDKbnNP2pjQLlyGe+SG11bmyJgNw4x7T
         KAtVa7eea9rdMT/cSeqr7vit9c1DHynU469tjDgeULYGtvrBcZmWWyiivN63iCT/pSVT
         kInQdVVVYHhkFXQwm9U0sVnKspCkYUqR+N3XGNw2T3n9WFXG0qqcK93PffD5xJolzquC
         llJA==
X-Gm-Message-State: AOJu0YyCmbdDOw7qVyYTKmf7p0YPYkV+NkjT7DfBXhvxcXXLs1GnHlvZ
        gyPonj4sYq7gW+KWb8xAIhtdir160dBd6ann6BuS6Q==
X-Google-Smtp-Source: AGHT+IGgWAVLAZj1yB/wjLE5o7mTLCnmR/2SrPqFD4z1Q5u8A8TRq2SpTPP6kwJLE+IAk/1YdShomytIZ8BM7R6Qo5g=
X-Received: by 2002:a67:fc86:0:b0:452:7380:5517 with SMTP id
 x6-20020a67fc86000000b0045273805517mr13662328vsp.32.1696843490622; Mon, 09
 Oct 2023 02:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231007170448.505487-1-masahiroy@kernel.org> <CAFA6WYNqe-e_ZqbxXW5BcmMOxQr42mdJV-o4W4U4XcOsPe0P+Q@mail.gmail.com>
 <CAK7LNASAPYAUQsKEp9Z-Bm=wJgb_Cebg02K26XGNz=j2Rgajag@mail.gmail.com>
In-Reply-To: <CAK7LNASAPYAUQsKEp9Z-Bm=wJgb_Cebg02K26XGNz=j2Rgajag@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 9 Oct 2023 14:54:39 +0530
Message-ID: <CAFA6WYNLvCF9NXvSOZNGJV2c5W_ZG11iq3Sy7Lr=ismD2ckiYw@mail.gmail.com>
Subject: Re: [PATCH 1/5] modpost: fix tee MODULE_DEVICE_TABLE built on big
 endian host
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 9 Oct 2023 at 12:27, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Oct 9, 2023 at 3:27=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org>=
 wrote:
> >
> > Hi Masahiro,
> >
> > On Sat, 7 Oct 2023 at 22:34, Masahiro Yamada <masahiroy@kernel.org> wro=
te:
> > >
> > > When MODULE_DEVICE_TABLE(tee, ) is built on a host with a different
> > > endianness from the target architecture, it results in an incorrect
> > > MODULE_ALIAS().
> > >
> > > For example, see a case where drivers/char/hw_random/optee-rng.c
> > > is built as a module.
> > >
> > > If you build it on a little endian host, you will get the correct
> > > MODULE_ALIAS:
> > >
> > >     $ grep MODULE_ALIAS drivers/char/hw_random/optee-rng.mod.c
> > >     MODULE_ALIAS("tee:ab7a617c-b8e7-4d8f-8301-d09b61036b64*");
> > >
> > > However, if you build it on a big endian host, you will get a wrong
> > > MODULE_ALIAS:
> > >
> > >     $ grep MODULE_ALIAS drivers/char/hw_random/optee-rng.mod.c
> > >     MODULE_ALIAS("tee:646b0361-9bd0-0183-8f4d-e7b87c617aab*");
> > >
> > > This issue has been unnoticed because the ARM kernel is most likely b=
uilt
> > > on a little endian host (cross-build on x86 or native-build on ARM).
> > >
> > > The uuid field must not be reversed because uuid_t is an array of __u=
8.
> > >
> >
> > To me it wasn't obvious that DEF_FIELD() has certain endianness limitat=
ions.
> >
> > > Fixes: 0fc1db9d1059 ("tee: add bus driver framework for TEE based dev=
ices")
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/mod/file2alias.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > > index 7056751c29b1..70bf6a2f585c 100644
> > > --- a/scripts/mod/file2alias.c
> > > +++ b/scripts/mod/file2alias.c
> > > @@ -1348,13 +1348,13 @@ static int do_typec_entry(const char *filenam=
e, void *symval, char *alias)
> > >  /* Looks like: tee:uuid */
> > >  static int do_tee_entry(const char *filename, void *symval, char *al=
ias)
> > >  {
> > > -       DEF_FIELD(symval, tee_client_device_id, uuid);
> >
> > As you have mentioned in patch #3: the limitations of TO_NATIVE(), if
> > you can update comments for DEF_FIELD() as well to make it clear that
> > it doesn't support byte arrays/strings would be helpful. I think the
> > following check that you have introduced in patch #3 can still be
> > bypassed for byte arrays/strings.
> >
> > + _Static_assert(sizeof(x) =3D=3D 1 || sizeof(x) =3D=3D 2 || \
> > +       sizeof(x) =3D=3D 4 || sizeof(x) =3D=3D 8, "bug");
>
>
>
>
> I am afraid you missed the point.
>
> bswap_2, bswap_4, bswap_8 do not take a pointer.
>
> If you pass an array or a string,
> it will result in a build error
> due to the compiler's prototype checking.
>
> The kbuild test robot will catch a build error anyway.
>

I see your point.

>
> "You cannot build it in the first place"
> is better than a comment.
>

That's fine with me as long as it's a build problem.

-Sumit

>
>
>
>
>
>
>
>
>
> > BTW, for this fix feel free to add:
> >
> > Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > -Sumit
> >
> > > +       DEF_FIELD_ADDR(symval, tee_client_device_id, uuid);
> > >
> > >         sprintf(alias, "tee:%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%0=
2x-%02x%02x%02x%02x%02x%02x",
> > > -               uuid.b[0], uuid.b[1], uuid.b[2], uuid.b[3], uuid.b[4]=
,
> > > -               uuid.b[5], uuid.b[6], uuid.b[7], uuid.b[8], uuid.b[9]=
,
> > > -               uuid.b[10], uuid.b[11], uuid.b[12], uuid.b[13], uuid.=
b[14],
> > > -               uuid.b[15]);
> > > +               uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid-=
>b[4],
> > > +               uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid-=
>b[9],
> > > +               uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], u=
uid->b[14],
> > > +               uuid->b[15]);
> > >
> > >         add_wildcard(alias);
> > >         return 1;
> > > --
> > > 2.39.2
> > >
>
>
>
> --
> Best Regards
> Masahiro Yamada
