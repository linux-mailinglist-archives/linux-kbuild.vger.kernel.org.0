Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 918C678484F
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Aug 2023 19:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjHVRSG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Aug 2023 13:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjHVRSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2023 13:18:05 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1BF7D87
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 10:17:57 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fee87dd251so29089535e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692724676; x=1693329476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVxH8gZtgJYxnVhZVMJiqe8tMcZ7bLjPOLe18Ze4lL0=;
        b=lPJQqMMDcohJF2JdOsK63KunlvjahCqtIQcc/RYTdukta+Dp6uZ20GNq+fQnzNPrtx
         zE0Yw1wuqLQtgpFziCB01PGnkAqotVgacE8aIY6L/jfvH6QhkaZiVdVxc81h7wZJjoz/
         gN96ucsushvA81Ntq2eWLfTdDwwZWk0ZyQN54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692724676; x=1693329476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVxH8gZtgJYxnVhZVMJiqe8tMcZ7bLjPOLe18Ze4lL0=;
        b=EqnTDqOm05aLwBoPE9HPcBwwm03G0fXHYP64yoGVqRa8zfUJY6vMmMGafnNJt1DJSK
         z3Ipq2+lmFOklzcXaxHL/0Vm5KVqDY0QQyrvnamOPJDiCbY1Z49bKgnw0R4YeTQygpaZ
         bTQJnp8V1Ub3l3AnSDRo4n3d9wEtwG2l6hhVi+btJpAJ0tEpKEGjhIhempgy0VrjczY/
         3ImQlGz3lFRw+gsj9B9crgUs0oNVImiO23VW/0GKc+WlH/UqLenBjw8IpN5tMvgZfgwU
         68qVdYbsJsWt903qtm6Ke3GEh/zHfSxQz6DqzlNovP1hYt9ZChrhJ8k3jDk/udKrFGlh
         /H5g==
X-Gm-Message-State: AOJu0Yw38U8q/OT8EogJNeHtEe3Tv2YWjH+GjoJH6a1SB6kj07OiWKNo
        QdP9cxLYtZG5Pj2gDpBnq5P3l+0aaw0R8NHgQTBwnQKJnELqO3hftt0=
X-Google-Smtp-Source: AGHT+IEQzodyd9vz4B621/6cy5AO6Fbt3D8H/LzvFpY5S44hM1nSd7SCg1qWjxx8fR3UGrUZPBRPQY8eS6S5g0RbKIg=
X-Received: by 2002:adf:f70c:0:b0:317:5af3:caa4 with SMTP id
 r12-20020adff70c000000b003175af3caa4mr7859759wrp.38.1692724676163; Tue, 22
 Aug 2023 10:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <CAFP8O3J2pUddEfL+W2j=tpjdj1ufsQMJqjcARbYvY3+khtBPig@mail.gmail.com>
In-Reply-To: <CAFP8O3J2pUddEfL+W2j=tpjdj1ufsQMJqjcARbYvY3+khtBPig@mail.gmail.com>
From:   Denis Nikitin <denik@chromium.org>
Date:   Tue, 22 Aug 2023 10:17:45 -0700
Message-ID: <CADDJ8CWon2yh=vW73W-88pSaU+J1UfPwhJ7++iAWwnUXvTJD9g@mail.gmail.com>
Subject: Re: [PATCH] modpost: Skip .llvm.call-graph-profile section check
To:     Fangrui Song <maskray@google.com>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for the prompt review!

On Tue, Aug 22, 2023 at 12:06=E2=80=AFAM Fangrui Song <maskray@google.com> =
wrote:
>
> On Mon, Aug 21, 2023 at 11:54=E2=80=AFPM Denis Nikitin <denik@chromium.or=
g> wrote:
> >
> > .llvm.call-graph-profile section is added when the kernel is built with
> > profiles (e.g. -fprofile-sample-use=3D<llvm.profile>).
>
> Right. .llvm.call-graph-profile may also be added when the kernel is
> built with clang -fprofile-use=3D (though instrumentation-based PGO
> support is not upstreamed yet).

OK, I will add -fprofile-use.

> > The section holds
> > metadata for symbols beloning to other sections and hence doesn't need
> > modpost checks.
>
> Typo: belonging.
>
> .llvm.call-graph-profile contains edge information derived from text
> sections, so .llvm.call-graph-profile itself doesn't need more
> analysis as the text sections have been analyzed.

Ack.

Thanks,
Denis
