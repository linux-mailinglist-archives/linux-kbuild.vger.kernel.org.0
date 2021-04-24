Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D3436A15D
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 15:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhDXN05 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 09:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhDXN04 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 09:26:56 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F53C061574
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Apr 2021 06:26:18 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id u11so20844878pjr.0
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Apr 2021 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=jKWXL778dGKF04NrlbT/ArKMPAiOnY7Xr+u+pNHdYLU=;
        b=jT84yKzOOhhMY9fZ7Il+FJNTEEqzIL5IWXS2VqVlFAhmv/JYV361se/KissZMx+er2
         +VDCv8iizVd/1h+AayVuxkfOB9dcYzUXq1Chcky7nq7i69v/idgu15lmRGe1818O+HBo
         359PpvfY0Zpu2SQtjuaotXUQ95C/fdfTZPnRxAXqtqtgPUjbCTj9GIMBwrtuwSkpxsSf
         5jQhaPWr1y/w+AhXEnrLIaeTDgw5luPeBPso+MjfHSpdzlF6ewv47c1GNnf0bjLA2p65
         qVU7oCYflG8zzpXNf2osVK8wLS7oX319gae9ZMW5PJ/uz7lBwUhe8eD9jW7KdQvMJIFz
         4C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=jKWXL778dGKF04NrlbT/ArKMPAiOnY7Xr+u+pNHdYLU=;
        b=flfRQB8W6zG/YjURkMNnIwIht6Rry0w17o94Vf4BvRRzt2O2t3Cql59c1n50fX4w7n
         WPkPleIW7ERmyB/L5JWe9DvlNDaq+18aTKA8uUC1+N/CV2cIGLGBAuOo8JHLA7V+ntep
         QvGfymyV+2UxZEDgaBZYiEmVTRIiZDuon8/U5cmAeIUX0oBBNyABWYJfDgdkzcokkm57
         4aNBhp5G1j7aVfmnUPvhvXmwc5g3zOVlRVui0AT6TlBglt+c8sQXK9yjfyPbKtAbs8ZW
         zv9BdSIqNhaHrn9rRGI4CvZvGFtme6/VbgeLWnMdW6CI0gLo75cXj6uCMWFSo9LlIQ8+
         9kKQ==
X-Gm-Message-State: AOAM5300LY1bew7DYsI7PuNzK3htTORfXvaxE8ROxJeLWktOWXhRGaqm
        4xj4IGds/SBV/RD/GVSIek8GiRKL72N0/Bav6PNAXOvv3kI=
X-Google-Smtp-Source: ABdhPJwlSHHlFPN5vy5WR9eGvmqrmdhkS6veC+DciwApp6Wg3iD+KfRV1xuHkoFVoK7sAKrAt4CyX5ymddhDVv6tDHQ=
X-Received: by 2002:a17:90a:8e82:: with SMTP id f2mr11218558pjo.146.1619270777551;
 Sat, 24 Apr 2021 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
In-Reply-To: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Sat, 24 Apr 2021 06:26:06 -0700
Message-ID: <CAGRSmLtsWvPhbmEkLNWC8FAtkvXBWSBRunAKNYUCRah2m+y2sQ@mail.gmail.com>
Subject: Fwd: 5.10 build issue creating library for driver support.
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

I moved to 5.10 from 5.4 now I have build problem:

"No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop

The build will build a small library file of shared driver support
routines, but it doesn't appear the build will support a library
anymore?  Is there a patch for that?

There was a patch that fix a prior problem of linking to a lib.a file:

Subject: Moving from 4.x to 5.4.22 breaks custom module build.

Is there a fix for this new issue?

Thanks.
