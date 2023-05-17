Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDCE7071F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 21:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjEQTX0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 15:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjEQTXP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 15:23:15 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E862D68
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:23:10 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3f51ea3a062so37111cf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684351389; x=1686943389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99WaBRQDUs3kb1dnzIG44mb1K4MZZ93giF8G4LLAmW8=;
        b=dC/JtS+CXoS3N4aXYIF6cSUebLVzJ7Tb65v5Kqkyjle341mL7a7aSc8Cj33QqRhHOM
         YkWvISnH+LhJSqB0OWz4QYFc4XCKPoCZGWjsI0eqFCsx4BoxL2c1z7DuOHVGoaE6UR55
         iCJoBY9KYYUHL6gLjCMLKhyd0LoDh5fZHTvpJ88bW+jcNBrl1fBZ4D6ooBVpzNELKZw7
         0KFLTQmN7Fn4dO3BAYhhDQQYBPjzVz7s2/2FfIvDwK7+cK0GCRIWrCNuB9a7UTlHYQBU
         BCkYU6X3gMVVhRnc+xjtl7wRsYrhEjA+5S4ch8p4sPJLOlLC1bis4Y8nQdqyZ3wuzUZ5
         3DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684351389; x=1686943389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99WaBRQDUs3kb1dnzIG44mb1K4MZZ93giF8G4LLAmW8=;
        b=QS/YBUbnvQ4PaUDwxUu01WnEloG3KmKtoB3Mt/HPv5g+8rysLghpzHgdV+dUQ9RJR2
         dBIQve9EIp4/+q+z9tnfxvzXq6aZg5CPSwItRJglYJWhl82tf41a+4gIj9Ow4d6qh7Q7
         FcmmT4f4Kw1qsq5OsQBCtuj75NIbC0fOB6g+fIr8ZCcOPnfQ1KNGlzXUo+4ioFdEygrI
         2PonVKV7XUuPflkwZljrIuIODr0HeQQRCHhKcfkt7qUa4fHn+BNOhYMJXV2XOIIMyn9/
         uFs1knnqklXdwv2hH//zDm++QYzmVWESN17wa3Z7aBDyPvBzPajU7MGnhaRi8P5tAfEa
         9amw==
X-Gm-Message-State: AC+VfDxI7hBM+gc0bjEYWGD/GU2+XXj/e14TjC3zdJ37lSd5n24C/RK/
        uP3T2SbXyU/yPoNe4T3m57n4CKoGH6nauHYCS4DnAQ==
X-Google-Smtp-Source: ACHHUZ7R+gC0bI/RsQjqW5ftAr/ftTU0NZgmcN4ZTqv8lHc3bxNUzCoZn8yuoEW6XLsEKxJ62Ukgubm/ICDjEdour/0=
X-Received: by 2002:ac8:5789:0:b0:3f3:75c2:7466 with SMTP id
 v9-20020ac85789000000b003f375c27466mr59103qta.8.1684351389019; Wed, 17 May
 2023 12:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
 <CAFP8O3L_RsaTMJvT7hmjD6ON49uob9Fb4mWg8ZUav_Y-FCgTMA@mail.gmail.com>
 <CAFP8O3JivZh+AAV7N90Nk7U2BHRNST6MRP0zHtfQ-Vj0m4+pDA@mail.gmail.com> <202305171215.7C58897@keescook>
In-Reply-To: <202305171215.7C58897@keescook>
From:   Fangrui Song <maskray@google.com>
Date:   Wed, 17 May 2023 12:22:57 -0700
Message-ID: <CAFP8O3JuPsCTgTXLkQpoy9WZG2jPxyisCjWhsB7yqJ-D9nA=OA@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To:     Kees Cook <keescook@chromium.org>
Cc:     ndesaulniers@google.com, masahiroy@kernel.org,
        linux-kbuild@vger.kernel.org, nathan@kernel.org,
        linux-hardening@vger.kernel.org, jpoimboe@kernel.org,
        llvm@lists.linux.dev, mbenes@suse.cz, linux-kernel@vger.kernel.org,
        trix@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 17, 2023 at 12:16=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Wed, May 17, 2023 at 12:09:35PM -0700, Fangrui Song wrote:
> > On Wed, May 17, 2023 at 12:08=E2=80=AFPM Fangrui Song <maskray@google.c=
om> wrote:
> > >
> > > On Wed, May 17, 2023 at 12:02=E2=80=AFPM Kees Cook <keescook@chromium=
.org> wrote:
> > > >
> > > > On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> > > > > -fsanitize-undefined-trap-on-error has been supported since GCC 5=
.1 and
> > > > > Clang 3.2.  The minimum supported version of these according to
> > > > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively.=
 Drop
> > > > > this cc-option check.
> > > > >
> > > > >
> > > >
> > > > Applied to for-next/hardening, thanks!
> > > >
> > > > [1/1] ubsan: remove cc-option test for UBSAN_TRAP
> > > >       https://git.kernel.org/kees/c/08e4044243a6
> > > >
> > > > --
> > > > Kees Cook
> > > >
> > > >
> > >
> > > For this -fsanitize-undefined-trap-on-error, I think we need a v2 pat=
ch that
> > > tries -fsanitize-trap=3Dall as well.
> >
> > Correction: -fsanitize-trap=3Dundefined
> >
> > > -fsanitize-undefined-trap-on-error has been deprecated in Clang for 8
> > > years, and at some point we will remove the option.
> > >
> > > GCC implements -fsanitize-trap=3Dall later, but
> > > -fsanitize-undefined-trap-on-error is documented as deprecated as
> > > well.
>
> Right now all the compilers support the old way, and I'd rather remove a
> cc-option call than add two. :)
>
> --
> Kees Cook

Hmm, this gives Clang developers a disadvantage... Anyone who removes
Clang's -fsanitize-undefined-trap-on-error (or give it a warning
before removal) will probably face complaints from kernel
developers...



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
