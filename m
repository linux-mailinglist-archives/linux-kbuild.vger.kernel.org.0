Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDCC35943C
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 06:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhDIE6y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 00:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhDIE6y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 00:58:54 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C5EC061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 21:58:41 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id l123so3428012pfl.8
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jKWXL778dGKF04NrlbT/ArKMPAiOnY7Xr+u+pNHdYLU=;
        b=o6WpYr9EXT4QNtrfGXvHMpF21SQ1Lsbm9UjJpwBOQ2t/jtpvXLp/+NHovkZpq6FQF2
         wwf4V9tOH0Q29iFfKtAgNa7PbYCjEKIJhm4Ky2mQ1UDy+42z35M+5J4tgbdQVsx5Hb44
         Ht66ntRMmkVV2YjQkYQZy9uEFxXd3hhO2O9HZYgfhkip0sEuSJsUyEqhPz7WEmSdG8TA
         ZHh1V9XLszOM1QOkr69hWEOCuAdK4xn8EjK0e4Mcl3a/FozOo3xkbT/x/czFweyYUyPZ
         6OHkcnDNH+Umiq8N44X5x2k3d/nHrd1TvP4+wwlb3eILs13ZS+sC+CR958K7YTHdGYOx
         Vu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=jKWXL778dGKF04NrlbT/ArKMPAiOnY7Xr+u+pNHdYLU=;
        b=YqTunOmxjHRJQmfkIZvPMd9EKC+Y4WoSoOXMCAWhWlvGq+tA2vAhnTAiFMuROyZtHL
         LTWPv6LBoWE5XZjvan4tKBxC61+pYZfMBN1Titp6j59PatmdHBhc1PlwCWjl8g0VH+v+
         9dFuFKpVtrR3hNCzAHLSqxXzcwWuuufFYTHCR77B3yypGi1nIkIsKLkxD/wfkKDYjrNQ
         PemuC+szkfrrcR3KS+Ss3brbJeOHp0gjUatUB+IUUZZfeo5ioNB1uD7wXCYDc78EZc5a
         MSjs4zoArsUlXeddx/7bwo4n+Rlkss7vn/YSyWFSZITfdzbCEuRpKM5iLdyArj44kDkG
         bm/w==
X-Gm-Message-State: AOAM530uXRoeZbsRkeDurG79WdRzXGThVIKsuq7rjsSTz8pxF0J++vvC
        Hc8ldey1xtVsql+3HeLGp1X8TOzHKf4kqaG3dxIvk4uAIJJncA==
X-Google-Smtp-Source: ABdhPJw/m2hGE+sTGB4dx2DfhTRqSgHNhsVeNiMYRw+wBAykxAVRkM8tj50snPz6XNnwCIPiApKIB+eeos3P16NgXw8=
X-Received: by 2002:a63:fb12:: with SMTP id o18mr11061231pgh.438.1617944321205;
 Thu, 08 Apr 2021 21:58:41 -0700 (PDT)
MIME-Version: 1.0
From:   "David F." <df7729@gmail.com>
Date:   Thu, 8 Apr 2021 21:58:30 -0700
Message-ID: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
Subject: 5.10 build issue creating library for driver support.
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
