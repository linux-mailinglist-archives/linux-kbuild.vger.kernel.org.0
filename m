Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403C13EE164
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbhHQAkS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbhHQAkH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:40:07 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46262C061149
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:38:44 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s3so1030304ljp.11
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pHaGWBp+iPke7D8PjWpRsP5FDk17EO5HdXW410aqSA8=;
        b=WUH6XmE9plzv3pLCMtudUeKkDwsm7fcLTqzEqRJzv67yYANEIvv65L5K4S7jRcS6n/
         ++d/KmbA8avZT3WWVKq6PRXv/oMsqDe/sMf4vqnITD6849cqzsCBLKFhCvshwvAUeoGi
         tYM7iUKQ+oOjw3s6tKh+BBEwpTniI6lqmI/a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pHaGWBp+iPke7D8PjWpRsP5FDk17EO5HdXW410aqSA8=;
        b=njT07ZIcnVpf7j1sq1utPzRorvox/fauSUGaRJ2DUkOzgaOTmAaJ84rGnfo6gkI61P
         z72SJMFv29q5muFY+7zfA2qTSzIjCGoeLTuVEAqV1fC4bHlWMnj/1AbujPXzAXED1UO7
         vnoIAX7/28z/GnUxAqslKHkU6iAsdh+HXxitOFwYfRURdudkUz95nFcEjLHh+dfRn69w
         UCLSG6sKs8f/00hBLDf98ytPqpBzuFATjEU+jBvHMazuqS9F/WVxt8T6JBzwZ5KSAQSd
         DIYSCDr+u+2FJyqEoaYIq9fJSgf7QUs5MthKg/wiiG7QoScplcHyQx1Z9jjMqijkecTd
         CqQw==
X-Gm-Message-State: AOAM5313bLOOUqTxzYOk3DwtLrj2IhJ/PBzR35qTKt9gz4txfBYHNj4G
        yjn5330TjBmrQfAOSPtUFn2JfH7SeVKfgSbk
X-Google-Smtp-Source: ABdhPJxH3Nx/vdW5NC27TxlaoBL+aGc1oTvB9ukf4gfgBBO9p7NkaeTTLIkQnihpQ9HLboP+CojxOA==
X-Received: by 2002:a2e:1556:: with SMTP id 22mr711038ljv.253.1629160722556;
        Mon, 16 Aug 2021 17:38:42 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id a9sm52078ljq.51.2021.08.16.17.38.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 17:38:41 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id r9so28548233lfn.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:38:41 -0700 (PDT)
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr353737lfn.41.1629160721393;
 Mon, 16 Aug 2021 17:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210813224131.25803-1-rdunlap@infradead.org> <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
 <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
In-Reply-To: <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 16 Aug 2021 14:38:25 -1000
X-Gmail-Original-Message-ID: <CAHk-=whP8o-K2=WWQm=cqx5YTpZcb+KCVvomZ+NeV19CsBMp3w@mail.gmail.com>
Message-ID: <CAHk-=whP8o-K2=WWQm=cqx5YTpZcb+KCVvomZ+NeV19CsBMp3w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 2:33 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So the warnings that clang gives with -Wmain seem to be much more reasonable.

In fact, I can't recreate the warning even with gcc and -Wmain.

I get the feeling that this was a temporary misake in gcc, and perhaps
only warns in a few very specific versions, and the gcc people already
fixed this long ago.

Oh well.

              Linus
