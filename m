Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C1F70718A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 21:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjEQTJ6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 15:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjEQTJv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 15:09:51 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559E3D048
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:09:47 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f38a9918d1so31701cf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684350586; x=1686942586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sfDGNxFljLZPwjQlmmmYoY6SbW+JgmdsgpLXcsCH5Y=;
        b=0MvIVpu2NgSI501OvzcIRQfAWlfFh7IoDuwZnbku8+cdXhaFdzbKEfjNN/VKul/mZn
         URKug3mfuS6JaTu5ojMXMT7+kKu9uiNFP0cnWqZUQJ49e9KwRGORJDFlPTfxNatgipeZ
         Vgk+/vIlqdtEk+wmhus1K7LMgVqIdzKI3DvVuOMDgi79B1Rem50C/RmW/jYSX0G3i/zJ
         WOiri7zt1F3RiHPjBIVcY26RtfboStBMhcPiP6HZXfy/9Qn+p4ZcTXmqmFGPxjPplVLk
         TXWJmQW5KaljSVGcWaIIMIFS8eR7yaBJkgU+qUn+Bhfw0Ocdwm5GrWpiMIcIJtMP0XWo
         K2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350586; x=1686942586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sfDGNxFljLZPwjQlmmmYoY6SbW+JgmdsgpLXcsCH5Y=;
        b=FrIYxoeCdqlZVwvs3Snw9sV6zY+3jvAZQCo7tqBNTp7/oCjIexIWpkSC0YM6W1+3Mn
         fL0fHbEVAmPWzed5TeOyN/GCj2Qsh8Nibm+5z8lRZ8jAmF/Ks3BE1mSi00ZTF2Co2X2t
         K0Nx3DrAoCE5mz7t16WwIms12S4v8PEpFcIumTn/JAkrOsJHh1kbFwaheeKCXqhrI4HH
         lmBsekP1kiJJYVMDA5zLP+cNG/k5JGm2E4v7mUvTSQcwqY5Y5mp7vI93nT31Sz+9KmIF
         hatKTsmNX3J9b1bkjoucSMwFjRbjdZxsk7lwY/h2o8pDGGtgwhAKKL00uVG0zPVpjSui
         QGoA==
X-Gm-Message-State: AC+VfDy4CurJi3Om+RA1CR/THlYhD/q9/LN+ORUweCGl0UH56pvg8ML8
        CQ4ExqB0vfXFGpjuKRc8SWxNixPa1FrlTya5BuF3mHaGhT2S6dfTs8M=
X-Google-Smtp-Source: ACHHUZ4xH8p2xAR9gogsMMo1l6go0T7O3blGg6ngP+XOlJcsKmi78F6t5pYwE2bb/x8i7L2vXtL9Yv+uOHHEhdQulvA=
X-Received: by 2002:a05:622a:188f:b0:3ed:86f6:6eab with SMTP id
 v15-20020a05622a188f00b003ed86f66eabmr19628qtc.14.1684350586364; Wed, 17 May
 2023 12:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com>
 <168435014337.2056649.7592777028793700479.b4-ty@chromium.org> <CAFP8O3L_RsaTMJvT7hmjD6ON49uob9Fb4mWg8ZUav_Y-FCgTMA@mail.gmail.com>
In-Reply-To: <CAFP8O3L_RsaTMJvT7hmjD6ON49uob9Fb4mWg8ZUav_Y-FCgTMA@mail.gmail.com>
From:   Fangrui Song <maskray@google.com>
Date:   Wed, 17 May 2023 12:09:35 -0700
Message-ID: <CAFP8O3JivZh+AAV7N90Nk7U2BHRNST6MRP0zHtfQ-Vj0m4+pDA@mail.gmail.com>
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

On Wed, May 17, 2023 at 12:08=E2=80=AFPM Fangrui Song <maskray@google.com> =
wrote:
>
> On Wed, May 17, 2023 at 12:02=E2=80=AFPM Kees Cook <keescook@chromium.org=
> wrote:
> >
> > On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> > > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 a=
nd
> > > Clang 3.2.  The minimum supported version of these according to
> > > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Dro=
p
> > > this cc-option check.
> > >
> > >
> >
> > Applied to for-next/hardening, thanks!
> >
> > [1/1] ubsan: remove cc-option test for UBSAN_TRAP
> >       https://git.kernel.org/kees/c/08e4044243a6
> >
> > --
> > Kees Cook
> >
> >
>
> For this -fsanitize-undefined-trap-on-error, I think we need a v2 patch t=
hat
> tries -fsanitize-trap=3Dall as well.

Correction: -fsanitize-trap=3Dundefined

> -fsanitize-undefined-trap-on-error has been deprecated in Clang for 8
> years, and at some point we will remove the option.
>
> GCC implements -fsanitize-trap=3Dall later, but
> -fsanitize-undefined-trap-on-error is documented as deprecated as
> well.
