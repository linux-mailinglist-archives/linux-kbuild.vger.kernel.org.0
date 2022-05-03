Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40945190AF
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 May 2022 23:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbiECVtU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 May 2022 17:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243170AbiECVtS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 May 2022 17:49:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC4E205DE
        for <linux-kbuild@vger.kernel.org>; Tue,  3 May 2022 14:45:44 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id m23so23611941ljb.8
        for <linux-kbuild@vger.kernel.org>; Tue, 03 May 2022 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mPFz6JxMBLrDOa8D8OvJc8dRpCCIxU0sDb/p3YNgE60=;
        b=lmPiQyXLF7vDL/rgmpglf9WWSO+z8kznYxL91ts50a6w+mEqSpNfpVYvPX8NhQp8Uv
         X/du124xd2sLK0hN37As8gjODZqB7+nEa5Ojw3fsU4ghWG9MqhONk4p4S2AkSdAha+Q4
         nWjHv2JCjU2r4NjrukyVVGh7mDMF25GwNYEFEKLsgEe4mgQN1LKchq6QXfyMHZME69Oi
         sVMu4O2eJBkRxwhAzCYqr8XwFvwXy/+6QPunVx27zQ1GfcOiAlWuF6IlWhkEaVxMrZUu
         DOmAJN7R6iQZ2c42KgptDBVAwUuvkS8PAXWIx9U276yeW8HnL3nL3ONiLS18MpqSu50D
         Yq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mPFz6JxMBLrDOa8D8OvJc8dRpCCIxU0sDb/p3YNgE60=;
        b=QggXzlhrngNM0qbMdLoc/DcbaCZilSKr8t0vywEckZ5hex7THHIaPWI83/oddEEHgM
         1AvtzuqcYK5HEWdEztMPKzbnqT71OEUKDKUz71cWc8uvjKNiilBF5hdBmyRbq4wHgXEE
         jXvlCADbAvff9QAYLlJMTG9Y1DF8e8EIaOLZ2rsV18nK2X4ASNj2Ri6Joz+3wHQfIurY
         rpJJ9aSR6nfT58k2mMa9FZOrVDaqRNdXUQ3xPlJlp0RAkbbesgM7dvDrOP+mg98J0hRk
         RcMQu8Zw24e55sUGiDehrFiH7C7cdUSGklNTEZfV3LumENNrwT50Go0hl45pOJg+PfDO
         1JdQ==
X-Gm-Message-State: AOAM533aE9OT4HmedySyFQQ9Lozzx64b8MrZM4F096gxF8t5ItSozhhS
        E1bM3VgydANZVZjvbqYBWyLEma9FX2mq+KZJ6C4HIA==
X-Google-Smtp-Source: ABdhPJySjBL1p+N3hj3DHEA588S062n0PV+2+6ZoihOmBkqZCW7zz/wum4v3Gn3+fGZHg/XBX9ucA4JJGD0APRkVECY=
X-Received: by 2002:a05:651c:1a09:b0:250:5bd1:6daf with SMTP id
 by9-20020a05651c1a0900b002505bd16dafmr5522087ljb.468.1651614342672; Tue, 03
 May 2022 14:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220501084032.1025918-1-masahiroy@kernel.org> <20220501084032.1025918-3-masahiroy@kernel.org>
In-Reply-To: <20220501084032.1025918-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 May 2022 14:45:31 -0700
Message-ID: <CAKwvOdnB=vb=jF0e6rnB21SAinTpnN+AxdPeR87qXGY0Hn2edw@mail.gmail.com>
Subject: Re: [PATCH v2 02/26] modpost: change mod->gpl_compatible to bool type
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 1, 2022 at 1:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, mod->gpl_compatible is tristate; it is set to -1 by default,
> then to 1 or 0 when MODULE_LICENSE() is found.
>
> Maybe, -1 was chosen to represent the 'unknown' license, but it is not
> useful.
>
> The current code:
>
>     if (!mod->gpl_compatible)
>             check_for_gpl_usage(exp->export, basename, exp->name);
>
> ... only cares whether gpl_compatible is zero or not.
>
> Change it to a bool type with the initial value 'true', which has no
> functional change.
>
> The default value should be 'true' instead of 'false'.
>
> Since commit 1d6cd3929360 ("modpost: turn missing MODULE_LICENSE() into
> error"), unknown module license is an error.
>
> The error message, "missing MODULE_LICENSE()" is enough to explain the
> issue. It is not sensible to show another message, "GPL-incompatible
> module ... uses GPL-only symbol".
>
> Add comments to explain this.
>
> While I was here, I renamed gpl_compatible to is_gpl_compatible for
> clarification, and also slightly refactored the code.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
