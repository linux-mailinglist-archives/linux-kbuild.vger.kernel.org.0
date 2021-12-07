Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9A546AF5A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Dec 2021 01:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378760AbhLGAuZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Dec 2021 19:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378768AbhLGAuY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Dec 2021 19:50:24 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03702C061746
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Dec 2021 16:46:55 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id o20so50136843eds.10
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2021 16:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghJHWYSCcNcRbUDIWR/w8CYgi8aCIw7xmUlHWMHylB8=;
        b=Ksm5N2TLcrb0SnNLGmOkVK9GpV44Fz1hZS0ozyA93fTibec6ce0+k1rxecvDGBApDw
         hzban1yEVA2Qor7uu6pNRdp4giVaJlaKXII6Tv3wSQDT71ApwB3/4Z3FxfsF7eA0bt4c
         BhzgKPUZYo+8TY3H9pVOfmSsyrLoxEl6bQrrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghJHWYSCcNcRbUDIWR/w8CYgi8aCIw7xmUlHWMHylB8=;
        b=O4gTUbhwS6dN7v3beyG42rruGp3b/a8QWqoRxgn6ulEIVyZxULmuLz+Qmy91rpJL3q
         +albIpDT5dTGdJI6mohm1naOMKoLcCyyn0nMNunM2aDk0M8A8SGTwT8VQy820wrHMGS9
         wE+hKSG1Z6inws9bG//GUdHaGIhpDItCCCUO65whWvgqazW5oBU7jLppJux9tQOz3PNm
         Br4M0lzgZFybDIWec5XQ/3zcSySHljFgKPLBuT0MbEgqRrBVhlkMmIdqNSJXkkjbhC0C
         TZD/GVGTEI0FV7biWA6dU8BeSs6ye6l/BkcFtR/q+i88kU2fnamU00D0jtrr2lasj5Yu
         Vxaw==
X-Gm-Message-State: AOAM531BdBuyTj8H7w3maJ7RWQycZqljXitWSUdtiXJ7E1zC7o/YUVi0
        Z7H21TmOjEiU1KxJ+Mwr7Q8WNIALwN+W7Ia9
X-Google-Smtp-Source: ABdhPJzOuMn92DHTmJgkLryR+wACnw44jLT3puMig+lK5kncwtgYaooE8UwpXYL5De8Pi27fg8pykQ==
X-Received: by 2002:a05:6402:350a:: with SMTP id b10mr3850022edd.184.1638838013077;
        Mon, 06 Dec 2021 16:46:53 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id qa7sm7676113ejc.64.2021.12.06.16.46.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 16:46:52 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id y196so9449044wmc.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2021 16:46:51 -0800 (PST)
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr2641508wmq.26.1638838011435;
 Mon, 06 Dec 2021 16:46:51 -0800 (PST)
MIME-Version: 1.0
References: <YatpectAYsWnmPy2@eldamar.lan> <CAHk-=whTTWUyL5j5_-UeRT6k9VcJM_VOfjiKuU2NBJkxhbnXpw@mail.gmail.com>
 <CAK7LNAR-VXwHFEJqCcrFDZj+_4+Xd6oynbj_0eS8N504_ydmyw@mail.gmail.com>
 <202112061128.6B670358@keescook> <Ya6IXWBGkN1iZI1b@eldamar.lan>
In-Reply-To: <Ya6IXWBGkN1iZI1b@eldamar.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Dec 2021 16:46:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjBp3qpx=wehDZijejFBPixV=yVQVrPqK8saSEwGVrfAQ@mail.gmail.com>
Message-ID: <CAHk-=wjBp3qpx=wehDZijejFBPixV=yVQVrPqK8saSEwGVrfAQ@mail.gmail.com>
Subject: Re: Makefile: CC_IMPLICIT_FALLTHROUGH passed quoted as argument to gcc
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 6, 2021 at 2:02 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Does the following look correct, as well from formal style/commit
> description? I have not yet done many contributions directly.

Thanks, looks good, applied.

Hopefully we'll get this cleaned up at a Kconfig level at some point,
but at least this avoids the external build environment issue for now.

             Linus
