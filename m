Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C044F9E24
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Apr 2022 22:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237160AbiDHU3Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Apr 2022 16:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbiDHU3X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Apr 2022 16:29:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A961D97C4
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Apr 2022 13:27:18 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j9so8837782lfe.9
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Apr 2022 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nQFVlwllC4YnO25+yufuwuGbhqunVpmbD2hguCYOvy4=;
        b=gWK+aFb/GaZFlvfNwH34Q366kaZ1QLSjm8LMPraJtyTtSOP3uKID/gRWIip6eNC0eL
         4bRNqWUu7nJKvVRcA8UVg4XFmEEFuJ+OUae9PxIfeS2hl2xtHUxkrRP27d9lDzRnOrvs
         fg81B8sMB87WkbZF9zuv4XoJXV+zgAyTDQEKep2V4yFWaJWXBiN6VvjC3wqltYPuQa+6
         /3vlLj2aBEDyVBuZk3J/POGzeXJQv+HzAi5IlCtoAcSM1/JHolNCNGYjzsgoOdaNJxCf
         2J29txGALCTVyPdW8SNgGSlCG9XxiSaUM0uMEJhePlYgD207TTDonFrPR9Y4rdDPjQOG
         5VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nQFVlwllC4YnO25+yufuwuGbhqunVpmbD2hguCYOvy4=;
        b=wsrxGTLiTrsdg+y/UFVeYe+ctKH4R8v6RTz123PoipA3u0PlhLjgBv6kXBcMTcKhq+
         aylJTQejRQemDK89acFGXjbVbdnpBV3Z8IPBOVI1LoQSOCZM8Sevop9IV7gJW2pgOLoy
         UcLCnIPMgaDebKgZJo/Oe3teWehQ4a+l7QTcLgcrwz/S4Y2VC0YAohfx+Ajpbk8Y2PFz
         MVGZDoUhKtkeyhclzxuDFsmoM28Tgz7FVytI+LLZKDtS4fT9/FhTZ+XzirrP+Almkum7
         r2wzXmhzkcrDq6o0egHOw5s4CvykrQ1mSHlyd4bvvYvW3ZA976KKnfkIUD/+20+iWdIC
         p20Q==
X-Gm-Message-State: AOAM532NIXl0GUQ8HOOPas+I0UEY5tWSKPzm6y+/abd+2IQ+LLf4pNdG
        eXwMDAITUMQg1sy41DpMIad/O4e/oxD1R5KsN1+W9A==
X-Google-Smtp-Source: ABdhPJy1buaZxT58htvnHFpW1VHCKRzCOuuekg5axqM58M9plO2OfHYEUC21WYU7xlWQwG0z2bFELCJwjSwn/k+ArK0=
X-Received: by 2002:a05:6512:3da1:b0:44a:2aeb:28e4 with SMTP id
 k33-20020a0565123da100b0044a2aeb28e4mr13355498lfv.579.1649449636724; Fri, 08
 Apr 2022 13:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <7fad83ecde03540e65677959034315f8fbb3755e.1649434832.git.jpoimboe@redhat.com>
In-Reply-To: <7fad83ecde03540e65677959034315f8fbb3755e.1649434832.git.jpoimboe@redhat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 8 Apr 2022 13:27:05 -0700
Message-ID: <CAKwvOdkKkCjt+a51mQk8+76uYyzvYSPVkNrmK1KW2w1Fk5yfog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove CONFIG_DEBUG_SECTION_MISMATCH
To:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>, x86@kernel.org,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Apr 8, 2022 at 9:23 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> So it's basically a debug (non-production) option, which has the goal of

So I think I agree that seeing it used in defconfigs is curious to me;
I'm kind of in favor of removing its use in defconfigs.  I wish the
defconfigs for more architectures were something closer to what a user
should reasonably start with; I don't think we'd want to encourage
people to actually ship kernels built with this option enabled.
-- 
Thanks,
~Nick Desaulniers
