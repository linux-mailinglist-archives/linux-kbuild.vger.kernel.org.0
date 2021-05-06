Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660583756B7
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 May 2021 17:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbhEFPZx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 May 2021 11:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235415AbhEFPZ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 May 2021 11:25:29 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908D6C061763
        for <linux-kbuild@vger.kernel.org>; Thu,  6 May 2021 08:24:30 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id i5so1829018uap.5
        for <linux-kbuild@vger.kernel.org>; Thu, 06 May 2021 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=DJDV+Y41njtBMouQ+LQv+c2L8v93bl/qtqGa2Hrunps=;
        b=L/NeYozpGRw7NEpDniP9aOEglMgGi4bI4ZO9OL3pMnvAvRlPhh3ldrMkfeFV1+Fr0/
         vOnznaeU22p6OM+K85zL/ezkIUEst9ZuEnDstZWsA51hLw+MnBZ+HlHPgabAToAGHdgb
         OfzceoV7I9oiSRQvcXv06jHeHHB0f2y1FS+e/yGQ/QD4ZbtotNae5XUOMMFOqUr3Kv6b
         h3WkbAP9MkRvPQV9/IBHyCkUwM7kjf/ke2VD1VX6kk9o57uOM1F8pj67cC8+uKDtDVQY
         ijF5NThoF5kw1mCmwimR4fVVur/8vSmLv8pdIyqnWNLEebZebcFHYZiTG0YWnoEIqbWn
         j2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=DJDV+Y41njtBMouQ+LQv+c2L8v93bl/qtqGa2Hrunps=;
        b=C5iOoBR9fl2lyXO3Ku6jAg0bCCtirj1Zqd7vRKPXUAWZ9YK2YUoqPW2Wj4WsWc64q6
         PYab2l9V4Njnpql6y70cJBZfwVpb6jGKCMkElRu2UeyrGvvv/lFTjy+XTxJ9eBg9+/R+
         /X3UYOxZ4zyXvBYFDy7Dm0FQnd2E+24+xv2fhmagiLB2d+X8bhfYatb+/Zq4bEhfQH7T
         SoyVYQATi2LcOii67I3qngMcXgDeac7h6AMw2AbCdNH2fGnMn1eSbQBFNhQe4Q86sRCB
         /T6T1ruf7xBUNPLYCDf4dBPVPp/Jma9Fv+bYO5P17YAeEm7JxQGi/4YDRy+aXnahJwyj
         Enww==
X-Gm-Message-State: AOAM530tWWZRtKOB3yOSAP4vNR3ZwxnuPRP/b7aW2GgleGr3Q5rDP+SM
        jvTkLBwK0Y7xmDbImYdiWDiQV17AjWrhOWmJMwc=
X-Google-Smtp-Source: ABdhPJxoyGYb9LgntCs7kE8ELfy7uFhW6DZYeFbM/xE3Mwom2rTYVFVXJ8HPe7udfh/i8VNkkR9eqhr4NeHIxPe1o5U=
X-Received: by 2002:ab0:6d9a:: with SMTP id m26mr4391981uah.53.1620314669781;
 Thu, 06 May 2021 08:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:a44f:0:0:0:0:0 with HTTP; Thu, 6 May 2021 08:24:28 -0700 (PDT)
Reply-To: 12345officialnicole@gmail.com
From:   Official <queenjennifer000@gmail.com>
Date:   Thu, 6 May 2021 15:24:28 +0000
Message-ID: <CAExHHwn8JChQ-75vRnakBRaNRnkBXyp7zFR9dhXFKXxa7pa_vg@mail.gmail.com>
Subject: =?UTF-8?B?6ri06riJ7ZWcIOuLteuzgCDrtoDtg4Hrk5zrpr3ri4jri6QuLi7nt4rmgKXjga7ov5Q=?=
        =?UTF-8?B?5L+h44KS44GK6aGY44GE44GX44G+44GZ?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

My good friend, I hope you're doing well =E2=80=98=E2=80=98and'' did you re=
ceive my
previous e-mail?  I have something important and profitable to discuss
with you, I would like to visit your country as soon as possible,
please reply to this email for more details about myself.
Regards
Ms. Official Nicole
