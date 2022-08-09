Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9727358E3E2
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Aug 2022 01:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiHIXw4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Aug 2022 19:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiHIXws (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Aug 2022 19:52:48 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA4B7FE63
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Aug 2022 16:52:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i14so24913418ejg.6
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Aug 2022 16:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+w0efWqRPp/QaA80uZ2hXwt3OEXDPP57fMDjGCeRiD8=;
        b=avFCSlfYTjdAD7Cyg5OGq3l+IG3inn0Ay2YR58meLuVyf4ACxmuvTN4rAMBw8ZcQ6r
         Wbkp5oET0CAGpugtr9+fl7oXwqPY3zPzktDpSCcYDiShxgGW3wCPtRFNZBLl6Ekwd5GB
         3K2/3qEBq3CxJkM+/56l0SB/7vfa4Elm2+B2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+w0efWqRPp/QaA80uZ2hXwt3OEXDPP57fMDjGCeRiD8=;
        b=04Zb9y0F9rErTp+wbJQHXdsMrKqK5rRDak01jcNQaRkBqI6ps1jrC6gtvIDj0lA1Hg
         AeZrFto2RqMbw/knrJHXFzDXvXQz0Aqv2FiiCl4Rg1gF0Z+A/xQXVatqNQEJ6j0TxXO9
         GryGAWqm2cLMd6b+uKAJRz4HdIQdE5rFc5/pAZGBQwI7gpohfiLqzpGUqOlc+RLewXeM
         T0+hc1KRlXavgNHu3C+/wgHYFv0I04bIKbgR97NDmKSPRcobgK0AqpWH18iXZhleUc4V
         Bie2jXnAmCy4SJTY1Q8GR0iQ3vBSDpLGs6oL8ue+APHurvxsbJ3easgdKzccgEOKvGMu
         j7Eg==
X-Gm-Message-State: ACgBeo2mhU3NbTcypqojYRFuRwDKXhvFBVa59l7Aw2647/4/raVOri8T
        oiasLoOgSUPyTPP+VyDmYo9i1cUlanUzAR1aGME=
X-Google-Smtp-Source: AA6agR7MydTv5KjqoDa6wIsU/hp323l9iyiVjMX0Xy2LAvdNEGUbK3wMS15voEleE532lXt3lAJgOQ==
X-Received: by 2002:a17:907:2888:b0:730:d9ca:34e with SMTP id em8-20020a170907288800b00730d9ca034emr18105616ejc.634.1660089166167;
        Tue, 09 Aug 2022 16:52:46 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id b21-20020aa7dc15000000b0043cf0d56a61sm6784420edu.8.2022.08.09.16.52.45
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 16:52:45 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id v5so7040713wmj.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Aug 2022 16:52:45 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:3a3:3ef3:c8d1 with SMTP id
 g16-20020a05600c4ed000b003a33ef3c8d1mr442539wmq.154.1660089164991; Tue, 09
 Aug 2022 16:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <YvLmPl8sgR2q3WgE@ZenIV>
In-Reply-To: <YvLmPl8sgR2q3WgE@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 9 Aug 2022 16:52:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wju2oRhU16tqgs5hD3GfF6sHBLZu-ihtnpmTiRyxO=Zqw@mail.gmail.com>
Message-ID: <CAHk-=wju2oRhU16tqgs5hD3GfF6sHBLZu-ihtnpmTiRyxO=Zqw@mail.gmail.com>
Subject: Re: [kconfig][RFC] getting things like CONFIG_ARCH_HAS_SYSCALL_WRAPPER
 without bothering with selects
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Aug 9, 2022 at 3:57 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> However, kconfig could do (1) without selects - something like
> bool ARCH_HAS_BAR_H
>         def_bool $(header-exists,bar.h)
>
> Does anybody see problems with the patch below?

I like the concept, but I'm not entirely sure how generic it is. How
many of those "arch has this header" do we really end up having?

Just looking at some of the "ARCH_HAS_XYZ" options, very few strike me
as being about a header file existing.

I'm not saying you picked the _only_ such case, but it doesn't seem
_entirely_ impossible that you did..

Looking at some of the other cases, they might be more interested in
not "does it have a header file", but "can I grep for this symbol
name"?

And that kind of "do you expose symbol XYZ in header ABC" query might
work for this ARCH_HAS_SYSCALL_WRAPPER case too?

So that seems like it might potentially be a more general-purpose
Kconfig helper. Hmm?

                    Linus
