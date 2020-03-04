Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB0717932C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2020 16:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgCDPT4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Mar 2020 10:19:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:59402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgCDPT4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 10:19:56 -0500
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF00020848;
        Wed,  4 Mar 2020 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583335195;
        bh=je8tPnydze2QJm0S9OXSeYj7zI/Hug4h3RxcJaMT+oA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gPhmMur2fts/HYB7wL0f19b1lSPBPoEtR43qAT6+4Lb2oH3rUnv1BODfuEMwIMZRZ
         siv8Zs7tKh4kO5REFiAFZsTSoLwyFBZKdzn1/CgfCoEYW94Rmm18kQrdqRCsZOq+iX
         iOg/mP2XaSPvt0piHSMUyoR4/LJquW/mPPsbM3NY=
Received: by mail-qk1-f174.google.com with SMTP id p62so1964923qkb.0;
        Wed, 04 Mar 2020 07:19:55 -0800 (PST)
X-Gm-Message-State: ANhLgQ0uOHOuTmjJ5Bpke2X7A42M+AF8fBcV0dWNG3a6ix7VkthLDLjT
        xd630Drtr4YhmwNZzO/w4N5yF9Y2x++pNoqRuw==
X-Google-Smtp-Source: ADFU+vuR0h6EdKTSVQErVvrih+gw6uB8EuJe4uEVCTXvTm2XksE1TMQ6vJGet8PXkAQ0dKd/eFgIT4INjk+HiXTsIdI=
X-Received: by 2002:a05:620a:12a3:: with SMTP id x3mr3528546qki.254.1583335194936;
 Wed, 04 Mar 2020 07:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-3-masahiroy@kernel.org>
 <20200304055520.GA28911@ravnborg.org>
In-Reply-To: <20200304055520.GA28911@ravnborg.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 4 Mar 2020 09:19:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLA7yq8rnVhM210sLt788yeu2xxFd94Fe0K_CGZw-mqSA@mail.gmail.com>
Message-ID: <CAL_JsqLA7yq8rnVhM210sLt788yeu2xxFd94Fe0K_CGZw-mqSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, devicetree@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 3, 2020 at 11:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro
>
> Thanks for the nice improvements to the dt infrastructure.
>
> Stealing a thread here..
>
> >  It is also possible to run checks with a single schema file by setting the
> >  ``DT_SCHEMA_FILES`` variable to a specific schema file.
> Would it be simple to enable the use of dirs for DT_SCHEMA_FILES?

I did name that with the intent of supporting more than one file.

> So I for example could do:
>
> make dt_bindings_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/

Does this work?:

make dt_bindings_check DT_SCHEMA_FILES="$(find
Documentation/devicetree/bindings/display/panel/ -name '*.yaml' |
xargs)"

Rob
