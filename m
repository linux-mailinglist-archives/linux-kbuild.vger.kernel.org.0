Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2D11F1149
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 04:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgFHCDA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Jun 2020 22:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgFHCC7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jun 2020 22:02:59 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1FCC08C5C3;
        Sun,  7 Jun 2020 19:02:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q24so5334768pjd.1;
        Sun, 07 Jun 2020 19:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mfx3Sj9FRZgAlKkU0LzGyYtv3vZ3jXxU4QX6vPSwotg=;
        b=IxgYn4mbhc2Vf8FRFIdJSbwmU25ArLjINBY8TBskXSLat97ACPvXWS0SKINAt4CaoW
         nyX+Gl3bJ5FHby9ApeiQfU33sdZTC1k42aDMgLj1597DADpUw5iFm+KYmCwAvJNLdpAK
         57ErAZuWqF7yp2lh6E1GrT48T9yPfCQU3ATtYqS87MGh1zSzEzh0EqATPAqC3P66Esud
         QuiN1xBGfFafr7O5HpevEvKJ1pAvB0Bg4mHh2yVBftuRq+FIgwgloz3jGQq/aSZ31GQV
         smDLe9Phelu8Km3zCfi/0iFPcx8kojUSuWc1qOuA/c/FptpXRDJY1vka/9TpVkmAOv3N
         fbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mfx3Sj9FRZgAlKkU0LzGyYtv3vZ3jXxU4QX6vPSwotg=;
        b=d5ykE8AwD1VJk4O/YxQGO0BTdZVinVycVXYdcR/1DbxSwY8zIdWOWWFkImdjRqqoll
         BgpbuwhX9q54qdUxSjuBUpmoSxNqFXKLD/gNGo+PIJf2lAyez970ObVfRG04N7ELi1I5
         VdKiwR3349vhtc08LLSX8fVnk7VrUZDDVeQqvdCyaVALgglVZLmM0mTnuCrV8U9rpsRw
         wqLkn5VActpgztFmN5h4rQUhzwnJzP5/XgBcrbltJvx/6or8xFcCNZCbxgTu3krytoGK
         /fTWqAS8BsBgp0XhhR7jjqfbHkY//H4GOtiiILaj8q8O5+/vsX7rhIdYE9OZxcCy+U3y
         Y5/g==
X-Gm-Message-State: AOAM532xVD1ruYNhqsW7Tsy4FyeK2hNj8otfSStgoP/5ep7yIp4apYT2
        LORIAwNHXtlDvxxx8W9lxaM=
X-Google-Smtp-Source: ABdhPJz5Hw6n77EW+y5qbhGjqDx6DdppXlDgnOcBMJ+4oJCDmD81ehMUbDIJ++zS6FMiYvZqXIy9ag==
X-Received: by 2002:a17:902:6906:: with SMTP id j6mr19601835plk.261.1591581778370;
        Sun, 07 Jun 2020 19:02:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e127sm5405462pfe.45.2020.06.07.19.02.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jun 2020 19:02:57 -0700 (PDT)
Date:   Sun, 7 Jun 2020 19:02:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
Message-ID: <20200608020256.GA256950@roeck-us.net>
References: <20200511042149.1712876-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511042149.1712876-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> I think all the warnings have been fixed by now. Make it a fatal error.
> 

Not entirely. With this patch in the tree, I get:

Building sparc64:allmodconfig ... failed
--------------
Error log:
error: the following would cause module name conflict:
  drivers/char/adi.ko
  drivers/input/joystick/adi.ko
make[1]: *** [modules_check] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [__sub-make] Error 2

Reverting this patch fixes the problem.

Guenter
