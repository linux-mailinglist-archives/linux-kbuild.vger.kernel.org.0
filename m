Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67283EE5BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 06:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhHQEit (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 00:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhHQEit (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 00:38:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CEFC0613C1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 21:38:16 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d4so38817536lfk.9
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 21:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uq/bBAwcycy9ILdK1/MFcUjGkBg8B9u5tF1ftRi5Jvs=;
        b=eQWhMGR4Wzx2VRiWFtn6HkHbefAZwK1koiIBF+/62t/04vISEOfEHz4jctSwiCwSym
         8/eJ0NnAss13r8v8P+RlBorAGjWvxqUb5flQvKImCB2tiOiklZv0qrFt3pQ2nOIwNz1r
         GvW4LNXZh+y8c7F5cAJRs0quHLY4glemS906I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uq/bBAwcycy9ILdK1/MFcUjGkBg8B9u5tF1ftRi5Jvs=;
        b=nVir4rUDxuK8uY/L3Bpf27GLzlnVbdXHuAQSUdRJRbjVWV341MGinOvqoSPvL3x1aL
         5WtfjfHzCUR+KojmRXyAF9p2uN6rtEChq40hDibFy76T6UDX2KnXSUck3UFTWMl8UTQI
         9VOeeVPhJq02QhH0T4x7eB5X/mJMG1mZ74xJ79ZHj+AfFj/xaYKuSUpblYsXRcCnG04k
         8JkR5tTOHRn6HITAhP0e1ftNBABLNDOhdN5QfqHhmXDMnWsgf9MQLYuyRZ+8atHIHUza
         oIFmkwTfEbbP9j9y1L1pk+IyNEZ4D86MFDDZu5ha6Q5SOvqHC8s1U2mdwn5Bh1rv2plw
         iEPA==
X-Gm-Message-State: AOAM5319HRKjqz2QX/JsSUl1qHf2JbMnbJCTP1fmBGEC0gJjb3veb4v0
        teNgSITssy6qUQf6YuqC7M0UZaxd3r0g8+Du
X-Google-Smtp-Source: ABdhPJwJdnQ16/rQSnJML7i5wQSmbhhKQPzQZnc86bRsjW9uXZmy8l4Er4103KsioWHfN74MUwk9Jw==
X-Received: by 2002:a05:6512:3b92:: with SMTP id g18mr969571lfv.192.1629175094632;
        Mon, 16 Aug 2021 21:38:14 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 22sm96390ljq.103.2021.08.16.21.38.13
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 21:38:13 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id p38so39076234lfa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 21:38:13 -0700 (PDT)
X-Received: by 2002:a05:6512:114c:: with SMTP id m12mr943646lfg.40.1629175093063;
 Mon, 16 Aug 2021 21:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005624.1455428-1-nathan@kernel.org> <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
In-Reply-To: <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 16 Aug 2021 18:37:57 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
Message-ID: <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 6:20 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Additionally, there should be some time for the CI systems to update
> their clang-14 builds, as the recent 0day report shows.

What?

No, the 0day report shows that the patch is buggy, and that the

  ifeq ($(shell test $(CONFIG_CLANG_VERSION) -ge 140000; echo $$?),0)

clearly doesn't work at all, since the flag is enabled on those
systems with old clang versions.

Alternatively, the test works, but the 140000 version is not enough.

So no. This patch is simply completely wrong, and doesn't fix the
problem with Clang's buggy -Wimplicit-fallthrough flag.

              Linus
