Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E375FA466
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Oct 2022 21:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiJJT5e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Oct 2022 15:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJJT5b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2022 15:57:31 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6016076462
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 12:57:30 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso13605347fac.6
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M8uyUjEJR//bZXPKOY27qzuplDCO6DMXj9UQvWKRnws=;
        b=FobSKKzVUOOjjfpa3KBD+BbpDxa3pcBVtD16L1m+hHqk/vBBDGrc1DLEAAjfQmEdpo
         Nfl+wTL3Ash0E9flHmSa3JitVaB3E30PhqSlA47DNFVWRw8tDBBOuwbgyZgHJEZe2g9A
         cHXxeSDe3X1TzJsmoQNiunyc3FVotC2yaW0YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8uyUjEJR//bZXPKOY27qzuplDCO6DMXj9UQvWKRnws=;
        b=K3S1y8KpXHNvgrH7n1O0xDaPTq9xsbboDRa1yns7GefnaI1aVacGuB2Ek/PSvmhZYe
         vOqsYVeoiQeeN5QCs6hUotPip+wbf9jV7raJttdT2XJQqWdESyvs6zk9behqx6eP7FZ1
         CsLhBX5NsoV9e+r5p0uCZu5MkP2GTDyVNooVRqOlOxzcpFnM9hGAkC7l2qAGjRQCrEPS
         xfWtTx2sveLhW133xpS9g24Md6Xivx0GEfLb0WE1XPZa7Ujy6ezjUJ4WGb1r2Wbj7rRB
         DGOHu9aUkbvbeIqyGXl0lTCI0xbGpa7I6yD9P6IcA5NSMkeD4DGWUEMPHwDhvjaNPa1i
         i3TA==
X-Gm-Message-State: ACrzQf2OerGxateMHXtWs93So6BmBQXWCRaieLZ4+Fw4slMK/OZyuRaW
        4gRSYr/M8fsLv5syuaZFH6+Sdt/t2k68Bw==
X-Google-Smtp-Source: AMsMyM6A/2Ehn+pn4CxENax3+b2l3ZYOxSmuSiwrQGxoFiSHbPQKHOI8xpCB9QUrGkZrAol8upYS5g==
X-Received: by 2002:a05:6870:6086:b0:132:e9d6:ea36 with SMTP id t6-20020a056870608600b00132e9d6ea36mr14989510oae.116.1665431849104;
        Mon, 10 Oct 2022 12:57:29 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id y188-20020a4a45c5000000b004769f57061asm4562888ooa.18.2022.10.10.12.57.28
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 12:57:28 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so8650433oop.9
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 12:57:28 -0700 (PDT)
X-Received: by 2002:a4a:aeca:0:b0:480:2413:1edc with SMTP id
 v10-20020a4aaeca000000b0048024131edcmr6524242oon.96.1665431847914; Mon, 10
 Oct 2022 12:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASzGEiQfPTaLmhG4k7VAwB5yznd-VqWdJHEF2YjgSQTcA@mail.gmail.com>
 <CAK7LNARfd1mbL8bE14NfRCmVU+wRZjxCuBVTBNQ-negr5nms4w@mail.gmail.com>
In-Reply-To: <CAK7LNARfd1mbL8bE14NfRCmVU+wRZjxCuBVTBNQ-negr5nms4w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 10 Oct 2022 12:57:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whG854+ki8fpvtMjjmgvbby=OnDS4e7-vY0DUCO6AYRUw@mail.gmail.com>
Message-ID: <CAHk-=whG854+ki8fpvtMjjmgvbby=OnDS4e7-vY0DUCO6AYRUw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.1-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 10, 2022 at 12:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I have not got any feedback on this pull request.
> I started to be worried because we are in the 2nd week of MW.

I merged it earlier today, I just haven't pushed that out yet.

I had some issues with my main machine, so things got delayed a bit:

  https://lore.kernel.org/all/CAHk-=wjNaJWvvUKTk43H-OtdP+wnM31tw8v4oz5t1TzfO4x+TQ@mail.gmail.com/

but it is all sorted out now and I'm catching up.

             Linus
