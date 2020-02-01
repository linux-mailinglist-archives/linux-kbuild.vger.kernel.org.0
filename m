Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8C414F983
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 19:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgBASpe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 13:45:34 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45285 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgBASpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 13:45:34 -0500
Received: by mail-lj1-f194.google.com with SMTP id f25so10477532ljg.12
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2020 10:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9t4kwJmW5ARKxnXZ4PSmUiIMEWNVmwbZmARfKh1tBE=;
        b=gx1D0+QmyxgtSASu1K01jjLcdzW2W7QVPS+we3A9Osh2vJkXIZD2WlELk3mYQf8AF5
         mxuurGDEa676cmu7D5RHAqbVIOTsin6OjZZYYXMc1rOVI/MXNCchXu1aRPSE8DG1p2LK
         ZM0CMUzd+IUSL1wjtPfrRtUrWlE/WTu0uwLao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9t4kwJmW5ARKxnXZ4PSmUiIMEWNVmwbZmARfKh1tBE=;
        b=saKGBK5du8+Jo12u/Mm90V2zYf236QSpr5OkNMyfwJZuBOcXheqw6zftCCHE4pgjaP
         sfgrYJrMJIji4ll9IHpTk1c+mvJWhYEpvobkzHzTGKclsqW9EfObGfPbbJ2BDxZfImDS
         nV+4nWwoTm3oDKj79coexsvSrJDX1p4hBJdkzpYTq36ke7bj5EZZByEkiu8bvLMv06M6
         PqUpjyC0f28YjHNfNBsq58Hm2i+Fmon4BfllJg7wAf8C8QmX7flPq59WzosK9ihAU2u4
         K0tCNq2a9ADjlhIuJkixgNx8aF7jOB1gssrvanWD7DcvhNV/SjaD1aDyn/rTIYjtiWow
         cpVg==
X-Gm-Message-State: APjAAAWqPj8v1leHYD1r7C2KqodgC1+wWXgQlHT3QRAPWtVPlJrz552t
        ZHP7AffekvdymfKSAZyjsxmjUfYnpeU=
X-Google-Smtp-Source: APXvYqxYsEEjsf2pKDOcopBBiadl3+wJwXfoOfJZLIq2WCA7KrxeogYopTD2YHtS4OLWHHfZm/p5tw==
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr9472747ljh.28.1580582732026;
        Sat, 01 Feb 2020 10:45:32 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id d20sm6867642ljg.95.2020.02.01.10.45.31
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2020 10:45:31 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id a13so10492037ljm.10
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2020 10:45:31 -0800 (PST)
X-Received: by 2002:a2e:580c:: with SMTP id m12mr9494329ljb.150.1580582730741;
 Sat, 01 Feb 2020 10:45:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
In-Reply-To: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 1 Feb 2020 10:45:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
Message-ID: <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 31, 2020 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - simplify built-in initramfs creation

Hmm.

This may simplify it from a _technical_ angle, but it seems to be a
fairly annoying step backwards from a UI perspective.

Now Kconfig asks a completely pointless question that most people have
absolutely zero interest in. The old situation was better, I feel.

Basically, I feel that from a "get normal users to test development
kernels", our Kconfig pain ends up being the biggest hurdle by far.

The kernel is easy to build and doesn't really require all that much
infrastructure, but generating the config - particularly when it
changes over time and you can't just say "just use the distro config"
- is a big step for people.

So honestly, while I've pulled this, I feel that this kind of change
is going _exactly_ the wrong way when it asks people questions that
they don't care one whit about.

If I as a kernel developer can't find it in myself to care and go "why
does it ask this new question", then that should tell you something.

Why do we have this choice in the first place? And no, it's not a
"simplification" to make life more complex for users.

                   Linus
