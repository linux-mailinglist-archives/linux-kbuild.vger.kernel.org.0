Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD83747A0F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jul 2023 00:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbjGDWOd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jul 2023 18:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjGDWOc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jul 2023 18:14:32 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4008AE7B
        for <linux-kbuild@vger.kernel.org>; Tue,  4 Jul 2023 15:14:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9891c73e0fbso19325166b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688508869; x=1691100869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IcGCOea3YEKw3Z0BdC3JX6yVfvpjQ2aXU5gSorSGoSk=;
        b=KkPcn2HAvJTcRtU26+KnV1CBWodWaWyh0/vwH5oFdhFfhAzIhWqwDGo3NFmFU5eW0+
         C8LHUKpZOaB34xjDX+a4TmO3/N7YdgzpaaoOBj0gDv8jsMGbPwPhM/TCAQKANnQfUqMn
         47ZmBJVRctATktYDZoFSloiVwijwjc3BR/GDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688508869; x=1691100869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcGCOea3YEKw3Z0BdC3JX6yVfvpjQ2aXU5gSorSGoSk=;
        b=kx8IxkXociS/O1KatdP22WYfoKDh+AQisbnknJF1nZHLXThoxY98jCilpyTYHWiQrW
         VjKEC4S1KCrQgL2UTsExLXfC25hbH8zD6gw4YMO9B48aUOaYGJFmJtmEkUA+263aRI61
         KZUahXjTqZLYi8LwOS9RBFdmHIjdhUnIkfvjZGxaEDMElDslT8g+Tu85Y9OrkOunqHR1
         xW1NerB0Zon1TdWvWlTK+1R1Tam1T+eROXU08X/UzmSdNu2Ywwa8lihRqed31lvpThnk
         ay1LEBLTZ/xPDlOOU+YiD5maqqLr7lCd/DXs4HkRhdKGXCBAIWiLNvRO4XH0XtJ/YEJs
         KENA==
X-Gm-Message-State: ABy/qLbL/x0DmxTES7qvplYajHRK6yp3qQJ0ksgWkZSTIajMKVeVqNhu
        Zu8daqeWijPWfwSgoPoM86RecwXy1NlfuSn38E3936oU
X-Google-Smtp-Source: APBJJlFr5dlN1jtoPigzLQCCfPyIFZHoaRcnR5uipBVbfIIt1JFsBdQit2OZg7sakUc3X4bZXEbTyQ==
X-Received: by 2002:a17:906:5308:b0:988:b61e:4219 with SMTP id h8-20020a170906530800b00988b61e4219mr438784ejo.29.1688508869566;
        Tue, 04 Jul 2023 15:14:29 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id rn20-20020a170906d93400b00993004239a4sm5853854ejb.215.2023.07.04.15.14.28
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 15:14:28 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so200330a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 15:14:28 -0700 (PDT)
X-Received: by 2002:a05:6402:2547:b0:51a:4039:b9e with SMTP id
 l7-20020a056402254700b0051a40390b9emr468288edb.9.1688508868151; Tue, 04 Jul
 2023 15:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
 <20230704211509.GA21834@1wt.eu> <CAHk-=wjH4O6v_EwVB=t_6Haky2jOiejHbCkCTvgNQWo1ghy8-w@mail.gmail.com>
 <20230704213415.GA21872@1wt.eu> <CAHk-=wjPEjrB7eCukREhWu-0qfjbFD-K8sk1TYYRgeHzYr1tuQ@mail.gmail.com>
 <20230704215600.GA22271@1wt.eu>
In-Reply-To: <20230704215600.GA22271@1wt.eu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jul 2023 15:14:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMytacPBHfKKi8GYdgfadNy5LA-1TDHrTtz22eJr2B1Q@mail.gmail.com>
Message-ID: <CAHk-=whMytacPBHfKKi8GYdgfadNy5LA-1TDHrTtz22eJr2B1Q@mail.gmail.com>
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

On Tue, 4 Jul 2023 at 14:56, Willy Tarreau <w@1wt.eu> wrote:
>
> This point I perfectly understand, but there's also this "ls" command
> that lists file names starting with 2023-* if required.

You know what? I'm done arguing with you.

Sure. I could also do "echo * | grep 2023" or something.

Or I could just remember every single mbx file I ever used.

Or maybe I could remember to just delete them immediately after using.

Or I could do any number of other things.

But what do you think "git status" is supposed to do?

Here's a theory - it's supposed to tell me about the status of my git tree.

Maybe it's supposed to tell me about extra files that maybe I should
be aware of. Maybe I should delete them. Maybe I should commit them.
Who knows?

Or maybe it's supposed to tell me that I've forgotten to push, or that
I have diffs I haven't committed.

All those things that are specific to having a git tree, that tools
like 'ls' simply don't know to do.

It's a crazy theory, I know. But just go with it, ok.

And  *if* we pretend for a moment that this is what "git status" is
supposed to do, then maybe it should have reminded me about stale
random files in that directory that ACTIVELY BREAK MY WORKFLOW.

Maybe that isn't your workflow.

Maybe you're perfectly fine not getting a unique auto-complete,
because you *want* your git directory filled with irrelevant crap.

Or maybe you just always do "ls" religiously and look for random files
in general, because  you are bored and it fills up that dead time.

But how about you just accept the fact that for some of us, the whole
point of 'git status" is to tell about these kinds of things, ok?

I'm now done. I have reverted that commit in my tree and pushed it
out, because while I was interested in hearing about any possible
other use for that overly aggressive gitignore entry, I'm not in the
least interested in you trying to teach me about esoteric tools like
'ls', or telling me that "unsuccessful auto-complete is still an
auto-complete".

              Linus
