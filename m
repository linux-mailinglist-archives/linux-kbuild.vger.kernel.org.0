Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E86F191A68
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 21:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgCXT7J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 15:59:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45197 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgCXT7G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 15:59:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id b9so7852313pls.12
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcQRcAtEQg4rjglKJRL2d98Lwfwnni+3VOu5y4qk85w=;
        b=qYdy9ZyBm+V84vQRBdlRTTvNTWSlZa5gYHUIUgd4O4BL5QBdn6VF9+ymfZWyvKzL/2
         /FOM9/+eBM3zVmgxj6CLruwd+vCZ5F8v6fKWp+ANxQUv9ZKTrG9WXB6KVw+xf15tRh/M
         bEZpa2mn4ETx1ELJqqGcVJ56DtgBO8mwIYIbKSpeB8ThQwmMHDppJVerNjKNcjMNfIdn
         4mwR48QTj83kunUhPaEhiY4GG8YIcPxsA/2jWrps7vuIhcEX84DwnB9kQ+DijcW6QF2d
         HPMyPCpZURVGe/yMfvl4PiIqZnOO4Ujrk2RxJrGbIuD4IctdsbBG3/lOTk27h7IopctE
         5VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcQRcAtEQg4rjglKJRL2d98Lwfwnni+3VOu5y4qk85w=;
        b=W+nJWnt2evxswRYtD/IWaa4zdmW/OiIjtpZsCttoM5x6BVgcRxQ1Amxt3+e+eO01VL
         LiariTPMVOPbk/moucIfP7U9Z9H/1k6L9trLzi8DaPetYk/TgPJW3D1rGsVUj/t4jUJP
         sCycNGEnIcWTl+oEaLxugOfNU4S1nomdgi5EQ7MMwBka5TkdNrSmQr8Dp1f6W8f4HVMR
         KS3Djb/ZS4WGRZbwyf0uKTN6JesJXpEFRAt1xBL8FUawqaSwOcUlz8KO0XFGYoVXN0Y/
         4uUOqerUJTO3Bbgon7TgSB6js7oh/iWyosZQWWPbodQskm00HeogMo/INxGxSI9sZN/b
         nRhA==
X-Gm-Message-State: ANhLgQ3PfZ8LUx6quhann2rwBbxBCJe7sssJ2DVmidb4jkDuRVbky/Me
        DOKbUavjzrE/aalkJMx6z8RLPqtol+jd3oqK3bIRlBFr
X-Google-Smtp-Source: ADFU+vuilu4nK+FQYgpHdIaviKzEUBXNJjUU1ornx3/tJ+r2le+vN0Nlu7KwhPe37OGsZLY9Z8pKyFJL8kFUhNhEyA8=
X-Received: by 2002:a17:902:6bc8:: with SMTP id m8mr21730233plt.223.1585079945020;
 Tue, 24 Mar 2020 12:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200324161539.7538-1-masahiroy@kernel.org> <20200324161539.7538-3-masahiroy@kernel.org>
 <CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com>
In-Reply-To: <CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 12:58:54 -0700
Message-ID: <CAKwvOdmWqAUhL5DRg9oQPXzFtogK-0Q-VZ=FWf=Cjm-RJgR4sw@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: remove AS variable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Network Development <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 24, 2020 at 12:38 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> consistent in this regard (and not using the compiler as the driver),

Ah, the preprocessor; we need to preprocess the .S files, .s files are
fine (though we have .lds.S files that are not `-x
assembler-with-cpp`)

-- 
Thanks,
~Nick Desaulniers
