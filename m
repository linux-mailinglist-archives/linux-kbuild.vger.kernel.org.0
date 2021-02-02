Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A98530CD81
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 22:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhBBVAS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 16:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbhBBVAP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 16:00:15 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9F8C06174A
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Feb 2021 12:59:35 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id e15so9879306lft.13
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Feb 2021 12:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nOzKpXWPBo1OpCUm1aLl7QvNKAWbvBkDYSSjgluEfi8=;
        b=p/Aj+yzc+qGVr+WVjVZGd1YOISTerygHb+HA4ZFyyHHzOf0cj7oPmcD4lw5HVWDqMv
         C7JrQi4VJ6mREpwymsccH/dPoAper37lhKrZyN1kS6q1ubK4psUUHfv7nJzjtsszB0U1
         WFyrkei2QNe5DCVhuaW7R+d2H5W8mPyHXoiWJ74aOUNGIMyaQXbGXLuaUhnCQk6lEW5b
         jGs0Bpoj+79sjAbBJRQwAvjoNFj8EgoH/6aSYMNBJY+iwk4rI5gCHIzcZiSOgIEu4PfR
         Y0ACykVD5BClOIreAooRROKziH2pdD8wtovnG6Iikfo+toXOZKklNVOh4ee5rmpivfR5
         vHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOzKpXWPBo1OpCUm1aLl7QvNKAWbvBkDYSSjgluEfi8=;
        b=ScFw9SbuST0ERNIDRQY+HFcE5CqkAlkiXB4clEWOgP9N94DGT3l7j67k/Rc7GW6ZPJ
         s4k03VMga7n7WzauS89N3JxXqHmmd/W12yNy/Ltk2uo6vUihgvX9P7f4q4g7uhIU5pua
         qgcQu3FTELfna9NMb61xlQ3MkiZin04tFzeTGpWOSGQcyBKoJIwvtsld7I0qQQouL7xq
         jf0cxtHTwuSKzgMjZ/wFLjBolBufF2o0S2xFXy1EWFmpB6TJ9NGm+4mDgpUBiVMKTPRV
         gv+pLoq99LUJow/hvL9PE8m0agrLdJn5RGyfNBFRnK7fb92icZt/H2odpZfEq4BfpmO5
         BCMw==
X-Gm-Message-State: AOAM531usMC+7R7heFToNbHhQy+IkPxY0VEzui58TA3AwhuFx0nJBiKi
        7dKC7e/Mp894xq6zmS4Do/2U5SqRgVqWxTUlAJWF4g==
X-Google-Smtp-Source: ABdhPJxFnif05v2wKdOjfPsSyLcaSDkHUUKC2AL/iGQWy24+xtwNC5cKvHHPV+XT+8yYngsHWx/JXnbfBRP+67Q5gH8=
X-Received: by 2002:ac2:5e81:: with SMTP id b1mr12140605lfq.473.1612299573366;
 Tue, 02 Feb 2021 12:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20210121213641.3477522-1-willmcvicker@google.com>
 <CABYd82Yk91u287iZvkUik+UYg2mHMpHimZzsg72cXOK6k8WpRg@mail.gmail.com> <20210202074245.GA3545218@infradead.org>
In-Reply-To: <20210202074245.GA3545218@infradead.org>
From:   Will McVicker <willmcvicker@google.com>
Date:   Tue, 2 Feb 2021 12:59:17 -0800
Message-ID: <CABYd82aZACHeO2XymKbUCbwJ-wj7sVFOqyeiY59G77LvQY7bEQ@mail.gmail.com>
Subject: Re: [PATCH v6] modules: introduce the MODULE_SCMVERSION config
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Christoph,

Did you see Saravana's response to you in version 5? I'd love to hear
your thoughts.

Thanks,
Will

On Mon, Feb 1, 2021 at 11:42 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> Just to deposit my opposition again:  I don't think this hack for your
> out of tree builds has any place in the kernel tree.
