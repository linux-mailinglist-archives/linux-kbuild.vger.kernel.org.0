Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634C22C6D1D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Nov 2020 23:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731951AbgK0WG1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Nov 2020 17:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731524AbgK0WFy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Nov 2020 17:05:54 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAE9C0613D1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 14:05:52 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id r24so8925306lfm.8
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 14:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhQQTyukA0hBMXZZ9IFzOlq0mvJ89vDkRZ3YCulgyfQ=;
        b=KslCAcATqBJOGXCSY+koKy4jqBiVmAo+dzC834xJuW1iV9pRl7H+bNhUXlI5qRk00l
         C2YT5zjSYjfbrVnXH6zVAmSZondZmvx5rpc1jXSOl9dVtudU29NpJqElbfCJ+7pN28v2
         uACCJ2w3EHGN++ZtcbrJ5jyVpAApKGIwkJJVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhQQTyukA0hBMXZZ9IFzOlq0mvJ89vDkRZ3YCulgyfQ=;
        b=C3dgQr5HeMQVN0yDWxScPsNmm6WWWk3FiTG9rjFIZ+YrRcZMbH4Ti/wLD4BV9ogq1Q
         eJSGf9dWaB1+sb1TODgFOHzcwQqS1PebcJAdMeYet9IQQ97MCGIbZqqYaUcUKuFQX9ir
         d1ZjoOgDvVXEGthcTT61w8miVk67yrUWShGt0pwDTWlDwWUikvoZNt/kcWRcjUh4YXp1
         2iH5oyjCj4m7hwuyKsyQKt8E12VOy9xxSN3BQdMNcHk9EZdMtQDgg1Ch2y+CxC1PuXgq
         2HvhDt1KQq3LfdhflQCEIctL9xV0sOYNR4LMoYKVlzVLFOfmzcShgnRvxaovu4C9LaMZ
         dy0A==
X-Gm-Message-State: AOAM533yOdeWqp96JjOTZaorJS5j1XZ1mUNMpdzonkt6y3kADHzx2j9d
        3P0QkVlm4KpqMudm+3qXO2tebO/tT5941g==
X-Google-Smtp-Source: ABdhPJyt2nIMJ1HqRgcqKOSATjoeP9JXWmR4G+rtat6emk0qaE21eNPwbeIr4X9fJnVPl1upIAytxg==
X-Received: by 2002:a19:d4b:: with SMTP id 72mr4592251lfn.33.1606514750978;
        Fri, 27 Nov 2020 14:05:50 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id c5sm842813lfg.84.2020.11.27.14.05.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 14:05:50 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id l11so8968504lfg.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 14:05:49 -0800 (PST)
X-Received: by 2002:a19:c301:: with SMTP id t1mr4183355lff.105.1606514749548;
 Fri, 27 Nov 2020 14:05:49 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com> <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
In-Reply-To: <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 27 Nov 2020 14:05:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
Message-ID: <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 27, 2020 at 1:53 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>     33.68%  cc1plus

So a third of the time is the _single_ invocation of cc1plus, which
happens from scrips/gcc-plugin.sh doing that

     $HOSTCC -c -x c++ -std=gnu++98 - -fsyntax-only

thing. Which is purely to verify that plugins work.

Ugh.

Emese - I'm talking to myself while I'm looking at why "make
allmodconfig" is so unbearably slow. This is part of it.

              Linus
