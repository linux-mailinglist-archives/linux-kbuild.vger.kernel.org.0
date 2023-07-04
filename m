Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B9B7478CE
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jul 2023 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjGDTtX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jul 2023 15:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbjGDTtX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jul 2023 15:49:23 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7DE10D9
        for <linux-kbuild@vger.kernel.org>; Tue,  4 Jul 2023 12:49:21 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b6f943383eso16290031fa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688500160; x=1691092160;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h4y4pe8nKPNc3vbmtQQZLZUBLO/NbEWrS8puocb/Up0=;
        b=H36zhe0MwmlWlO2lW0dYKtdnedoDkVIl2291itwlJI8sIg2XeNIr94M7/xGlBhV8H2
         yjkF2b5dOSdGBQatMXvp+K10wU9IyGPI5Wi43Zc5b0jedNf/fNo9UkT25qbwgdgESQmV
         0vOLHJTSY/plvO+6TQFOZZOdcCh6hIwibOYlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688500160; x=1691092160;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4y4pe8nKPNc3vbmtQQZLZUBLO/NbEWrS8puocb/Up0=;
        b=hzcmaqnCeQbt+67K1kN6LqWT1QmqgOnqToOX4XItv4uXva3CC0QmNIZ6X0ySwaT+G4
         LL3m1Q87i68XhPi5rqgqwnikALPoI+M4IMsaUBpqgRWGnalRBuDGtsNKKKbEc/xW8t76
         +LIx/S72JNY1qSB7cixEEM3BWPOr+y0DhpXOhRGsZ7voXzS4VXbDvweVyK5BINfX7BeX
         +Rhc9E3v1CsXUWvnBr6OnzxkdpXnkrYSDt8uulb3v+sas61q0dAldryv51VIQfaVtBj7
         atvVJu2F+Hgtno8ZsrsemTAmMum1fcRu7qnGk3TggsES22HilX8l8M60/56QGTD/cxxE
         qMkA==
X-Gm-Message-State: ABy/qLbABfnBjAA+b08Uc1xNaYqbFZ3i0/ugGfhw2QHCy+52tR6+bSYL
        pY1mIgFXlno0zDjUi0xFZfyzYh5DSvo7RL0UcNHgqyjo
X-Google-Smtp-Source: APBJJlFOetmHEpJIi6+8+1znPh3y8bm7/XDQblpNjaWhTVvb2R6NjeIwbiDRs7fWfkK5HjltCoEBQA==
X-Received: by 2002:a05:6512:3d09:b0:4f8:6d54:72fb with SMTP id d9-20020a0565123d0900b004f86d5472fbmr12011775lfv.62.1688500159789;
        Tue, 04 Jul 2023 12:49:19 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id d10-20020a056402078a00b0051de38eb925sm6777886edy.93.2023.07.04.12.49.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 12:49:18 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51dec0b6fecso5677990a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jul 2023 12:49:18 -0700 (PDT)
X-Received: by 2002:a50:fa96:0:b0:50b:c693:70af with SMTP id
 w22-20020a50fa96000000b0050bc69370afmr8998604edr.2.1688500158487; Tue, 04 Jul
 2023 12:49:18 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Jul 2023 12:49:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
Message-ID: <CAHk-=wiJHMje8cpiTajqrLrM23wZK0SWetuK1Bd67c0OGM_BzQ@mail.gmail.com>
Subject: Overly aggressive .gitignore file?
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
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

So this keeps happening to me - I go to apply a patch I just
downloaded with 'b4', and I do my regular

     git am -s --whitespace 2023<tab>

and the dang thing doesn't autocomplete.,

The reason it doesn't auto-complete ends up being that my kernel tree
contains some other random stale mbx file from the _previous_ time I
did that, because they effectively get hidden from "git status" etc by
our .gitignore file.

So then those stale files end up staying around much too long and not
showing up on my radar even though they are just old garbage by the
time I have actually applied them.

And I always use auto-complete, because those filenames that 'b4'
generate are ridiculously long (for good reason).

And the auto-complete always fails, because b4 just uses a common
prefix pattern too (again, for a perfectly good reason - I'm not
complaining about b4 here).

This has been a slight annoyance for a while, but the last time it
happened just a moment ago when I applied David Howells' afs patch
(commit 03275585cabd: "afs: Fix accidental truncation when storing
data" - not that the particular commit matters, I'm just pointing out
how it just happened _again_).

So I'm really inclined to just revert the commit that added this
pattern: 534066a983df (".gitignore: ignore *.cover and *.mbx"). It's
actively detrimental to my workflow.

I'm not sure why that pattern was added, though. These are not
auto-generated files from our build.  So before I go off and revert
it, let's ask the people mentioned in that commit.

I *suspect* the thing that triggered this wasn't that people actually
wanted to ignore these files, but that it was related to the misguided
"let's use .gitignore to build source packages" project.

But at least for me, it's a real problem when .gitignore contains
other files than the ones we actually generate.

The only one that actually commonly affects me is the *.mbx file,
although I could certainly see the same being true of the *.cover
thing.

And there might certainly be other patterns like this that I just
don't react to, because they don't have the same detrimental effects
on how I work.

Comments?

               Linus
