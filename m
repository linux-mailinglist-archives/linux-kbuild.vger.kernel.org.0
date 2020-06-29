Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BAE20E0D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 23:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389407AbgF2UuJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 16:50:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:46664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731473AbgF2UuI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 16:50:08 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DEE020720;
        Mon, 29 Jun 2020 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593463807;
        bh=bf1gx6HwyAGL1lgUaDDu+79hOVdRZJ+m+V17HLQNqP8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=13bkz6rT88bW5ozmcTVlIDpLKBOZ9RXp5Dr9YU/HxouH/lD3TjAXms857cHHw2KkV
         /2ixNXRUdyyGI63P/xu6opcacLXslGJGqcQJutmchqqO/13Dp1GMejsr+c+vg2puDb
         qanzweqYc6g3z+fdluowc8Z2mlJoZ+ONrT0Cw5pw=
Received: by mail-ot1-f45.google.com with SMTP id d4so16724576otk.2;
        Mon, 29 Jun 2020 13:50:07 -0700 (PDT)
X-Gm-Message-State: AOAM530enl5d2ZGClclltXDXi9w2bAcDslvSppaGQZUxrk+FJUEOQVwb
        E3C8G1nI7fIl4noVO/zSJ+k5EZMzh9Tx4SgQlg==
X-Google-Smtp-Source: ABdhPJzzF4kN7KDy2z2NmYmJxIweiy6VO0KsRTtdXWY9U7ErrDy0wmMgtxFXM1W9UJjV4JYyi44/uK+KLXtRv6Qmytk=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr14052433otb.107.1593463806654;
 Mon, 29 Jun 2020 13:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200625170434.635114-1-masahiroy@kernel.org> <20200625170434.635114-5-masahiroy@kernel.org>
In-Reply-To: <20200625170434.635114-5-masahiroy@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 29 Jun 2020 14:49:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL4pTFK_pSNn1cSvjzwdg71dVzM3P06BYYEwDj2t+swPA@mail.gmail.com>
Message-ID: <CAL_JsqL4pTFK_pSNn1cSvjzwdg71dVzM3P06BYYEwDj2t+swPA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: split DT schema check rules
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 25, 2020 at 11:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When building %.dt.yaml from %.dts, two things happen in a row:
>
>  [1] Run DTC to convert %.dts into %.dt.yaml
>
>  [2] Run dt-validate against %.dt.yaml
>
> Currently, when any .yaml schema file is updated, processed-schema.yaml
> is regenerated, then both [1] and [2] are rerun for all .dts files.
>
> Actually, we do not need to rerun [1] since the original .dts is not
> updated.

I have plans (and an intern working on it) to integrate the schema
checks into dtc. That's going to make turning on the schema checks
just a flag to dtc. I'm not sure if adding the complexity here is
worth it as I'd expect much of this patch to go away again.

Is there any negative impact on the absolute clean build time? I'm
more concerned about that than optimizing rerunning.

Rob
