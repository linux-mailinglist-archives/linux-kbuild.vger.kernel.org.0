Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C808532DA29
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 20:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbhCDTN4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 14:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbhCDTNn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 14:13:43 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC355C061574
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Mar 2021 11:13:02 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m22so45089147lfg.5
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 11:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3VGWnxMaYg51SC+CxXKHH3eAPL9wuuzDkZF08z83fw8=;
        b=YjEV8ZKjqX5sDh5Hyzb1VXQwrKtsCFgC3DUoJnWlSMmU+/Ymq5zQZGQvCpBUGj6XAF
         cKGiYfDOxUHayg993eCDtsDljJANZOJzsD1f4SbxY7aEqrunpDihnbvQL719yQnZ2XPe
         Pb3HPXMnMRstiN8DRtWeiWiENVa48hs7Ibo8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3VGWnxMaYg51SC+CxXKHH3eAPL9wuuzDkZF08z83fw8=;
        b=H4aybYYm7BzfzKTgaQxL02a3T6VnTePcUmqkoPdcLJ11JcEv+WZBwF/gxREl7u6HFe
         m7PIgYyuDHKUBQebhqnAVsqF5bK4i2h/dHdGELoiTiUmUVY9m1cBlV0G5XCdTmYidimp
         zcfwnwv3CXBuJUyaNDOvcctRYq/0Hci63Yz/0SJnEw7knN3OHlTweWz+UBRTPN+HIqwD
         ++04z7zqa0vaD7PrP3ZMGkfyMElzgNc/FyDq5ZZaUH7Jk5mNijv8pGnuKJX2vgDD1UOr
         NO4OcyFVvnq7FhPNtD2A1gGkYSOFAPEORsiyE4zfOft+mbe0tS/dUMh2hxQyIjzTatRo
         EYiw==
X-Gm-Message-State: AOAM532ya+So4v0PU8UGtqXquZdTbZU/sgQhJVtkyS+B4t+kreX4iAkD
        LOp7ZQaoV3CaWmhuDTdDtuoPENfOZxlC/g==
X-Google-Smtp-Source: ABdhPJz/QqfyTTQScbirjWQOE89LK/g5iQ71278+sJux31ex4P6OLrimtd1h0uz1ffBkOChdhpsLFA==
X-Received: by 2002:a05:6512:68a:: with SMTP id t10mr3035157lfe.334.1614885180599;
        Thu, 04 Mar 2021 11:13:00 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id e9sm37896ljj.52.2021.03.04.11.12.59
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 11:12:59 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id e7so45124196lft.2
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 11:12:59 -0800 (PST)
X-Received: by 2002:ac2:41d5:: with SMTP id d21mr2980850lfi.487.1614885178880;
 Thu, 04 Mar 2021 11:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble> <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble> <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble> <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble> <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
In-Reply-To: <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 4 Mar 2021 11:12:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
Message-ID: <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 7:36 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> All the kernel-space objects are rebuilt
> when the compiler is upgraded.

I very much NAK'ed that one. Why did that go in?

Or maybe I NAK'ed another version of it (I think the one I NAK'ed was
from Josh), and didn't realize that there were multiple ones.

> Linus complaint about GCC plugins not being rebuilt.

Yes, and that was a separate complaint and not at all tied to the other objects.

Gcc plugins aren't kernel object files at all. They are very much like
dynamically loadable libraries to gcc itself.

               Linus
