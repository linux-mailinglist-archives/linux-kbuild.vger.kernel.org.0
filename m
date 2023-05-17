Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61012707186
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 21:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjEQTJP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 15:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjEQTJO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 15:09:14 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3D5AD08
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:09:10 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f38824a025so38291cf.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684350549; x=1686942549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTCrNF1k6eLvgjFBEtoVOllbYMzqAXAFq2VPdBNe0PU=;
        b=1RbKqgNlFVDn38jbjn+Xyf9v2PZkmr8NlkChy47jOU4d/MCsfICl4HNWXWC54W/pIG
         1dofWJXAUWTCZsLtED0n1ndgNbYBCSAPo29fdxJKDrBAtQLgOX9f4pwZf9kS3ghxthb2
         N0cN9RM3ETTW9YLxhlOsJZe46DUn6ZX78QPySHArvwB3zQoi3yo5ttMISt8BFPmlw110
         S2XVBIeCofavikgM7slybu8BTtRWgBDobDNS6+35+preNvJmtRz207zhxdU79kZEcZuJ
         wKIH702z053O+wSyqnfucxGZO8MfVQbrjAHBqACNkUsgYmu7+zNA5DF9+/qkjRd2vMvk
         XikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350549; x=1686942549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTCrNF1k6eLvgjFBEtoVOllbYMzqAXAFq2VPdBNe0PU=;
        b=bRzsUeKdIBv7SYkFq7bFtq1952Ce5IpNZ2FseUMZcYNfiaxO6LqWV2y74+iC50BIol
         2QiuJDB9I/D/RWHfElV6AoLZ1/1LpgxTjCChydzW7PWiBDwoIgAErFuSTEwSfp4TazT8
         H7TDOOWVnoThLcRzucvpcOJ3WWK2m7kPlesJq4s4eSfiZtGrn4SzvgfJdRjKhUh8CeM+
         8oBwprI5C/FH606Em0Mm+OXUyE73gJm/IRuhM5Mum696YoBtCW1WaWbbOye5h2iKUx/j
         TvsY2yyMmj7gtj17/ACL/mTkQHchzRThFkAW4iTghejKXRrjBc1T4v1NjVduQNXFo/NK
         NLUA==
X-Gm-Message-State: AC+VfDxgjEh551WmWts9rXq+gDbw4X5KRODMJT8WIcWbQsECz33s3lAJ
        WJi2+HHl37x8EjjXw5Ke3eckEzx80KRyBPJqn81th3bDf68dQeTDkp+8TA==
X-Google-Smtp-Source: ACHHUZ4vHFPYr3XteL6OVBxr3sfjSsd2NrUvpo8AQLiFMWwfzIDeniQtS3efGU7DsGoHFylfwTLFONOliqHDKMSojjg=
X-Received: by 2002:a05:622a:181b:b0:3ef:3083:a437 with SMTP id
 t27-20020a05622a181b00b003ef3083a437mr34609qtc.18.1684350549567; Wed, 17 May
 2023 12:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com> <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
In-Reply-To: <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
From:   Fangrui Song <maskray@google.com>
Date:   Wed, 17 May 2023 12:08:58 -0700
Message-ID: <CAFP8O3L_RsaTMJvT7hmjD6ON49uob9Fb4mWg8ZUav_Y-FCgTMA@mail.gmail.com>
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

On Wed, May 17, 2023 at 12:02=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> > Clang 3.2.  The minimum supported version of these according to
> > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> > this cc-option check.
> >
> >
>
> Applied to for-next/hardening, thanks!
>
> [1/1] ubsan: remove cc-option test for UBSAN_TRAP
>       https://git.kernel.org/kees/c/08e4044243a6
>
> --
> Kees Cook
>
>

For this -fsanitize-undefined-trap-on-error, I think we need a v2 patch tha=
t
tries -fsanitize-trap=3Dall as well.

-fsanitize-undefined-trap-on-error has been deprecated in Clang for 8
years, and at some point we will remove the option.

GCC implements -fsanitize-trap=3Dall later, but
-fsanitize-undefined-trap-on-error is documented as deprecated as
well.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
