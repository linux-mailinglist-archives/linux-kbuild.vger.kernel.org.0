Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462AFA366A
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2019 14:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfH3MMg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Aug 2019 08:12:36 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41677 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfH3MMg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 08:12:36 -0400
Received: by mail-lf1-f65.google.com with SMTP id j4so5169668lfh.8;
        Fri, 30 Aug 2019 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uo5QXx6OVi+EZsgsiMtZvW49jMucnNQYYVHnbYIyY8U=;
        b=poj5ucJzEB3RlxQNN2VKdSWVhlVJn43CM7RgD7jgcF1O0y4zs09/5l0iZPv+HjA06I
         uTRCXTMCO9O4bSpwSemT6PATKcl62yRE5y/q1Csg1sQeSiws5nRALTsMY7MVgMK5aagY
         UeumT7bWJFB7FUm+OBtdOhxYWzlR8mu6wXD6HOGWyGAvi/ParAPjowS3Z53n0aV5mJbT
         1rgPAF33HbSZOYI9kFo9Z7UMbeE264b1kipMQsPwcvbqtawLKQK66Ga35aHqbZHBOs6j
         nBsZTcUb1LfOcCHh410j3yiksDd0S+KmKC09g9u8DdJuDpdIQaJLURsxqdaNzAJrfn1W
         Kx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uo5QXx6OVi+EZsgsiMtZvW49jMucnNQYYVHnbYIyY8U=;
        b=awmIqbPcDqXMYgOEUhA1S1PBRXSLPDIsj+w2jclnPI6k1gGiBEWmIKdb9QZZGKA1zK
         OBq4cGsMn/TNpNdNHhkcAQMJHkREyLJloWvPpaVPHLe3t0TR89DAlOsuRR1sBlGph3Ht
         I2cht62DvUjDVtQYrUeU6WHF8PizuwOb+lod7jtMoHgMqQ82j0qF5sr7r/i+GxtMW9b+
         P7oW7qTiRDLITFA/nk+mZQjfBfu1IsfDoRJGBI9EumAKHsVKRAfKmyPdANzOE9S2tlQV
         6aXF6KCkG5mhy16XI9vSWhQdmQNMnYWFYGZ8FPjrxMMsst84ubo3erdJlE2FeS6q2s7G
         s1Fw==
X-Gm-Message-State: APjAAAX872a2bUNXmgOy1V8gkjMCVujjSxAYhUAzo80v5OEn3/d/oGm6
        +Xc6V1zFbtw3Bp+As1Pb22YTDCD6bUu9GcyJyN8=
X-Google-Smtp-Source: APXvYqyvByj1EWem56d4TT79u5U4Bo0K8ITf8OGgAh/fkFMqhtRgseWc/gRi6O2mWlxBT6jTP5ReG3KH835Ea17Cg30=
X-Received: by 2002:ac2:43ad:: with SMTP id t13mr9877625lfl.66.1567167154263;
 Fri, 30 Aug 2019 05:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190829120215.1977-1-msuchanek@suse.de> <ccc65bd29747f8ad4d0ba1b3eda6c9d230f03c70.camel@perches.com>
In-Reply-To: <ccc65bd29747f8ad4d0ba1b3eda6c9d230f03c70.camel@perches.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 30 Aug 2019 14:12:23 +0200
Message-ID: <CANiq72=ND-czaeKS9qUpEfrFj_SrUWBrmGQHVKCvV=dG8S=-XA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Convert -Wimplicit-fallthrough to -Wimplicit-fallthrough=2
To:     Joe Perches <joe@perches.com>
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 30, 2019 at 1:09 PM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2019-08-29 at 14:02 +0200, Michal Suchanek wrote:
> > In particular the default value of 3 does not match the comments like
> > /* falls through to do foobar */
>
> How many comments are there like this in the kernel?

+1 Given we are trying to move to attr-only and therefore
-Wimplicit-fallthrough=5, going back a level needs to be backed by a
good argument. It would be way better to fix those comments instead.

Cheers,
Miguel
