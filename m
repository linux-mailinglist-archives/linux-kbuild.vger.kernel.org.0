Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0739441ED4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 17:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhKAQzQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 12:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhKAQzP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 12:55:15 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D688C061766
        for <linux-kbuild@vger.kernel.org>; Mon,  1 Nov 2021 09:52:42 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id n11so9104865iod.9
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Nov 2021 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=LjD4GxWdc2zr8/9EZOl5q2FS3VyqZrhxuRWYjSCst2U=;
        b=KiSk8LZhR7EZ/6Y/XeCSQZEjR7gPdV1w/ihpXQJrwiIBFMuPhCVhIFeiQYWo8CYa1z
         Df7GWUMVZkI3hloAM9BQvv3bkbNMij0XMwazsTY8oHQdeOvNzVB96famhHLiW9AGecDM
         nZHhwuzvLgGIp1JqYojKJyYDWTJlUNK/54Vdeygvt+B6ds8+KAmvLvUfMhsJFII+kv+G
         VIFaN68qihLLN53lLk/R0TQJZxCO1qStepUqEyJ2hs4MG7+kYIafTRbZvGAZw0PaNxnG
         lavTjPsXn+2suPlGogjD3moJmOFQACURdndJBOGmcDzAQXfJZ1pRPYYrPe69ClDZiNRk
         5RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=LjD4GxWdc2zr8/9EZOl5q2FS3VyqZrhxuRWYjSCst2U=;
        b=Jl5TgdNbLeriBdICvjgXRkvqberZBZ7XWgZowoNkVZX7GQjZUwW5Ba21+Lchiy3hP6
         G+cv0diGVBLCds7DAmK0jktC5vGs/UAQSLbEr1tJaYn9fUuAY+kDuRI1JaRoJ46tQiQD
         ZXk5PvsABvGbnh3Vc34TM2a0eCJlRfQLJB4p7cxBHwWbUCLKmk6lKWPBa7LBuQFIoV/8
         L5TlFL3fxDnJi2F7AX1+Ay+IRfl1OdLZ+Ch1f78J6pdLeHCuYCxZaz/Q1FpEprqsjMuU
         n+lQfAOO0mExB0sqlL/TF5/R6SxAK0raZ+iSbL93RaRcrjtpK2+hTOR9gM0GuV1xmX9x
         IjGw==
X-Gm-Message-State: AOAM531vG8D+do0BxLNVmdN3GvRdZxk29Sxk3+Vd8q3wM6GS87SP2bCt
        ockhNbOySmvglEuFiXiQoKdWxZgHBMzoZnqXzGk=
X-Google-Smtp-Source: ABdhPJyJawcz7J3D3BhTKOOSV5gD20ZECyj0S5nLNNDsEKYR56W4l7eyyzYWS0luko/WegN6zPQS90X2lc3hLZwF7BQ=
X-Received: by 2002:a02:7047:: with SMTP id f68mr9473228jac.109.1635785561397;
 Mon, 01 Nov 2021 09:52:41 -0700 (PDT)
MIME-Version: 1.0
Sender: readsghfrdfrsafxgf@gmail.com
Received: by 2002:a05:6e02:1bee:0:0:0:0 with HTTP; Mon, 1 Nov 2021 09:52:41
 -0700 (PDT)
From:   Mrs Carlsen monika <carlsen.monika@gmail.com>
Date:   Mon, 1 Nov 2021 17:52:41 +0100
X-Google-Sender-Auth: D9QI990OBmKiogm5tZnMWTUO9YM
Message-ID: <CAAbfOQwdBV60-k=B_-MyrH-mKBBi5KD0Juf1sxg3SZrrLJeBjg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

 I sent this mail praying it will found you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day.I'm Mrs.Monika John Carlsen, wife of late Mr John Carlsen, a
widow suffering from long time illness.i have some funds i inherited
from my late husband, the sum of (elevenmilliondollars) my Doctor told
me recently that I have serious sickness which is cancer problem. What
disturbs me most is my stroke sickness.Having known my condition,I
decided to donate this fund to a good person that will utilize it the
way i am going to instruct herein.I need a very honest and God fearing
person who can claim this money and use it for Charity works,for
orphanages,widows and also build schools for less privileges that will
be named after my late husband if possible and to promote the word of
God and the effort that the house of God is maintained.

I do not want a situation where this money will be used in an ungodly
manner.That's why I'm taking this decision. I'm not afraid of death so
I know where I'm going.I accept this decision because I do not have
any child who will inherit this money after I die. Please I want your
sincerely and urgent answer to know if you will be able to execute
this project, and I will give you more information on how the fund
will be transferred to your bank account.I'm waiting for your reply.

Best Regards,
Mrs. Monika John Carlsen
