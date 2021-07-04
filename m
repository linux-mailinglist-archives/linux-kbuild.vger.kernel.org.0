Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B5B3BAF13
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhGDUzB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGDUzB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:55:01 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EB6C061762
        for <linux-kbuild@vger.kernel.org>; Sun,  4 Jul 2021 13:52:25 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w11so21844120ljh.0
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jul 2021 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kNbjhH0GpClGiRwzQUpR4hJv6EHO3XdnhQiyv1Zn4I=;
        b=DDKedwHAnd/R9xdhNG2krhsT+Nw/0E+PNH+jTyBdnlj/cEeFjebi3V2C3060Nznwiw
         vtlfihLS1N6oGS1nPJo971wzPG320Cr4ei5n8FjoPqsNRC/sBQhpBRy3FWWHn7ysHPW0
         LY6Jmq2nQLEukQRziXJban++K/Kva/xuLIO6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kNbjhH0GpClGiRwzQUpR4hJv6EHO3XdnhQiyv1Zn4I=;
        b=m+7QWAesfnK8swWeAjoZsbT4EJMSwjEGCzNZduus3mI2OcqK4SZvB1Eqr2HmVagIej
         XLaypQMnVxq/oVbPqq+HeRddQMaZ0tCoTXAjrVBFz0+b9b7XkWarsXsLdw7kuaXAOQqG
         HXz85HaZAf9hCN5blvPQcT3kw19q+AtAygTpFaTvo6dXzIzymWwkP2bfMaYyLLTRLMKR
         KvdwOpP2SW/88YPFuGt+o5JfTQe2uqRSw4B1L0ordLPy4HnejDinqwU8UQsXkQ/iqDKP
         Rsq7zZxrKTFoDJmw4i1Z5mzoCx+hYQbZyIQHBo2VJUFaN9GzHNFekHfCbob4ZQksoH0l
         ZIiA==
X-Gm-Message-State: AOAM531bGGUkyc11l8ldPaq3Td6JseZbxlUW8PzNA+/RKWahA2J56Oqa
        vFFKHO4tgC5B1SOAfQFM9ZJyX1EW+KHgyFS3
X-Google-Smtp-Source: ABdhPJyODHp2+bNj5Zl1WRBg5FSIulNmAtw+I4XhtA6nbXuJcUgDyjVuYp3xWgj4A40xua/11uvBXA==
X-Received: by 2002:a2e:9e04:: with SMTP id e4mr8333780ljk.431.1625431943548;
        Sun, 04 Jul 2021 13:52:23 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id r24sm882657lfi.157.2021.07.04.13.52.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id c28so5236857lfp.11
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jul 2021 13:52:22 -0700 (PDT)
X-Received: by 2002:ac2:42d6:: with SMTP id n22mr7866162lfl.41.1625431941847;
 Sun, 04 Jul 2021 13:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-2-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Jul 2021 13:52:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
Message-ID: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 1:28 PM <ojeda@kernel.org> wrote:
>
>
> +       /* If zero, it is a "big" symbol, so a two byte length follows. */
> +       if (len == 0) {
> +               len = (data[0] << 8) | data[1];
> +               data += 2;
> +               off += len + 2;
> +       }

Side note: it might be a good idea at this point to verify that "len" is >255.

Also, why is this in big-endian order?

Let's just try to kill big-endian data, it's disgusting and should
just die already.

BE is practically dead anyway, we shouldn't add new cases. Networking
has legacy reasons from the bad old days when byte order wars were
still a thing, but those days are gone.

           Linus
