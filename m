Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F0A14F961
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 19:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgBAS2X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 13:28:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42040 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgBAS2X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 13:28:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id d10so10462225ljl.9
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2020 10:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IZAnCMpe8DW4khvlse83k3bVZJhm44NmP/u82ve7Vg=;
        b=N6WC6YbLEkYpGK90chX8z0G9lK4WcDblSzCh5VurtZtsJhEf3zIu29kgqCw1IWPMS9
         dMfaHr3I7HyMTWSkKGqK2Rdc6Uc6m307lrzA6BY+4we7tol7x7i0C2gba2oNsDxXmsK9
         oqiaQzWnez0t+y/f1iVkzxzs7TmiOtXC2cvg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IZAnCMpe8DW4khvlse83k3bVZJhm44NmP/u82ve7Vg=;
        b=MOj8LhAR+a91WMG12NVa9qrDZ+6ZrU4FQhvJF8hYJML0xA5KPvtBuiNAnttf9Ik6Ta
         Ich21bGIIw0E5O3J7FwtbVigl/2IT3tsvakGgVZzt/StNty+HyaLX4ir8t9f7Db/kL/e
         kg5w2zygZ99nmC08L+qV982z0uxAPWPkjROdX4bvUNgqd03L1f30PFNXrtNymK+Q8sgx
         8Z2cqivbLGgB4EoSYaiO2JP6QDfmAsdqZbDE7FXztILWK2WQaWfwPkmj1/ekNw1N91G1
         hKkAp0oqsGa0zDS17cRuSOFtjWLcXLQblShvmGvBzqJ+bvC8Hf8IURIB+hak3KX1d532
         wFBQ==
X-Gm-Message-State: APjAAAXs/nHt0f+ubpkJmK2cfWlYRAF7ExoHib4uPRyP6kkXTntF19+n
        zsPUOxcr+DU6LcGzXeKTHg+lCnH1o+M=
X-Google-Smtp-Source: APXvYqzvCi8Y+GKlCv6IFTpiuQYW9gAA1DSYlbI85RIlneT9Mks1JurhWte4T1KN/D4DkXaI6C7kSQ==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr9128610lja.231.1580581700620;
        Sat, 01 Feb 2020 10:28:20 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id w29sm8298824ljd.99.2020.02.01.10.28.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2020 10:28:19 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id t23so7021609lfk.6
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2020 10:28:19 -0800 (PST)
X-Received: by 2002:a19:c7d8:: with SMTP id x207mr8314743lff.142.1580581699074;
 Sat, 01 Feb 2020 10:28:19 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
In-Reply-To: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 1 Feb 2020 10:28:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj1K6DR65Vg0-KreeRdK7AKhJ3XwbJ7Gqk5L0=QkKfvDg@mail.gmail.com>
Message-ID: <CAHk-=wj1K6DR65Vg0-KreeRdK7AKhJ3XwbJ7Gqk5L0=QkKfvDg@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.6-rc1
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
>  - add 'yes2modconfig' and 'mod2yesconfig' targets

It would have been appreciated if you'd explain what the point of those are.

Yes, I looked into the individual commits to check, but it wasn't
exactly obvious why anybody would ever use this.

                    Linus
