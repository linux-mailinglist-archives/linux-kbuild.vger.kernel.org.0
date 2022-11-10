Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF37A624BE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 21:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiKJUeh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 15:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbiKJUeg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 15:34:36 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998631EAE7
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 12:34:34 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id gw22so2687134pjb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 12:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VL9aeHuUYL2W2BVBk3NWEv20RRfgbUC2woMlxx/dn2Y=;
        b=jbtHaE5bAdjg7fk0lqg5V+EpCSRLcj3ojSRXFq031zHZ9Ec+xEWYJBwx6xYjirHXBH
         opxTp8kqQM4KBmyr9DB+Q4Vwh92AznxXRIkjmym1oOeP4l7o3WZNh7/W84NPU4RmhxWL
         YVIS7sXQ6jlZb9U6U3RupAjHXXKWFdJQ0wTkWEp82Wh5KErvJuUDwPCQuKnBXw/wcG6e
         RRChZHj4QJh3hUP8Nn6zPkLAoKdhCfnlWc67lj1kn0W9krWrTuOWHmsFRXRJW4wzyzU3
         wTzg0RsxECXhk1QRciMU2C/ZUzLMzdC3bqizygv0tBJGejrFg8aoVA+BATfn0AB5NNk2
         hOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL9aeHuUYL2W2BVBk3NWEv20RRfgbUC2woMlxx/dn2Y=;
        b=yf3IcDUZ6bkb9rc64FRzuZyzD9/1AROVNrABGUaRW8x5SCERXW/Yd8tJ4kwEFP6P2m
         QWrf5nYG79jJmqiHQlDp49iRPW3ancDLyMOQK/+dgYEtFO6hNC2SIfe7InjvytjUbnFQ
         k15cPx1vhB8m8g2pkLANT51boMQlunrCGJ1hzu4tdDodAuMt7vOsD6cYGUIWFRTQ56nT
         /yIlDKgBiJ3QabdKsFTLDwRUfb9qwcb496bIs5zSFvZ9av1sdhqwU4LjzqglDbQxrHoq
         mCtzCa7sCQNvZzjis6gXPTjWaBXjmKnE3CXpCVHuasI362TZuJC+ROD+YwIR/rR033oZ
         5aKQ==
X-Gm-Message-State: ACrzQf0juEeWTkEayRJpaon5/82vjeaD6fuLchqZeTtYVp/MS2qc+iiY
        aHCQn0EALTgdxTPrem8wBRCqPmqspQFNLo7/dJ19HdfXa5s=
X-Google-Smtp-Source: AMsMyM7QjTrWOvNQ4ZHkYrv1Rmk2KoXuGeFjD3x+yvhw+YSbrGI7TfoGGyV0KL9f93NIipVX0jL6cEeubLqgqhCuVJ8=
X-Received: by 2002:a17:902:768c:b0:186:b136:187a with SMTP id
 m12-20020a170902768c00b00186b136187amr64118016pll.94.1668112473900; Thu, 10
 Nov 2022 12:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20221110150425.164386-1-nicolas@fjasle.eu> <20221110150425.164386-4-nicolas@fjasle.eu>
In-Reply-To: <20221110150425.164386-4-nicolas@fjasle.eu>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Nov 2022 12:34:22 -0800
Message-ID: <CAKwvOdk4Dde9b9SE8UBy+RuSCwD2GHhBDBRsMHadK-imsuMvEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add linux-kbuild's patchwork
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 10, 2022 at 7:05 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> Add patchwork URL for Kconfig and Kbuild.

Interesting, I didn't know this existed. Masahiro, do you use patchwork?

I think regardless, this link is helpful.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 45c88bb34b6b..b031b52e32a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11026,6 +11026,7 @@ KCONFIG
>  M:     Masahiro Yamada <masahiroy@kernel.org>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
> +Q:     https://patchwork.kernel.org/project/linux-kbuild/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
>  F:     Documentation/kbuild/kconfig*
>  F:     scripts/Kconfig.include
> @@ -11087,6 +11088,7 @@ R:      Nick Desaulniers <ndesaulniers@google.com>
>  R:     Nicolas Schier <nicolas@fjasle.eu>
>  L:     linux-kbuild@vger.kernel.org
>  S:     Maintained
> +Q:     https://patchwork.kernel.org/project/linux-kbuild/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>  F:     Documentation/kbuild/
>  F:     Makefile
> --
> 2.37.2
>


-- 
Thanks,
~Nick Desaulniers
