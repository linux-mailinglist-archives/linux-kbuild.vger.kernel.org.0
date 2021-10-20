Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733C24351E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhJTRve (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhJTRvX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:51:23 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C26BC06174E;
        Wed, 20 Oct 2021 10:49:07 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id s3so23098801ild.0;
        Wed, 20 Oct 2021 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HjdW/J41CTP6p7TduzFh9+zmoUvsISMf0iYtuNEONWQ=;
        b=fSJDCwnxeFIxZrnJ3pIimYU8vOVErPsMkXvZdtKzrc3sh9Q2L5XuIVSSjBJqTM+DMR
         3Wpw9/Wwb4zCkMhxxLpgDiriFDH8iiY5wuk5p7Zz9W7Iq3gSHSLiWHZ2a886Ul5nY9jI
         skPbHCjjS0JH6nk85+feQb0JRRVQS7ES6Ty4TDr8JdMaoN2ST8cM7xPBQ98aG+7AStQJ
         geocgiHecYGpjXyXF394vGOHScN7e7juEY+MndYbJXCk/yYpniBEWsE+zm33HmFRCJ70
         L5ANsq4ciODRNCT4YJviYXYnMR/uWdLfvJWVBK3ssk+7rnqEWFpXhT7qGTjspJSK3yrj
         TGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HjdW/J41CTP6p7TduzFh9+zmoUvsISMf0iYtuNEONWQ=;
        b=oIvOjOlFZTWBy0Jz8cvd4hZT03pJxDQRuYLx+c0ascoq3FhE93PgA2IB4rUDFZY2PE
         I4s1vEHnLjxtisLqmji0epNA371Su4Qa3EDkSw4JQZXe973Nmez1EvlmfyA7bKSngTls
         7ISH1gFZn0f8ZYP5QIhCH3jEehmxQZ3B8WiRpxb3qSvzJ/9O/XfeV70prk6aDREPLsAL
         QmnSmeQLI8oZ6vyl1aCyiyqA3HzUOjv03LiBD3lMbkhq9LZ9t0wRrNV1U2/QLJFo/MbK
         8qBm3k9F79pLT2omgaZ6jxTLUokM6Q231AF5OhmEjyU7wdQG+oB0Kkvu3kpwKahBMLzD
         fueQ==
X-Gm-Message-State: AOAM531W7YnYsqh9D0ypy8JLrtu3PU1UJ001SRYcte9YXyMcO+rZ2R+c
        OkPvdcoaoK91MUdZuMYTtyW8iyCuFfWNqqUaHFs=
X-Google-Smtp-Source: ABdhPJwqc4x1oIQbpSHkR5LIDn4xq+/w7aGOGNe/RpeEeJU5EAfsWRl0yDYwgmO9nDxDvIqwfZl6hH2VWM7OHSICK2s=
X-Received: by 2002:a05:6e02:2141:: with SMTP id d1mr342997ilv.5.1634752146703;
 Wed, 20 Oct 2021 10:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org> <20211020173554.38122-3-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-3-keescook@chromium.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 20 Oct 2021 19:48:55 +0200
Message-ID: <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Dan Li <ashimida@linux.alibaba.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
>
> - * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>

Perhaps we should Cc this address to give them notice.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
