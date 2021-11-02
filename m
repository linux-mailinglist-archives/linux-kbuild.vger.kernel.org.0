Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2A0443590
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 19:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhKBSaV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Nov 2021 14:30:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229791AbhKBSaU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Nov 2021 14:30:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EDA961051;
        Tue,  2 Nov 2021 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635877665;
        bh=DZplYRBGOrJPP0ubuE5YqCmm59G6QUPY/gj/biitGqk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u0YYshMLr4md2FaV9dRKZULmDv6Cb1m03TbIiD7tHFLhUwZniDQx0cRAc/OQ4C1Wf
         /sj92YhBaruQzq95oQWSWVR+2oMXKPfpXtZolDi4vkorcegBT4kh5lbbDGPjyOsE20
         UHKoE5/gmbjy+GLrCcaWe2G1yBKUWnk0gBoT3SU5OyONdGbrVFXE3cE2hdvbqwJyBj
         1+0x3EGj/fngyYrVGiTViyNTXjZYbfgdjEKh6rPrBxqKzw4pTGhiyh+DUSC8N9rFY/
         Wbrp/lRzSCCVNK1pA82zuOVY5jGmTtxWz6hdoaD66bGTuGaH29FvRyAP96G0UB/X94
         Q2vlPZiUiOs4w==
Received: by mail-lf1-f41.google.com with SMTP id j2so418033lfg.3;
        Tue, 02 Nov 2021 11:27:45 -0700 (PDT)
X-Gm-Message-State: AOAM531b2SfzuHQ/bU+ZmUOatPsmc8aWjWSw325zhJwZ7KjHgrMnH5Yo
        U68pP+rSCGuIZDptBaMQeSaFZ59DFO+DQCUibEc=
X-Google-Smtp-Source: ABdhPJyhu29XICJvupMdivCJzmoC+g4vkRN50vLmrVsYv+mISI3cwD18BFEp8tSPZ6nGA5bxvxb8BR5dMdXZ/oh4E/0=
X-Received: by 2002:ac2:5d4b:: with SMTP id w11mr35116383lfd.676.1635877663635;
 Tue, 02 Nov 2021 11:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <7e805797dd70bc40aac9343f82548324ba28cd72.1635407415.git.yang.guang5@zte.com.cn>
In-Reply-To: <7e805797dd70bc40aac9343f82548324ba28cd72.1635407415.git.yang.guang5@zte.com.cn>
From:   Song Liu <song@kernel.org>
Date:   Tue, 2 Nov 2021 11:27:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW59RWDaM6qL1LFJ1E2_=UOxOficDoUt=N46suZmTS54zA@mail.gmail.com>
Message-ID: <CAPhsuW59RWDaM6qL1LFJ1E2_=UOxOficDoUt=N46suZmTS54zA@mail.gmail.com>
Subject: Re: [PATCH v2] raid5-ppl: use swap() to make code cleaner
To:     cgel.zte@gmail.com
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, zealci@zte.com.cn,
        yang.guang5@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 1:48 AM <cgel.zte@gmail.com> wrote:
>
> From: Yang Guang <yang.guang5@zte.com.cn>
>
> Use the macro `swap()` defined in `include/linux/minmax.h` to avoid
> opencoding it.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>

Applied to md-next. Thanks!
