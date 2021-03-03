Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CAC32C3B9
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhCCX7i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388228AbhCCVG3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 16:06:29 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCAFC061756
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Mar 2021 12:57:11 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u4so39416018lfs.0
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 12:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jRuDUUKixXJZDP0HjES33qad4zVN4t6lxUgDAY1T79Q=;
        b=QNwL/lnQ6xUnUJftFOjYj8S9SK2GrudH3yjL3FFeYEI36t+HVCk0ahbgAXK7QMT1q/
         d7s7AYb2jVr536dyDslgA1cJdUs4S/uosw+QeGO4MUiZh8yb3HqGGqPuVwKJQLGPWteM
         NqzmXkjI8rx2WgJHgIn7NY19N0J8VPem+YCDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jRuDUUKixXJZDP0HjES33qad4zVN4t6lxUgDAY1T79Q=;
        b=CgCdvS4jES15PSkUQwVoGUshn8aByr0DXXMJtxNQaonyLoBlYaw4EHIx3JAYcRT96M
         AWAd3RydksnYvXFQ7I4x8IvgKm9miVfPwkrvkUcndStckV4Rl0CDv7BDhIP3J/Ct0Qvg
         cHUJZwzrz9OhTZ43pOcsoeoz5zvc/Vbt1a1QDZesJ7YiupHSF0LzY6pWL4BCILUZM3Cu
         yEwUI41EfwrPt1wapFGw4K7HYZv78g5BZUHIXDey5wvgkB3KB2vLiT87FppQx0qS3JTd
         Lm5CF1lFgKmxTB98Za4J9FthxdRswawJ2dbMCkBkUg/o0oagm2g70zHHI5w0voLsinSt
         5j2w==
X-Gm-Message-State: AOAM5328mngw2ohaW1RAYva5IZT/dOJRPxAOzZg0ICVtCE5GBGRi6lNm
        nM3MbqEzWB8E5PLRu99Rm8cTw5SplMzmwQ==
X-Google-Smtp-Source: ABdhPJwEWIydN9pybnOVxBlCgDLHfy9e/1x5OZkjIbXQfp6uzhsl+Sqfqb54hY15UbSWnCLoEcAcqw==
X-Received: by 2002:a05:6512:3aa:: with SMTP id v10mr354130lfp.308.1614805029611;
        Wed, 03 Mar 2021 12:57:09 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id d8sm3043986lfg.96.2021.03.03.12.57.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 12:57:09 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id d3so39365419lfg.10
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 12:57:08 -0800 (PST)
X-Received: by 2002:ac2:58fc:: with SMTP id v28mr305345lfo.201.1614805028665;
 Wed, 03 Mar 2021 12:57:08 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble> <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble>
In-Reply-To: <20210303202406.bxgdx5a25j6wc43b@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Mar 2021 12:56:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
Message-ID: <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 12:24 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Your nack is for a different reason: GCC plugins are second-class
> citizens.  Fair enough...

MNo, I didn't NAK it. Quite the reverser.

I am ABSOLUTELY against rebuilding normal object files just because
gcc versions change. A compiler version change makes zero difference
for any normal object file.

But the gcc plugins are different. They very much _are_ tied to a
particular gcc version.

Now, they are tied to a particular gcc version because they are
horribly badly done, and bad technology, and I went off on a bit of a
rant about just how bad they are, but the point is that gcc plugins
depend on the exact gcc version in ways that normal object files do
_not_.

               Linus
