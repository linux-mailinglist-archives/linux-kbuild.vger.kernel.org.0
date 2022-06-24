Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613D955A10E
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jun 2022 20:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbiFXSig (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jun 2022 14:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbiFXSiY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jun 2022 14:38:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0D5522F4
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jun 2022 11:38:23 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id q6so6320087eji.13
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jun 2022 11:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QiP8VcEZQ30q3Pk2h5Gwsq7YGZeOh6yin9xVA7T6iaI=;
        b=Q0xRVwsW6uojzuz7GmFCcljGvfW5k7ElXVA7lvUp3NBj47SwMwuuXv7+qvn2HcdJLO
         UdXVgH1FThd5pleoQfjWrBJWa+YK42yeq+I6luoycW61OhF6AFcqiuRNAj1sPxtaYCFs
         5B4QaxAYi/epISS4yFeWUbcKzQ3LhfCLhsyac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QiP8VcEZQ30q3Pk2h5Gwsq7YGZeOh6yin9xVA7T6iaI=;
        b=meZNC8A3SMcIYAEb61JBVWxirCa0zJv+uCk44cUbJoES4Z4J3ZikOKroU9cvBeOXKU
         0fpas6zmYptghAg8PnOsMlZH7zVOYMooCuUP+4vVaEu5+KQWjEYFRww1kGLfid+6uy6a
         FeIiVO8++jD0nfTerfmPIj04MUT3g9ZUZxCo/3n1pabBQOcQ2nEeqS1klmf3rG3AhFT/
         Zu75mbXo8dLszyz2T0j11105sRN9qnrznd00ewe2dWIjX9fg3ewBLTIPjqPmDJQvz1k+
         J85ujW4wLdXQp7/VSFrnDoFNclQpjv+FjIIZMlxbbqwaOFEJpOG6NavJyj0YyElo/E/p
         sffA==
X-Gm-Message-State: AJIora/NGdhjlp0tYbOl2LTEuv6QHFXs3vLhejwQjksskCrhCYAwhTsK
        /BQRmn3p4O7m8cUPxmWXgtol6x+su/lTcXXO
X-Google-Smtp-Source: AGRyM1sGgkUyLemsYeIrUWZFDEpI+BxWfqhiZpS8+heFHbuvFJAcAiVgTDQHXdMQMtBW4Uvv0sfupA==
X-Received: by 2002:a17:906:7482:b0:722:ea8f:3a12 with SMTP id e2-20020a170906748200b00722ea8f3a12mr403080ejl.220.1656095901409;
        Fri, 24 Jun 2022 11:38:21 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709063bca00b00706e8ac43b8sm1509175ejf.199.2022.06.24.11.38.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 11:38:19 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id p6-20020a05600c1d8600b003a035657950so1988039wms.4
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jun 2022 11:38:19 -0700 (PDT)
X-Received: by 2002:a05:600c:681:b0:3a0:2da6:d173 with SMTP id
 a1-20020a05600c068100b003a02da6d173mr5308343wmn.68.1656095898877; Fri, 24 Jun
 2022 11:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+55aFz2sNBbZyg-_i8_Ldr2e8o9dfvdSfHHuRzVtP2VMAUWPg@mail.gmail.com>
 <CA+55aFyugRmHNV1BbhB_YHf3mgaiU6ND_KL8bu0PPEaRVNwWHg@mail.gmail.com>
In-Reply-To: <CA+55aFyugRmHNV1BbhB_YHf3mgaiU6ND_KL8bu0PPEaRVNwWHg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 24 Jun 2022 11:38:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5aP-0fr8Q8ekwGn6KMAtkQbiBYxtnAFhj5LXCCszckQ@mail.gmail.com>
Message-ID: <CAHk-=wg5aP-0fr8Q8ekwGn6KMAtkQbiBYxtnAFhj5LXCCszckQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Kconfig: -O3 enablement
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chris Down <chris@chrisdown.name>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>, mikoxyzzz@gmail.com,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Oleksandr Natalenko <oleksandr@redhat.com>,
        quic_eberman@quicinc.com, Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Fri, Jun 24, 2022 at 11:29 AM Linus Torvalds <linus@linux-foundation.org> wrote:

Bah. That was really me, just with a badly set up "reply through lore"
setup, so with the wrong email address.

That's what happens when you are

 (a) incompetent

 (b) stopped getting the mailing lists as regular email because you
think lore works so well

 (c) normally rely on being cc'd

My apologies for the incompetence.

                Linus
