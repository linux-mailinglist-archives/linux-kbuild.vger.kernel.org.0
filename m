Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27564484774
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jan 2022 19:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbiADSHU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jan 2022 13:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbiADSHT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jan 2022 13:07:19 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583DDC061784
        for <linux-kbuild@vger.kernel.org>; Tue,  4 Jan 2022 10:07:19 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j11so81705282lfg.3
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jan 2022 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FvUSWM8asV7TSsVhKHo2Vs+mW55Ad8feWEmsL+BvlZ8=;
        b=aigDwNH/D4hq1zIuNcOSz5GkiJ793Ga58PlIhV9oJOu/smRupWwefivn90SeeTyrn5
         HThZyaTSyZXK5MzZDKpy48j6ZlAQR83l+Tkhh8Zicqlz/x+8G4jGKnIC8qFFhU+gHS6I
         Rej19czLxWFCpb0BpUTveO598tFaFOJ6J6numziVTtR+Y66LHLUcWjCW9t0UX/RXkNkp
         z9XtLHxbxkq3cPCKcZLZWth4fqXE+mZ8xTotlRoCf7jTVhbRtEwjW/De22leDXu7AyFl
         SWZQ58TiV9SydUjyXys4x2fiejxy7PFqEG6qykgxTSsUar5bxbiiKgfNXffq7zrSxX02
         4JIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvUSWM8asV7TSsVhKHo2Vs+mW55Ad8feWEmsL+BvlZ8=;
        b=fHFHTb81kZGvMAfHaD2gYADk6o5JfuoRyOwht1vBv394T9XMuvT2OztMvA3i4G8gVO
         6JLUnrR2hODTlu8Byi7T/XZuwVkXKUHwYS+TV7fOTgDxXjs3dy9KXvzBW17DOcVm3QAq
         mJROoU9+kOXTZ9hnwg8PoHCYzx9ybEwf+sLsVUi9DMbum5QQl6ddg8Tx8iLFLXEgVF8Z
         IbdrDGkSg8egt52JfeladihWmhS74lbroFnp+91B9/QBzPRHLL1zkMW+mUsqQV/6+odv
         kykNddxFYPTA9+19qro1/aZvEq2LCK+gzDaGRpAqedUi7Gfkb9bgrIpyz9dLjNNakEMG
         uD9A==
X-Gm-Message-State: AOAM530YGP6+ZmlV9Zu1H4hFEmlX2xFOsXL59S2+Z80OHMZofqEn3S9q
        iIorYbOaddz6URXMQXSXDysGAW6xnag2Y/WzNiV7sHcZT98=
X-Google-Smtp-Source: ABdhPJyukNdwgdJqBBt/WWtYHebJllitoaPGkf9/oNlfFpRP3A9HkMVwXhZPZBRtCnsNgsgGbL0bk9WKi1Cl1b+qNSw=
X-Received: by 2002:a05:6512:3baa:: with SMTP id g42mr44000557lfv.651.1641319637393;
 Tue, 04 Jan 2022 10:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20211231075551.589515-1-xu.xin16@zte.com.cn>
In-Reply-To: <20211231075551.589515-1-xu.xin16@zte.com.cn>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 4 Jan 2022 10:07:05 -0800
Message-ID: <CAKwvOdmL8Lhew+=-7YB6J5a8LKKN2EDS5vGExeKET9ykwRH8oA@mail.gmail.com>
Subject: Re: [PATCH] Fix compilation errors when using special directory
To:     cgel.zte@gmail.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        xu xin <xu.xin16@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 30, 2021 at 11:55 PM <cgel.zte@gmail.com> wrote:
>
> From: xu xin <xu.xin16@zte.com.cn>
>
> When we compile the kernel with cross compilers, if CROSS_COMPILE is
> specified by the path containing special directory like '~', some
> compilation error will occurs.
>
> Here's an example:
>
> $ make ARCH=x86_64
> CROSS_COMPILE=~/x86_64_gcc9.2.0_glibc2.31.0/bin/x86_64-pc-linux-gnu- all

I guess you could replace ~ with `$(realpath ...)` in the above
command line invocation of make?
-- 
Thanks,
~Nick Desaulniers
