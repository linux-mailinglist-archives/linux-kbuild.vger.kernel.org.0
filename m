Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC7F332F62
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 20:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhCITzl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 14:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhCITzL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 14:55:11 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35EFC06175F
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Mar 2021 11:55:10 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x4so22572140lfu.7
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 11:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vt6mkj0jVSFTyY251Tb+CgzT35tgzBSQBV+Cmr871e4=;
        b=HuwD6tNld4iJU8Mjzfb5DkBasrVtWUDLvxCey2JTv3AkO14FHWHCfvCBwVVm9qmad7
         XVSyULhL/IA06Np4AEJ6M0SLOPBYwCPPl3mkeVZblnO5S5Nb7yneY7pAgZy/IOR41zgQ
         F/1JI+UzQGWnuob1RvDgYA7ZEYuIgahwstCvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vt6mkj0jVSFTyY251Tb+CgzT35tgzBSQBV+Cmr871e4=;
        b=O02IzHVjfik0NG5BpeCM+WTquehCyRB5Em2l51zXHgvdlBzMcQXSRCW0QQpYWdoESl
         sEzmxmr+/I8ZhrCy+/O8+fMnFuarPWHvgv67n9/gNL4/zUkoMFII92KY8rrLyvL9Abwr
         PLbUsarviWnAXEq27Iaov21sQYavwVgL4hNoTHKeEJc++/chQRRQK4BaX1sKWTs19tmH
         BXAZ5QuoUZsBlW7sTfsDqejPK1y90Ca5nbOKcBAJckdS2687b32REDAuY4AN+h0M2bos
         zenYFkVDGvMUeaNjEx44xQfXQjMhN8m0FXbDPjXA2VXgYDsMDky1tzNp78OzxNQPPYgj
         2OIg==
X-Gm-Message-State: AOAM530t0by58cr6bqDbrDyvwBfgWJS6S7gvulgk5yTkeTcvWFYfs+Nt
        kwlueV6kauo1a7+rVivAkjiZNk4qBJpolw==
X-Google-Smtp-Source: ABdhPJyCsXa+O3txvKnx5IQdO9BlsT/0o9Ko9x1uYECXZxT2ntGvQ/g7VIMuKLTF8ztjzUdg+AuvAg==
X-Received: by 2002:a05:6512:1108:: with SMTP id l8mr18429046lfg.255.1615319709073;
        Tue, 09 Mar 2021 11:55:09 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id d7sm2297862lja.114.2021.03.09.11.55.07
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 11:55:08 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id v9so29305246lfa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 11:55:07 -0800 (PST)
X-Received: by 2002:a05:6512:a8c:: with SMTP id m12mr18981829lfu.253.1615319707578;
 Tue, 09 Mar 2021 11:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20210309151737.345722-1-masahiroy@kernel.org> <20210309151737.345722-5-masahiroy@kernel.org>
In-Reply-To: <20210309151737.345722-5-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 9 Mar 2021 11:54:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh8qKZYoN-M5a5-=ps7Cf_obtd0P_-0h+nMQEWkVqGFzg@mail.gmail.com>
Message-ID: <CAHk-=wh8qKZYoN-M5a5-=ps7Cf_obtd0P_-0h+nMQEWkVqGFzg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: remove guarding from TRIM_UNUSED_KSYMS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Jessica Yu <jeyu@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 9, 2021 at 7:18 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Now that the build time cost of this option is unnoticeable level,
> revert the following two:

It might still be a good idea to make it depend on EXPERT. Otherwise
you'll have problems with external modules..

Also, can you actually specify that "unnoticeable level" with numbers?

             Linus
