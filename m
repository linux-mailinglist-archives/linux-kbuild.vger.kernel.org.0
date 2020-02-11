Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A5515883E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 03:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgBKCgz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Feb 2020 21:36:55 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:32815 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbgBKCgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 21:36:55 -0500
Received: by mail-vk1-f193.google.com with SMTP id i78so2575067vke.0;
        Mon, 10 Feb 2020 18:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZyEZ/pOjni03p5CJTGQn4guDmrGEy4H+FIPKHmUfqQ=;
        b=j+wTX9ekCsz4lQTnO0o6YxQi/RDcxchwLDOWZo4TPaHsdvF7K5p8X94r6dlDcmtcqI
         /sblqfvf0sqSKjK4oso+oLJOTuEb7h+rLHywG/UayM06GscdwWZaC5qY2IypSREHgcRZ
         4PyRx/KHuc0d+GbFFdXPwmJdrJ374Jv1ehxoFOA5n4uAXUHtqQfEvPn82qd+Q8JtnZXR
         8Lzp/PpQnT8AuutrReg28yEES2eALdZRm1PfksB15RAyr+4MmH+3bi7Uq8SqGGS+Nn0o
         S6J1mrajpCSZ11gT/tpZKfz2wKEvA7XjNfroVEFYbUebFq+R5g0fZtjt+PUf30gh35ni
         oLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZyEZ/pOjni03p5CJTGQn4guDmrGEy4H+FIPKHmUfqQ=;
        b=bhU+jfc3sG64trKs0nEa99sk/Cfv9gdOQ9r8EkGYQSwHqF0SZMsLqtIKvOonFUjeWb
         BDcByb6BWup7hPggqDg4Gc9mpeYyS9KyWYtVYAy5zmaxTzeXnqcGXo+AGCnjO5TQbZOi
         gaJWYervQV1J8mprsSiQgIt3sYTvzT8wQEUHiDGqQYBHEiogiocw11jtbTOyr1rm/fye
         xkJKNkV7YITmZQm/KWQC6FP2HI65Cg/lUmeFmRa9rM+lRiHydkZQR3TCzcZM6L25AVDt
         w4HrQzjAu+cjIBr2GNKk0LZx+yURwSN7tvudUr6YZPE35RQvuLs0J16dTtk0j28YBvzw
         ft0w==
X-Gm-Message-State: APjAAAVNDp4pYEmC1HrBnykqoQd/fGlNgPaWQgIvBWRj48CR2FVeFNgm
        6PbJcX6FUE8SGR4TKNrdW/05yOCaCvazwbGrfGM=
X-Google-Smtp-Source: APXvYqzNthuHBqnZYTmdg3NvBxLgugDSi3V5pUPPaK8A7N4L+PlzM2HP6iayI64KIILpcBhpLy2smq7bC6xh2hWKFBI=
X-Received: by 2002:a1f:b6d7:: with SMTP id g206mr3682850vkf.8.1581388614515;
 Mon, 10 Feb 2020 18:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20200210161852.842-1-masahiroy@kernel.org>
In-Reply-To: <20200210161852.842-1-masahiroy@kernel.org>
From:   Justin Capella <justincapella@gmail.com>
Date:   Mon, 10 Feb 2020 18:36:42 -0800
Message-ID: <CAMrEMU86jmds8LMmbdVk=54h+ziY=6MHwyzHxVRXy5dLGFTmGA@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Looks like len is already +1, maybe it shouldn't be?

>         len = strlen(name) + 1;
>
> -       sym = malloc(sizeof(*sym) + len);
> +       sym = malloc(sizeof(*sym) + len + 1);


Maybe strlcpy or if len wasn't incremented?

>
> -       memcpy(sym_name(sym), name, len);
> +       strcpy(sym_name(sym), name);
>
