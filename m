Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A588E18DC2
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 18:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfEIQLy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 12:11:54 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44392 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfEIQLk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 12:11:40 -0400
Received: by mail-vs1-f67.google.com with SMTP id j184so1749727vsd.11
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGvBfOsWL3Wi+dnFRPgL2CSHV9bM5eevOaTWbHZZuDE=;
        b=nzz1DnJ9BjEj1kg7AW6KUgUZlu7zGHA9FSRGd+vLU/L8x1Ifys0nieltpWrVOTytwS
         EiyrtldcK6DQKdtKFp5okPwfl1DFhaKke1rI9Vb381WUOwsV9+l0ZKYix9zjra7pv/ON
         nxoU2ZAcc9KIgPu90LxZfOub19uzYZ98Qy1Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGvBfOsWL3Wi+dnFRPgL2CSHV9bM5eevOaTWbHZZuDE=;
        b=snRajmHfhXAgUT8wXmT3QDgYQDrQalbkPb0MqifTMBv/8t5bjvY9vu8FkIB/h2Lrq0
         iF8DDbi1R+2NmBfm3sHON6dRhVAGr89rlkNN+ZphfD8DWypZhvPiAZwJrIZ5NrDgWoe1
         JiNZQcQ3hx3hhHCuqqs3yzxYpf7RGoZg3+u0TMdcb/I3aTBHnHQE7GZ0QLtzO6aUcky7
         9LhnUHIsnQ9noU1vuQW3nf+n3aH9rbsWNF7jcLUYN2CPhU59s56toR2/mXmnsaxrJbZa
         fKEqT8tchlO3HnAWUlXYIa/jqQlOrRYyw0Mgg0sdvhM6WbAHQZxbMIPebp246IyFBV4j
         +B5Q==
X-Gm-Message-State: APjAAAX4CfiQGB2RljMPQFQyxz79UXgIxcCj1ArtLjKPW3uWpgvcZa35
        HNpCdj5iZipqmm18yzvsNxoCE1WoAyc=
X-Google-Smtp-Source: APXvYqzqMAFvfM3NlBE+3NoRC09el6IYlrZhcfVqa5qpHhzWq15OhDU+FbCs/AKNjEd7xGbujWdRwg==
X-Received: by 2002:a67:6847:: with SMTP id d68mr2877421vsc.90.1557418298605;
        Thu, 09 May 2019 09:11:38 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id e6sm2974117vkf.0.2019.05.09.09.11.37
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:11:37 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id q189so715737vkq.11
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:11:37 -0700 (PDT)
X-Received: by 2002:a1f:9710:: with SMTP id z16mr2186751vkd.92.1557418296626;
 Thu, 09 May 2019 09:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064549.1302-1-yamada.masahiro@socionext.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 9 May 2019 09:11:25 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
Message-ID: <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 8, 2019 at 11:46 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
