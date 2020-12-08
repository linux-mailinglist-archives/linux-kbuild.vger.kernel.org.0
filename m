Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF202D2E91
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 16:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgLHPp1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 10:45:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:45508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729558AbgLHPp1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 10:45:27 -0500
X-Gm-Message-State: AOAM5333cFy9RqMufZD6YHyki4rtYs4GQnSR/8sX5ATusP0lNvOqtem7
        w34wZc4gd5kNGa8/OufljIZ2I3K9I9V92GIg2Vg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607442287;
        bh=XnUBCnuwS3a0yY8m4d7R9CBXnxO1IfUe0Pb0ShYezwU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=X6HTBkY+H4RQWfjBSf0Cpd+QWS+UYkB220Gi1G3NwhDvBj4KQjtw2Px8iF5XtfRV1
         kPUxb9gGWuUlmAZykBabTHe+ITnH8RWhiN/9YL329J1Ew8bL76s1YR2HX6Zz5GjamI
         HRvkqKvsLh8eI5YY2jLNpbDkW0SpqVeXM2kJ9HxZ++NqeCLm3FbwVOVfF2qm+tXwcq
         7okSVlL/2FXPboZVczYXSNtCRpu90KJsJZI6+ZMQNLCYTZ/nmjFr/Bux6LYXtCO9Wv
         E8s3v+VHVCqshHW8Gfvq+/utdWM+hbj7Ip1iFryXarnEw1W2VoOIkIJ+Vp7YW12VBj
         JUaZ/3otcJ6bw==
X-Google-Smtp-Source: ABdhPJx1OwNGBHXfTKFMDTlwFIx+5gI8uKFbxpOQGjZkKfe6OhA3A1queQKh4w9f8VYcijFAuyUmhC783qyzzKHLRXs=
X-Received: by 2002:aca:418b:: with SMTP id o133mr3045148oia.67.1607442286314;
 Tue, 08 Dec 2020 07:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20201208152857.2162093-1-geert+renesas@glider.be> <20201208152857.2162093-2-geert+renesas@glider.be>
In-Reply-To: <20201208152857.2162093-2-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 8 Dec 2020 16:44:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1g9riaw2RhfWWsDv4VyqHe9maWXsH7gqCaQERHqR69jg@mail.gmail.com>
Message-ID: <CAK8P3a1g9riaw2RhfWWsDv4VyqHe9maWXsH7gqCaQERHqR69jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/kbuild: Document COMPILE_TEST dependencies
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 8, 2020 at 4:28 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Document best practises for using COMPILE_TEST dependencies.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Arnd Bergmann <arnd@arndb.de>
