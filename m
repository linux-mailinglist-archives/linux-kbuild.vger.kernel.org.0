Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357142F5D08
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 10:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbhANJOi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 04:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbhANJOX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 04:14:23 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36832C061575;
        Thu, 14 Jan 2021 01:13:40 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 186so6558388qkj.3;
        Thu, 14 Jan 2021 01:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=St+n7nsfEnaf4R5ncFQcIS7I1e7xK6DWZkH006syrq0=;
        b=F0nbqxx0LkfAxANau3Zs4Cr1U7kyVdSDtmb/rS6bXuNr/jCCq8X14Daao778nY4laM
         WyELtwwnuFUU6TRQdPg7ZQxK+Jmu3omlxFhD1QpRnR2DD+iu6TBWm8CkDlP3ofNhn4H9
         iraOnVvk06ivM0KkP2MmJnd3XKmRuVCY4LaahQc4Sn9mcqlVgE4NxQsCoHAt9l6trxXJ
         4rxIFOHIne07Yb5dwfPuhiRYoOYLS7YSDgvFgp9LEjoIrTfGqECsJb6K8xmW3v1wHEIt
         85MdrIYHnwtUUgqK+8MIkqfGyzsW0GUlePA/ExgApZaR6nDip4dIKZG9Vx2LM3EyusLI
         xUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=St+n7nsfEnaf4R5ncFQcIS7I1e7xK6DWZkH006syrq0=;
        b=CHvQPL2tYvjw7bO8l9vD350mtPalpUUZnfQ1YzE6cuxJTttAHTXP5HKV8vsoIIz/zS
         piDwqXDe0Pw9JJ+H+1LjtTatqjOc/yK1qwxXRHQtslz6D8LaiWIRYoznPGPKP9qMO6gS
         k4JvjY8PnZdjGZLmKpKiBWSPo+IrBac6oQTaiWgM9RE8FKix3y5NYTv6Uud7D/yS40+y
         3X9k0ueQpPmd3MF9mfo3V/ic7LfVRavo7L9xOhgBcCdQLhTtDNmNMiQIDjMSwMWvufz5
         bxRuSgYpMSNsebSMT+XE4ARSUzKlcah4JYD6paXHrRDOcwvW7K1PKlYleUtY3rhhCGT2
         80WA==
X-Gm-Message-State: AOAM530q0urgcwO82+Etgo3rDQhLuj9vg/1YocvkkT79EEUavHd5fqlZ
        +CIB5QXhmxffDq4xfEgJ9TAADy1t49nvio0riWg=
X-Google-Smtp-Source: ABdhPJxEFQpg0yNqRNt94vAk1nY5odZZFDicUOGWAkbd4CZ7Hlq7GkZZpeuQ6D5dWLu+OIPzJCuzzJFRPX7UOHrnCd0=
X-Received: by 2002:a25:ac03:: with SMTP id w3mr8897177ybi.135.1610615619534;
 Thu, 14 Jan 2021 01:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com>
 <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
 <CAKwvOdmr7RttdM25wWKiV8t+tzn8W-C_U6avwrQXQWphT8XhXQ@mail.gmail.com> <20210114022352.GA9913@Ryzen-9-3900X.localdomain>
In-Reply-To: <20210114022352.GA9913@Ryzen-9-3900X.localdomain>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 14 Jan 2021 10:13:28 +0100
Message-ID: <CANiq72kvnuUZftJRsrPMYA=CLe2q7fO=mrobXMbcf-y3vFhtLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 3:23 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> A clean "make -skj24 htmldocs" takes me a little over three minutes or
> so on my Ryzen 9 3900X. Just to give some perspective.

Oh, wow, that's something...

Thanks a lot for adding this:

    Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
