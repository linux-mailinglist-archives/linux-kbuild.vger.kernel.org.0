Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E725E69ABF4
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Feb 2023 13:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjBQMz7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Feb 2023 07:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjBQMz6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Feb 2023 07:55:58 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A3319F34
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 04:55:57 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id c7so927227vsu.11
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 04:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1676638556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Niz+iUEDg12bkyQmg8bfO1CeSRErQ0TqE9j1iy2aNsg=;
        b=QY0L+kPXE08wzX3b5emELH1EQJht51B+irrfsdh//mQS9K52zJ38WcWfnZvAk6Dovd
         2zrJT/4o/kzGN9lyqrVfm5CTuSzP2ZSoz1/VI4qyoSAlUjtaibIq+1CKcWP3yvQeb3kX
         aZDKT2zUcnMVuSTKXqBtCADYqhTNMVwI91oJUj7PiH082TWnC4xU6VHvrFWgIhN5tMY5
         DgH/Q4umJzTYdlzIfDRGipF726x7RrCZkiLfsQfC1f9UAZT+GDpGb2Pu7g3X0xgOX0Pp
         2bgZMx/BAlibAajCLhYINXrwt7+qXop9Qd6QaNMuVvL4qfI5zhGwUJJopb9ynizR9QRE
         2nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676638556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Niz+iUEDg12bkyQmg8bfO1CeSRErQ0TqE9j1iy2aNsg=;
        b=nrs3mL1v0HLUFjsPo/dZSEIapbVLShOqcCStHKPggHxr/BsY0fkZ3tHfDIAVooRHg6
         1pJLyPof97aR71BHvqwTFhgW276qkQOS3VDIg4vfboik/Kh2e6o3UVwZjT1g8aRwxIWo
         Em7K5AUILgFWvu2has7iHW9538fSBH9Ay6Qra1XZrHZ1i4zFoYZsPmscGLK2tYK/YrqG
         fRmxZOkkeW8eWmJp9u/aQTfhlSwG/fD5XWKb9t/GKsjgYZxXL16TvcSQ/MrunjH3qjf1
         AJe63dV6LK2c20vjXfi6acZcALPion07qa2YaEf+xlWcSpzVKyPmt63rEr7w2WkyE/eg
         61+Q==
X-Gm-Message-State: AO0yUKUR5W1eN3NvQY/vKWTTO5bNZq8WjYajsRwoTGvbIwyLpWFy2PsQ
        4cid+A1O1oLbci5ieK+7twWV5dSg6Ma2fgd6YGVVdQ==
X-Google-Smtp-Source: AK7set+udpoefmaJkwkRxt8m+o6+9rF6WqX7urSmvbraV+4q17Ykk2j9jTg2GaM7+fSY62hRGa9q0YtXLvVEpdW0OdY=
X-Received: by 2002:a67:70c6:0:b0:412:2e92:21a6 with SMTP id
 l189-20020a6770c6000000b004122e9221a6mr1748513vsc.13.1676638556537; Fri, 17
 Feb 2023 04:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216234522.3757369-1-elver@google.com> <20230216234522.3757369-2-elver@google.com>
 <CA+fCnZehvF1o4rQJah=SXaS-AXWs--h2CDaUca-hJK=ZTD8kTg@mail.gmail.com>
In-Reply-To: <CA+fCnZehvF1o4rQJah=SXaS-AXWs--h2CDaUca-hJK=ZTD8kTg@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 17 Feb 2023 13:55:19 +0100
Message-ID: <CANpmjNN9EPTLR5-HvpCtYjauMTT=Ud86wqV54anSYC=vgZ70zw@mail.gmail.com>
Subject: Re: [PATCH -tip v4 2/3] kasan: Treat meminstrinsic as builtins in
 uninstrumented files
To:     Andrey Konovalov <andreyknvl@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        linux-toolchains@vger.kernel.org,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 17 Feb 2023 at 12:07, Andrey Konovalov <andreyknvl@gmail.com> wrote:

> Is it also safe to remove custom mem* definitions from
> arch/x86/include/asm/string_64.h now?
>
> https://elixir.bootlin.com/linux/v6.2-rc8/source/arch/x86/include/asm/string_64.h#L88

Yes, I think so - sent another patch:
https://lore.kernel.org/all/Y+94tm7xoeTGqPgs@elver.google.com/
