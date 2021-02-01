Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C673F30B399
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 00:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhBAXcm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Feb 2021 18:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhBAXcl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Feb 2021 18:32:41 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EDCC061573;
        Mon,  1 Feb 2021 15:32:01 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id g69so20778532oib.12;
        Mon, 01 Feb 2021 15:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=HjmTKpGieoLOWt2p79tfhfP5UvMhYYaxr0kBRIrD13Q=;
        b=K+ImDEXqkmMRBskGOv3pPWfJcSPQAtGqus8kG/ijGsSOA4uISzMO3jFXwrp+tnThc3
         ihshD6gD3HVSr03nu4nZjv8q4AI3OequmxhAF2H7UMHoAIXHSlgMGH1nfhKJDzmRyiJv
         b0AUmohJeUaaKvEJcyBNcz7rxzwZ0AnDBiGMesolfTl9Hu/Yly1cKGZrXnYat8mDTpxX
         ZL6WGicLouPil7O1cMRihAOBpMubf/7QlCeZR7Ms3lTso4ktC1zAwOoQQV+axRXf20L+
         LXZZsB4xlGDrfDkz3sASrI1Fuz5V1oY4t3l0RNE6dBvdFsw2cfwJMcwDEFgAYrZ0s3US
         MdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HjmTKpGieoLOWt2p79tfhfP5UvMhYYaxr0kBRIrD13Q=;
        b=cadTlXCKGXUAskWSEzi4Y/RYtZBsyOaj+MFQp8OSVHil4RLUBYDnGrbwgoBDys0u5E
         VV+xMrCZD4O7c6QO8kO4v/eW77/2OB5/R3A7P4NxUfOh/T8A2GF8XNMyFkGgp4O4KuNT
         Be7JOag0K9n2S23P/0Cp88hSTlnHiGxDEl0tPT4cEg5xLn8LQDPOsMjaEiXtHuEfVa4L
         DFAsBhXif8xO6xDGCxqLuIwz3M8yBq7YMfiPKko3Q9B2ucS6bGdDyA5aIGmiMypy+ISl
         seNmyAtjcsJm2LjyP9NjLjeDU7RZTtSc5+etW0YTkgC3UlgMYQ4V8fFHRi3DN9cHuIAw
         cgTQ==
X-Gm-Message-State: AOAM5303v8jk2CTadVdl6pwLQm5ASHZw8IzQ6O+KcxcQJ/6BI5qujku7
        om8uR0BlqHXOx1HaovYafPGyAaqH5V8kRiAcTX8MiZzAO84=
X-Google-Smtp-Source: ABdhPJyWN13qTHNi3j/5hP9NpY6ARORs4T4rvS5AF3FUDeax9u7rFBoCVZ2vGsitSAc13CIV0+Kb3wCU6znwcolnaDg=
X-Received: by 2002:a54:458f:: with SMTP id z15mr858860oib.139.1612222320532;
 Mon, 01 Feb 2021 15:32:00 -0800 (PST)
MIME-Version: 1.0
From:   Amy Parker <enbyamy@gmail.com>
Date:   Mon, 1 Feb 2021 15:31:49 -0800
Message-ID: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
Subject: Alternative compilers to GCC/Clang
To:     linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello! My name's Amy. I'm really impressed by the work done to make
Clang (and the LLVM toolchain overall) able to compile the kernel.
Figured I might as well donate my monkey hours to helping make it run
on other compilers as well. I haven't been able to find any that use
the same arguments structure as GCC and Clang (read: you can pass it
in as CC=compilername in your $MAKEOPTS). Any compilers along that
route anyone here has worked with that I could work with?

Best regards,
Amy Parker
(she/her/hers)
