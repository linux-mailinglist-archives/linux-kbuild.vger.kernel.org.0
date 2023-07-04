Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC415747985
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jul 2023 23:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjGDVU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jul 2023 17:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjGDVU5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jul 2023 17:20:57 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EC312A
        for <linux-kbuild@vger.kernel.org>; Tue,  4 Jul 2023 14:20:56 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9939fbb7191so10418366b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 14:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688505654; x=1691097654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n75Dh2puDmWxs7IMDzFSoZlMiY6RQZaHybFGnsL1ZMY=;
        b=QOODvko3WFZFhybeNOP3lbChfYO1Uc3IsA5HH7WSwBUgpgyh1EyfYWsHcn3/OiI0s5
         EZEjJG6l6ecCFsAopwbb9PHUYFUDDCWOF/SvmiZrJLJHszYY7zanT9wcNB7r6h7J5bZs
         Tv9sfBOAsIbeONQX2EOkPHY5M2SHe9I/Rslnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688505654; x=1691097654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n75Dh2puDmWxs7IMDzFSoZlMiY6RQZaHybFGnsL1ZMY=;
        b=ZChcbLzQoEfb8FQZRByvbVZuyCkDtoyNgnR92mFxjQmp9z1Q2qtl53ro8IC6WKxXAE
         IGfL4g38G30Hqo9+C/NuZD9ssLDdPYhb91umf8Zexrkn5G6jZryqvUPdxUlizZmyPNjS
         fY2qjgyi8ShVNpuBdpvbGXumF4e/PVwC7oFKv/YGK4ZRA3QnZWRow+VLCGzh0tgJf41A
         w8Mt9lOvlu9AwekzRdSfjzE8DM/HOYiWjdaSU9mCNnibrnoXzJd508WiTIy3RrJhvk+T
         xqqV+z6cx5GUpkxv5gKEoHvXQYQC5gzMr//39Nc31ONfri6UxJZb2SMItDB+ZjnAi84i
         rD+A==
X-Gm-Message-State: ABy/qLYNSOsIzwh3STDSoJ2VgVL+rN+OBelmjfu4WyfodnmTP8ZMQQs0
        F/E+c8W4x7FqdCtVoHo5qP/7kVVtfLMBDvj3WWs0ow==
X-Google-Smtp-Source: APBJJlGrZdb+1lbGtmyhJzxoTd9NUjdBec3APKgwua/t0SczHRPu9Bc7Qq2oSE+D4N6Tug1q0gwW9w==
X-Received: by 2002:a17:906:245:b0:992:1653:3402 with SMTP id 5-20020a170906024500b0099216533402mr404805ejl.25.1688505654779;
        Tue, 04 Jul 2023 14:20:54 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id gw26-20020a170906f15a00b009929d998abcsm8079334ejb.209.2023.07.04.14.20.53
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 14:20:54 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-98e39784a85so12097366b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 14:20:53 -0700 (PDT)
X-Received: by 2002:a17:907:7f26:b0:966:1bf2:2af5 with SMTP id
 qf38-20020a1709077f2600b009661bf22af5mr379213ejc.22.1688505653634; Tue, 04
 Jul 2023 14:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
 <20230704211509.GA21834@1wt.eu>
In-Reply-To: <20230704211509.GA21834@1wt.eu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jul 2023 14:20:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjH4O6v_EwVB=t_6Haky2jOiejHbCkCTvgNQWo1ghy8-w@mail.gmail.com>
Message-ID: <CAHk-=wjH4O6v_EwVB=t_6Haky2jOiejHbCkCTvgNQWo1ghy8-w@mail.gmail.com>
Subject: Re: Overly aggressive .gitignore file?
To:     Willy Tarreau <w@1wt.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nick Desaulniers <ndesaulniers@google.com>,
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

On Tue, 4 Jul 2023 at 14:15, Willy Tarreau <w@1wt.eu> wrote:
>
> I don't understand why your completion on "git am" should rely on
> *tracked* files.

It doesn't.

Read that email again.

It fails on *untracked* files that are hidden from "git status" and
friends by our .gitignore pattern:

   *.mbx

added by commit 534066a983df (".gitignore: ignore *.cover and *.mbx")

So when I have those old stale mbx files around, I don't see them,
because "git status" will happily say

    nothing to commit, working tree clean

with no mention of those old turds.

Really. Try it.

> From a workflow perspective that makes no sense,
> as by definition, git am will consume only *untracked* files.

I don't think you actually read my email.

            Linus
