Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41166A3388
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Feb 2023 19:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjBZS6u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Feb 2023 13:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBZS6u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Feb 2023 13:58:50 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87739003
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Feb 2023 10:58:48 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id o12so17263693edb.9
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Feb 2023 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euEYr+aEqxi2MZsla4irIlbr81F8Y/rQgPcXv2JYmC4=;
        b=OMV2yy5/qDnAk5uxG4huXHzGZGDFql6n50QxVL5U8Tf9HbCJJ+fDVaFdlQqBLQG0aW
         MK2yau+Bn7qF+ptc8Q4mxzJKDAfjTNLgZThoM6iY9mvmHSUlFppqmOBef/qfQcu9sYit
         MMu08voc5G9enl9MMPKCGwVn3eDEUk67DyEmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euEYr+aEqxi2MZsla4irIlbr81F8Y/rQgPcXv2JYmC4=;
        b=2jhDYksU1O3Q8UUWNYQz2RmbBXbxeJKChUoq0hC05fOpesocnrwUX/55L1aNPod6PF
         A3d1x4adl8Tuya+KwhE0gPfEbcvObZVdnfuamfJemgd3Hv35Hsz9emDkKu9A5uSidpc4
         oPWebheGlN6bvKcGgGrnBdVA8ns3dzE5G2haIRKQ+lRbJtEvZtSt9symosR+XJ8adBiU
         CWwM3rEc6k3BkKPEEKqT0dINnZVKNRhz8aMuGQgC3K2fn1qunTM6HZ/OOuXHxiK2iseJ
         DMcirNSKlhi2cySmuPuhfK93ChWmVU7vHNSnXzQ9BIylp3KKWxz3cSVrgUbU//sxoWdQ
         F5pQ==
X-Gm-Message-State: AO0yUKX9ShZEEFIIID+Stt9lOLQ8ka2wjbkshtb/rOqmWs5K1Fq8jEw2
        RdYtifdjoNssAXTEy0eqypKbWmot4HXGpmt6qxdizA==
X-Google-Smtp-Source: AK7set+ibiGCkEqI0WkJqOLlG/+Z1yJlZky0olqhR7vsFepUF8ZkR/JKM2bdtLBpuXhbtyM62NAt+g==
X-Received: by 2002:a17:906:1757:b0:8af:3519:ea1 with SMTP id d23-20020a170906175700b008af35190ea1mr32343021eje.57.1677437926910;
        Sun, 26 Feb 2023 10:58:46 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id fp2-20020a1709069e0200b008ee5356801dsm2235777ejc.187.2023.02.26.10.58.46
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 10:58:46 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id cy6so17349483edb.5
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Feb 2023 10:58:46 -0800 (PST)
X-Received: by 2002:a17:906:40cc:b0:877:747d:4a82 with SMTP id
 a12-20020a17090640cc00b00877747d4a82mr14342318ejk.0.1677437926047; Sun, 26
 Feb 2023 10:58:46 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com>
In-Reply-To: <CAK7LNATJ-3JQ0QQGQ5R+R8aBJEq-tmBL8iBZrbM_4t0zeoYTaw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 26 Feb 2023 10:58:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi49sMaC7vY1yMagk7eqLK=1jHeHQ=yZ_k45P=xBccnmA@mail.gmail.com>
Message-ID: <CAHk-=wi49sMaC7vY1yMagk7eqLK=1jHeHQ=yZ_k45P=xBccnmA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.3-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 26, 2023 at 8:34=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Masahiro Yamada (46):
>       kbuild: add a tool to list files ignored by git
>       kbuild: make perf-tar*-src-pkg work without relying on git

I've pulled this, but I really object to these kinds of silly games.

That whole list-gitignored thing should go away, and silly
work-arounds for "I don't use git" should likewise just be killed.

There's absolutely _zero_ exzcuse for making our build tools more
complicated for bad reasons. The "I don't have git" may have been a
reason a decade ago. It's *not* a valid reason today.

People who insist on using quilt etc should just realize that then
they don't get the featrues that git offers.

You can't have your cake and eat it too.

I do *not* want to see git functionality basically duplicated in some
kernel C helper script just because somebody can't be bothered to just
use git.

              Linus
