Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073BB6778C
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 03:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbfGMBqr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 21:46:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34930 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbfGMBqr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 21:46:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so11049776ljh.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2019 18:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YpQBVIzXh6maHmnk6CkzSIf8JtAzl5sL2cPmtNRfmXk=;
        b=K8AtATm5+VzKcjCh1t23FiisxnQ59lcDmayDKPzNLSACmY2usb4c4BiBeo+WS4EL/u
         6ymFl96lKJSvZK4VnUvz6ftqiORSOFYBPH+iqvhueUX2d7+6oUY2iYIvP51yPPPJ4KCp
         JxrjT03/3RhJisxpkJPXnyPccXkRiV7XpOTcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YpQBVIzXh6maHmnk6CkzSIf8JtAzl5sL2cPmtNRfmXk=;
        b=W3dZxnntRv4ELt1B1c+4se4isE6jB4TClBOLBKDRruDtocfpeDVOyVNth+fcjlCXQw
         DiMXJsIxFy0BxJoJCz+PZVjcM4qbuJ9BADRUp8kCORbTbnRnskW8afg7NZO95hXoI2ad
         n1ErPjxVBoMU0dkWbh2cASOT3ZsKGj0P9g+LBvHQEaeiKi1+G2FMHxfN6os8qofE1k15
         PU4n02bKlxv7tVZqlwwXCZpzq2paWvHBudfPsdKAuYaJY8GlsbLtc86OB+AOM8Cdj5Gf
         Xo9Y4jhnm81KB1eHGnd1aCiDAGLYkMMgSro3C46nzOMbEVuwXiuq7eyxoEJZM1DR6X9Z
         e3yA==
X-Gm-Message-State: APjAAAXIVrBEp/5dl5QjwfpFCBTyRs5rjqkmGLDXtid5SsZccYwKBsh/
        K2fF9m73yfLd7E2YG+ucKIJ9AxjHe6k=
X-Google-Smtp-Source: APXvYqxou8RF5/y0YCFBWElG2VyRcVwwTaa8/P8wN7vULPsUnG3qwPl1A5SHs/f9AYJl63NBOWGXmA==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr7602392ljk.29.1562982404738;
        Fri, 12 Jul 2019 18:46:44 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id n124sm1311875lfd.46.2019.07.12.18.46.43
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 18:46:43 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 16so10999529ljv.10
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2019 18:46:43 -0700 (PDT)
X-Received: by 2002:a2e:b0e6:: with SMTP id h6mr7313053ljl.18.1562982402950;
 Fri, 12 Jul 2019 18:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190712010556.248319-1-briannorris@chromium.org>
 <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com>
 <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com> <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
In-Reply-To: <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Fri, 12 Jul 2019 18:46:31 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOOyd4-thctnHG06GXnouf6EuJ4QV5QM+3iNBYQF499uA@mail.gmail.com>
Message-ID: <CA+ASDXOOyd4-thctnHG06GXnouf6EuJ4QV5QM+3iNBYQF499uA@mail.gmail.com>
Subject: Re: [RFC PATCH] bug: always show source-tree-relative paths in WARN()/BUG()
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 11, 2019 at 6:50 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> GCC 8 added this flag.
> So, it will be eventually all solved in the GCC world.

Ack.

> Clang has not supported it yet...

That's what it appeared like. I've bugged our Clang-loving toolchain
folks to see if we can get parity.

> Trimming absolute path at run-time
> is no help for reducing the kernel image.

Sure, but that's not my stated goal. It would indeed be nicer though.
I guess if no one else speaks up with a favorable word toward my RFC,
I'll just see what I can do on the toolchain side.

Thanks for the help,
Brian
