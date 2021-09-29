Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9B441C319
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Sep 2021 12:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245379AbhI2K7k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 06:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245255AbhI2K7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 06:59:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA44C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 03:57:58 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so8893461lfa.9
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=MhaWH0xm/odULRUgpRN30Lg5qdDn6Ee/GPJGPBWoxIc=;
        b=PxaqUDtmyLh7SXV80pQf194//bWib7aZsYZwCjAGDgMGbWBcRtRbW59mkZW6MXWrJ/
         fMtTsql04fLAvWMOMZCYxLq7dfUAQJSFLLP2CgN0zJEcg3RmBHHerUp+5USBGLyFJVEq
         YLJIWA/ZT7POvM8HFy8NTaR/zWQ5J7E8TQBwYoB+Mt6w0v+qKN8Kjlb3ajRvn9Nqm0mh
         v5plo+H16CnioHWOw+mJiBYmMn8pU4LJLTk7LZLXzWCCnI5R6B070Jzoa+jXZMe5dUVU
         Wnw1AhjlJdu4uaeC+mQQtVvQqYSvKbXN5Ln4xUVDIUDK50/GCOEbGEKnhV79slS+Yb5R
         mZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=MhaWH0xm/odULRUgpRN30Lg5qdDn6Ee/GPJGPBWoxIc=;
        b=Mp4wTp5JOs/nrUFSTvHic7aVJI6zwN3RZol0Ifz+p0ZG0C8AXiuaNLa5bz2OANIkKS
         kd3k81iHaFFufvsncyE0ZLatov7zmHqmJk6DvDPR++aftO3W3hoTaN4qo2EZMU4xNU78
         1kb/i1m4K4lLQWDn44qWZuZFDcFv8n5LSzwp/WemuJTeeDFvApd9/8bRYviLhxCiV7Ew
         rU90uXU/ksqI424Yw2AR4sBlcnheZqpYN78biUJHbdz3qOxHnrt0d+49SQ5ktjw23kxu
         ynC+j0BV7jjK+XQUr1LQPhpwnsT+JJ/qqeZ3NazScOdU7Bhk4WzGtuzY82y308osq3EY
         Qo7w==
X-Gm-Message-State: AOAM530zCT99ei6KkieWuFgVY9CVIFWMhbqYFTew8bhziSvx4fvkFobq
        aIrdc00Qq/e+OsY+glejLmOinpRijWUWW36CG1E=
X-Google-Smtp-Source: ABdhPJwNCEEhcK8qjJULqtQGWM/GbkZ42UWyxs+q6Ol8hjuw0ipBBQ+4OFNXqzKcDCxdYN9pUX89Z6I4+82Op/O1X34=
X-Received: by 2002:a05:6512:3b21:: with SMTP id f33mr11291867lfv.8.1632913077067;
 Wed, 29 Sep 2021 03:57:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:b04b:0:0:0:0:0 with HTTP; Wed, 29 Sep 2021 03:57:56
 -0700 (PDT)
Reply-To: isabella.ferreira@yandex.com
From:   "Isabella.Ferreira" <dornoos04@gmail.com>
Date:   Wed, 29 Sep 2021 11:57:56 +0100
Message-ID: <CAP5iM2NQcpj1BQ58uAdpUDpjv6Wf6SncE8HZYgStCPQkY4NaoQ@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Greetings,

I wonder why you continue neglecting my emails. Please, acknowledge
the receipt of this message in reference to the subject above as I
intend to send to you the details of the mail. Sometimes, try to check
your spam box because most of these correspondences fall out sometimes
in SPAM folder.

Best regards,
Isabella
