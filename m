Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74632CDC8A
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 18:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgLCRiI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 12:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgLCRiH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 12:38:07 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2768FC061A4E
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 09:37:21 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id r24so3908337lfm.8
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 09:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IAYzt5aWmV7k8rYu1oRqo0Iimqerq25dwLnLWK087IQ=;
        b=g0RuxTC/9WXibSwY5+tIOu4MFx49cSGSc9R6BBeB0r2N/EwzO3l5hiz5zRhoRxTjkr
         /6iZvATcu++ZOkyFOL9z5bNa8MptTxwO92Sq8SlrhC4i9hnYgcuER2QESiIS5hyddN64
         7B+S6BMI/TOidGb4AUDbKQSxvIkDJJJ/NGFPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IAYzt5aWmV7k8rYu1oRqo0Iimqerq25dwLnLWK087IQ=;
        b=G1lfIAO96SxDx+8XhIJcJxwm14SXjJ4PdtLzFHkdWzdOaQ/EFa1TDYEMVuLyDM/MBo
         qxjiSXYBaF3JsX61n7Dbu7Xch9Eecf5yEiZ9MRJEe9zRYSWhO+7D2XIwDPVn6Y7qspPf
         6+JRWVT4472wF6o7nBLdUiEBjRJw4A+CD7uOuWTQei86ZoTFNT6IBGCIhtHRgU/QRWNT
         h2wLuuQv9ilAhepxzSy4vY1/+RFZ5VtuM5UmTT4CmNmn8vQfRhpePWv01kV/PBOtM+Da
         yKwAue6BepBW2FSmCl3D7CiFJXPXRLgzUqVw2HGn/k56mnYIIFq8eYH/TeIiEwYcWQtF
         b5eA==
X-Gm-Message-State: AOAM533R9FMscd5KOuKThrj5A3M9OxgkaBkb5TGFZ/8TMiSxZQWh6nsf
        3/UAGkbdjwUy9mi5d622WLLTH8e/wM/c+A==
X-Google-Smtp-Source: ABdhPJw5Fc9l7LQfq/Dh+jdzhsVOcNdD9B5DbolhJbrc0WwptL6qUKRT1TZTLv2x9w9TWXNu+YeYJw==
X-Received: by 2002:a05:6512:3245:: with SMTP id c5mr1756423lfr.405.1607017039393;
        Thu, 03 Dec 2020 09:37:19 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id a16sm744581lfg.16.2020.12.03.09.37.18
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 09:37:18 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id o24so3461325ljj.6
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 09:37:18 -0800 (PST)
X-Received: by 2002:a2e:a543:: with SMTP id e3mr1691756ljn.421.1607017037787;
 Thu, 03 Dec 2020 09:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20201203125700.161354-1-masahiroy@kernel.org>
In-Reply-To: <20201203125700.161354-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 3 Dec 2020 09:37:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgRV9VHO2RVwn+iMfH_WFjQV1dsZtEQhgrUBQfM9QBPmQ@mail.gmail.com>
Message-ID: <CAHk-=wgRV9VHO2RVwn+iMfH_WFjQV1dsZtEQhgrUBQfM9QBPmQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 3, 2020 at 5:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Checking the existence of plugin-version.h is still needed to ensure
> the plugin-dev package is installed. The test code is now small enough
> to be embedded in scripts/gcc-plugins/Kconfig.

Ack. I think the "plugin" directory name should be quoted, but that's
a pre-existing bug.

          Linus
