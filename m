Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86C753D87F
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jun 2022 22:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241163AbiFDUZx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jun 2022 16:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241152AbiFDUZw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jun 2022 16:25:52 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F29193D8
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Jun 2022 13:25:50 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x62so14065087ede.10
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Jun 2022 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s6LWbAd7J0IEJ67tWdiKQHasDtoGBID3lgP8OtvIfoI=;
        b=YzijxbITT28cq7CI4bzLk1rKr7/I0WrdYDx7n0AQEZIWQ2DoqHBSLgYse7uLimKs2o
         Xx9wrDoeaMrKvSAbCqgU7HlMreTYn5ns6AvgwNzmYk0UuXPO6/3xFiArmvwe47eHs2+I
         Q//fl08dQhGkqLu9jjTdCNRYUjFIXHhxbhWk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s6LWbAd7J0IEJ67tWdiKQHasDtoGBID3lgP8OtvIfoI=;
        b=plV+AUGO5BBty6a68Nv6gicqUsUuR11DPNmwvBAszhkvW/aNB2EgazZkgUFAV4KKYd
         l/9Z5Io5rbUDASObDmlNuiXTcce+dUI8HDPrkcBDodBI7c40Q9VRO9UcabSdybZ896DK
         QKKl2xdh4t9cMsm/cxDULI+jzixU3iFII0kdJn2UVFaRcxPZNq8WHA5CP5QyWkcPW6VH
         GtTzhY/WjW54e5UnEzMAIrp3VzftGy1RUvQOE1tyShBbrXXRrGSldCTpBXpl1s7rXzhm
         dUQpP8gQHVOASlOMye5vvHfni2jxcjCNtL37o8Dc/Wuo80ofr/OCvYvI9JKvP3B0Fgal
         LdGg==
X-Gm-Message-State: AOAM533ofdJH8H1ZLSWnP19mfzWgTFHGN1hqcKn2E3mvJHar+FxRSrHz
        c6yCvjpwbS8Ik2UNPnzqou21gwJ2AzTFm1gK
X-Google-Smtp-Source: ABdhPJzMMB6iY7Q3kRm1sfJzX6uDeeLZSqfDX6zyM8x10Gw12CYU+8T3QjyOJmg2mistgT3OaGoDlQ==
X-Received: by 2002:a05:6402:f17:b0:42d:d3f3:244c with SMTP id i23-20020a0564020f1700b0042dd3f3244cmr17988358eda.52.1654374348574;
        Sat, 04 Jun 2022 13:25:48 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906590e00b006fe8ec44461sm4335038ejq.101.2022.06.04.13.25.47
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jun 2022 13:25:47 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id q15so2594936wmj.2
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Jun 2022 13:25:47 -0700 (PDT)
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr10269781wmp.38.1654374347348; Sat, 04
 Jun 2022 13:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATHyNjCaK+agk=DOTR8sPaOP9kBvS_xYaBUHfF+5Fzftg@mail.gmail.com>
In-Reply-To: <CAK7LNATHyNjCaK+agk=DOTR8sPaOP9kBvS_xYaBUHfF+5Fzftg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 4 Jun 2022 13:25:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg-mH-_GYpkhz_psjBWG6ZcjKnPo83fg7YMj_by+-LRTQ@mail.gmail.com>
Message-ID: <CAHk-=wg-mH-_GYpkhz_psjBWG6ZcjKnPo83fg7YMj_by+-LRTQ@mail.gmail.com>
Subject: Re: [GIT PULL] More Kbuild updates for v5.19-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 3, 2022 at 9:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - Fix modpost to detect EXPORT_SYMBOL marked as __init or__exit
>    (This uncovered a couple of potential issues of exported symbols)

I pulled, and then unpulled again, since this introduces new warnings.

If you introduce new checks, you fix what it checks.

And if the warnings didn't get sorted out, then it wasn't ready to be merged.

There's a  good *reason* I require a clean build: non-clean builds
just mean that people will ignore new warnings because they think they
are the old ones that they have already seen.

So no, it is *NOT* ok to introduce new warnings and think "people will
fix these up because now there are warnings about it".

Quite the reverse. People not only *won't* fix things up, and it will
just hide new warnings from *other* things instead.

                   Linus
