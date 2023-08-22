Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0BA7848AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Aug 2023 19:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjHVRvR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Aug 2023 13:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjHVRvQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2023 13:51:16 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B057CF1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 10:51:15 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-407db3e9669so35121cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692726674; x=1693331474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTQHxKG2D5LbRoD1UXRmuUXHuB7AJbXnzw+23CsotMg=;
        b=BFKbjhidrHsnQIwzb82AQGRT2a0QCnLlD78C+BChYGJ+4KywPdEVN7H9NkYWTSENtV
         PpQiOiKA8vCLtQb26ZmoX+9N9ba6VlbEiLIMpiesyYZhYW6svghc0Yv/cTEWeln8Ux3H
         0Gn3QFi6JvwghAXDJlLQSSN3D4ZhK1t4U1VYIlxAXsTMGM0UEbjimlZQA+q03aWZJih9
         8Aws/YLO8+VCX06ywZAWCT86oEomaGyX9RTa/72fz+I1TSEzyaovPUArABUmTXyV5UKA
         aPiO45OACjhSujvGPthBRtFfQtAXiiGxjVWhFoFpWgbGuuLas9TF1FWxPzuKdkYlt7Nf
         TE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692726674; x=1693331474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTQHxKG2D5LbRoD1UXRmuUXHuB7AJbXnzw+23CsotMg=;
        b=gWlnO9n5R/r1wkeK7IIdsd3Bqcx576iFgWP6oNxDv24r4KMSLlWTvOELjvep/ElPIg
         pmFiyEBPtgcvnzduSBlKKf9Kjw39+uaOGOMD5YZxD8CHpFelun4OWgYDNhjCvpsfJGru
         lJD5fBaq2isgqRLkyh2u9xNsKrUgkJ+6BSfbtowOB3XXOwP+3viKW6GqtMjkfpsVOdgQ
         keY0q0YXTskARXc2l9figEh1YlcrYqBLIkaljk8QYwQI+FTJZ6lIAuRcxbMimWWq2NKM
         kovnXmd1/kOBvgxMdiIstV/CQlUHQi227KzSbZdZ0W4c3Wuj1qMxjNnTYq8pkasCFgFW
         VQyg==
X-Gm-Message-State: AOJu0YygvXGF4ng52bfSdmOCUVs+tVJYu0alIGi8HqEgVgb4kqCndz3e
        VAQhseFrOrQzwSwsQIv+dvAYHIkQYKcbeihS71V8eg==
X-Google-Smtp-Source: AGHT+IH8CcGn1FXMoAKRlf73hzf0gvM8a+jzi/t6hcmvWwSTQP9yOtL9F6zEdJuVNx2nfT4ZMWZ+QL4DMpachfRO/Rw=
X-Received: by 2002:a05:622a:1a90:b0:3ef:302c:319e with SMTP id
 s16-20020a05622a1a9000b003ef302c319emr347014qtc.8.1692726674341; Tue, 22 Aug
 2023 10:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
In-Reply-To: <20230822174835.253469-1-denik@chromium.org>
From:   Fangrui Song <maskray@google.com>
Date:   Tue, 22 Aug 2023 10:51:03 -0700
Message-ID: <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To:     Denis Nikitin <denik@chromium.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 22, 2023 at 10:49=E2=80=AFAM Denis Nikitin <denik@chromium.org>=
 wrote:
>
> .llvm.call-graph-profile section is added by clang when the kernel is
> built with profiles (e.g. -fprofile-sample-use=3D or -fprofile-use=3D).
>
> The section contains edge information derived from text sections,
> so .llvm.call-graph-profile itself doesn't need more analysis as
> the text sections have been analyzed.
>
> This change fixes the kernel build with clang and a sample profile
> which currently fails with:
>
> "FATAL: modpost: Please add code to calculate addend for this architectur=
e"
>
> Signed-off-by: Denis Nikitin <denik@chromium.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks. The new commit message looks good to me.

Reviewed-by: Fangrui Song <maskray@google.com>

> ---
>  scripts/mod/modpost.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index b29b29707f10..64bd13f7199c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -761,6 +761,7 @@ static const char *const section_white_list[] =3D
>         ".fmt_slot*",                   /* EZchip */
>         ".gnu.lto*",
>         ".discard.*",
> +       ".llvm.call-graph-profile",     /* call graph */
>         NULL
>  };
>
> --
> 2.42.0.rc1.204.g551eb34607-goog
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
