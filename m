Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9AC332E04
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 19:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhCISQ2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 13:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhCISQ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 13:16:26 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4914DC06174A;
        Tue,  9 Mar 2021 10:16:26 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id f4so14923231ybk.11;
        Tue, 09 Mar 2021 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVAIQLIqXoX8qO2PQUGm9uEysAZ1Y7IE/qC8fvuhIiU=;
        b=PjBHMgDPXauBlP8haz8ji+nun+8fqmJe+rWaTkYgZslcbheEb0ShNIvI+KHGVde6TI
         M37Npa5mqiG/5umq8ZVz51YBxk2u0N95+pKbOiY5BGWK4nijK/swANGfK1xOSVYFgJVB
         IXFoyabgsHCFLUp3bzV1WgV38vTbD4BhziAVZ/7rp443jmTesj0FasBo04SLaBpzgFgQ
         tuwTi4nuw5xpDTRV3SkuDcITpGT9JRgDNf33aWE4pm3PXAClwjvr//M9BYZ2+gJJOuFn
         zYY/CClWyMyoI1KPcy1ph1DdHjgaMQTr3OvRN/Lqli6/ZSOXRX41ao2p101tnyVO7nfD
         x0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVAIQLIqXoX8qO2PQUGm9uEysAZ1Y7IE/qC8fvuhIiU=;
        b=XnU3V6HyESauSICcBCRdD4Tpq2Id/HlCxvBtS5CgoWZYa1arEfeg3pSYy4mu3TiwlM
         f8vDnFqTzpjKtgkXqLOwqrv0Ktb8nfz73+5PJO+PwxOroAT/1zV71gX5cqGjZ7BTYTGG
         XPU9cPNw4aRzSV6Sul/wYBEjp7qwxKjUJsmzor2UqFyXHx65cERIdJos3TR5/UCeSIYY
         TSeLu4I3o/A8t81A6xRSl8vxHcWFC7Y4hFLNh7b40k7znomG89fkqXR3ezuNgS7Tf06N
         QKJ6Hqzz/fAoDLayHK3dZmRSCHYdUbzkC3sBnygMVNkD9WYNsAxzNmT++FLKeXTTnu+8
         kbAA==
X-Gm-Message-State: AOAM531PS0PrFNLnQDP5P6eMgQz2y4Q1vw0gUYIC4IeRcpXyW+QByA9G
        nGp6NZNV0ujIGwKgUxBuAqVNRDqGycbWZVuYMmvwFv9agbpEnA==
X-Google-Smtp-Source: ABdhPJwt4dBUGCy7DdgKmEYyUTynJwq/meKjVp++1vF8GjdeEjMzxInRPzAEPv8RjapbdSoV02b0QE5YUQvnfhE0MaY=
X-Received: by 2002:a25:d296:: with SMTP id j144mr43477410ybg.33.1615313785326;
 Tue, 09 Mar 2021 10:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20210309162545.637647-1-masahiroy@kernel.org>
In-Reply-To: <20210309162545.637647-1-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 9 Mar 2021 19:16:14 +0100
Message-ID: <CANiq72m9JsX92A6FS_11z1b4G--vh1cH+1QuQKvte4gurpZHvQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: dummy-tools: adjust to scripts/cc-version.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.cz>, Jiri Slaby <jirislaby@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 9, 2021 at 5:29 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit aec6c60a01d3 ("kbuild: check the minimum compiler version in
> Kconfig") changed how the script detects the compiler version.
>
> Get 'make CROSS_COMPILE=scripts/dummy-tools/' back working again.
>
> Fixes: aec6c60a01d3 ("kbuild: check the minimum compiler version in Kconfig")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
