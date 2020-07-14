Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB9521F27E
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 15:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgGNN2T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 09:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGNN2S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 09:28:18 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF21C061755
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 06:28:18 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id f23so17247554iof.6
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=3YyS0MtM2vx/LwuRohsuAw4aW5hlnUW15EH2nsG//3s=;
        b=gTtsHfayiY1poGcXd5f5lXNs7vr79NVucFvlkc8PSmmOzeAYW25AIv0+IKTUmh0upY
         HACYGPkTkEO2iyCl2kQi+YdU5SUAwZdTuLIvq/y+0gBBgKfSPoo35zoTkDoJ+b0MX13y
         idywWDnIpNYnn1O4+4RgMRCfngdjKApWrXxlcLM1DV5I1oAeCPdujELyQ0ykqm1ZjFVI
         xCHh6h/AYsBM6SWoaqVtr22+nHdqeaHBWJQ2c+oyjjhU0pLv+Vuw2OmchVAC35vG6F/V
         J7yOu3kzQsezY5GBI8serr733L1LcuSX7CDycV2je8I9uOa1KabX37Xo3RQ+jlBtHnih
         bHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=3YyS0MtM2vx/LwuRohsuAw4aW5hlnUW15EH2nsG//3s=;
        b=lIykja53bYDseFFRkwHZfCiz7TUx7RZk/biEZfANzyiz/RvyE++3d0tGE5WXC1AfZW
         kkQlTqjMf1i6m1JOcUTyA+GMjAz4rR/Ywn5QViWOzd1T8lmCLUbpBvD+6RPk/+5W3w4N
         YYT58W9UvnK7ULBHTfoOCG0FmblDz1ieSfyII2Cib8ANZQFpBGvMi4uBn9aZBxQXYS2N
         KAmu7o262ENUUmspQPP7dz+EunxA6IgW51SyeyaECVErJUIJ6rhihbgPfwYyJrBgf9Cd
         7ykbeZ9KLBaD2JI6PVI544wnHBHucJabYpM8q5ShLmKcjQBjg/bk3LCLlrldCnU1kVAC
         cEuQ==
X-Gm-Message-State: AOAM532Y6cSy0FMLrOvb4u1+xQ6ov+g9TDvq4nc/6ybSB5p6d5HHF/rP
        wLuCoBKitel/FqJmm1qsAI9VHPfik5fam/6z0Ro=
X-Google-Smtp-Source: ABdhPJy7dGpn9q9SQdgLUXfPBmRgNz0FRSbtYASi1Dy5UhyU/qxvjwC2sfVgBsSebxlOkwPywQdvgriNdQsxI883xRg=
X-Received: by 2002:a05:6638:2591:: with SMTP id s17mr5982160jat.23.1594733298180;
 Tue, 14 Jul 2020 06:28:18 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 14 Jul 2020 15:28:06 +0200
Message-ID: <CA+icZUX+9pxg99bT-njDG1rCVZtZGe--k8=7t6CfEnCnCwxaMA@mail.gmail.com>
Subject: Building stuff only in arch/x86/boot/compressed
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

I wanted to test the patch-series "x86/boot: Remove runtime
relocations from compressed kernel" version 4 against Linux v5.8-rc5.

This modifies/touches stuff in arch/x86/boot/compressed.

How can I just test the series the fast way?

I tried...

make $make_opts vmlinux

That takes far too long - unsure it does what I want.

Thanks in advance.

Regards,
- Sedat -

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=23508
