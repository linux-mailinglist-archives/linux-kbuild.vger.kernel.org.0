Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E7D47D46D
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Dec 2021 16:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241578AbhLVPzf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Dec 2021 10:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241570AbhLVPzf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Dec 2021 10:55:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25F6C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 07:55:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3323B81D5E
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 15:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3605FC36AEB
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 15:55:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SF0OnoZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1640188529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5rRpmwgqeBAiX9i8pgR+tn6NsjHEoaRQIM91cMm/3OY=;
        b=SF0OnoZNBGiQfzbalI2TnNYfM56XClT6xcCgCRV5KJ/Yeu6UXe2isSFP7o8hIaSMCEe788
        JN5LDmpgqV6J2jnpd+hZP2AHv8sDdZhfZQe8NuU6/kh8LcBgZ3PignzWltJiAEecjvo8hQ
        ja9Sxjy0C5fSHZ8JUU92zf5/uHHLGwA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9ccce60 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-kbuild@vger.kernel.org>;
        Wed, 22 Dec 2021 15:55:28 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id x32so7894531ybi.12
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 07:55:28 -0800 (PST)
X-Gm-Message-State: AOAM532JN3LKUOPSrurKx6So+DFiVsfZWp6o4ZkdHVvshGccMpLDX818
        w+MV+vrNVQVf/7etjlNIqPyvcaWXvvQZkucKMFQ=
X-Google-Smtp-Source: ABdhPJyOo4YxpfsXTwf+1FFh95fJ2SMUJWWjjm+qpaFHpBEEjuOkOVx+lic96WpzczPOc4FQZsz4r/QzudJ4z8MlSEM=
X-Received: by 2002:a25:ab86:: with SMTP id v6mr5090603ybi.457.1640188526759;
 Wed, 22 Dec 2021 07:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20211222143628.618436-1-Jason@zx2c4.com> <d96ded7a-f584-db38-4170-c991b772a136@infradead.org>
In-Reply-To: <d96ded7a-f584-db38-4170-c991b772a136@infradead.org>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 22 Dec 2021 16:55:15 +0100
X-Gmail-Original-Message-ID: <CAHmME9oKMm_VZ10yArhstX4_=f6Vj6Po-uii_0t_wjtiG81dvg@mail.gmail.com>
Message-ID: <CAHmME9oKMm_VZ10yArhstX4_=f6Vj6Po-uii_0t_wjtiG81dvg@mail.gmail.com>
Subject: Re: [PATCH RFC kbuild] lib/crypto: blake2s: include as built-in
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 22, 2021 at 4:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> If lib-y ignores (drops) an object file (usually because it is not used),
> the usual way to force it to be included is to add it to obj-y instead
> of lib-y (see many examples in lib/Makefile).

This is not a problem with lib-y. This is a problem with libs-y. Note
the 's'. The former is working as expected. The latter controls
whether a directory's lib.a is picked up. For whatever reason, the
build system isn't respecting a libs-y declaration added to
lib/Makefile like it respects for one added to arch/*/Makefile.

> However, this may cause problems with weak symbols. I don't recall it being
> used in that scenario.

The reason we're using lib-y is so that unused code is pruned in the
case that the weak symbol isn't used. IOW, a usual use for lib-y. And
it works just fine. As mentioned, the issue is just with libs-y not
finding that lib.a file.

Jason
