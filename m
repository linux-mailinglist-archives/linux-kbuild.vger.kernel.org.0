Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7CD74B6F1
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jul 2023 21:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbjGGTMP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Jul 2023 15:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjGGTMO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jul 2023 15:12:14 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6AA118
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Jul 2023 12:12:13 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso34631161fa.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jul 2023 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688757132; x=1691349132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8RgAiRj/Ah9GpFVKQ42X3iF0te9OVig0xR7Tnv48JkA=;
        b=KBtj8DBLIvc+ld9MJdHlsAZraivfLO55rL7GtiKuwX5rEqWqeUQfPshtY+2tuA3T4k
         +78INjV8z14lc74qCfseqhhgLcSN1kS7tRrXN2C5846XV4rA0B/rnjt+kwZU8BwjKUD1
         H9qBdMYMxG+CA0wxxkI3NqA2KkFqXs5LPYKVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688757132; x=1691349132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RgAiRj/Ah9GpFVKQ42X3iF0te9OVig0xR7Tnv48JkA=;
        b=lJh1S4uv30qOI0MnhakoKSGwbZ5+SryWzM13CMdCGVYAR2KPHvwyd6UK7f8lwznbVp
         +QiLGBWXOuSq/sgMRHoEWVGZvr7MRh9txjz7eCYZdV5nWWqXKR8XdATp1Qi7cBK4XdHe
         4R0rCvkD3zdd1Ko8aMDJiuVd/KSLGM4LauNsH1ICkfqo2Q7FyaVX3zm0k/R/PEx7FMP8
         U6ruiD4RccuC1xk+8Z2xctqxU5YS3WAWCUlyBuZucQIY94yA18Gv/A06Pe079Mux9Ly8
         T2BDZsbwBTnhzsj3FAhApS4DuK/6Z24mwW+ltlu1gcuN5F7X0PloYJAF5Ys/uUPat+59
         Sbgg==
X-Gm-Message-State: ABy/qLayRt9f6YF1W8hY+CTolWL9Se9VwNuZUWqw8zQfHU0AN4KYCq0K
        OtmoLL2XRAGj0mwN+JCSXzi4+lbyCmwqrmGKp5tiZjqG
X-Google-Smtp-Source: APBJJlG6RJ+2cK9/O+9taKWzxgwRrFKShypMhO4PZ1zAm0a89s0xblVVVGObR+ZpKw6iCe++0dds0w==
X-Received: by 2002:a2e:9c87:0:b0:2b6:c4fd:753a with SMTP id x7-20020a2e9c87000000b002b6c4fd753amr4683097lji.34.1688757131796;
        Fri, 07 Jul 2023 12:12:11 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e8753000000b002b6d647c7e6sm894172ljj.133.2023.07.07.12.12.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 12:12:11 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso3706706e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jul 2023 12:12:11 -0700 (PDT)
X-Received: by 2002:a05:6512:3104:b0:4fb:7626:31a8 with SMTP id
 n4-20020a056512310400b004fb762631a8mr4290389lfb.27.1688757130684; Fri, 07 Jul
 2023 12:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
 <20230704211509.GA21834@1wt.eu> <CAHk-=wjH4O6v_EwVB=t_6Haky2jOiejHbCkCTvgNQWo1ghy8-w@mail.gmail.com>
 <20230704213415.GA21872@1wt.eu> <CAHk-=wjPEjrB7eCukREhWu-0qfjbFD-K8sk1TYYRgeHzYr1tuQ@mail.gmail.com>
 <20230704215600.GA22271@1wt.eu> <CAHk-=whMytacPBHfKKi8GYdgfadNy5LA-1TDHrTtz22eJr2B1Q@mail.gmail.com>
 <20230704222758.GB22271@1wt.eu> <20230705004129.GI1178919@mit.edu> <CAKwvOd=ktNGZ=uBVxF7Wicooy7VMz1UNe5MRDkEDZPcg1_DJ2A@mail.gmail.com>
In-Reply-To: <CAKwvOd=ktNGZ=uBVxF7Wicooy7VMz1UNe5MRDkEDZPcg1_DJ2A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 7 Jul 2023 12:11:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJQS72y15+33DTZiR0pyBwFZSyd=LcN0weso_AWfCenA@mail.gmail.com>
Message-ID: <CAHk-=wiJQS72y15+33DTZiR0pyBwFZSyd=LcN0weso_AWfCenA@mail.gmail.com>
Subject: Re: Overly aggressive .gitignore file?
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     "Theodore Ts'o" <tytso@mit.edu>, Willy Tarreau <w@1wt.eu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 7 Jul 2023 at 11:51, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
>
> I don't really understand why *.patch is ok to have in .gitignore but
> *.mbox is not?  Wouldn't autocomplete fail due to `git status` for the
> exact same reason?

I'm sure it does. It just isn't in *my* workflow, so I don't hit it.

But if other people find the *.patch pattern annoying, I certainly
agree that that should be removed too.

               Linus
