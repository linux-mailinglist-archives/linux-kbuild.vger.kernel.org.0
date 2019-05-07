Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965F716B9E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2019 21:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfEGToz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 7 May 2019 15:44:55 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:43311 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEGToz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 15:44:55 -0400
Received: by mail-lf1-f48.google.com with SMTP id u27so12472046lfg.10;
        Tue, 07 May 2019 12:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=Ssd009GDqXFUgegCEA2wlem81XMpI7r+xaCXsSHDscY=;
        b=AiwWB9s+XumjJPYzXnkeAHwOIkZpJ/KUfk+t2jTsknoUlkvq+H+UwgnvUKvNoeFGq+
         V8RvcrJvzUCOPwhEiylyvwvWe2Agj/rTK8ooPizyzAqLeYZosQwfFkigFNjc2xkQCCY5
         F8KH0z0MsqR5A276ZzW8+fg6clKaMsUxylZEq291pmm15QEFwQCTsNKbLzh3cyPyZB47
         B3Ow9wk6hYGKXisE78AEcW6OVqKzhM8iQ+ZQiQuGphvy09TNY+WZufxpIajx0mZu3vpm
         sBBqnSne5OFaQ77ZAg33srlx/F0LQNXVu5DQXAoPmfclyKJ/2eXkk+FFsFjdHTBzVAoI
         ui8g==
X-Gm-Message-State: APjAAAXiYidxnzuXE1e5Y7xuKVM3bYf/XxZIl/WegvD27QQuiLuR3rDM
        lylz30f9P1hzG0Rff6QBFVg=
X-Google-Smtp-Source: APXvYqzuTb6pH6QAKu1Oh0j+/UVmrEPEQGonyFoe0Pnj3t6A6Z3VwfzN5WGMlKQawhAeb4bVqEnXew==
X-Received: by 2002:ac2:514b:: with SMTP id q11mr17742299lfd.114.1557258293517;
        Tue, 07 May 2019 12:44:53 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6a7:f0bd:5989:4f17:8168:6ecf? ([2a00:1fa0:6a7:f0bd:5989:4f17:8168:6ecf])
        by smtp.gmail.com with ESMTPSA id j24sm3296240lfh.28.2019.05.07.12.44.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:44:52 -0700 (PDT)
Date:   Tue, 07 May 2019 22:44:48 +0300
In-Reply-To: <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
References: <1556107369-7655-1-git-send-email-alex.popov@linux.com> <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com> <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [v2 1/1] kconfig: Terminate menu blocks with a comment in the generated config
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Alexander Popov <alex.popov@linux.com>
Message-ID: <C3B61434-2789-4643-B936-A056B073F1CC@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



7 May 2019 15:29:26 GMT+03:00, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>This patch breaks "make testconfig".
>
>Please get rid of the "endof" for the rootmenu
>at the end of the .config file.

Thanks a lot for having a look! 
I'll fix this issue, test it and return with the next version. 

Best regards, 
Alexander 
