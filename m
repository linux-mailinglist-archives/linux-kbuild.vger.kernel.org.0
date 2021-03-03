Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7629232C256
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhCCTfv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240732AbhCCT0u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 14:26:50 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD14C061762
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Mar 2021 11:25:55 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id y12so17287558ljj.12
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 11:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P3A2O71ftuJfSYcOjzG8n0G0DSSbzV3fpd6bic7USUM=;
        b=fJlv4zH8GTkwLsBd+qX8OFR+earNuJHiLEuvYOwl3rNwh0Qticl4+a/PHzSKaRifKR
         wtUSTXlWKZe11OR4eXmAUXXnA4krJ07dpa0WsRUD7tFxvIxX3tWiNeIGVgjRkH9/OaAs
         dURJsQj/RGcwMDzmA+QLnZtjhPWSZpnRxGwpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3A2O71ftuJfSYcOjzG8n0G0DSSbzV3fpd6bic7USUM=;
        b=nveQM7w+dknpqhD+Vj99MiNyfE6zzDfTRsHmQI2vZtG4rNRfjx/EuEzNyWgL8H7pnc
         qLsLJ4DZuLbz6cn3hQc+WqobJV9ZMeyhSbssmxB830Qaydmlljjtzhq6xnpdJUGzHqYh
         JT3YNRGkbfwmcIldpvNZDmwYwDry/fzSYRIw899OCd6FIOw4IpdFS4+3+QBFxLXPd723
         pFcSfYFO0HjlJerG/+HYpd083Ha4uTY5KH5xMzxBKWLeroFq+LnZ/yFikrEz/WSjLU1f
         tdH7D9ZjNrsSSX0tnFcSrjC29o42oKanBGDllq53GatF/+x4ss50J/7TAfn49tmOcI5A
         Xh3w==
X-Gm-Message-State: AOAM532GTDLQ+H15+PgC3iGPuHhBoYdosgnTLuMVhwj7eJuwQaubrKke
        VhE/MgZ1cty1b6bPE4i7pqy+chMDtCx9Lg==
X-Google-Smtp-Source: ABdhPJwsfGbegydg5jZlG4RABA4QVVeXYLwTn6vyFDaFpq22De04eJpetN/U8JqeQY1eVIXt88YI7g==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr291045ljk.50.1614799553017;
        Wed, 03 Mar 2021 11:25:53 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id p13sm3354382ljj.49.2021.03.03.11.25.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 11:25:51 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id m22so38982890lfg.5
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 11:25:51 -0800 (PST)
X-Received: by 2002:a19:ed03:: with SMTP id y3mr121436lfy.377.1614799550613;
 Wed, 03 Mar 2021 11:25:50 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble>
In-Reply-To: <20210303191516.6ksxmng4pis7ue4p@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Mar 2021 11:25:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
Message-ID: <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
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

On Wed, Mar 3, 2021 at 11:15 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Adding Linus, who indicated in another thread that we shouldn't force
> exact GCC versions because there's no technical reason to do so.

I do not believe we should recompile everything just because the gcc
version changes.

But gcc _plugins_ certainly should depend on the kernel version.

Very few people should be enabling the gcc plugins in the first place.
Honestly, most of them are bad, and the people who really care about
those things have already moved to clang which does the important
parts natively without the need for a plugin. I'm personally waiting
for the day when we can just say "let's remove them". But in the
meantime, making the plugins depend on the gcc version some way is
certainly better than not doing so.

                  Linus
