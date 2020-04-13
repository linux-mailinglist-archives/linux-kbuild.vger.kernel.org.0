Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88551A6CF7
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2020 22:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgDMUKB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Apr 2020 16:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727802AbgDMUKA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 16:10:00 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD71BC0A3BDC
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 13:09:59 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id x2so8271108qtr.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wS4LfUEfcaepgrDKoyH+3EpawEIoAdGvJZDCX/qAgsw=;
        b=JflVCMLjUpbfqqdekGmPk2YdNBr3jdvUi51cFWBMMH9etXkxyBBj6+O+/FvzM3Vv1g
         sa4gJ7ouxmFIOB8eutom3CJ3WsyGp+LUmMJyrJOkWwHA6Xc/a5kW2nVKpeHRy/VS1z5l
         fFgWycU9UOu9ldrROmDjfiiMCkcdpP0lsvk5Rz/hxMuL9BLnb4hO85HjEm4o02sfXPYB
         Zsj5BMGJwDg4yA41mpBavxAJPHCLpwN3GMq0gcoTM9lIkkTShfxTxpaF3Ga0XDWebniT
         6NlKC5sWjlIpTyhE/pez4i9l1/rO6QDTq2uSDGf+kUYLH0ATL17SWb0MMvvLOlE0KDsd
         5dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wS4LfUEfcaepgrDKoyH+3EpawEIoAdGvJZDCX/qAgsw=;
        b=V5S/idNUnV9LhtY2c70glYpC59E+33v+66exZdPd8YBSKHH8h+hy2e5STKBWp/XLxT
         KV4L9oAqLGzIWSKBui63TiBYgaLF6EpASFSybJNFoGEnEsHmtGh5/Z1epETsDzNgadth
         MsaiWdJoZ2DTAi8gzsES0gg5oDLczfdIx5ePO5T/LmVUv7euSEwIPNKb7yamM8CSssEi
         obcd80UZZe5IImDzENKTqNZ/GSea/+kbXEXe6EDX0w+wLRKzKcUOaB97+mVj/ki36C4+
         WyvP/Upsf+JBMZIrkunp40F4v8phk5cNlBfSHlVTZKgHzYKVI6v7Rd/6fOjjydzEvF/t
         rZHA==
X-Gm-Message-State: AGi0PuYBBluq+rHlaY5bX13EG6OYb3I3z5Ulor8nNJWombR7mk4C/dnt
        acNmffmv9ICgFm+ruYETbna3Kw==
X-Google-Smtp-Source: APiQypLEHBz158Idz//9kBLxhlQ68PJmoeLRwqPdwOoaLVPTQWsum2IkPpZPT0zpt9NDiw7tEKmXRw==
X-Received: by 2002:ac8:4b4c:: with SMTP id e12mr13018668qts.78.1586808599022;
        Mon, 13 Apr 2020 13:09:59 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id o16sm8773770qki.110.2020.04.13.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 13:09:58 -0700 (PDT)
Message-ID: <14517051a7046f105570a90d61e3a02d4c8a51eb.camel@massaru.org>
Subject: Re: [PATCH] kbuild: arch/$(SUBARCH)/include/generated/ aren't
 cleaned by mrproper
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Date:   Mon, 13 Apr 2020 17:09:54 -0300
In-Reply-To: <CAFd5g45yG1sSyuft4e_hrFxTNeES5fQVVyjmN8qOFyEmoUU4fg@mail.gmail.com>
References: <20200413115815.141587-1-vitor@massaru.org>
         <CAFd5g45yG1sSyuft4e_hrFxTNeES5fQVVyjmN8qOFyEmoUU4fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2020-04-13 at 12:47 -0700, Brendan Higgins wrote:
> On Mon, Apr 13, 2020 at 4:58 AM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> > This bug was introduced in this commit a788b2ed81abe
> > 
> > Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Please elaborate on what this change does and why it is necessary.
> Shuah and I are not the only ones who will want to understand what is
> going on here.

Sure, I'll do that.

Thanks for the review.

> 
> Otherwise, the change itself looks good to me.
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Tested-by: Brendan Higgins <brendanhiggins@google.com>

