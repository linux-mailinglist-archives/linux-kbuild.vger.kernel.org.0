Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8202E510493
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Apr 2022 18:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350664AbiDZQyk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353627AbiDZQyI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 12:54:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C31F19C74A
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 09:49:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n14so12268230lfu.13
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6cyKMJFzFFXxE/BSvj6oE7ZuzNJmTUgU4USeumAaWKU=;
        b=p4tlywGR8PjYwMom7BHCxv2X5i78rPZxwzz6q4cGXv7WZf/Nt1zQ+Z2X1ZvTDdG2BD
         cjhOmt3XVAQQF6BDZWAmQyzbMH8dWZaRTiNs9I8C9Zbx9J4XwMNJ8RNTfDWkkA3C5TuU
         C+ugUKhpS2PaNZPDCFv+eU2oU/3GdJg17ps9cYxHVE1PP5gWdmUkzlEmWpq0Pa/qxN9w
         9MqNDbvWBr/Qn6Zot2HBUGRib422n+5oWxF3W7cn2ztKPfkkjpARTLFcW1kltlrHKstM
         P7JyBoTWCO+PP2Kod2B5gkbm1VbRTh+hZVBNbCrsER6Zjd+TcudpSRKlpDWR7nvylkBF
         2j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6cyKMJFzFFXxE/BSvj6oE7ZuzNJmTUgU4USeumAaWKU=;
        b=gfgOzLxsEbdMHiANxeVDmCdfEpQC6R4ZYU+in1WCs7aBEG6ipAAPTMwRuI2jwWWr5B
         gOVezTp4+8kjiB3ormI9CifURN7D3YjPbd3pceQ6cPfZL1BtjR3oltnKZReyoZcKm8SP
         IpXwCj5vSHa/p7QAaDapBd+TaWCU+bM03i5k1pQ8hfq82VkyAesB7WB7tRLhC+/h/fo1
         DPOY8nbbLTkMp/tBToZSz8lnEYiAb2w97JeD/StXhLcNrDBT1pULQowTK3oS2z/3JBhM
         Bjxm+f4T7EqoriEURQu7BfnLu6CLgtDKgKQYYO0At4VhnWwgcaRdlxWWoJsKokY551mJ
         le8A==
X-Gm-Message-State: AOAM5329k63G3XGZiOyPDgxWRi8kXdXPUkx/MxZxTlOnLbUBbpv2n423
        OeupgDuAgq3TCcmacCXGgrIC6uR6YdO82rOvNsDLWMksX8c=
X-Google-Smtp-Source: ABdhPJxAU6GulMB6PpLc/wJs2tXBNZzsDX0Yvz43RAPDCTxIp0w8zPhLcN1ObELx8w++3my788hiMXABPa9Omrj7NKM=
X-Received: by 2002:ac2:4646:0:b0:472:108e:51af with SMTP id
 s6-20020ac24646000000b00472108e51afmr5175944lfo.184.1650991776109; Tue, 26
 Apr 2022 09:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-9-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-9-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 09:49:24 -0700
Message-ID: <CAKwvOdmh+ZRu5K-Km0ynDwQi+BNDYKyo=BER6XUo=ik6GtNypA@mail.gmail.com>
Subject: Re: [PATCH 08/27] modpost: traverse modules in order
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, modpost manages modules in a singly liked list; it adds a new

s/liked/linked/

> node to the head, and traverses the list from new to old.
>
> It works, but the error messages are shown in the reverse order.
>
> If you have a Makefile like this:
>
>   obj-m += foo.o bar.o
>
> then, modpost shows error messages in bar.o, foo.o, in this order.
>
> Use a doubly linked list to keep the order in modules.order; use
> list_add_tail() for the node addition and list_for_each_entry() for
> the list traverse.
>
> Now that the kernel's list macros have been imported to modpost, I will
> use them actively going forward.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
